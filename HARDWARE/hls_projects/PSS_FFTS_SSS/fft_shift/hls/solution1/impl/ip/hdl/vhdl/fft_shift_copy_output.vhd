-- ==============================================================
-- RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2020.2 (64-bit)
-- Version: 2020.2
-- Copyright (C) Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
-- 
-- ===========================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity fft_shift_copy_output is
port (
    ap_clk : IN STD_LOGIC;
    ap_rst : IN STD_LOGIC;
    ap_start : IN STD_LOGIC;
    ap_done : OUT STD_LOGIC;
    ap_idle : OUT STD_LOGIC;
    ap_ready : OUT STD_LOGIC;
    OUT_temp_R_address0 : OUT STD_LOGIC_VECTOR (6 downto 0);
    OUT_temp_R_ce0 : OUT STD_LOGIC;
    OUT_temp_R_q0 : IN STD_LOGIC_VECTOR (31 downto 0);
    OUT_temp_I_address0 : OUT STD_LOGIC_VECTOR (6 downto 0);
    OUT_temp_I_ce0 : OUT STD_LOGIC;
    OUT_temp_I_q0 : IN STD_LOGIC_VECTOR (31 downto 0);
    OUT_R_TDATA : OUT STD_LOGIC_VECTOR (31 downto 0);
    OUT_R_TVALID : OUT STD_LOGIC;
    OUT_R_TREADY : IN STD_LOGIC;
    OUT_R_TKEEP : OUT STD_LOGIC_VECTOR (3 downto 0);
    OUT_R_TSTRB : OUT STD_LOGIC_VECTOR (3 downto 0);
    OUT_R_TLAST : OUT STD_LOGIC_VECTOR (0 downto 0);
    OUT_I_TDATA : OUT STD_LOGIC_VECTOR (31 downto 0);
    OUT_I_TVALID : OUT STD_LOGIC;
    OUT_I_TREADY : IN STD_LOGIC;
    OUT_I_TKEEP : OUT STD_LOGIC_VECTOR (3 downto 0);
    OUT_I_TSTRB : OUT STD_LOGIC_VECTOR (3 downto 0);
    OUT_I_TLAST : OUT STD_LOGIC_VECTOR (0 downto 0) );
end;


architecture behav of fft_shift_copy_output is 
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_ST_fsm_state1 : STD_LOGIC_VECTOR (4 downto 0) := "00001";
    constant ap_ST_fsm_pp0_stage0 : STD_LOGIC_VECTOR (4 downto 0) := "00010";
    constant ap_ST_fsm_state4 : STD_LOGIC_VECTOR (4 downto 0) := "00100";
    constant ap_ST_fsm_state5 : STD_LOGIC_VECTOR (4 downto 0) := "01000";
    constant ap_ST_fsm_state6 : STD_LOGIC_VECTOR (4 downto 0) := "10000";
    constant ap_const_boolean_1 : BOOLEAN := true;
    constant ap_const_lv32_0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    constant ap_const_lv32_1 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000001";
    constant ap_const_boolean_0 : BOOLEAN := false;
    constant ap_const_lv1_0 : STD_LOGIC_VECTOR (0 downto 0) := "0";
    constant ap_const_lv32_3 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000011";
    constant ap_const_lv32_2 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000010";
    constant ap_const_lv1_1 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv7_0 : STD_LOGIC_VECTOR (6 downto 0) := "0000000";
    constant ap_const_lv64_7F : STD_LOGIC_VECTOR (63 downto 0) := "0000000000000000000000000000000000000000000000000000000001111111";
    constant ap_const_lv4_F : STD_LOGIC_VECTOR (3 downto 0) := "1111";
    constant ap_const_lv4_1 : STD_LOGIC_VECTOR (3 downto 0) := "0001";
    constant ap_const_lv7_1 : STD_LOGIC_VECTOR (6 downto 0) := "0000001";
    constant ap_const_lv7_7F : STD_LOGIC_VECTOR (6 downto 0) := "1111111";
    constant ap_const_lv32_4 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000100";

