// ==============================================================
// RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and OpenCL
// Version: 2019.2
// Copyright (C) 1986-2019 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module Mat2Array (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        img_data_stream_V_dout,
        img_data_stream_V_empty_n,
        img_data_stream_V_read,
        fb_address0,
        fb_ce0,
        fb_we0,
        fb_d0
);

parameter    ap_ST_fsm_state1 = 4'd1;
parameter    ap_ST_fsm_state2 = 4'd2;
parameter    ap_ST_fsm_pp0_stage0 = 4'd4;
parameter    ap_ST_fsm_state5 = 4'd8;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
input  [7:0] img_data_stream_V_dout;
input   img_data_stream_V_empty_n;
output   img_data_stream_V_read;
output  [6:0] fb_address0;
output   fb_ce0;
output   fb_we0;
output  [7:0] fb_d0;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg img_data_stream_V_read;
reg fb_ce0;
reg fb_we0;

(* fsm_encoding = "none" *) reg   [3:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
reg    img_data_stream_V_blk_n;
wire    ap_CS_fsm_pp0_stage0;
reg    ap_enable_reg_pp0_iter1;
wire    ap_block_pp0_stage0;
reg   [0:0] icmp_ln241_reg_199;
reg   [3:0] t_V_1_reg_107;
wire   [0:0] icmp_ln240_fu_118_p2;
wire    ap_CS_fsm_state2;
wire   [3:0] row_V_fu_124_p2;
reg   [3:0] row_V_reg_184;
wire   [6:0] shl_ln_fu_130_p3;
reg   [6:0] shl_ln_reg_189;
wire   [4:0] shl_ln1352_1_fu_138_p3;
reg   [4:0] shl_ln1352_1_reg_194;
wire   [0:0] icmp_ln241_fu_146_p2;
wire    ap_block_state3_pp0_stage0_iter0;
reg    ap_block_state4_pp0_stage0_iter1;
reg    ap_block_pp0_stage0_11001;
wire   [3:0] col_V_fu_152_p2;
reg    ap_enable_reg_pp0_iter0;
wire   [4:0] add_ln253_1_fu_162_p2;
reg   [4:0] add_ln253_1_reg_208;
reg    ap_block_pp0_stage0_subdone;
reg    ap_condition_pp0_exit_iter0_state3;
reg   [3:0] t_V_reg_96;
wire    ap_CS_fsm_state5;
wire   [63:0] zext_ln253_fu_175_p1;
wire   [4:0] zext_ln253_1_fu_158_p1;
wire   [6:0] zext_ln253_2_fu_167_p1;
wire   [6:0] add_ln253_fu_170_p2;
reg   [3:0] ap_NS_fsm;
reg    ap_idle_pp0;
wire    ap_enable_pp0;

// power-on initialization
initial begin
#0 ap_CS_fsm = 4'd1;
#0 ap_enable_reg_pp0_iter1 = 1'b0;
#0 ap_enable_reg_pp0_iter0 = 1'b0;
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_CS_fsm <= ap_ST_fsm_state1;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter0 <= 1'b0;
    end else begin
        if (((1'b0 == ap_block_pp0_stage0_subdone) & (1'b1 == ap_condition_pp0_exit_iter0_state3) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
            ap_enable_reg_pp0_iter0 <= 1'b0;
        end else if (((icmp_ln240_fu_118_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state2))) begin
            ap_enable_reg_pp0_iter0 <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter1 <= 1'b0;
    end else begin
        if (((1'b0 == ap_block_pp0_stage0_subdone) & (1'b1 == ap_condition_pp0_exit_iter0_state3))) begin
            ap_enable_reg_pp0_iter1 <= (1'b1 ^ ap_condition_pp0_exit_iter0_state3);
        end else if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter1 <= ap_enable_reg_pp0_iter0;
        end else if (((icmp_ln240_fu_118_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state2))) begin
            ap_enable_reg_pp0_iter1 <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (icmp_ln241_fu_146_p2 == 1'd0) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        t_V_1_reg_107 <= col_V_fu_152_p2;
    end else if (((icmp_ln240_fu_118_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state2))) begin
        t_V_1_reg_107 <= 4'd0;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state5)) begin
        t_V_reg_96 <= row_V_reg_184;
    end else if (((ap_start == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
        t_V_reg_96 <= 4'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (icmp_ln241_fu_146_p2 == 1'd0) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        add_ln253_1_reg_208 <= add_ln253_1_fu_162_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        icmp_ln241_reg_199 <= icmp_ln241_fu_146_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state2)) begin
        row_V_reg_184 <= row_V_fu_124_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln240_fu_118_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state2))) begin
        shl_ln1352_1_reg_194[4 : 1] <= shl_ln1352_1_fu_138_p3[4 : 1];
        shl_ln_reg_189[6 : 3] <= shl_ln_fu_130_p3[6 : 3];
    end
end

always @ (*) begin
    if ((icmp_ln241_fu_146_p2 == 1'd1)) begin
        ap_condition_pp0_exit_iter0_state3 = 1'b1;
    end else begin
        ap_condition_pp0_exit_iter0_state3 = 1'b0;
    end
end

always @ (*) begin
    if ((((icmp_ln240_fu_118_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state2)) | ((ap_start == 1'b0) & (1'b1 == ap_CS_fsm_state1)))) begin
        ap_done = 1'b1;
    end else begin
        ap_done = 1'b0;
    end
end

always @ (*) begin
    if (((ap_start == 1'b0) & (1'b1 == ap_CS_fsm_state1))) begin
        ap_idle = 1'b1;
    end else begin
        ap_idle = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter0 == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b0))) begin
        ap_idle_pp0 = 1'b1;
    end else begin
        ap_idle_pp0 = 1'b0;
    end
end

always @ (*) begin
    if (((icmp_ln240_fu_118_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        fb_ce0 = 1'b1;
    end else begin
        fb_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (icmp_ln241_reg_199 == 1'd0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        fb_we0 = 1'b1;
    end else begin
        fb_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((icmp_ln241_reg_199 == 1'd0) & (1'b0 == ap_block_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        img_data_stream_V_blk_n = img_data_stream_V_empty_n;
    end else begin
        img_data_stream_V_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (icmp_ln241_reg_199 == 1'd0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        img_data_stream_V_read = 1'b1;
    end else begin
        img_data_stream_V_read = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            if (((ap_start == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end
        end
        ap_ST_fsm_state2 : begin
            if (((icmp_ln240_fu_118_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end
        end
        ap_ST_fsm_pp0_stage0 : begin
            if (~((1'b0 == ap_block_pp0_stage0_subdone) & (icmp_ln241_fu_146_p2 == 1'd1) & (ap_enable_reg_pp0_iter0 == 1'b1))) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end else if (((1'b0 == ap_block_pp0_stage0_subdone) & (icmp_ln241_fu_146_p2 == 1'd1) & (ap_enable_reg_pp0_iter0 == 1'b1))) begin
                ap_NS_fsm = ap_ST_fsm_state5;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end
        end
        ap_ST_fsm_state5 : begin
            ap_NS_fsm = ap_ST_fsm_state2;
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign add_ln253_1_fu_162_p2 = (shl_ln1352_1_reg_194 + zext_ln253_1_fu_158_p1);

assign add_ln253_fu_170_p2 = (zext_ln253_2_fu_167_p1 + shl_ln_reg_189);

assign ap_CS_fsm_pp0_stage0 = ap_CS_fsm[32'd2];

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_state5 = ap_CS_fsm[32'd3];

assign ap_block_pp0_stage0 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_pp0_stage0_11001 = ((icmp_ln241_reg_199 == 1'd0) & (img_data_stream_V_empty_n == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b1));
end

always @ (*) begin
    ap_block_pp0_stage0_subdone = ((icmp_ln241_reg_199 == 1'd0) & (img_data_stream_V_empty_n == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b1));
end

assign ap_block_state3_pp0_stage0_iter0 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_state4_pp0_stage0_iter1 = ((icmp_ln241_reg_199 == 1'd0) & (img_data_stream_V_empty_n == 1'b0));
end

assign ap_enable_pp0 = (ap_idle_pp0 ^ 1'b1);

assign col_V_fu_152_p2 = (t_V_1_reg_107 + 4'd1);

assign fb_address0 = zext_ln253_fu_175_p1;

assign fb_d0 = img_data_stream_V_dout;

assign icmp_ln240_fu_118_p2 = ((t_V_reg_96 == 4'd10) ? 1'b1 : 1'b0);

assign icmp_ln241_fu_146_p2 = ((t_V_1_reg_107 == 4'd10) ? 1'b1 : 1'b0);

assign row_V_fu_124_p2 = (t_V_reg_96 + 4'd1);

assign shl_ln1352_1_fu_138_p3 = {{t_V_reg_96}, {1'd0}};

assign shl_ln_fu_130_p3 = {{t_V_reg_96}, {3'd0}};

assign zext_ln253_1_fu_158_p1 = t_V_1_reg_107;

assign zext_ln253_2_fu_167_p1 = add_ln253_1_reg_208;

assign zext_ln253_fu_175_p1 = add_ln253_fu_170_p2;

always @ (posedge ap_clk) begin
    shl_ln_reg_189[2:0] <= 3'b000;
    shl_ln1352_1_reg_194[0] <= 1'b0;
end

endmodule //Mat2Array
