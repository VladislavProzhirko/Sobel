-- ==============================================================
-- RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and OpenCL
-- Version: 2019.2
-- Copyright (C) 1986-2019 Xilinx, Inc. All Rights Reserved.
-- 
-- ===========================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity Block_proc is
port (
    ap_clk : IN STD_LOGIC;
    ap_rst : IN STD_LOGIC;
    ap_start : IN STD_LOGIC;
    ap_done : OUT STD_LOGIC;
    ap_continue : IN STD_LOGIC;
    ap_idle : OUT STD_LOGIC;
    ap_ready : OUT STD_LOGIC;
    src_rows_V_out_din : OUT STD_LOGIC_VECTOR (4 downto 0);
    src_rows_V_out_full_n : IN STD_LOGIC;
    src_rows_V_out_write : OUT STD_LOGIC;
    src_cols_V_out_din : OUT STD_LOGIC_VECTOR (4 downto 0);
    src_cols_V_out_full_n : IN STD_LOGIC;
    src_cols_V_out_write : OUT STD_LOGIC );
end;


architecture behav of Block_proc is 
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_ST_fsm_state1 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv32_0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    constant ap_const_lv5_A : STD_LOGIC_VECTOR (4 downto 0) := "01010";
    constant ap_const_boolean_1 : BOOLEAN := true;

    signal ap_done_reg : STD_LOGIC := '0';
    signal ap_CS_fsm : STD_LOGIC_VECTOR (0 downto 0) := "1";
    attribute fsm_encoding : string;
    attribute fsm_encoding of ap_CS_fsm : signal is "none";
    signal ap_CS_fsm_state1 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state1 : signal is "none";
    signal src_rows_V_out_blk_n : STD_LOGIC;
    signal src_cols_V_out_blk_n : STD_LOGIC;
    signal ap_block_state1 : BOOLEAN;
    signal ap_NS_fsm : STD_LOGIC_VECTOR (0 downto 0);


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


    ap_done_reg_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_done_reg <= ap_const_logic_0;
            else
                if ((ap_continue = ap_const_logic_1)) then 
                    ap_done_reg <= ap_const_logic_0;
                elsif ((not(((ap_start = ap_const_logic_0) or (src_cols_V_out_full_n = ap_const_logic_0) or (src_rows_V_out_full_n = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
                    ap_done_reg <= ap_const_logic_1;
                end if; 
            end if;
        end if;
    end process;


    ap_NS_fsm_assign_proc : process (ap_start, ap_done_reg, ap_CS_fsm, ap_CS_fsm_state1, src_rows_V_out_full_n, src_cols_V_out_full_n)
    begin
        case ap_CS_fsm is
            when ap_ST_fsm_state1 => 
                ap_NS_fsm <= ap_ST_fsm_state1;
            when others =>  
                ap_NS_fsm <= "X";
        end case;
    end process;
    ap_CS_fsm_state1 <= ap_CS_fsm(0);

    ap_block_state1_assign_proc : process(ap_start, ap_done_reg, src_rows_V_out_full_n, src_cols_V_out_full_n)
    begin
                ap_block_state1 <= ((ap_start = ap_const_logic_0) or (src_cols_V_out_full_n = ap_const_logic_0) or (src_rows_V_out_full_n = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1));
    end process;


    ap_done_assign_proc : process(ap_start, ap_done_reg, ap_CS_fsm_state1, src_rows_V_out_full_n, src_cols_V_out_full_n)
    begin
        if ((not(((ap_start = ap_const_logic_0) or (src_cols_V_out_full_n = ap_const_logic_0) or (src_rows_V_out_full_n = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            ap_done <= ap_const_logic_1;
        else 
            ap_done <= ap_done_reg;
        end if; 
    end process;


    ap_idle_assign_proc : process(ap_start, ap_CS_fsm_state1)
    begin
        if (((ap_start = ap_const_logic_0) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            ap_idle <= ap_const_logic_1;
        else 
            ap_idle <= ap_const_logic_0;
        end if; 
    end process;


    ap_ready_assign_proc : process(ap_start, ap_done_reg, ap_CS_fsm_state1, src_rows_V_out_full_n, src_cols_V_out_full_n)
    begin
        if ((not(((ap_start = ap_const_logic_0) or (src_cols_V_out_full_n = ap_const_logic_0) or (src_rows_V_out_full_n = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            ap_ready <= ap_const_logic_1;
        else 
            ap_ready <= ap_const_logic_0;
        end if; 
    end process;


    src_cols_V_out_blk_n_assign_proc : process(ap_start, ap_done_reg, ap_CS_fsm_state1, src_cols_V_out_full_n)
    begin
        if ((not(((ap_start = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            src_cols_V_out_blk_n <= src_cols_V_out_full_n;
        else 
            src_cols_V_out_blk_n <= ap_const_logic_1;
        end if; 
    end process;

    src_cols_V_out_din <= ap_const_lv5_A;

    src_cols_V_out_write_assign_proc : process(ap_start, ap_done_reg, ap_CS_fsm_state1, src_rows_V_out_full_n, src_cols_V_out_full_n)
    begin
        if ((not(((ap_start = ap_const_logic_0) or (src_cols_V_out_full_n = ap_const_logic_0) or (src_rows_V_out_full_n = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            src_cols_V_out_write <= ap_const_logic_1;
        else 
            src_cols_V_out_write <= ap_const_logic_0;
        end if; 
    end process;


    src_rows_V_out_blk_n_assign_proc : process(ap_start, ap_done_reg, ap_CS_fsm_state1, src_rows_V_out_full_n)
    begin
        if ((not(((ap_start = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            src_rows_V_out_blk_n <= src_rows_V_out_full_n;
        else 
            src_rows_V_out_blk_n <= ap_const_logic_1;
        end if; 
    end process;

    src_rows_V_out_din <= ap_const_lv5_A;

    src_rows_V_out_write_assign_proc : process(ap_start, ap_done_reg, ap_CS_fsm_state1, src_rows_V_out_full_n, src_cols_V_out_full_n)
    begin
        if ((not(((ap_start = ap_const_logic_0) or (src_cols_V_out_full_n = ap_const_logic_0) or (src_rows_V_out_full_n = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            src_rows_V_out_write <= ap_const_logic_1;
        else 
            src_rows_V_out_write <= ap_const_logic_0;
        end if; 
    end process;

end behav;