attribute shreg_extract : string;
    signal ap_CS_fsm : STD_LOGIC_VECTOR (4 downto 0) := "00001";
    attribute fsm_encoding : string;
    attribute fsm_encoding of ap_CS_fsm : signal is "none";
    signal ap_CS_fsm_state1 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state1 : signal is "none";
    signal OUT_R_TDATA_blk_n : STD_LOGIC;
    signal ap_CS_fsm_pp0_stage0 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_pp0_stage0 : signal is "none";
    signal ap_enable_reg_pp0_iter1 : STD_LOGIC := '0';
    signal ap_block_pp0_stage0 : BOOLEAN;
    signal icmp_ln39_reg_202 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_CS_fsm_state5 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state5 : signal is "none";
    signal OUT_I_TDATA_blk_n : STD_LOGIC;
    signal i_reg_148 : STD_LOGIC_VECTOR (6 downto 0);
    signal add_ln39_fu_159_p2 : STD_LOGIC_VECTOR (6 downto 0);
    signal ap_enable_reg_pp0_iter0 : STD_LOGIC := '0';
    signal ap_block_state2_pp0_stage0_iter0 : BOOLEAN;
    signal ap_block_state3_pp0_stage0_iter1 : BOOLEAN;
    signal ap_block_state3_io : BOOLEAN;
    signal ap_block_pp0_stage0_11001 : BOOLEAN;
    signal icmp_ln39_fu_165_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_CS_fsm_state4 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state4 : signal is "none";
    signal ap_block_pp0_stage0_subdone : BOOLEAN;
    signal ap_condition_pp0_exit_iter0_state2 : STD_LOGIC;
    signal i_cast_fu_171_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal bitcast_ln303_2_fu_177_p1 : STD_LOGIC_VECTOR (31 downto 0);
    signal ap_block_pp0_stage0_01001 : BOOLEAN;
    signal bitcast_ln303_fu_187_p1 : STD_LOGIC_VECTOR (31 downto 0);
    signal ap_block_state5 : BOOLEAN;
    signal ap_block_state5_io : BOOLEAN;
    signal bitcast_ln303_3_fu_182_p1 : STD_LOGIC_VECTOR (31 downto 0);
    signal bitcast_ln303_1_fu_192_p1 : STD_LOGIC_VECTOR (31 downto 0);
    signal ap_CS_fsm_state6 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state6 : signal is "none";
    signal ap_NS_fsm : STD_LOGIC_VECTOR (4 downto 0);
    signal ap_idle_pp0 : STD_LOGIC;
    signal ap_enable_pp0 : STD_LOGIC;
    signal ap_ce_reg : STD_LOGIC;


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
                if (((ap_const_boolean_0 = ap_block_pp0_stage0_subdone) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_logic_1 = ap_condition_pp0_exit_iter0_state2))) then 
                    ap_enable_reg_pp0_iter0 <= ap_const_logic_0;
                elsif (((ap_const_logic_1 = ap_CS_fsm_state1) and (ap_start = ap_const_logic_1))) then 
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
                if (((ap_const_boolean_0 = ap_block_pp0_stage0_subdone) and (ap_const_logic_1 = ap_condition_pp0_exit_iter0_state2))) then 
                    ap_enable_reg_pp0_iter1 <= (ap_const_logic_1 xor ap_condition_pp0_exit_iter0_state2);
                elsif ((ap_const_boolean_0 = ap_block_pp0_stage0_subdone)) then 
                    ap_enable_reg_pp0_iter1 <= ap_enable_reg_pp0_iter0;
                elsif (((ap_const_logic_1 = ap_CS_fsm_state1) and (ap_start = ap_const_logic_1))) then 
                    ap_enable_reg_pp0_iter1 <= ap_const_logic_0;
                end if; 
            end if;
        end if;
    end process;


    i_reg_148_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_logic_1 = ap_CS_fsm_state1) and (ap_start = ap_const_logic_1))) then 
                i_reg_148 <= ap_const_lv7_0;
            elsif (((icmp_ln39_fu_165_p2 = ap_const_lv1_0) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
                i_reg_148 <= add_ln39_fu_159_p2;
            end if; 
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then
                icmp_ln39_reg_202 <= icmp_ln39_fu_165_p2;
            end if;
        end if;
    end process;

    ap_NS_fsm_assign_proc : process (ap_start, ap_CS_fsm, ap_CS_fsm_state1, OUT_R_TREADY, OUT_I_TREADY, ap_CS_fsm_state5, ap_enable_reg_pp0_iter0, icmp_ln39_fu_165_p2, ap_block_pp0_stage0_subdone, ap_block_state5_io)
    begin
        case ap_CS_fsm is
            when ap_ST_fsm_state1 => 
                if (((ap_const_logic_1 = ap_CS_fsm_state1) and (ap_start = ap_const_logic_1))) then
                    ap_NS_fsm <= ap_ST_fsm_pp0_stage0;
                else
                    ap_NS_fsm <= ap_ST_fsm_state1;
                end if;
            when ap_ST_fsm_pp0_stage0 => 
                if (not(((icmp_ln39_fu_165_p2 = ap_const_lv1_1) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_subdone)))) then
                    ap_NS_fsm <= ap_ST_fsm_pp0_stage0;
                elsif (((icmp_ln39_fu_165_p2 = ap_const_lv1_1) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_subdone))) then
                    ap_NS_fsm <= ap_ST_fsm_state4;
                else
                    ap_NS_fsm <= ap_ST_fsm_pp0_stage0;
                end if;
            when ap_ST_fsm_state4 => 
                ap_NS_fsm <= ap_ST_fsm_state5;
            when ap_ST_fsm_state5 => 
                if ((not(((ap_const_logic_0 = OUT_I_TREADY) or (ap_const_logic_0 = OUT_R_TREADY) or (ap_const_boolean_1 = ap_block_state5_io))) and (ap_const_logic_1 = ap_CS_fsm_state5))) then
                    ap_NS_fsm <= ap_ST_fsm_state6;
                else
                    ap_NS_fsm <= ap_ST_fsm_state5;
                end if;
            when ap_ST_fsm_state6 => 
                ap_NS_fsm <= ap_ST_fsm_state1;
            when others =>  
                ap_NS_fsm <= "XXXXX";
        end case;
    end process;

    OUT_I_TDATA_assign_proc : process(OUT_R_TREADY, OUT_I_TREADY, ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter1, icmp_ln39_reg_202, ap_CS_fsm_state5, ap_block_pp0_stage0_01001, bitcast_ln303_3_fu_182_p1, bitcast_ln303_1_fu_192_p1)
    begin
        if ((not(((ap_const_logic_0 = OUT_I_TREADY) or (ap_const_logic_0 = OUT_R_TREADY))) and (ap_const_logic_1 = ap_CS_fsm_state5))) then 
            OUT_I_TDATA <= bitcast_ln303_1_fu_192_p1;
        elsif (((icmp_ln39_reg_202 = ap_const_lv1_0) and (ap_const_boolean_0 = ap_block_pp0_stage0_01001) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            OUT_I_TDATA <= bitcast_ln303_3_fu_182_p1;
        else 
            OUT_I_TDATA <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
        end if; 
    end process;


    OUT_I_TDATA_blk_n_assign_proc : process(OUT_I_TREADY, ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter1, ap_block_pp0_stage0, icmp_ln39_reg_202, ap_CS_fsm_state5)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state5) or ((icmp_ln39_reg_202 = ap_const_lv1_0) and (ap_const_boolean_0 = ap_block_pp0_stage0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0)))) then 
            OUT_I_TDATA_blk_n <= OUT_I_TREADY;
        else 
            OUT_I_TDATA_blk_n <= ap_const_logic_1;
        end if; 
    end process;

    OUT_I_TKEEP <= ap_const_lv4_F;

    OUT_I_TLAST_assign_proc : process(OUT_R_TREADY, OUT_I_TREADY, ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter1, icmp_ln39_reg_202, ap_CS_fsm_state5, ap_block_pp0_stage0_01001)
    begin
        if ((not(((ap_const_logic_0 = OUT_I_TREADY) or (ap_const_logic_0 = OUT_R_TREADY))) and (ap_const_logic_1 = ap_CS_fsm_state5))) then 
            OUT_I_TLAST <= ap_const_lv1_1;
        elsif (((icmp_ln39_reg_202 = ap_const_lv1_0) and (ap_const_boolean_0 = ap_block_pp0_stage0_01001) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            OUT_I_TLAST <= ap_const_lv1_0;
        else 
            OUT_I_TLAST <= "X";
        end if; 
    end process;

    OUT_I_TSTRB <= ap_const_lv4_1;

    OUT_I_TVALID_assign_proc : process(OUT_R_TREADY, OUT_I_TREADY, ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter1, icmp_ln39_reg_202, ap_CS_fsm_state5, ap_block_pp0_stage0_11001, ap_block_state5_io)
    begin
        if ((((icmp_ln39_reg_202 = ap_const_lv1_0) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0)) or (not(((ap_const_logic_0 = OUT_I_TREADY) or (ap_const_logic_0 = OUT_R_TREADY) or (ap_const_boolean_1 = ap_block_state5_io))) and (ap_const_logic_1 = ap_CS_fsm_state5)))) then 
            OUT_I_TVALID <= ap_const_logic_1;
        else 
            OUT_I_TVALID <= ap_const_logic_0;
        end if; 
    end process;


    OUT_R_TDATA_assign_proc : process(OUT_R_TREADY, OUT_I_TREADY, ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter1, icmp_ln39_reg_202, ap_CS_fsm_state5, bitcast_ln303_2_fu_177_p1, ap_block_pp0_stage0_01001, bitcast_ln303_fu_187_p1)
    begin
        if ((not(((ap_const_logic_0 = OUT_I_TREADY) or (ap_const_logic_0 = OUT_R_TREADY))) and (ap_const_logic_1 = ap_CS_fsm_state5))) then 
            OUT_R_TDATA <= bitcast_ln303_fu_187_p1;
        elsif (((icmp_ln39_reg_202 = ap_const_lv1_0) and (ap_const_boolean_0 = ap_block_pp0_stage0_01001) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            OUT_R_TDATA <= bitcast_ln303_2_fu_177_p1;
        else 
            OUT_R_TDATA <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
        end if; 
    end process;


    OUT_R_TDATA_blk_n_assign_proc : process(OUT_R_TREADY, ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter1, ap_block_pp0_stage0, icmp_ln39_reg_202, ap_CS_fsm_state5)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state5) or ((icmp_ln39_reg_202 = ap_const_lv1_0) and (ap_const_boolean_0 = ap_block_pp0_stage0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0)))) then 
            OUT_R_TDATA_blk_n <= OUT_R_TREADY;
        else 
            OUT_R_TDATA_blk_n <= ap_const_logic_1;
        end if; 
    end process;

    OUT_R_TKEEP <= ap_const_lv4_F;

    OUT_R_TLAST_assign_proc : process(OUT_R_TREADY, OUT_I_TREADY, ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter1, icmp_ln39_reg_202, ap_CS_fsm_state5, ap_block_pp0_stage0_01001)
    begin
        if ((not(((ap_const_logic_0 = OUT_I_TREADY) or (ap_const_logic_0 = OUT_R_TREADY))) and (ap_const_logic_1 = ap_CS_fsm_state5))) then 
            OUT_R_TLAST <= ap_const_lv1_1;
        elsif (((icmp_ln39_reg_202 = ap_const_lv1_0) and (ap_const_boolean_0 = ap_block_pp0_stage0_01001) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            OUT_R_TLAST <= ap_const_lv1_0;
        else 
            OUT_R_TLAST <= "X";
        end if; 
    end process;

    OUT_R_TSTRB <= ap_const_lv4_1;

    OUT_R_TVALID_assign_proc : process(OUT_R_TREADY, OUT_I_TREADY, ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter1, icmp_ln39_reg_202, ap_CS_fsm_state5, ap_block_pp0_stage0_11001, ap_block_state5_io)
    begin
        if ((((icmp_ln39_reg_202 = ap_const_lv1_0) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0)) or (not(((ap_const_logic_0 = OUT_I_TREADY) or (ap_const_logic_0 = OUT_R_TREADY) or (ap_const_boolean_1 = ap_block_state5_io))) and (ap_const_logic_1 = ap_CS_fsm_state5)))) then 
            OUT_R_TVALID <= ap_const_logic_1;
        else 
            OUT_R_TVALID <= ap_const_logic_0;
        end if; 
    end process;


    OUT_temp_I_address0_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_block_pp0_stage0, ap_enable_reg_pp0_iter0, ap_CS_fsm_state4, i_cast_fu_171_p1)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state4)) then 
            OUT_temp_I_address0 <= ap_const_lv64_7F(7 - 1 downto 0);
        elsif (((ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage0) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            OUT_temp_I_address0 <= i_cast_fu_171_p1(7 - 1 downto 0);
        else 
            OUT_temp_I_address0 <= "XXXXXXX";
        end if; 
    end process;


    OUT_temp_I_ce0_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter0, ap_block_pp0_stage0_11001, ap_CS_fsm_state4)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state4) or ((ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0)))) then 
            OUT_temp_I_ce0 <= ap_const_logic_1;
        else 
            OUT_temp_I_ce0 <= ap_const_logic_0;
        end if; 
    end process;


    OUT_temp_R_address0_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_block_pp0_stage0, ap_enable_reg_pp0_iter0, ap_CS_fsm_state4, i_cast_fu_171_p1)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state4)) then 
            OUT_temp_R_address0 <= ap_const_lv64_7F(7 - 1 downto 0);
        elsif (((ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage0) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            OUT_temp_R_address0 <= i_cast_fu_171_p1(7 - 1 downto 0);
        else 
            OUT_temp_R_address0 <= "XXXXXXX";
        end if; 
    end process;


    OUT_temp_R_ce0_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter0, ap_block_pp0_stage0_11001, ap_CS_fsm_state4)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state4) or ((ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0)))) then 
            OUT_temp_R_ce0 <= ap_const_logic_1;
        else 
            OUT_temp_R_ce0 <= ap_const_logic_0;
        end if; 
    end process;

    add_ln39_fu_159_p2 <= std_logic_vector(unsigned(i_reg_148) + unsigned(ap_const_lv7_1));
    ap_CS_fsm_pp0_stage0 <= ap_CS_fsm(1);
    ap_CS_fsm_state1 <= ap_CS_fsm(0);
    ap_CS_fsm_state4 <= ap_CS_fsm(2);
    ap_CS_fsm_state5 <= ap_CS_fsm(3);
    ap_CS_fsm_state6 <= ap_CS_fsm(4);
        ap_block_pp0_stage0 <= not((ap_const_boolean_1 = ap_const_boolean_1));

    ap_block_pp0_stage0_01001_assign_proc : process(OUT_R_TREADY, OUT_I_TREADY, ap_enable_reg_pp0_iter1, icmp_ln39_reg_202)
    begin
                ap_block_pp0_stage0_01001 <= ((ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (((icmp_ln39_reg_202 = ap_const_lv1_0) and (ap_const_logic_0 = OUT_I_TREADY)) or ((icmp_ln39_reg_202 = ap_const_lv1_0) and (ap_const_logic_0 = OUT_R_TREADY))));
    end process;


    ap_block_pp0_stage0_11001_assign_proc : process(OUT_R_TREADY, OUT_I_TREADY, ap_enable_reg_pp0_iter1, icmp_ln39_reg_202, ap_block_state3_io)
    begin
                ap_block_pp0_stage0_11001 <= ((ap_enable_reg_pp0_iter1 = ap_const_logic_1) and ((ap_const_boolean_1 = ap_block_state3_io) or ((icmp_ln39_reg_202 = ap_const_lv1_0) and (ap_const_logic_0 = OUT_I_TREADY)) or ((icmp_ln39_reg_202 = ap_const_lv1_0) and (ap_const_logic_0 = OUT_R_TREADY))));
    end process;


    ap_block_pp0_stage0_subdone_assign_proc : process(OUT_R_TREADY, OUT_I_TREADY, ap_enable_reg_pp0_iter1, icmp_ln39_reg_202, ap_block_state3_io)
    begin
                ap_block_pp0_stage0_subdone <= ((ap_enable_reg_pp0_iter1 = ap_const_logic_1) and ((ap_const_boolean_1 = ap_block_state3_io) or ((icmp_ln39_reg_202 = ap_const_lv1_0) and (ap_const_logic_0 = OUT_I_TREADY)) or ((icmp_ln39_reg_202 = ap_const_lv1_0) and (ap_const_logic_0 = OUT_R_TREADY))));
    end process;

        ap_block_state2_pp0_stage0_iter0 <= not((ap_const_boolean_1 = ap_const_boolean_1));

    ap_block_state3_io_assign_proc : process(OUT_R_TREADY, OUT_I_TREADY, icmp_ln39_reg_202)
    begin
                ap_block_state3_io <= (((icmp_ln39_reg_202 = ap_const_lv1_0) and (ap_const_logic_0 = OUT_I_TREADY)) or ((icmp_ln39_reg_202 = ap_const_lv1_0) and (ap_const_logic_0 = OUT_R_TREADY)));
    end process;


    ap_block_state3_pp0_stage0_iter1_assign_proc : process(OUT_R_TREADY, OUT_I_TREADY, icmp_ln39_reg_202)
    begin
                ap_block_state3_pp0_stage0_iter1 <= (((icmp_ln39_reg_202 = ap_const_lv1_0) and (ap_const_logic_0 = OUT_I_TREADY)) or ((icmp_ln39_reg_202 = ap_const_lv1_0) and (ap_const_logic_0 = OUT_R_TREADY)));
    end process;


    ap_block_state5_assign_proc : process(OUT_R_TREADY, OUT_I_TREADY)
    begin
                ap_block_state5 <= ((ap_const_logic_0 = OUT_I_TREADY) or (ap_const_logic_0 = OUT_R_TREADY));
    end process;


    ap_block_state5_io_assign_proc : process(OUT_R_TREADY, OUT_I_TREADY)
    begin
                ap_block_state5_io <= ((ap_const_logic_0 = OUT_I_TREADY) or (ap_const_logic_0 = OUT_R_TREADY));
    end process;


    ap_condition_pp0_exit_iter0_state2_assign_proc : process(icmp_ln39_fu_165_p2)
    begin
        if ((icmp_ln39_fu_165_p2 = ap_const_lv1_1)) then 
            ap_condition_pp0_exit_iter0_state2 <= ap_const_logic_1;
        else 
            ap_condition_pp0_exit_iter0_state2 <= ap_const_logic_0;
        end if; 
    end process;


    ap_done_assign_proc : process(ap_start, ap_CS_fsm_state1, ap_CS_fsm_state6)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state6) or ((ap_const_logic_1 = ap_CS_fsm_state1) and (ap_start = ap_const_logic_0)))) then 
            ap_done <= ap_const_logic_1;
        else 
            ap_done <= ap_const_logic_0;
        end if; 
    end process;

    ap_enable_pp0 <= (ap_idle_pp0 xor ap_const_logic_1);

    ap_idle_assign_proc : process(ap_start, ap_CS_fsm_state1)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state1) and (ap_start = ap_const_logic_0))) then 
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


    ap_ready_assign_proc : process(ap_CS_fsm_state6)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state6)) then 
            ap_ready <= ap_const_logic_1;
        else 
            ap_ready <= ap_const_logic_0;
        end if; 
    end process;

    bitcast_ln303_1_fu_192_p1 <= OUT_temp_I_q0;
    bitcast_ln303_2_fu_177_p1 <= OUT_temp_R_q0;
    bitcast_ln303_3_fu_182_p1 <= OUT_temp_I_q0;
    bitcast_ln303_fu_187_p1 <= OUT_temp_R_q0;
    i_cast_fu_171_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(i_reg_148),64));
    icmp_ln39_fu_165_p2 <= "1" when (i_reg_148 = ap_const_lv7_7F) else "0";
end behav;