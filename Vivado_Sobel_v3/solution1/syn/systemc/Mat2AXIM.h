// ==============================================================
// RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and OpenCL
// Version: 2019.2
// Copyright (C) 1986-2019 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

#ifndef _Mat2AXIM_HH_
#define _Mat2AXIM_HH_

#include "systemc.h"
#include "AESL_pkg.h"


namespace ap_rtl {

struct Mat2AXIM : public sc_module {
    // Port declarations 15
    sc_in_clk ap_clk;
    sc_in< sc_logic > ap_rst;
    sc_in< sc_logic > ap_start;
    sc_out< sc_logic > ap_done;
    sc_in< sc_logic > ap_continue;
    sc_out< sc_logic > ap_idle;
    sc_out< sc_logic > ap_ready;
    sc_in< sc_lv<8> > img_data_stream_V_dout;
    sc_in< sc_logic > img_data_stream_V_empty_n;
    sc_out< sc_logic > img_data_stream_V_read;
    sc_out< sc_lv<5> > fb_address0;
    sc_out< sc_logic > fb_ce0;
    sc_out< sc_logic > fb_we0;
    sc_out< sc_lv<32> > fb_d0;
    sc_in< sc_lv<32> > fb_q0;


    // Module declarations
    Mat2AXIM(sc_module_name name);
    SC_HAS_PROCESS(Mat2AXIM);

    ~Mat2AXIM();

    sc_trace_file* mVcdFile;

