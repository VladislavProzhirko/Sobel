// ==============================================================
// RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and OpenCL
// Version: 2019.2
// Copyright (C) 1986-2019 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

#include "Sobel.h"
#include "AESL_pkg.h"

using namespace std;

namespace ap_rtl {

const sc_lv<5> Sobel::ap_const_lv5_0 = "00000";
const sc_logic Sobel::ap_const_logic_0 = sc_dt::Log_0;
const sc_lv<32> Sobel::ap_const_lv32_0 = "00000000000000000000000000000000";
const sc_logic Sobel::ap_const_logic_1 = sc_dt::Log_1;
const sc_lv<2> Sobel::ap_const_lv2_0 = "00";
const sc_lv<2> Sobel::ap_const_lv2_1 = "1";
const bool Sobel::ap_const_boolean_1 = true;

Sobel::Sobel(sc_module_name name) : sc_module(name), mVcdFile(0) {
    Block_proc_U0 = new Block_proc("Block_proc_U0");
    Block_proc_U0->ap_clk(ap_clk);
    Block_proc_U0->ap_rst(ap_rst);
    Block_proc_U0->ap_start(Block_proc_U0_ap_start);
    Block_proc_U0->ap_done(Block_proc_U0_ap_done);
    Block_proc_U0->ap_continue(Block_proc_U0_ap_continue);
    Block_proc_U0->ap_idle(Block_proc_U0_ap_idle);
    Block_proc_U0->ap_ready(Block_proc_U0_ap_ready);
    Block_proc_U0->src_rows_V_out_din(Block_proc_U0_src_rows_V_out_din);
    Block_proc_U0->src_rows_V_out_full_n(src_rows_V_c_full_n);
    Block_proc_U0->src_rows_V_out_write(Block_proc_U0_src_rows_V_out_write);
    Block_proc_U0->src_cols_V_out_din(Block_proc_U0_src_cols_V_out_din);
    Block_proc_U0->src_cols_V_out_full_n(src_cols_V_c_full_n);
    Block_proc_U0->src_cols_V_out_write(Block_proc_U0_src_cols_V_out_write);
    Array2Mat_U0 = new Array2Mat("Array2Mat_U0");
    Array2Mat_U0->ap_clk(ap_clk);
    Array2Mat_U0->ap_rst(ap_rst);
    Array2Mat_U0->ap_start(Array2Mat_U0_ap_start);
    Array2Mat_U0->start_full_n(start_for_Filter2D_U0_full_n);
    Array2Mat_U0->ap_done(Array2Mat_U0_ap_done);
    Array2Mat_U0->ap_continue(Array2Mat_U0_ap_continue);
    Array2Mat_U0->ap_idle(Array2Mat_U0_ap_idle);
    Array2Mat_U0->ap_ready(Array2Mat_U0_ap_ready);
    Array2Mat_U0->start_out(Array2Mat_U0_start_out);
    Array2Mat_U0->start_write(Array2Mat_U0_start_write);
    Array2Mat_U0->fb_address0(Array2Mat_U0_fb_address0);
    Array2Mat_U0->fb_ce0(Array2Mat_U0_fb_ce0);
    Array2Mat_U0->fb_q0(image_in_q0);
    Array2Mat_U0->img_rows_V_dout(src_rows_V_c_dout);
    Array2Mat_U0->img_rows_V_empty_n(src_rows_V_c_empty_n);
    Array2Mat_U0->img_rows_V_read(Array2Mat_U0_img_rows_V_read);
    Array2Mat_U0->img_cols_V_dout(src_cols_V_c_dout);
    Array2Mat_U0->img_cols_V_empty_n(src_cols_V_c_empty_n);
    Array2Mat_U0->img_cols_V_read(Array2Mat_U0_img_cols_V_read);
    Array2Mat_U0->img_data_stream_V_din(Array2Mat_U0_img_data_stream_V_din);
    Array2Mat_U0->img_data_stream_V_full_n(src_data_stream_0_V_full_n);
    Array2Mat_U0->img_data_stream_V_write(Array2Mat_U0_img_data_stream_V_write);
    Array2Mat_U0->img_rows_V_out_din(Array2Mat_U0_img_rows_V_out_din);
    Array2Mat_U0->img_rows_V_out_full_n(src_rows_V_c8_full_n);
    Array2Mat_U0->img_rows_V_out_write(Array2Mat_U0_img_rows_V_out_write);
    Array2Mat_U0->img_cols_V_out_din(Array2Mat_U0_img_cols_V_out_din);
    Array2Mat_U0->img_cols_V_out_full_n(src_cols_V_c9_full_n);
    Array2Mat_U0->img_cols_V_out_write(Array2Mat_U0_img_cols_V_out_write);
    Filter2D_U0 = new Filter2D("Filter2D_U0");
    Filter2D_U0->ap_clk(ap_clk);
    Filter2D_U0->ap_rst(ap_rst);
    Filter2D_U0->ap_start(Filter2D_U0_ap_start);
    Filter2D_U0->ap_done(Filter2D_U0_ap_done);
    Filter2D_U0->ap_continue(Filter2D_U0_ap_continue);
    Filter2D_U0->ap_idle(Filter2D_U0_ap_idle);
    Filter2D_U0->ap_ready(Filter2D_U0_ap_ready);
    Filter2D_U0->p_src_rows_V_dout(src_rows_V_c8_dout);
    Filter2D_U0->p_src_rows_V_empty_n(src_rows_V_c8_empty_n);
    Filter2D_U0->p_src_rows_V_read(Filter2D_U0_p_src_rows_V_read);
    Filter2D_U0->p_src_cols_V_dout(src_cols_V_c9_dout);
    Filter2D_U0->p_src_cols_V_empty_n(src_cols_V_c9_empty_n);
    Filter2D_U0->p_src_cols_V_read(Filter2D_U0_p_src_cols_V_read);
    Filter2D_U0->p_src_data_stream_V_dout(src_data_stream_0_V_dout);
    Filter2D_U0->p_src_data_stream_V_empty_n(src_data_stream_0_V_empty_n);
    Filter2D_U0->p_src_data_stream_V_read(Filter2D_U0_p_src_data_stream_V_read);
    Filter2D_U0->p_dst_data_stream_V_din(Filter2D_U0_p_dst_data_stream_V_din);
    Filter2D_U0->p_dst_data_stream_V_full_n(dst_data_stream_0_V_full_n);
    Filter2D_U0->p_dst_data_stream_V_write(Filter2D_U0_p_dst_data_stream_V_write);
    Mat2Array_U0 = new Mat2Array("Mat2Array_U0");
    Mat2Array_U0->ap_clk(ap_clk);
    Mat2Array_U0->ap_rst(ap_rst);
    Mat2Array_U0->ap_start(Mat2Array_U0_ap_start);
    Mat2Array_U0->ap_done(Mat2Array_U0_ap_done);
    Mat2Array_U0->ap_continue(Mat2Array_U0_ap_continue);
    Mat2Array_U0->ap_idle(Mat2Array_U0_ap_idle);
    Mat2Array_U0->ap_ready(Mat2Array_U0_ap_ready);
    Mat2Array_U0->img_data_stream_V_dout(dst_data_stream_0_V_dout);
    Mat2Array_U0->img_data_stream_V_empty_n(dst_data_stream_0_V_empty_n);
    Mat2Array_U0->img_data_stream_V_read(Mat2Array_U0_img_data_stream_V_read);
    Mat2Array_U0->fb_address0(Mat2Array_U0_fb_address0);
    Mat2Array_U0->fb_ce0(Mat2Array_U0_fb_ce0);
    Mat2Array_U0->fb_we0(Mat2Array_U0_fb_we0);
    Mat2Array_U0->fb_d0(Mat2Array_U0_fb_d0);
    Mat2Array_U0->fb_q0(image_out_q0);
    src_rows_V_c_U = new fifo_w5_d2_A("src_rows_V_c_U");
    src_rows_V_c_U->clk(ap_clk);
    src_rows_V_c_U->reset(ap_rst);
    src_rows_V_c_U->if_read_ce(ap_var_for_const0);
    src_rows_V_c_U->if_write_ce(ap_var_for_const0);
    src_rows_V_c_U->if_din(Block_proc_U0_src_rows_V_out_din);
    src_rows_V_c_U->if_full_n(src_rows_V_c_full_n);
    src_rows_V_c_U->if_write(Block_proc_U0_src_rows_V_out_write);
    src_rows_V_c_U->if_dout(src_rows_V_c_dout);
    src_rows_V_c_U->if_empty_n(src_rows_V_c_empty_n);
    src_rows_V_c_U->if_read(Array2Mat_U0_img_rows_V_read);
    src_cols_V_c_U = new fifo_w5_d2_A("src_cols_V_c_U");
    src_cols_V_c_U->clk(ap_clk);
    src_cols_V_c_U->reset(ap_rst);
    src_cols_V_c_U->if_read_ce(ap_var_for_const0);
    src_cols_V_c_U->if_write_ce(ap_var_for_const0);
    src_cols_V_c_U->if_din(Block_proc_U0_src_cols_V_out_din);
    src_cols_V_c_U->if_full_n(src_cols_V_c_full_n);
    src_cols_V_c_U->if_write(Block_proc_U0_src_cols_V_out_write);
    src_cols_V_c_U->if_dout(src_cols_V_c_dout);
    src_cols_V_c_U->if_empty_n(src_cols_V_c_empty_n);
    src_cols_V_c_U->if_read(Array2Mat_U0_img_cols_V_read);
    src_data_stream_0_V_U = new fifo_w8_d2_A("src_data_stream_0_V_U");
    src_data_stream_0_V_U->clk(ap_clk);
    src_data_stream_0_V_U->reset(ap_rst);
    src_data_stream_0_V_U->if_read_ce(ap_var_for_const0);
    src_data_stream_0_V_U->if_write_ce(ap_var_for_const0);
    src_data_stream_0_V_U->if_din(Array2Mat_U0_img_data_stream_V_din);
    src_data_stream_0_V_U->if_full_n(src_data_stream_0_V_full_n);
    src_data_stream_0_V_U->if_write(Array2Mat_U0_img_data_stream_V_write);
    src_data_stream_0_V_U->if_dout(src_data_stream_0_V_dout);
    src_data_stream_0_V_U->if_empty_n(src_data_stream_0_V_empty_n);
    src_data_stream_0_V_U->if_read(Filter2D_U0_p_src_data_stream_V_read);
    src_rows_V_c8_U = new fifo_w5_d2_A("src_rows_V_c8_U");
    src_rows_V_c8_U->clk(ap_clk);
    src_rows_V_c8_U->reset(ap_rst);
    src_rows_V_c8_U->if_read_ce(ap_var_for_const0);
    src_rows_V_c8_U->if_write_ce(ap_var_for_const0);
    src_rows_V_c8_U->if_din(Array2Mat_U0_img_rows_V_out_din);
    src_rows_V_c8_U->if_full_n(src_rows_V_c8_full_n);
    src_rows_V_c8_U->if_write(Array2Mat_U0_img_rows_V_out_write);
    src_rows_V_c8_U->if_dout(src_rows_V_c8_dout);
    src_rows_V_c8_U->if_empty_n(src_rows_V_c8_empty_n);
    src_rows_V_c8_U->if_read(Filter2D_U0_p_src_rows_V_read);
    src_cols_V_c9_U = new fifo_w5_d2_A("src_cols_V_c9_U");
    src_cols_V_c9_U->clk(ap_clk);
    src_cols_V_c9_U->reset(ap_rst);
    src_cols_V_c9_U->if_read_ce(ap_var_for_const0);
    src_cols_V_c9_U->if_write_ce(ap_var_for_const0);
    src_cols_V_c9_U->if_din(Array2Mat_U0_img_cols_V_out_din);
    src_cols_V_c9_U->if_full_n(src_cols_V_c9_full_n);
    src_cols_V_c9_U->if_write(Array2Mat_U0_img_cols_V_out_write);
    src_cols_V_c9_U->if_dout(src_cols_V_c9_dout);
    src_cols_V_c9_U->if_empty_n(src_cols_V_c9_empty_n);
    src_cols_V_c9_U->if_read(Filter2D_U0_p_src_cols_V_read);
    dst_data_stream_0_V_U = new fifo_w8_d2_A("dst_data_stream_0_V_U");
    dst_data_stream_0_V_U->clk(ap_clk);
    dst_data_stream_0_V_U->reset(ap_rst);
    dst_data_stream_0_V_U->if_read_ce(ap_var_for_const0);
    dst_data_stream_0_V_U->if_write_ce(ap_var_for_const0);
    dst_data_stream_0_V_U->if_din(Filter2D_U0_p_dst_data_stream_V_din);
    dst_data_stream_0_V_U->if_full_n(dst_data_stream_0_V_full_n);
    dst_data_stream_0_V_U->if_write(Filter2D_U0_p_dst_data_stream_V_write);
    dst_data_stream_0_V_U->if_dout(dst_data_stream_0_V_dout);
    dst_data_stream_0_V_U->if_empty_n(dst_data_stream_0_V_empty_n);
    dst_data_stream_0_V_U->if_read(Mat2Array_U0_img_data_stream_V_read);
    start_for_Filter2eOg_U = new start_for_Filter2eOg("start_for_Filter2eOg_U");
    start_for_Filter2eOg_U->clk(ap_clk);
    start_for_Filter2eOg_U->reset(ap_rst);
    start_for_Filter2eOg_U->if_read_ce(ap_var_for_const0);
    start_for_Filter2eOg_U->if_write_ce(ap_var_for_const0);
    start_for_Filter2eOg_U->if_din(start_for_Filter2D_U0_din);
    start_for_Filter2eOg_U->if_full_n(start_for_Filter2D_U0_full_n);
    start_for_Filter2eOg_U->if_write(Array2Mat_U0_start_write);
    start_for_Filter2eOg_U->if_dout(start_for_Filter2D_U0_dout);
    start_for_Filter2eOg_U->if_empty_n(start_for_Filter2D_U0_empty_n);
    start_for_Filter2eOg_U->if_read(Filter2D_U0_ap_ready);

    SC_METHOD(thread_ap_clk_no_reset_);
    dont_initialize();
    sensitive << ( ap_clk.pos() );

    SC_METHOD(thread_Array2Mat_U0_ap_continue);

    SC_METHOD(thread_Array2Mat_U0_ap_start);
    sensitive << ( ap_start );
    sensitive << ( ap_sync_reg_Array2Mat_U0_ap_ready );

    SC_METHOD(thread_Block_proc_U0_ap_continue);

    SC_METHOD(thread_Block_proc_U0_ap_start);
    sensitive << ( ap_start );
    sensitive << ( ap_sync_reg_Block_proc_U0_ap_ready );

    SC_METHOD(thread_Block_proc_U0_start_full_n);

    SC_METHOD(thread_Block_proc_U0_start_write);

    SC_METHOD(thread_Filter2D_U0_ap_continue);

    SC_METHOD(thread_Filter2D_U0_ap_start);
    sensitive << ( start_for_Filter2D_U0_empty_n );

    SC_METHOD(thread_Filter2D_U0_start_full_n);

    SC_METHOD(thread_Filter2D_U0_start_write);

    SC_METHOD(thread_Mat2Array_U0_ap_continue);

    SC_METHOD(thread_Mat2Array_U0_ap_start);
    sensitive << ( ap_start );
    sensitive << ( ap_sync_reg_Mat2Array_U0_ap_ready );

    SC_METHOD(thread_Mat2Array_U0_start_full_n);

    SC_METHOD(thread_Mat2Array_U0_start_write);

    SC_METHOD(thread_ap_done);
    sensitive << ( Mat2Array_U0_ap_done );

    SC_METHOD(thread_ap_idle);
    sensitive << ( Block_proc_U0_ap_idle );
    sensitive << ( Array2Mat_U0_ap_idle );
    sensitive << ( Filter2D_U0_ap_idle );
    sensitive << ( Mat2Array_U0_ap_idle );

    SC_METHOD(thread_ap_ready);
    sensitive << ( ap_sync_ready );

    SC_METHOD(thread_ap_sync_Array2Mat_U0_ap_ready);
    sensitive << ( Array2Mat_U0_ap_ready );
    sensitive << ( ap_sync_reg_Array2Mat_U0_ap_ready );

    SC_METHOD(thread_ap_sync_Block_proc_U0_ap_ready);
    sensitive << ( Block_proc_U0_ap_ready );
    sensitive << ( ap_sync_reg_Block_proc_U0_ap_ready );

    SC_METHOD(thread_ap_sync_Mat2Array_U0_ap_ready);
    sensitive << ( Mat2Array_U0_ap_ready );
    sensitive << ( ap_sync_reg_Mat2Array_U0_ap_ready );

    SC_METHOD(thread_ap_sync_continue);

    SC_METHOD(thread_ap_sync_done);
    sensitive << ( Mat2Array_U0_ap_done );

    SC_METHOD(thread_ap_sync_ready);
    sensitive << ( ap_sync_Block_proc_U0_ap_ready );
    sensitive << ( ap_sync_Array2Mat_U0_ap_ready );
    sensitive << ( ap_sync_Mat2Array_U0_ap_ready );

    SC_METHOD(thread_image_in_address0);
    sensitive << ( Array2Mat_U0_fb_address0 );

    SC_METHOD(thread_image_in_ce0);
    sensitive << ( Array2Mat_U0_fb_ce0 );

    SC_METHOD(thread_image_in_d0);

    SC_METHOD(thread_image_in_we0);

    SC_METHOD(thread_image_out_address0);
    sensitive << ( Mat2Array_U0_fb_address0 );

    SC_METHOD(thread_image_out_ce0);
    sensitive << ( Mat2Array_U0_fb_ce0 );

    SC_METHOD(thread_image_out_d0);
    sensitive << ( Mat2Array_U0_fb_d0 );

    SC_METHOD(thread_image_out_we0);
    sensitive << ( Mat2Array_U0_fb_we0 );

    SC_METHOD(thread_start_for_Filter2D_U0_din);

    SC_THREAD(thread_hdltv_gen);
    sensitive << ( ap_clk.pos() );

    SC_THREAD(thread_ap_var_for_const0);

    ap_sync_reg_Block_proc_U0_ap_ready = SC_LOGIC_0;
    Block_proc_U0_ap_ready_count = "00";
    ap_sync_reg_Array2Mat_U0_ap_ready = SC_LOGIC_0;
    Array2Mat_U0_ap_ready_count = "00";
    ap_sync_reg_Mat2Array_U0_ap_ready = SC_LOGIC_0;
    Mat2Array_U0_ap_ready_count = "00";
    static int apTFileNum = 0;
    stringstream apTFilenSS;
    apTFilenSS << "Sobel_sc_trace_" << apTFileNum ++;
    string apTFn = apTFilenSS.str();
    mVcdFile = sc_create_vcd_trace_file(apTFn.c_str());
    mVcdFile->set_time_unit(1, SC_PS);
    if (1) {
#ifdef __HLS_TRACE_LEVEL_PORT__
    sc_trace(mVcdFile, image_in_address0, "(port)image_in_address0");
    sc_trace(mVcdFile, image_in_ce0, "(port)image_in_ce0");
    sc_trace(mVcdFile, image_in_d0, "(port)image_in_d0");
    sc_trace(mVcdFile, image_in_q0, "(port)image_in_q0");
    sc_trace(mVcdFile, image_in_we0, "(port)image_in_we0");
    sc_trace(mVcdFile, image_out_address0, "(port)image_out_address0");
    sc_trace(mVcdFile, image_out_ce0, "(port)image_out_ce0");
    sc_trace(mVcdFile, image_out_d0, "(port)image_out_d0");
    sc_trace(mVcdFile, image_out_q0, "(port)image_out_q0");
    sc_trace(mVcdFile, image_out_we0, "(port)image_out_we0");
    sc_trace(mVcdFile, ap_clk, "(port)ap_clk");
    sc_trace(mVcdFile, ap_rst, "(port)ap_rst");
    sc_trace(mVcdFile, ap_start, "(port)ap_start");
    sc_trace(mVcdFile, ap_done, "(port)ap_done");
    sc_trace(mVcdFile, ap_ready, "(port)ap_ready");
    sc_trace(mVcdFile, ap_idle, "(port)ap_idle");
#endif
#ifdef __HLS_TRACE_LEVEL_INT__
    sc_trace(mVcdFile, Block_proc_U0_ap_start, "Block_proc_U0_ap_start");
    sc_trace(mVcdFile, Block_proc_U0_ap_done, "Block_proc_U0_ap_done");
    sc_trace(mVcdFile, Block_proc_U0_ap_continue, "Block_proc_U0_ap_continue");
    sc_trace(mVcdFile, Block_proc_U0_ap_idle, "Block_proc_U0_ap_idle");
    sc_trace(mVcdFile, Block_proc_U0_ap_ready, "Block_proc_U0_ap_ready");
    sc_trace(mVcdFile, Block_proc_U0_src_rows_V_out_din, "Block_proc_U0_src_rows_V_out_din");
    sc_trace(mVcdFile, Block_proc_U0_src_rows_V_out_write, "Block_proc_U0_src_rows_V_out_write");
    sc_trace(mVcdFile, Block_proc_U0_src_cols_V_out_din, "Block_proc_U0_src_cols_V_out_din");
    sc_trace(mVcdFile, Block_proc_U0_src_cols_V_out_write, "Block_proc_U0_src_cols_V_out_write");
    sc_trace(mVcdFile, Array2Mat_U0_ap_start, "Array2Mat_U0_ap_start");
    sc_trace(mVcdFile, Array2Mat_U0_ap_done, "Array2Mat_U0_ap_done");
    sc_trace(mVcdFile, Array2Mat_U0_ap_continue, "Array2Mat_U0_ap_continue");
    sc_trace(mVcdFile, Array2Mat_U0_ap_idle, "Array2Mat_U0_ap_idle");
    sc_trace(mVcdFile, Array2Mat_U0_ap_ready, "Array2Mat_U0_ap_ready");
    sc_trace(mVcdFile, Array2Mat_U0_start_out, "Array2Mat_U0_start_out");
    sc_trace(mVcdFile, Array2Mat_U0_start_write, "Array2Mat_U0_start_write");
    sc_trace(mVcdFile, Array2Mat_U0_fb_address0, "Array2Mat_U0_fb_address0");
    sc_trace(mVcdFile, Array2Mat_U0_fb_ce0, "Array2Mat_U0_fb_ce0");
    sc_trace(mVcdFile, Array2Mat_U0_img_rows_V_read, "Array2Mat_U0_img_rows_V_read");
    sc_trace(mVcdFile, Array2Mat_U0_img_cols_V_read, "Array2Mat_U0_img_cols_V_read");
    sc_trace(mVcdFile, Array2Mat_U0_img_data_stream_V_din, "Array2Mat_U0_img_data_stream_V_din");
    sc_trace(mVcdFile, Array2Mat_U0_img_data_stream_V_write, "Array2Mat_U0_img_data_stream_V_write");
    sc_trace(mVcdFile, Array2Mat_U0_img_rows_V_out_din, "Array2Mat_U0_img_rows_V_out_din");
    sc_trace(mVcdFile, Array2Mat_U0_img_rows_V_out_write, "Array2Mat_U0_img_rows_V_out_write");
    sc_trace(mVcdFile, Array2Mat_U0_img_cols_V_out_din, "Array2Mat_U0_img_cols_V_out_din");
    sc_trace(mVcdFile, Array2Mat_U0_img_cols_V_out_write, "Array2Mat_U0_img_cols_V_out_write");
    sc_trace(mVcdFile, Filter2D_U0_ap_start, "Filter2D_U0_ap_start");
    sc_trace(mVcdFile, Filter2D_U0_ap_done, "Filter2D_U0_ap_done");
    sc_trace(mVcdFile, Filter2D_U0_ap_continue, "Filter2D_U0_ap_continue");
    sc_trace(mVcdFile, Filter2D_U0_ap_idle, "Filter2D_U0_ap_idle");
    sc_trace(mVcdFile, Filter2D_U0_ap_ready, "Filter2D_U0_ap_ready");
    sc_trace(mVcdFile, Filter2D_U0_p_src_rows_V_read, "Filter2D_U0_p_src_rows_V_read");
    sc_trace(mVcdFile, Filter2D_U0_p_src_cols_V_read, "Filter2D_U0_p_src_cols_V_read");
    sc_trace(mVcdFile, Filter2D_U0_p_src_data_stream_V_read, "Filter2D_U0_p_src_data_stream_V_read");
    sc_trace(mVcdFile, Filter2D_U0_p_dst_data_stream_V_din, "Filter2D_U0_p_dst_data_stream_V_din");
    sc_trace(mVcdFile, Filter2D_U0_p_dst_data_stream_V_write, "Filter2D_U0_p_dst_data_stream_V_write");
    sc_trace(mVcdFile, Mat2Array_U0_ap_start, "Mat2Array_U0_ap_start");
    sc_trace(mVcdFile, Mat2Array_U0_ap_done, "Mat2Array_U0_ap_done");
    sc_trace(mVcdFile, Mat2Array_U0_ap_continue, "Mat2Array_U0_ap_continue");
    sc_trace(mVcdFile, Mat2Array_U0_ap_idle, "Mat2Array_U0_ap_idle");
    sc_trace(mVcdFile, Mat2Array_U0_ap_ready, "Mat2Array_U0_ap_ready");
    sc_trace(mVcdFile, Mat2Array_U0_img_data_stream_V_read, "Mat2Array_U0_img_data_stream_V_read");
    sc_trace(mVcdFile, Mat2Array_U0_fb_address0, "Mat2Array_U0_fb_address0");
    sc_trace(mVcdFile, Mat2Array_U0_fb_ce0, "Mat2Array_U0_fb_ce0");
    sc_trace(mVcdFile, Mat2Array_U0_fb_we0, "Mat2Array_U0_fb_we0");
    sc_trace(mVcdFile, Mat2Array_U0_fb_d0, "Mat2Array_U0_fb_d0");
    sc_trace(mVcdFile, ap_sync_continue, "ap_sync_continue");
    sc_trace(mVcdFile, src_rows_V_c_full_n, "src_rows_V_c_full_n");
    sc_trace(mVcdFile, src_rows_V_c_dout, "src_rows_V_c_dout");
    sc_trace(mVcdFile, src_rows_V_c_empty_n, "src_rows_V_c_empty_n");
    sc_trace(mVcdFile, src_cols_V_c_full_n, "src_cols_V_c_full_n");
    sc_trace(mVcdFile, src_cols_V_c_dout, "src_cols_V_c_dout");
    sc_trace(mVcdFile, src_cols_V_c_empty_n, "src_cols_V_c_empty_n");
    sc_trace(mVcdFile, src_data_stream_0_V_full_n, "src_data_stream_0_V_full_n");
    sc_trace(mVcdFile, src_data_stream_0_V_dout, "src_data_stream_0_V_dout");
    sc_trace(mVcdFile, src_data_stream_0_V_empty_n, "src_data_stream_0_V_empty_n");
    sc_trace(mVcdFile, src_rows_V_c8_full_n, "src_rows_V_c8_full_n");
    sc_trace(mVcdFile, src_rows_V_c8_dout, "src_rows_V_c8_dout");
    sc_trace(mVcdFile, src_rows_V_c8_empty_n, "src_rows_V_c8_empty_n");
    sc_trace(mVcdFile, src_cols_V_c9_full_n, "src_cols_V_c9_full_n");
    sc_trace(mVcdFile, src_cols_V_c9_dout, "src_cols_V_c9_dout");
    sc_trace(mVcdFile, src_cols_V_c9_empty_n, "src_cols_V_c9_empty_n");
    sc_trace(mVcdFile, dst_data_stream_0_V_full_n, "dst_data_stream_0_V_full_n");
    sc_trace(mVcdFile, dst_data_stream_0_V_dout, "dst_data_stream_0_V_dout");
    sc_trace(mVcdFile, dst_data_stream_0_V_empty_n, "dst_data_stream_0_V_empty_n");
    sc_trace(mVcdFile, ap_sync_done, "ap_sync_done");
    sc_trace(mVcdFile, ap_sync_ready, "ap_sync_ready");
    sc_trace(mVcdFile, ap_sync_reg_Block_proc_U0_ap_ready, "ap_sync_reg_Block_proc_U0_ap_ready");
    sc_trace(mVcdFile, ap_sync_Block_proc_U0_ap_ready, "ap_sync_Block_proc_U0_ap_ready");
    sc_trace(mVcdFile, Block_proc_U0_ap_ready_count, "Block_proc_U0_ap_ready_count");
    sc_trace(mVcdFile, ap_sync_reg_Array2Mat_U0_ap_ready, "ap_sync_reg_Array2Mat_U0_ap_ready");
    sc_trace(mVcdFile, ap_sync_Array2Mat_U0_ap_ready, "ap_sync_Array2Mat_U0_ap_ready");
    sc_trace(mVcdFile, Array2Mat_U0_ap_ready_count, "Array2Mat_U0_ap_ready_count");
    sc_trace(mVcdFile, ap_sync_reg_Mat2Array_U0_ap_ready, "ap_sync_reg_Mat2Array_U0_ap_ready");
    sc_trace(mVcdFile, ap_sync_Mat2Array_U0_ap_ready, "ap_sync_Mat2Array_U0_ap_ready");
    sc_trace(mVcdFile, Mat2Array_U0_ap_ready_count, "Mat2Array_U0_ap_ready_count");
    sc_trace(mVcdFile, Block_proc_U0_start_full_n, "Block_proc_U0_start_full_n");
    sc_trace(mVcdFile, Block_proc_U0_start_write, "Block_proc_U0_start_write");
    sc_trace(mVcdFile, start_for_Filter2D_U0_din, "start_for_Filter2D_U0_din");
    sc_trace(mVcdFile, start_for_Filter2D_U0_full_n, "start_for_Filter2D_U0_full_n");
    sc_trace(mVcdFile, start_for_Filter2D_U0_dout, "start_for_Filter2D_U0_dout");
    sc_trace(mVcdFile, start_for_Filter2D_U0_empty_n, "start_for_Filter2D_U0_empty_n");
    sc_trace(mVcdFile, Filter2D_U0_start_full_n, "Filter2D_U0_start_full_n");
    sc_trace(mVcdFile, Filter2D_U0_start_write, "Filter2D_U0_start_write");
    sc_trace(mVcdFile, Mat2Array_U0_start_full_n, "Mat2Array_U0_start_full_n");
    sc_trace(mVcdFile, Mat2Array_U0_start_write, "Mat2Array_U0_start_write");
#endif

    }
    mHdltvinHandle.open("Sobel.hdltvin.dat");
    mHdltvoutHandle.open("Sobel.hdltvout.dat");
}

Sobel::~Sobel() {
    if (mVcdFile) 
        sc_close_vcd_trace_file(mVcdFile);

    mHdltvinHandle << "] " << endl;
    mHdltvoutHandle << "] " << endl;
    mHdltvinHandle.close();
    mHdltvoutHandle.close();
    delete Block_proc_U0;
    delete Array2Mat_U0;
    delete Filter2D_U0;
    delete Mat2Array_U0;
    delete src_rows_V_c_U;
    delete src_cols_V_c_U;
    delete src_data_stream_0_V_U;
    delete src_rows_V_c8_U;
    delete src_cols_V_c9_U;
    delete dst_data_stream_0_V_U;
    delete start_for_Filter2eOg_U;
}

void Sobel::thread_ap_var_for_const0() {
    ap_var_for_const0 = ap_const_logic_1;
}

void Sobel::thread_ap_clk_no_reset_() {
    if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_sync_ready.read()) && 
         esl_seteq<1,1,1>(ap_const_logic_0, Array2Mat_U0_ap_ready.read()))) {
        Array2Mat_U0_ap_ready_count = (!Array2Mat_U0_ap_ready_count.read().is_01() || !ap_const_lv2_1.is_01())? sc_lv<2>(): (sc_biguint<2>(Array2Mat_U0_ap_ready_count.read()) - sc_biguint<2>(ap_const_lv2_1));
    } else if ((esl_seteq<1,1,1>(ap_const_logic_0, ap_sync_ready.read()) && 
                esl_seteq<1,1,1>(ap_const_logic_1, Array2Mat_U0_ap_ready.read()))) {
        Array2Mat_U0_ap_ready_count = (!Array2Mat_U0_ap_ready_count.read().is_01() || !ap_const_lv2_1.is_01())? sc_lv<2>(): (sc_biguint<2>(Array2Mat_U0_ap_ready_count.read()) + sc_biguint<2>(ap_const_lv2_1));
    }
    if ((esl_seteq<1,1,1>(ap_const_logic_0, Block_proc_U0_ap_ready.read()) && 
         esl_seteq<1,1,1>(ap_const_logic_1, ap_sync_ready.read()))) {
        Block_proc_U0_ap_ready_count = (!Block_proc_U0_ap_ready_count.read().is_01() || !ap_const_lv2_1.is_01())? sc_lv<2>(): (sc_biguint<2>(Block_proc_U0_ap_ready_count.read()) - sc_biguint<2>(ap_const_lv2_1));
    } else if ((esl_seteq<1,1,1>(Block_proc_U0_ap_ready.read(), ap_const_logic_1) && 
                esl_seteq<1,1,1>(ap_const_logic_0, ap_sync_ready.read()))) {
        Block_proc_U0_ap_ready_count = (!Block_proc_U0_ap_ready_count.read().is_01() || !ap_const_lv2_1.is_01())? sc_lv<2>(): (sc_biguint<2>(Block_proc_U0_ap_ready_count.read()) + sc_biguint<2>(ap_const_lv2_1));
    }
    if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_sync_ready.read()) && 
         esl_seteq<1,1,1>(ap_const_logic_0, Mat2Array_U0_ap_ready.read()))) {
        Mat2Array_U0_ap_ready_count = (!Mat2Array_U0_ap_ready_count.read().is_01() || !ap_const_lv2_1.is_01())? sc_lv<2>(): (sc_biguint<2>(Mat2Array_U0_ap_ready_count.read()) - sc_biguint<2>(ap_const_lv2_1));
    } else if ((esl_seteq<1,1,1>(ap_const_logic_0, ap_sync_ready.read()) && 
                esl_seteq<1,1,1>(ap_const_logic_1, Mat2Array_U0_ap_ready.read()))) {
        Mat2Array_U0_ap_ready_count = (!Mat2Array_U0_ap_ready_count.read().is_01() || !ap_const_lv2_1.is_01())? sc_lv<2>(): (sc_biguint<2>(Mat2Array_U0_ap_ready_count.read()) + sc_biguint<2>(ap_const_lv2_1));
    }
    if ( ap_rst.read() == ap_const_logic_1) {
        ap_sync_reg_Array2Mat_U0_ap_ready = ap_const_logic_0;
    } else {
        if (esl_seteq<1,1,1>(ap_const_logic_1, (ap_start.read() & 
             ap_sync_ready.read()))) {
            ap_sync_reg_Array2Mat_U0_ap_ready = ap_const_logic_0;
        } else {
            ap_sync_reg_Array2Mat_U0_ap_ready = ap_sync_Array2Mat_U0_ap_ready.read();
        }
    }
    if ( ap_rst.read() == ap_const_logic_1) {
        ap_sync_reg_Block_proc_U0_ap_ready = ap_const_logic_0;
    } else {
        if (esl_seteq<1,1,1>(ap_const_logic_1, (ap_start.read() & 
             ap_sync_ready.read()))) {
            ap_sync_reg_Block_proc_U0_ap_ready = ap_const_logic_0;
        } else {
            ap_sync_reg_Block_proc_U0_ap_ready = ap_sync_Block_proc_U0_ap_ready.read();
        }
    }
    if ( ap_rst.read() == ap_const_logic_1) {
        ap_sync_reg_Mat2Array_U0_ap_ready = ap_const_logic_0;
    } else {
        if (esl_seteq<1,1,1>(ap_const_logic_1, (ap_start.read() & 
             ap_sync_ready.read()))) {
            ap_sync_reg_Mat2Array_U0_ap_ready = ap_const_logic_0;
        } else {
            ap_sync_reg_Mat2Array_U0_ap_ready = ap_sync_Mat2Array_U0_ap_ready.read();
        }
    }
}

