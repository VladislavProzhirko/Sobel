/*
 * tb.v
 *
 *  Created on: 17.10.2019
 *      Author: Alexander Antonov <antonov.alex.alex@gmail.com>
 *     License: See LICENSE file for details
 */


`timescale 1ns / 1ps

`define HALF_PERIOD			5						//external 100 MHZ
`define DIVIDER_115200		32'd8680
`define DIVIDER_19200		32'd52083
`define DIVIDER_9600		32'd104166
`define DIVIDER_4800		32'd208333
`define DIVIDER_2400		32'd416666

// udm interface
`define SYNC_BYTE			8'h55
`define ESCAPE_BYTE			8'h5a
`define IDCODE_CMD			8'h00	// check udm accessibility
`define RST_CMD				8'h80	// Reset slave	
`define nRST_CMD			8'hC0	// nReset slave	
`define WR_CMD 				8'h81	// Write slave with autoincrement
`define RD_CMD 				8'h82	// Read slave with autoincrement
`define WR_CMD_NOINC 		8'h83	// Write slave without autoincrement
`define RD_CMD_NOINC 		8'h84	// Read slave without autoincrement

module tb ();
//
reg CLK_100MHZ, RST, rx;
reg [15:0] SW;
wire [15:0] LED;
	
NEXYS4_DDR
#(
	.SIM("YES")
) DUT (
	.CLK100MHZ(CLK_100MHZ)
    , .CPU_RESETN(!RST)
    
    , .SW(SW)
    , .LED(LED)

    , .UART_TXD_IN(rx)
    , .UART_RXD_OUT()
);

//////////////////////////
/////////tasks////////////
//////////////////////////

reg parity;
integer i, j, k;

reg [32:0] rate;
reg [1:0] configuration;


////wait////
task WAIT
	(
	 input reg [15:0] periods
	 );
begin
for (i=0; i<periods; i=i+1)
	begin
	#(`HALF_PERIOD*2);
	end
end
endtask


////reset all////
task RESET_ALL ();
begin
	CLK_100MHZ = 1'b0;
	RST = 1'b1;
	rx = 1'b1;
	#(`HALF_PERIOD/2);
	RST = 1;
	#(`HALF_PERIOD*6);
	RST = 0;
end
endtask


task UART_CFG
	(
		input reg [32:0] rate_i,
		input reg [1:0] configuration_i
	);
	begin
	rate = rate_i;
	configuration = configuration_i;
	end
endtask

////Send byte to UART////