    sc_signal< sc_logic > ap_done_reg;
    sc_signal< sc_lv<5> > ap_CS_fsm;
    sc_signal< sc_logic > ap_CS_fsm_state1;
    sc_signal< sc_logic > img_data_stream_V_blk_n;
    sc_signal< sc_logic > ap_CS_fsm_state4;
    sc_signal< sc_lv<1> > icmp_ln240_fu_119_p2;
    sc_signal< sc_logic > ap_CS_fsm_state2;
    sc_signal< sc_lv<4> > row_V_fu_125_p2;
    sc_signal< sc_lv<4> > row_V_reg_362;
    sc_signal< sc_lv<7> > shl_ln_fu_131_p3;
    sc_signal< sc_lv<7> > shl_ln_reg_367;
    sc_signal< sc_lv<6> > zext_ln241_fu_147_p1;
    sc_signal< sc_lv<6> > zext_ln241_reg_372;
    sc_signal< sc_lv<2> > trunc_ln253_1_fu_155_p3;
    sc_signal< sc_lv<2> > trunc_ln253_1_reg_377;
    sc_signal< sc_lv<4> > col_V_fu_169_p2;
    sc_signal< sc_lv<4> > col_V_reg_385;
    sc_signal< sc_logic > ap_CS_fsm_state3;
    sc_signal< sc_lv<5> > fb_addr_reg_390;
    sc_signal< sc_lv<1> > icmp_ln241_fu_163_p2;
    sc_signal< sc_lv<1> > icmp_ln253_fu_231_p2;
    sc_signal< sc_lv<1> > icmp_ln253_reg_395;
    sc_signal< sc_lv<6> > zext_ln253_3_fu_237_p1;
    sc_signal< sc_lv<6> > zext_ln253_3_reg_401;
    sc_signal< sc_lv<32> > and_ln253_fu_287_p2;
    sc_signal< sc_lv<32> > and_ln253_reg_407;
    sc_signal< sc_lv<4> > t_V_reg_97;
    sc_signal< bool > ap_block_state1;
    sc_signal< sc_logic > ap_CS_fsm_state5;
    sc_signal< sc_lv<4> > t_V_1_reg_108;
    sc_signal< sc_lv<64> > zext_ln253_1_fu_203_p1;
    sc_signal< sc_lv<5> > shl_ln1352_1_fu_139_p3;
    sc_signal< sc_lv<1> > trunc_ln253_fu_151_p1;
    sc_signal< sc_lv<6> > zext_ln253_fu_175_p1;
    sc_signal< sc_lv<6> > add_ln253_fu_179_p2;
    sc_signal< sc_lv<7> > zext_ln253_2_fu_184_p1;
    sc_signal< sc_lv<7> > add_ln253_1_fu_188_p2;
    sc_signal< sc_lv<5> > lshr_ln_fu_193_p4;
    sc_signal< sc_lv<2> > trunc_ln253_2_fu_208_p1;
    sc_signal< sc_lv<2> > add_ln253_2_fu_212_p2;
    sc_signal< sc_lv<5> > shl_ln1_fu_217_p3;
    sc_signal< sc_lv<5> > empty_60_fu_225_p2;
    sc_signal< sc_lv<6> > zext_ln253_4_fu_241_p1;
    sc_signal< sc_lv<6> > select_ln253_fu_245_p3;
    sc_signal< sc_lv<6> > select_ln253_1_fu_253_p3;
    sc_signal< sc_lv<6> > xor_ln253_1_fu_261_p2;
    sc_signal< sc_lv<32> > zext_ln253_7_fu_267_p1;
    sc_signal< sc_lv<32> > zext_ln253_8_fu_271_p1;
    sc_signal< sc_lv<32> > shl_ln253_1_fu_275_p2;
    sc_signal< sc_lv<32> > lshr_ln253_fu_281_p2;
    sc_signal< sc_lv<6> > xor_ln253_fu_297_p2;
    sc_signal< sc_lv<6> > select_ln253_2_fu_302_p3;
    sc_signal< sc_lv<32> > zext_ln253_5_fu_293_p1;
    sc_signal< sc_lv<32> > zext_ln253_6_fu_308_p1;
    sc_signal< sc_lv<32> > shl_ln253_fu_312_p2;
    sc_signal< sc_lv<32> > tmp_fu_318_p4;
    sc_signal< sc_lv<32> > xor_ln253_2_fu_335_p2;
    sc_signal< sc_lv<32> > select_ln253_3_fu_328_p3;
    sc_signal< sc_lv<32> > and_ln253_1_fu_340_p2;
    sc_signal< sc_lv<32> > and_ln253_2_fu_346_p2;
    sc_signal< sc_lv<5> > ap_NS_fsm;
    static const sc_logic ap_const_logic_1;
    static const sc_logic ap_const_logic_0;
    static const sc_lv<5> ap_ST_fsm_state1;
    static const sc_lv<5> ap_ST_fsm_state2;
    static const sc_lv<5> ap_ST_fsm_state3;
    static const sc_lv<5> ap_ST_fsm_state4;
    static const sc_lv<5> ap_ST_fsm_state5;
    static const sc_lv<32> ap_const_lv32_0;
    static const sc_lv<32> ap_const_lv32_3;
    static const sc_lv<32> ap_const_lv32_1;
    static const sc_lv<1> ap_const_lv1_0;
    static const sc_lv<32> ap_const_lv32_2;
    static const sc_lv<4> ap_const_lv4_0;
    static const sc_lv<32> ap_const_lv32_4;
    static const sc_lv<4> ap_const_lv4_A;
    static const sc_lv<4> ap_const_lv4_1;
    static const sc_lv<3> ap_const_lv3_0;
    static const sc_lv<32> ap_const_lv32_6;
    static const sc_lv<5> ap_const_lv5_7;
    static const sc_lv<6> ap_const_lv6_1F;
    static const sc_lv<32> ap_const_lv32_FFFFFFFF;
    static const sc_lv<32> ap_const_lv32_1F;
    static const sc_lv<1> ap_const_lv1_1;
    static const bool ap_const_boolean_1;
    // Thread declarations
    void thread_ap_clk_no_reset_();
    void thread_add_ln253_1_fu_188_p2();
    void thread_add_ln253_2_fu_212_p2();
    void thread_add_ln253_fu_179_p2();
    void thread_and_ln253_1_fu_340_p2();
    void thread_and_ln253_2_fu_346_p2();
    void thread_and_ln253_fu_287_p2();
    void thread_ap_CS_fsm_state1();
    void thread_ap_CS_fsm_state2();
    void thread_ap_CS_fsm_state3();
    void thread_ap_CS_fsm_state4();
    void thread_ap_CS_fsm_state5();
    void thread_ap_block_state1();
    void thread_ap_done();
    void thread_ap_idle();
    void thread_ap_ready();
    void thread_col_V_fu_169_p2();
    void thread_empty_60_fu_225_p2();
    void thread_fb_address0();
    void thread_fb_ce0();
    void thread_fb_d0();
    void thread_fb_we0();
    void thread_icmp_ln240_fu_119_p2();
    void thread_icmp_ln241_fu_163_p2();
    void thread_icmp_ln253_fu_231_p2();
    void thread_img_data_stream_V_blk_n();
    void thread_img_data_stream_V_read();
    void thread_lshr_ln253_fu_281_p2();
    void thread_lshr_ln_fu_193_p4();
    void thread_row_V_fu_125_p2();
    void thread_select_ln253_1_fu_253_p3();
    void thread_select_ln253_2_fu_302_p3();
    void thread_select_ln253_3_fu_328_p3();
    void thread_select_ln253_fu_245_p3();
    void thread_shl_ln1352_1_fu_139_p3();
    void thread_shl_ln1_fu_217_p3();
    void thread_shl_ln253_1_fu_275_p2();
    void thread_shl_ln253_fu_312_p2();
    void thread_shl_ln_fu_131_p3();
    void thread_tmp_fu_318_p4();
    void thread_trunc_ln253_1_fu_155_p3();
    void thread_trunc_ln253_2_fu_208_p1();
    void thread_trunc_ln253_fu_151_p1();
    void thread_xor_ln253_1_fu_261_p2();
    void thread_xor_ln253_2_fu_335_p2();
    void thread_xor_ln253_fu_297_p2();
    void thread_zext_ln241_fu_147_p1();
    void thread_zext_ln253_1_fu_203_p1();
    void thread_zext_ln253_2_fu_184_p1();
    void thread_zext_ln253_3_fu_237_p1();
    void thread_zext_ln253_4_fu_241_p1();
    void thread_zext_ln253_5_fu_293_p1();
    void thread_zext_ln253_6_fu_308_p1();
    void thread_zext_ln253_7_fu_267_p1();
    void thread_zext_ln253_8_fu_271_p1();
    void thread_zext_ln253_fu_175_p1();
    void thread_ap_NS_fsm();
};

}

using namespace ap_rtl;

#endif