void Sobel::thread_Array2Mat_U0_ap_continue() {
    Array2Mat_U0_ap_continue = ap_const_logic_1;
}

void Sobel::thread_Array2Mat_U0_ap_start() {
    Array2Mat_U0_ap_start = (ap_start.read() & (ap_sync_reg_Array2Mat_U0_ap_ready.read() ^ 
  ap_const_logic_1));
}

void Sobel::thread_Block_proc_U0_ap_continue() {
    Block_proc_U0_ap_continue = ap_const_logic_1;
}

void Sobel::thread_Block_proc_U0_ap_start() {
    Block_proc_U0_ap_start = (ap_start.read() & (ap_sync_reg_Block_proc_U0_ap_ready.read() ^ 
  ap_const_logic_1));
}

void Sobel::thread_Block_proc_U0_start_full_n() {
    Block_proc_U0_start_full_n = ap_const_logic_1;
}

void Sobel::thread_Block_proc_U0_start_write() {
    Block_proc_U0_start_write = ap_const_logic_0;
}

void Sobel::thread_Filter2D_U0_ap_continue() {
    Filter2D_U0_ap_continue = ap_const_logic_1;
}

void Sobel::thread_Filter2D_U0_ap_start() {
    Filter2D_U0_ap_start = start_for_Filter2D_U0_empty_n.read();
}