task UART_SEND_SERIALIZE
	(
	 input reg [7:0] send_byte
	 );
	begin
	parity = 0;
	//start
	rx = 1'b0;
	#rate;
	//sending data
	for (i=0; i<8; i=i+1)
		begin
		rx = send_byte[0];
		#rate;
		parity = parity ^ send_byte[0];
		send_byte = send_byte >> 1;
		end
	//parity
	if (configuration != 2'b00)
		begin
		if (configuration == 2'b10)
			begin
			rx = parity;
			#rate;
			end
		else if (configuration == 2'b01)
			begin
			rx = ~parity;
			#rate;
			end
		end
	//stop;
		rx = 1'b1;
		#rate;
	end
endtask

task UART_SEND 
	(
	 input reg [7:0] send_byte
	 );
	begin
	@(posedge DUT.udm.uart_rx.clk_i)
	DUT.udm.uart_rx.rx_done_tick_o <= 1'b1;
	DUT.udm.uart_rx.dout_bo <= send_byte;
	@(posedge DUT.udm.uart_rx.clk_i)
	DUT.udm.uart_rx.rx_done_tick_o <= 1'b0;
	DUT.udm.uart_rx.dout_bo <= 8'h0;
	end
endtask

task udm_rst ();
	begin
	UART_SEND(`SYNC_BYTE);
	UART_SEND(`RST_CMD);
	end
endtask

task udm_nrst ();
	begin
	UART_SEND(`SYNC_BYTE);
	UART_SEND(`nRST_CMD);
	end
endtask

task udm_hreset ();
	begin
	udm_rst();
	udm_nrst();
	end
endtask

task udm_check ();
	begin
	UART_SEND(`SYNC_BYTE);
	UART_SEND(`IDCODE_CMD);
	end
endtask

task udm_sendbyte
	(
		input reg [7:0] databyte
	);
	begin
	if ((databyte == `SYNC_BYTE) || (databyte == `ESCAPE_BYTE))
		UART_SEND(`ESCAPE_BYTE);
	UART_SEND(databyte);
	end
endtask


task udm_sendword_le
	(
		input reg [31:0] dataword
	);
	begin
	udm_sendbyte(dataword[7:0]);
	udm_sendbyte(dataword[15:8]);
	udm_sendbyte(dataword[23:16]);
	udm_sendbyte(dataword[31:24]);
	end
endtask


task udm_sendword_be
	(
		input reg [31:0] dataword
	);
	begin
	udm_sendbyte(dataword[31:24]);
	udm_sendbyte(dataword[23:16]);
	udm_sendbyte(dataword[15:8]);
	udm_sendbyte(dataword[7:0]);
	end
endtask


task udm_wr_single
	(
		input reg [31:0] wr_addr,
		input reg [31:0] wr_data
	);
	begin

	// header
	UART_SEND(`SYNC_BYTE);
	UART_SEND(`WR_CMD);
	
	// address
	udm_sendword_le(wr_addr);

	// length
	udm_sendword_le(32'h4);
	
	// data
	udm_sendword_le(wr_data);

	end
endtask


task udm_rd_single
	(
		input reg [31:0] wr_addr
	);
	begin
	
	// header
	UART_SEND(`SYNC_BYTE);
	UART_SEND(`RD_CMD);
	
	// address
	udm_sendword_le(wr_addr);

	// length
	udm_sendword_le(32'h4);

	end
endtask


//////////////////////////
//initial block
initial
begin
	$display ("### SIMULATION STARTED ###");

	SW = 8'h30;
	RESET_ALL();
	UART_CFG(`DIVIDER_115200, 2'b00);
	WAIT(100);
	
	
	udm_wr_single(32'h80000000, {8'he1,8'hff,8'hd8,8'hff});    //1
	udm_wr_single(32'h80000004, {8'h78,8'h45,8'h16,8'h00});    //2
	udm_wr_single(32'h80000008,	{8'h69,8'h66,8'h00,8'h00});    //3
	udm_wr_single(32'h8000000C,	{8'h4d,8'h4d,8'h00,8'h2a});    //4
	udm_wr_single(32'h80000010,	{8'h00,8'h00,8'h00,8'h08});    //5
	udm_wr_single(32'h80000014,	{8'h00,8'h00,8'h00,8'h00});    //6
	udm_wr_single(32'h80000018,	{8'h00,8'h00,8'h00,8'h00});    //7
	udm_wr_single(32'h8000001C,	{8'hff,8'hdb,8'h00,8'h84});    //8
	udm_wr_single(32'h80000020,	{8'h00,8'h03,8'h02,8'h02});    //9
	udm_wr_single(32'h80000024,	{8'h08,8'h08,8'h08,8'h08});    //10
	udm_wr_single(32'h80000028,	{8'h08,8'h08,8'h08,8'h08});    //11
	udm_wr_single(32'h8000002C,	{8'h08,8'h08,8'h08,8'h08});    //12
	udm_wr_single(32'h80000030,	{8'h08,8'h08,8'h08,8'h08});    //13
	udm_wr_single(32'h80000034,	{8'h08,8'h08,8'h08,8'h08});    //14
	udm_wr_single(32'h80000038,	{8'h08,8'h08,8'h08,8'h08});    //15
	udm_wr_single(32'h8000003C,	{8'h08,8'h08,8'h08,8'h08});    //16
	udm_wr_single(32'h80000040,	{8'h08,8'h08,8'h08,8'h08});    //17
	udm_wr_single(32'h80000044,	{8'h08,8'h08,8'h08,8'h08});    //18
	udm_wr_single(32'h80000048,	{8'h08,8'h08,8'h08,8'h08});    //19
	udm_wr_single(32'h8000004C,	{8'h08,8'h08,8'h08,8'h0a});    //20
	udm_wr_single(32'h80000050,	{8'h08,8'h08,8'h08,8'h08});    //21
	udm_wr_single(32'h80000054,	{8'h0a,8'h0a,8'h0a,8'h08});    //22
	udm_wr_single(32'h80000058,	{8'h08,8'h0b,8'h08,8'h08});    //23
	udm_wr_single(32'h8000005C,	{8'h08,8'h0d,8'h0d,8'h08});    //24
	udm_wr_single(32'h80000060,	{8'h0a,8'h08,8'h01,8'h03});    //25
	/*
	udm_wr_single(32'h80000000, 8'hff);    1
	udm_wr_single(32'h80000004, 8'hd8);    1
	udm_wr_single(32'h80000008, 8'hff);    1
	udm_wr_single(32'h8000000c, 8'he1);    1
	udm_wr_single(32'h80000010, 8'h00);    2
	udm_wr_single(32'h80000014, 8'h16);    2
	udm_wr_single(32'h80000018, 8'h45);    2
	udm_wr_single(32'h8000001c, 8'h78);    2
	udm_wr_single(32'h80000020, 8'h69);    3
	udm_wr_single(32'h80000024, 8'h66);    3
	udm_wr_single(32'h80000028, 8'h00);    3
	udm_wr_single(32'h8000002c, 8'h00);    3
	udm_wr_single(32'h80000030, 8'h4d);    4
	udm_wr_single(32'h80000034, 8'h4d);    4
	udm_wr_single(32'h80000038, 8'h00);    4
	udm_wr_single(32'h8000003c, 8'h2a);    4///
	udm_wr_single(32'h80000040, 8'h00);    5
	udm_wr_single(32'h80000044, 8'h00);    5
	udm_wr_single(32'h80000048, 8'h00);    5
	udm_wr_single(32'h8000004c, 8'h08);    5///
	udm_wr_single(32'h80000050, 8'h00);    6
	udm_wr_single(32'h80000054, 8'h00);    6
	udm_wr_single(32'h80000058, 8'h00);    6
	udm_wr_single(32'h8000005c, 8'h00);    6///
	udm_wr_single(32'h80000060, 8'h00);    7
	udm_wr_single(32'h80000064, 8'h00);    7
	udm_wr_single(32'h80000068, 8'h00);    7
	udm_wr_single(32'h8000006c, 8'h00);    7///
	udm_wr_single(32'h80000070, 8'hff);    8
	udm_wr_single(32'h80000074, 8'hdb);    8
	udm_wr_single(32'h80000078, 8'h00);    8
	udm_wr_single(32'h8000007c, 8'h84);    8///
	udm_wr_single(32'h80000080, 8'h00);    9
	udm_wr_single(32'h80000084, 8'h03);    9
	udm_wr_single(32'h80000088, 8'h02);    9
	udm_wr_single(32'h8000008c, 8'h02);    9///
	udm_wr_single(32'h80000090, 8'h08);    10
	udm_wr_single(32'h80000094, 8'h08);    10
	udm_wr_single(32'h80000098, 8'h08);    10
	udm_wr_single(32'h8000009c, 8'h08);    10
	udm_wr_single(32'h800000a0, 8'h08);    11
	udm_wr_single(32'h800000a4, 8'h08);    11
	udm_wr_single(32'h800000a8, 8'h08);    11
	udm_wr_single(32'h800000ac, 8'h08);    11
	udm_wr_single(32'h800000b0, 8'h08);    12
	udm_wr_single(32'h800000b4, 8'h08);    12
	udm_wr_single(32'h800000b8, 8'h08);    12
	udm_wr_single(32'h800000bc, 8'h08);    12
	udm_wr_single(32'h800000c0, 8'h08);    13
	udm_wr_single(32'h800000c4, 8'h08);    13
	udm_wr_single(32'h800000c8, 8'h08);    13
	udm_wr_single(32'h800000cc, 8'h08);    13
	udm_wr_single(32'h800000d0, 8'h08);    14
	udm_wr_single(32'h800000d4, 8'h08);    14
	udm_wr_single(32'h800000d8, 8'h08);    14
	udm_wr_single(32'h800000dc, 8'h08);    14
	udm_wr_single(32'h800000e0, 8'h08);    15
	udm_wr_single(32'h800000e4, 8'h08);    15
	udm_wr_single(32'h800000e8, 8'h08);    15
	udm_wr_single(32'h800000ec, 8'h08);    15
	udm_wr_single(32'h800000f0, 8'h08);    16
	udm_wr_single(32'h800000f4, 8'h08);    16
	udm_wr_single(32'h800000f8, 8'h08);    16
	udm_wr_single(32'h800000fc, 8'h08);    16
	udm_wr_single(32'h80000100, 8'h08);    17
	udm_wr_single(32'h80000104, 8'h08);    17
	udm_wr_single(32'h80000108, 8'h08);    17
	udm_wr_single(32'h8000010c, 8'h08);    17
	udm_wr_single(32'h80000110, 8'h08);    18
	udm_wr_single(32'h80000114, 8'h08);    18
	udm_wr_single(32'h80000118, 8'h08);    18
	udm_wr_single(32'h8000011c, 8'h08);    18
	udm_wr_single(32'h80000120, 8'h08);    19
	udm_wr_single(32'h80000124, 8'h08);    19
	udm_wr_single(32'h80000128, 8'h08);    19
	udm_wr_single(32'h8000012c, 8'h08);    19
	udm_wr_single(32'h80000130, 8'h08);    20
	udm_wr_single(32'h80000134, 8'h08);    20
	udm_wr_single(32'h80000138, 8'h08);    20
	udm_wr_single(32'h8000013c, 8'h0a);    20///////////
	udm_wr_single(32'h80000140, 8'h08);    21
	udm_wr_single(32'h80000144, 8'h08);    21
	udm_wr_single(32'h80000148, 8'h08);    21
	udm_wr_single(32'h8000014c, 8'h08);    21///
	udm_wr_single(32'h80000150, 8'h0a);    22
	udm_wr_single(32'h80000154, 8'h0a);    22
	udm_wr_single(32'h80000158, 8'h0a);    22
	udm_wr_single(32'h8000015c, 8'h08);    22
	udm_wr_single(32'h80000160, 8'h08);    23
	udm_wr_single(32'h80000164, 8'h0b);    23
	udm_wr_single(32'h80000168, 8'h0d);    23
	udm_wr_single(32'h8000016c, 8'h0a);    23//////
	udm_wr_single(32'h80000170, 8'h08);    24
	udm_wr_single(32'h80000174, 8'h0d);    24
	udm_wr_single(32'h80000178, 8'h08);    24
	udm_wr_single(32'h8000017c, 8'h08);    24////
	udm_wr_single(32'h80000180, 8'h0a);    25
	udm_wr_single(32'h80000184, 8'h08);    25
	udm_wr_single(32'h80000188, 8'h01);    25
	udm_wr_single(32'h8000018c, 8'h03);    25   
	*/ 
	//udm_wr_single(32'h70000000, 8'hDA);
	
	//udm_wr_single(32'h00000010, 1'b1);
	//udm_rd_single(32'h0000000c);
	/*udm_check();
	udm_hreset();
	
	udm_wr_single(32'h00000000, 32'h33cc);
	udm_rd_single(32'h00000004);*/
	
	/*udm_wr_single(32'h80000000, 32'h01);
	udm_wr_single(32'h80000004, 32'h02);
	udm_wr_single(32'h80000008, 32'h03);
	udm_wr_single(32'h8000000c, 32'h04);
	udm_wr_single(32'h80000010, 32'h05);
	udm_wr_single(32'h80000014, 32'h06);
	udm_wr_single(32'h80000018, 32'h07);
	udm_wr_single(32'h8000001c, 32'h08);
	udm_wr_single(32'h80000020, 32'h09);
	udm_wr_single(32'h80000024, 32'h0a);
	
	udm_wr_single(32'h00000010, 1'b1);
	udm_rd_single(32'h0000000c);*/
	
	
	//arr
	/*udm_wr_single(32'h80000000, 8'h31);
	udm_wr_single(32'h80000004, 8'h32);
	udm_wr_single(32'h80000008, 8'h33);
	udm_wr_single(32'h8000000C, 8'h34);
	udm_wr_single(32'h80000010, 8'h35);
	udm_wr_single(32'h80000014, 8'h36);
	udm_wr_single(32'h80000018, 8'h37);
	udm_wr_single(32'h8000001C, 8'h38);
	udm_wr_single(32'h80000020, 8'h31);
	udm_wr_single(32'h80000024, 8'h32);
	udm_wr_single(32'h80000028, 8'h33);
	udm_wr_single(32'h8000002C, 8'h34);
	udm_wr_single(32'h80000030, 8'h35);
	udm_wr_single(32'h80000034, 8'h36);
	udm_wr_single(32'h80000038, 8'h37);
	udm_wr_single(32'h8000003C, 8'h38);
	udm_wr_single(32'h80000040, 8'h31);
	udm_wr_single(32'h80000044, 8'h32);
	udm_wr_single(32'h80000048, 8'h33);
	udm_wr_single(32'h8000004C, 8'h34);
	udm_wr_single(32'h80000050, 8'h35);
	udm_wr_single(32'h80000054, 8'h36);
	udm_wr_single(32'h80000058, 8'h37);
	udm_wr_single(32'h8000005C, 8'h38);
	udm_wr_single(32'h80000060, 8'h31);
	udm_wr_single(32'h80000064, 8'h32);
	udm_wr_single(32'h80000068, 8'h33);
	udm_wr_single(32'h8000006C, 8'h34);
	udm_wr_single(32'h80000070, 8'h35);
	udm_wr_single(32'h80000074, 8'h36);
	udm_wr_single(32'h80000078, 8'h37);
	udm_wr_single(32'h8000007C, 8'h38);*/
	
	/*udm_wr_single(32'h80000000, {8'h34,8'h33,8'h32,8'h31});
	udm_wr_single(32'h80000004, {8'h38,8'h37,8'h36,8'h35});
	
	udm_wr_single(32'h80000008, {8'h34,8'h33,8'h32,8'h31});
	udm_wr_single(32'h8000000C, {8'h38,8'h37,8'h36,8'h35});
	
	udm_wr_single(32'h80000010, {8'h34,8'h33,8'h32,8'h31});
	udm_wr_single(32'h80000014, {8'h38,8'h37,8'h36,8'h35});
	
	udm_wr_single(32'h80000018, {8'h34,8'h33,8'h32,8'h31});
	udm_wr_single(32'h8000001C, {8'h38,8'h37,8'h36,8'h35});*/
	
	/*udm_wr_single(32'h80000020, 8'h31);
	udm_wr_single(32'h80000024, 8'h32);
	udm_wr_single(32'h80000028, 8'h33);
	udm_wr_single(32'h8000002C, 8'h34);
	udm_wr_single(32'h80000030, 8'h35);
	udm_wr_single(32'h80000034, 8'h36);
	udm_wr_single(32'h80000038, 8'h37);
	udm_wr_single(32'h8000003C, 8'h38);
	udm_wr_single(32'h80000040, 8'h31);
	udm_wr_single(32'h80000044, 8'h32);
	udm_wr_single(32'h80000048, 8'h33);
	udm_wr_single(32'h8000004C, 8'h34);
	udm_wr_single(32'h80000050, 8'h35);
	udm_wr_single(32'h80000054, 8'h36);
	udm_wr_single(32'h80000058, 8'h37);
	udm_wr_single(32'h8000005C, 8'h38);
	udm_wr_single(32'h80000060, 8'h31);
	udm_wr_single(32'h80000064, 8'h32);
	udm_wr_single(32'h80000068, 8'h33);
	udm_wr_single(32'h8000006C, 8'h34);
	udm_wr_single(32'h80000070, 8'h35);
	udm_wr_single(32'h80000074, 8'h36);
	udm_wr_single(32'h80000078, 8'h37);
	udm_wr_single(32'h8000007C, 8'h38);*/
	
	//len
	//udm_wr_single(32'h00000008, 32'h20);
	//start
	
	
	udm_wr_single(32'h90000000, 8'hDA);
	
	udm_wr_single(32'h00000010, 1'b1);
	
	
	//read ret
	//udm_rd_single(32'h0000000C);
	
	
	WAIT(50000);

	$display ("### TEST PROCEDURE FINISHED ###");
	$stop;
end
//
always #`HALF_PERIOD CLK_100MHZ = ~CLK_100MHZ;

always #1000 SW = SW + 8'h1;
//
endmodule
