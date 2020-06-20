/*
 * NEXYS4_DDR.v
 *
 *  Created on: 01.01.2020
 *      Author: Alexander Antonov <antonov.alex.alex@gmail.com>
 *     License: See LICENSE file for details
 */




module NEXYS4_DDR
#( parameter SIM = "NO" )
(
	input 	CLK100MHZ
    , input   CPU_RESETN
    
    , input   [15:0] SW
    , output reg  [15:0] LED

    , input   UART_TXD_IN
    , output  UART_RXD_OUT
);



localparam UDM_BUS_TIMEOUT = (SIM == "YES") ? 100 : (1024*1024*100);
localparam UDM_RX_EXTERNAL_OVERRIDE = (SIM == "YES") ? "YES" : "NO";

wire clk_gen;
wire pll_locked;

sys_clk sys_clk
(
    .clk_in1(CLK100MHZ)
    , .reset(!CPU_RESETN)
    , .clk_out1(clk_gen)
    , .locked(pll_locked)
);

wire arst;
assign arst = !(CPU_RESETN & pll_locked);

wire srst;
reset_cntrl reset_cntrl
(
	.clk_i(clk_gen),
	.arst_i(arst),
	.srst_o(srst)
);

wire udm_reset;

wire [0:0] udm_req;
wire [0:0] udm_we;
wire [31:0] udm_addr;
wire [3:0] udm_be;
wire [31:0] udm_wdata;
wire [0:0] udm_ack;
reg [0:0] udm_resp;
reg [31:0] udm_rdata;

udm
#(
    .BUS_TIMEOUT(UDM_BUS_TIMEOUT)
    , .RX_EXTERNAL_OVERRIDE(UDM_RX_EXTERNAL_OVERRIDE)
)udm (
	.clk_i(clk_gen)
	, .rst_i(srst)

	, .rx_i(UART_TXD_IN)
	, .tx_o(UART_RXD_OUT)

	, .rst_o(udm_reset)
	
	, .bus_req_o(udm_req)
	, .bus_we_o(udm_we)
	, .bus_addr_bo(udm_addr)
	, .bus_be_bo(udm_be)
	, .bus_wdata_bo(udm_wdata)
	, .bus_ack_i(udm_ack)
	, .bus_resp_i(udm_resp)
	, .bus_rdata_bi(udm_rdata)
);

localparam CSR_LED_ADDR	 	= 32'h00000000;
localparam CSR_SW_ADDR  	= 32'h00000004;
localparam TESTMEM_ADDR 	= 32'h80000000;
localparam TESTMEM_WSIZE	= 1024;


localparam CSR_LEN_ADDR = 32'h00000008;
localparam CSR_RET_ADDR  	= 32'h0000000C;
localparam CSR_START_ADDR  	= 32'h00000010;

wire [31:0] ap_ret;
reg [31:0] LEN;
reg start;
wire done;
wire idle;
wire ready;


wire testmem_udm_enb;
assign testmem_udm_enb = (!(udm_addr < TESTMEM_ADDR) && (udm_addr < (TESTMEM_ADDR + (TESTMEM_WSIZE*4))));

reg testmem_udm_we;
reg [31:0] testmem_udm_addr, testmem_udm_wdata;
wire [31:0] testmem_udm_rdata;

wire testmem_p1_we;
wire [6:0] testmem_p1_addr; 
wire [31:0] testmem_p1_wdata;
wire [31:0] testmem_p1_rdata;

// testmem's port1 is inactive
assign testmem_p1_we = 1'b0;
//assign testmem_p1_addr = 0;
assign testmem_p1_wdata = 0;

ram_dual #(
    .mem_init("NO")
    , .mem_data("nodata.hex")
    , .dat_width(32)
    , .adr_width(20)
    , .mem_size(TESTMEM_WSIZE)
) testmem (
    .clk(clk_gen)

    , .dat0_i(testmem_udm_wdata)
    , .adr0_i(testmem_udm_addr)
    , .we0_i(testmem_udm_we)
    , .dat0_o(testmem_udm_rdata)

    , .dat1_i(testmem_p1_wdata)
    , .adr1_i({32'h0, testmem_p1_addr})
    , .we1_i(testmem_p1_we)
    , .dat1_o(testmem_p1_rdata)
);

assign udm_ack = udm_req;   // bus always ready to accept request
reg csr_resp, testmem_resp, testmem_resp_dly;
reg [31:0] csr_rdata;

// bus request
always @(posedge clk_gen)
    begin
    
    testmem_udm_we <= 1'b0;
    testmem_udm_addr <= 0;
    testmem_udm_wdata <= 0;
    start <= 0;
    
    csr_resp <= 1'b0;
    testmem_resp_dly <= 1'b0;
    testmem_resp <= testmem_resp_dly;
    
    if (udm_req && udm_ack)
        begin
        
        if (udm_we)     // writing
            begin
            if (udm_addr == CSR_LED_ADDR) LED <= udm_wdata;
            if (udm_addr == CSR_LEN_ADDR) LEN <= udm_wdata;
            if (udm_addr == CSR_START_ADDR) start <= 1'b1;
            if (testmem_udm_enb)
                begin
                testmem_udm_we <= 1'b1;
                testmem_udm_addr <= udm_addr[31:2];     // 4-byte aligned access only
                testmem_udm_wdata <= udm_wdata;
                end
            end
        
        else            // reading
            begin
            if (udm_addr == CSR_LED_ADDR)
                begin
                csr_resp <= 1'b1;
                csr_rdata <= LED;
                end
            if (udm_addr == CSR_SW_ADDR)
                begin
                csr_resp <= 1'b1;
                csr_rdata <= SW;
                end
             if (udm_addr == CSR_RET_ADDR)
                begin
                csr_resp <= 1'b1;
                csr_rdata <= ap_ret;
                end    
            if (testmem_udm_enb)
                begin
                testmem_udm_we <= 1'b0;
                testmem_udm_addr <= udm_addr[31:2];     // 4-byte aligned access only
                testmem_udm_wdata <= udm_wdata;
                testmem_resp_dly <= 1'b1;
                end
            end
        end
    end
    

// bus response
always @*
    begin
    udm_resp = csr_resp | testmem_resp;
    udm_rdata = 0;
    if (csr_resp) udm_rdata = csr_rdata;
    if (testmem_resp) udm_rdata = testmem_udm_rdata;
    end

//wire [31:0] adr_array;
//reg [31:0] reg_array;

/*sr_array my_fun (
        .ap_clk(clk_gen), //in
        .ap_rst(srst),//in
        .ap_start(start),//in
        .ap_done(done),//out
        .ap_idle(idle),//out
        .ap_ready(ready),//out
        .x_address0(testmem_p1_addr),//out
        //.x_ce0(),//out
        .x_q0(testmem_p1_rdata),//in
        .ap_return(ap_ret)//out
);*/

Sobel Sobel_my (
        .image_in_address0(testmem_p1_addr),
        //.image_in_ce0,
        //.image_in_d0,
        .image_in_q0(testmem_p1_rdata),
        //.image_in_we0,
        .image_out_address0(testmem_p1_addr),
        //.image_out_ce0,
        //.image_out_d0,
        .image_out_q0(testmem_p1_rdata),
        //.image_out_we0,
        .ap_clk(clk_gen),
        .ap_rst(srst),
        .ap_start(start),
        .ap_done(done),
        .ap_ready(ready),
        .ap_idle(idle)
);
endmodule