void Sobel::thread_Filter2D_U0_start_full_n() {
    Filter2D_U0_start_full_n = ap_const_logic_1;
}

void Sobel::thread_Filter2D_U0_start_write() {
    Filter2D_U0_start_write = ap_const_logic_0;
}

void Sobel::thread_Mat2Array_U0_ap_continue() {
    Mat2Array_U0_ap_continue = ap_const_logic_1;
}

void Sobel::thread_Mat2Array_U0_ap_start() {
    Mat2Array_U0_ap_start = (ap_start.read() & (ap_sync_reg_Mat2Array_U0_ap_ready.read() ^ 
  ap_const_logic_1));
}

void Sobel::thread_Mat2Array_U0_start_full_n() {
    Mat2Array_U0_start_full_n = ap_const_logic_1;
}

void Sobel::thread_Mat2Array_U0_start_write() {
    Mat2Array_U0_start_write = ap_const_logic_0;
}

void Sobel::thread_ap_done() {
    ap_done = Mat2Array_U0_ap_done.read();
}

void Sobel::thread_ap_idle() {
    ap_idle = (Block_proc_U0_ap_idle.read() & Array2Mat_U0_ap_idle.read() & Filter2D_U0_ap_idle.read() & Mat2Array_U0_ap_idle.read());
}

