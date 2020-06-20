-- ==============================================================
-- RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and OpenCL
-- Version: 2019.2
-- Copyright (C) 1986-2019 Xilinx, Inc. All Rights Reserved.
-- 
-- ===========================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity Array2Mat is
port (
    ap_clk : IN STD_LOGIC;
    ap_rst : IN STD_LOGIC;
    ap_start : IN STD_LOGIC;
    ap_done : OUT STD_LOGIC;
    ap_idle : OUT STD_LOGIC;
    ap_ready : OUT STD_LOGIC;
    fb_address0 : OUT STD_LOGIC_VECTOR (6 downto 0);
    fb_ce0 : OUT STD_LOGIC;
    fb_q0 : IN STD_LOGIC_VECTOR (7 downto 0);
    img_rows_V_read : IN STD_LOGIC_VECTOR (4 downto 0);
    img_cols_V_read : IN STD_LOGIC_VECTOR (4 downto 0);
    img_data_stream_V_din : OUT STD_LOGIC_VECTOR (7 downto 0);
    img_data_stream_V_full_n : IN STD_LOGIC;
    img_data_stream_V_write : OUT STD_LOGIC );
end;


architecture behav of Array2Mat is 
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_ST_fsm_state1 : STD_LOGIC_VECTOR (3 downto 0) := "0001";
    constant ap_ST_fsm_state2 : STD_LOGIC_VECTOR (3 downto 0) := "0010";
    constant ap_ST_fsm_pp0_stage0 : STD_LOGIC_VECTOR (3 downto 0) := "0100";
    constant ap_ST_fsm_state5 : STD_LOGIC_VECTOR (3 downto 0) := "1000";
    constant ap_const_boolean_1 : BOOLEAN := true;
    constant ap_const_lv32_0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    constant ap_const_lv32_2 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000010";
    constant ap_const_boolean_0 : BOOLEAN := false;
    constant ap_const_lv1_0 : STD_LOGIC_VECTOR (0 downto 0) := "0";
    constant ap_const_lv32_1 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000001";
    constant ap_const_lv1_1 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv32_3 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000011";
    constant ap_const_lv3_0 : STD_LOGIC_VECTOR (2 downto 0) := "000";

    signal ap_CS_fsm : STD_LOGIC_VECTOR (3 downto 0) := "0001";
    attribute fsm_encoding : string;
    attribute fsm_encoding of ap_CS_fsm : signal is "none";
    signal ap_CS_fsm_state1 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state1 : signal is "none";
    signal img_data_stream_V_blk_n : STD_LOGIC;
    signal ap_CS_fsm_pp0_stage0 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_pp0_stage0 : signal is "none";
    signal ap_enable_reg_pp0_iter1 : STD_LOGIC := '0';
    signal ap_block_pp0_stage0 : BOOLEAN;
    signal icmp_ln175_reg_233 : STD_LOGIC_VECTOR (0 downto 0);
    signal t_V_3_reg_120 : STD_LOGIC_VECTOR (31 downto 0);
    signal img_cols_V_read_cast_fu_131_p1 : STD_LOGIC_VECTOR (31 downto 0);
    signal img_cols_V_read_cast_reg_204 : STD_LOGIC_VECTOR (31 downto 0);
    signal img_rows_V_read_cast_fu_135_p1 : STD_LOGIC_VECTOR (31 downto 0);
    signal img_rows_V_read_cast_reg_209 : STD_LOGIC_VECTOR (31 downto 0);
    signal icmp_ln174_fu_139_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_CS_fsm_state2 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state2 : signal is "none";
    signal row_V_fu_144_p2 : STD_LOGIC_VECTOR (31 downto 0);
    signal row_V_reg_218 : STD_LOGIC_VECTOR (31 downto 0);
    signal shl_ln_fu_154_p3 : STD_LOGIC_VECTOR (7 downto 0);
    signal shl_ln_reg_223 : STD_LOGIC_VECTOR (7 downto 0);
    signal shl_ln1352_2_fu_166_p3 : STD_LOGIC_VECTOR (7 downto 0);
    signal shl_ln1352_2_reg_228 : STD_LOGIC_VECTOR (7 downto 0);
    signal icmp_ln175_fu_174_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_block_state3_pp0_stage0_iter0 : BOOLEAN;
    signal ap_block_state4_pp0_stage0_iter1 : BOOLEAN;
    signal ap_block_pp0_stage0_11001 : BOOLEAN;
    signal col_V_fu_179_p2 : STD_LOGIC_VECTOR (31 downto 0);
    signal ap_enable_reg_pp0_iter0 : STD_LOGIC := '0';
    signal ap_block_pp0_stage0_subdone : BOOLEAN;
    signal ap_condition_pp0_exit_iter0_state3 : STD_LOGIC;
    signal t_V_reg_109 : STD_LOGIC_VECTOR (31 downto 0);
    signal ap_CS_fsm_state5 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state5 : signal is "none";
    signal zext_ln178_fu_199_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal ap_block_pp0_stage0_01001 : BOOLEAN;
    signal trunc_ln1352_fu_150_p1 : STD_LOGIC_VECTOR (4 downto 0);
    signal trunc_ln1352_1_fu_162_p1 : STD_LOGIC_VECTOR (6 downto 0);
    signal trunc_ln178_fu_185_p1 : STD_LOGIC_VECTOR (7 downto 0);
    signal add_ln178_1_fu_189_p2 : STD_LOGIC_VECTOR (7 downto 0);
    signal add_ln178_fu_194_p2 : STD_LOGIC_VECTOR (7 downto 0);
    signal ap_NS_fsm : STD_LOGIC_VECTOR (3 downto 0);
    signal ap_idle_pp0 : STD_LOGIC;
    signal ap_enable_pp0 : STD_LOGIC;


