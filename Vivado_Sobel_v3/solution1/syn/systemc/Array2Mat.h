// ==============================================================
// RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and OpenCL
// Version: 2019.2
// Copyright (C) 1986-2019 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

#ifndef _Array2Mat_HH_
#define _Array2Mat_HH_

#include "systemc.h"
#include "AESL_pkg.h"


namespace ap_rtl {

struct Array2Mat : public sc_module {
    // Port declarations 14
    sc_in_clk ap_clk;
    sc_in< sc_logic > ap_rst;
    sc_in< sc_logic > ap_start;
    sc_out< sc_logic > ap_done;
    sc_out< sc_logic > ap_idle;
    sc_out< sc_logic > ap_ready;
    sc_out< sc_lv<7> > fb_address0;
    sc_out< sc_logic > fb_ce0;
    sc_in< sc_lv<8> > fb_q0;
    sc_in< sc_lv<5> > img_rows_V_read;
    sc_in< sc_lv<5> > img_cols_V_read;
    sc_out< sc_lv<8> > img_data_stream_V_din;
    sc_in< sc_logic > img_data_stream_V_full_n;
    sc_out< sc_logic > img_data_stream_V_write;


    // Module declarations
    Array2Mat(sc_module_name name);
    SC_HAS_PROCESS(Array2Mat);

    ~Array2Mat();

    sc_trace_file* mVcdFile;

    sc_signal< sc_lv<4> > ap_CS_fsm;
    sc_signal< sc_logic > ap_CS_fsm_state1;
    sc_signal< sc_logic > img_data_stream_V_blk_n;
    sc_signal< sc_logic > ap_CS_fsm_pp0_stage0;
    sc_signal< sc_logic > ap_enable_reg_pp0_iter1;
    sc_signal< bool > ap_block_pp0_stage0;
    sc_signal< sc_lv<1> > icmp_ln175_reg_233;
    sc_signal< sc_lv<32> > t_V_3_reg_120;
    sc_signal< sc_lv<32> > img_cols_V_read_cast_fu_131_p1;
    sc_signal< sc_lv<32> > img_cols_V_read_cast_reg_204;
    sc_signal< sc_lv<32> > img_rows_V_read_cast_fu_135_p1;
    sc_signal< sc_lv<32> > img_rows_V_read_cast_reg_209;
    sc_signal< sc_lv<1> > icmp_ln174_fu_139_p2;
    sc_signal< sc_logic > ap_CS_fsm_state2;
    sc_signal< sc_lv<32> > row_V_fu_144_p2;
    sc_signal< sc_lv<32> > row_V_reg_218;
    sc_signal< sc_lv<8> > shl_ln_fu_154_p3;
    sc_signal< sc_lv<8> > shl_ln_reg_223;
    sc_signal< sc_lv<8> > shl_ln1352_2_fu_166_p3;
    sc_signal< sc_lv<8> > shl_ln1352_2_reg_228;
    sc_signal< sc_lv<1> > icmp_ln175_fu_174_p2;
    sc_signal< bool > ap_block_state3_pp0_stage0_iter0;
    sc_signal< bool > ap_block_state4_pp0_stage0_iter1;
    sc_signal< bool > ap_block_pp0_stage0_11001;
    sc_signal< sc_lv<32> > col_V_fu_179_p2;
    sc_signal< sc_logic > ap_enable_reg_pp0_iter0;
    sc_signal< bool > ap_block_pp0_stage0_subdone;
    sc_signal< sc_logic > ap_condition_pp0_exit_iter0_state3;
    sc_signal< sc_lv<32> > t_V_reg_109;
    sc_signal< sc_logic > ap_CS_fsm_state5;
    sc_signal< sc_lv<64> > zext_ln178_fu_199_p1;
    sc_signal< bool > ap_block_pp0_stage0_01001;
    sc_signal< sc_lv<5> > trunc_ln1352_fu_150_p1;
    sc_signal< sc_lv<7> > trunc_ln1352_1_fu_162_p1;
    sc_signal< sc_lv<8> > trunc_ln178_fu_185_p1;
    sc_signal< sc_lv<8> > add_ln178_1_fu_189_p2;
    sc_signal< sc_lv<8> > add_ln178_fu_194_p2;
    sc_signal< sc_lv<4> > ap_NS_fsm;
    sc_signal< sc_logic > ap_idle_pp0;
    sc_signal< sc_logic > ap_enable_pp0;
    static const sc_logic ap_const_logic_1;
    static const sc_logic ap_const_logic_0;
    static const sc_lv<4> ap_ST_fsm_state1;
    static const sc_lv<4> ap_ST_fsm_state2;
    static const sc_lv<4> ap_ST_fsm_pp0_stage0;
    static const sc_lv<4> ap_ST_fsm_state5;
    static const bool ap_const_boolean_1;
    static const sc_lv<32> ap_const_lv32_0;
    static const sc_lv<32> ap_const_lv32_2;
    static const bool ap_const_boolean_0;
    static const sc_lv<1> ap_const_lv1_0;
    static const sc_lv<32> ap_const_lv32_1;
    static const sc_lv<1> ap_const_lv1_1;
    static const sc_lv<32> ap_const_lv32_3;
    static const sc_lv<3> ap_const_lv3_0;
    // Thread declarations
    void thread_ap_clk_no_reset_();
    void thread_add_ln178_1_fu_189_p2();
    void thread_add_ln178_fu_194_p2();
    void thread_ap_CS_fsm_pp0_stage0();
    void thread_ap_CS_fsm_state1();
    void thread_ap_CS_fsm_state2();
    void thread_ap_CS_fsm_state5();
    void thread_ap_block_pp0_stage0();
    void thread_ap_block_pp0_stage0_01001();
    void thread_ap_block_pp0_stage0_11001();
    void thread_ap_block_pp0_stage0_subdone();
    void thread_ap_block_state3_pp0_stage0_iter0();
    void thread_ap_block_state4_pp0_stage0_iter1();
    void thread_ap_condition_pp0_exit_iter0_state3();
    void thread_ap_done();
    void thread_ap_enable_pp0();
    void thread_ap_idle();
    void thread_ap_idle_pp0();
    void thread_ap_ready();
    void thread_col_V_fu_179_p2();
    void thread_fb_address0();
    void thread_fb_ce0();
    void thread_icmp_ln174_fu_139_p2();
    void thread_icmp_ln175_fu_174_p2();
    void thread_img_cols_V_read_cast_fu_131_p1();
    void thread_img_data_stream_V_blk_n();
    void thread_img_data_stream_V_din();
    void thread_img_data_stream_V_write();
    void thread_img_rows_V_read_cast_fu_135_p1();
    void thread_row_V_fu_144_p2();
    void thread_shl_ln1352_2_fu_166_p3();
    void thread_shl_ln_fu_154_p3();
    void thread_trunc_ln1352_1_fu_162_p1();
    void thread_trunc_ln1352_fu_150_p1();
    void thread_trunc_ln178_fu_185_p1();
    void thread_zext_ln178_fu_199_p1();
    void thread_ap_NS_fsm();
};

}

using namespace ap_rtl;

#endif