void Sobel::thread_ap_ready() {
    ap_ready = ap_sync_ready.read();
}

void Sobel::thread_ap_sync_Array2Mat_U0_ap_ready() {
    ap_sync_Array2Mat_U0_ap_ready = (Array2Mat_U0_ap_ready.read() | ap_sync_reg_Array2Mat_U0_ap_ready.read());
}

void Sobel::thread_ap_sync_Block_proc_U0_ap_ready() {
    ap_sync_Block_proc_U0_ap_ready = (Block_proc_U0_ap_ready.read() | ap_sync_reg_Block_proc_U0_ap_ready.read());
}

void Sobel::thread_ap_sync_Mat2Array_U0_ap_ready() {
    ap_sync_Mat2Array_U0_ap_ready = (Mat2Array_U0_ap_ready.read() | ap_sync_reg_Mat2Array_U0_ap_ready.read());
}

void Sobel::thread_ap_sync_continue() {
    ap_sync_continue = ap_const_logic_1;
}

void Sobel::thread_ap_sync_done() {
    ap_sync_done = Mat2Array_U0_ap_done.read();
}

void Sobel::thread_ap_sync_ready() {
    ap_sync_ready = (ap_sync_Block_proc_U0_ap_ready.read() & ap_sync_Array2Mat_U0_ap_ready.read() & ap_sync_Mat2Array_U0_ap_ready.read());
}