begin




    ap_CS_fsm_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_CS_fsm <= ap_ST_fsm_state1;
            else
                ap_CS_fsm <= ap_NS_fsm;
            end if;
        end if;
    end process;


    ap_enable_reg_pp0_iter0_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_enable_reg_pp0_iter0 <= ap_const_logic_0;
            else
                if (((ap_const_boolean_0 = ap_block_pp0_stage0_subdone) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_logic_1 = ap_condition_pp0_exit_iter0_state3))) then 
                    ap_enable_reg_pp0_iter0 <= ap_const_logic_0;
                elsif (((icmp_ln174_fu_139_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state2))) then 
                    ap_enable_reg_pp0_iter0 <= ap_const_logic_1;
                end if; 
            end if;
        end if;
    end process;


    ap_enable_reg_pp0_iter1_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_enable_reg_pp0_iter1 <= ap_const_logic_0;
            else
                if (((ap_const_boolean_0 = ap_block_pp0_stage0_subdone) and (ap_const_logic_1 = ap_condition_pp0_exit_iter0_state3))) then 
                    ap_enable_reg_pp0_iter1 <= (ap_const_logic_1 xor ap_condition_pp0_exit_iter0_state3);
                elsif ((ap_const_boolean_0 = ap_block_pp0_stage0_subdone)) then 
                    ap_enable_reg_pp0_iter1 <= ap_enable_reg_pp0_iter0;
                elsif (((icmp_ln174_fu_139_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state2))) then 
                    ap_enable_reg_pp0_iter1 <= ap_const_logic_0;
                end if; 
            end if;
        end if;
    end process;


    t_V_3_reg_120_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (icmp_ln175_fu_174_p2 = ap_const_lv1_0) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
                t_V_3_reg_120 <= col_V_fu_179_p2;
            elsif (((icmp_ln174_fu_139_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state2))) then 
                t_V_3_reg_120 <= ap_const_lv32_0;
            end if; 
        end if;
    end process;

    t_V_reg_109_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state5)) then 
                t_V_reg_109 <= row_V_reg_218;
            elsif (((ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
                t_V_reg_109 <= ap_const_lv32_0;
            end if; 
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then
                icmp_ln175_reg_233 <= icmp_ln175_fu_174_p2;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state1))) then
                img_cols_V_read_cast_reg_204 <= img_cols_V_read_cast_fu_131_p1;
                img_rows_V_read_cast_reg_209 <= img_rows_V_read_cast_fu_135_p1;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state2)) then
                row_V_reg_218 <= row_V_fu_144_p2;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((icmp_ln174_fu_139_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state2))) then
                    shl_ln1352_2_reg_228(7 downto 1) <= shl_ln1352_2_fu_166_p3(7 downto 1);
                    shl_ln_reg_223(7 downto 3) <= shl_ln_fu_154_p3(7 downto 3);
            end if;
        end if;
    end process;
    shl_ln_reg_223(2 downto 0) <= "000";
    shl_ln1352_2_reg_228(0) <= '0';

    ap_NS_fsm_assign_proc : process (ap_start, ap_CS_fsm, ap_CS_fsm_state1, icmp_ln174_fu_139_p2, ap_CS_fsm_state2, icmp_ln175_fu_174_p2, ap_enable_reg_pp0_iter0, ap_block_pp0_stage0_subdone)
    begin
        case ap_CS_fsm is
            when ap_ST_fsm_state1 => 
                if (((ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state1))) then
                    ap_NS_fsm <= ap_ST_fsm_state2;
                else
                    ap_NS_fsm <= ap_ST_fsm_state1;
                end if;
            when ap_ST_fsm_state2 => 
                if (((icmp_ln174_fu_139_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state2))) then
                    ap_NS_fsm <= ap_ST_fsm_state1;
                else
                    ap_NS_fsm <= ap_ST_fsm_pp0_stage0;
                end if;
            when ap_ST_fsm_pp0_stage0 => 
                if (not(((ap_const_boolean_0 = ap_block_pp0_stage0_subdone) and (icmp_ln175_fu_174_p2 = ap_const_lv1_1) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1)))) then
                    ap_NS_fsm <= ap_ST_fsm_pp0_stage0;
                elsif (((ap_const_boolean_0 = ap_block_pp0_stage0_subdone) and (icmp_ln175_fu_174_p2 = ap_const_lv1_1) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1))) then
                    ap_NS_fsm <= ap_ST_fsm_state5;
                else
                    ap_NS_fsm <= ap_ST_fsm_pp0_stage0;
                end if;
            when ap_ST_fsm_state5 => 
                ap_NS_fsm <= ap_ST_fsm_state2;
            when others =>  
                ap_NS_fsm <= "XXXX";
        end case;
    end process;
    add_ln178_1_fu_189_p2 <= std_logic_vector(unsigned(shl_ln1352_2_reg_228) + unsigned(trunc_ln178_fu_185_p1));
    add_ln178_fu_194_p2 <= std_logic_vector(unsigned(add_ln178_1_fu_189_p2) + unsigned(shl_ln_reg_223));
    ap_CS_fsm_pp0_stage0 <= ap_CS_fsm(2);
    ap_CS_fsm_state1 <= ap_CS_fsm(0);
    ap_CS_fsm_state2 <= ap_CS_fsm(1);
    ap_CS_fsm_state5 <= ap_CS_fsm(3);
        ap_block_pp0_stage0 <= not((ap_const_boolean_1 = ap_const_boolean_1));

    ap_block_pp0_stage0_01001_assign_proc : process(img_data_stream_V_full_n, ap_enable_reg_pp0_iter1, icmp_ln175_reg_233)
    begin
                ap_block_pp0_stage0_01001 <= ((icmp_ln175_reg_233 = ap_const_lv1_0) and (img_data_stream_V_full_n = ap_const_logic_0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1));
    end process;


    ap_block_pp0_stage0_11001_assign_proc : process(img_data_stream_V_full_n, ap_enable_reg_pp0_iter1, icmp_ln175_reg_233)
    begin
                ap_block_pp0_stage0_11001 <= ((icmp_ln175_reg_233 = ap_const_lv1_0) and (img_data_stream_V_full_n = ap_const_logic_0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1));
    end process;


    ap_block_pp0_stage0_subdone_assign_proc : process(img_data_stream_V_full_n, ap_enable_reg_pp0_iter1, icmp_ln175_reg_233)
    begin
                ap_block_pp0_stage0_subdone <= ((icmp_ln175_reg_233 = ap_const_lv1_0) and (img_data_stream_V_full_n = ap_const_logic_0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1));
    end process;

        ap_block_state3_pp0_stage0_iter0 <= not((ap_const_boolean_1 = ap_const_boolean_1));

    ap_block_state4_pp0_stage0_iter1_assign_proc : process(img_data_stream_V_full_n, icmp_ln175_reg_233)
    begin
                ap_block_state4_pp0_stage0_iter1 <= ((icmp_ln175_reg_233 = ap_const_lv1_0) and (img_data_stream_V_full_n = ap_const_logic_0));
    end process;


    ap_condition_pp0_exit_iter0_state3_assign_proc : process(icmp_ln175_fu_174_p2)
    begin
        if ((icmp_ln175_fu_174_p2 = ap_const_lv1_1)) then 
            ap_condition_pp0_exit_iter0_state3 <= ap_const_logic_1;
        else 
            ap_condition_pp0_exit_iter0_state3 <= ap_const_logic_0;
        end if; 
    end process;


    ap_done_assign_proc : process(ap_start, ap_CS_fsm_state1, icmp_ln174_fu_139_p2, ap_CS_fsm_state2)
    begin
        if ((((icmp_ln174_fu_139_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state2)) or ((ap_start = ap_const_logic_0) and (ap_const_logic_1 = ap_CS_fsm_state1)))) then 
            ap_done <= ap_const_logic_1;
        else 
            ap_done <= ap_const_logic_0;
        end if; 
    end process;

    ap_enable_pp0 <= (ap_idle_pp0 xor ap_const_logic_1);

    ap_idle_assign_proc : process(ap_start, ap_CS_fsm_state1)
    begin
        if (((ap_start = ap_const_logic_0) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            ap_idle <= ap_const_logic_1;
        else 
            ap_idle <= ap_const_logic_0;
        end if; 
    end process;


    ap_idle_pp0_assign_proc : process(ap_enable_reg_pp0_iter1, ap_enable_reg_pp0_iter0)
    begin
        if (((ap_enable_reg_pp0_iter0 = ap_const_logic_0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_0))) then 
            ap_idle_pp0 <= ap_const_logic_1;
        else 
            ap_idle_pp0 <= ap_const_logic_0;
        end if; 
    end process;


    ap_ready_assign_proc : process(icmp_ln174_fu_139_p2, ap_CS_fsm_state2)
    begin
        if (((icmp_ln174_fu_139_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state2))) then 
            ap_ready <= ap_const_logic_1;
        else 
            ap_ready <= ap_const_logic_0;
        end if; 
    end process;

    col_V_fu_179_p2 <= std_logic_vector(unsigned(t_V_3_reg_120) + unsigned(ap_const_lv32_1));
    fb_address0 <= zext_ln178_fu_199_p1(7 - 1 downto 0);

    fb_ce0_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_block_pp0_stage0_11001, ap_enable_reg_pp0_iter0)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            fb_ce0 <= ap_const_logic_1;
        else 
            fb_ce0 <= ap_const_logic_0;
        end if; 
    end process;

    icmp_ln174_fu_139_p2 <= "1" when (t_V_reg_109 = img_rows_V_read_cast_reg_209) else "0";
    icmp_ln175_fu_174_p2 <= "1" when (t_V_3_reg_120 = img_cols_V_read_cast_reg_204) else "0";
        img_cols_V_read_cast_fu_131_p1 <= std_logic_vector(IEEE.numeric_std.resize(signed(img_cols_V_read),32));


    img_data_stream_V_blk_n_assign_proc : process(img_data_stream_V_full_n, ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter1, ap_block_pp0_stage0, icmp_ln175_reg_233)
    begin
        if (((icmp_ln175_reg_233 = ap_const_lv1_0) and (ap_const_boolean_0 = ap_block_pp0_stage0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            img_data_stream_V_blk_n <= img_data_stream_V_full_n;
        else 
            img_data_stream_V_blk_n <= ap_const_logic_1;
        end if; 
    end process;

    img_data_stream_V_din <= fb_q0;

    img_data_stream_V_write_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter1, icmp_ln175_reg_233, ap_block_pp0_stage0_11001)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (icmp_ln175_reg_233 = ap_const_lv1_0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            img_data_stream_V_write <= ap_const_logic_1;
        else 
            img_data_stream_V_write <= ap_const_logic_0;
        end if; 
    end process;

        img_rows_V_read_cast_fu_135_p1 <= std_logic_vector(IEEE.numeric_std.resize(signed(img_rows_V_read),32));

    row_V_fu_144_p2 <= std_logic_vector(unsigned(t_V_reg_109) + unsigned(ap_const_lv32_1));
    shl_ln1352_2_fu_166_p3 <= (trunc_ln1352_1_fu_162_p1 & ap_const_lv1_0);
    shl_ln_fu_154_p3 <= (trunc_ln1352_fu_150_p1 & ap_const_lv3_0);
    trunc_ln1352_1_fu_162_p1 <= t_V_reg_109(7 - 1 downto 0);
    trunc_ln1352_fu_150_p1 <= t_V_reg_109(5 - 1 downto 0);
    trunc_ln178_fu_185_p1 <= t_V_3_reg_120(8 - 1 downto 0);
    zext_ln178_fu_199_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(add_ln178_fu_194_p2),64));
end behav;