void Sobel::thread_image_in_address0() {
    image_in_address0 = Array2Mat_U0_fb_address0.read();
}

void Sobel::thread_image_in_ce0() {
    image_in_ce0 = Array2Mat_U0_fb_ce0.read();
}

void Sobel::thread_image_in_d0() {
    image_in_d0 = ap_const_lv32_0;
}

void Sobel::thread_image_in_we0() {
    image_in_we0 = ap_const_logic_0;
}

void Sobel::thread_image_out_address0() {
    image_out_address0 = Mat2Array_U0_fb_address0.read();
}

void Sobel::thread_image_out_ce0() {
    image_out_ce0 = Mat2Array_U0_fb_ce0.read();
}

void Sobel::thread_image_out_d0() {
    image_out_d0 = Mat2Array_U0_fb_d0.read();
}

void Sobel::thread_image_out_we0() {
    image_out_we0 = Mat2Array_U0_fb_we0.read();
}

void Sobel::thread_start_for_Filter2D_U0_din() {
    start_for_Filter2D_U0_din =  (sc_lv<1>) (ap_const_logic_1);
}

void Sobel::thread_hdltv_gen() {
    const char* dump_tv = std::getenv("AP_WRITE_TV");
    if (!(dump_tv && string(dump_tv) == "on")) return;

    wait();

    mHdltvinHandle << "[ " << endl;
    mHdltvoutHandle << "[ " << endl;
    int ap_cycleNo = 0;
    while (1) {
        wait();
        const char* mComma = ap_cycleNo == 0 ? " " : ", " ;
        mHdltvoutHandle << mComma << "{"  <<  " \"image_in_address0\" :  \"" << image_in_address0.read() << "\" ";
        mHdltvoutHandle << " , " <<  " \"image_in_ce0\" :  \"" << image_in_ce0.read() << "\" ";
        mHdltvoutHandle << " , " <<  " \"image_in_d0\" :  \"" << image_in_d0.read() << "\" ";
        mHdltvinHandle << mComma << "{"  <<  " \"image_in_q0\" :  \"" << image_in_q0.read() << "\" ";
        mHdltvoutHandle << " , " <<  " \"image_in_we0\" :  \"" << image_in_we0.read() << "\" ";
        mHdltvoutHandle << " , " <<  " \"image_out_address0\" :  \"" << image_out_address0.read() << "\" ";
        mHdltvoutHandle << " , " <<  " \"image_out_ce0\" :  \"" << image_out_ce0.read() << "\" ";
        mHdltvoutHandle << " , " <<  " \"image_out_d0\" :  \"" << image_out_d0.read() << "\" ";
        mHdltvinHandle << " , " <<  " \"image_out_q0\" :  \"" << image_out_q0.read() << "\" ";
        mHdltvoutHandle << " , " <<  " \"image_out_we0\" :  \"" << image_out_we0.read() << "\" ";
        mHdltvinHandle << " , " <<  " \"ap_rst\" :  \"" << ap_rst.read() << "\" ";
        mHdltvinHandle << " , " <<  " \"ap_start\" :  \"" << ap_start.read() << "\" ";
        mHdltvoutHandle << " , " <<  " \"ap_done\" :  \"" << ap_done.read() << "\" ";
        mHdltvoutHandle << " , " <<  " \"ap_ready\" :  \"" << ap_ready.read() << "\" ";
        mHdltvoutHandle << " , " <<  " \"ap_idle\" :  \"" << ap_idle.read() << "\" ";
        mHdltvinHandle << "}" << std::endl;
        mHdltvoutHandle << "}" << std::endl;
        ap_cycleNo++;
    }
}

}

