-- ==============================================================
-- RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2020.2 (64-bit)
-- Version: 2020.2
-- Copyright (C) Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
-- 
-- ===========================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity lteCellSearch_track_pss_peak is
port (
    ap_clk : IN STD_LOGIC;
    ap_rst : IN STD_LOGIC;
    ap_start : IN STD_LOGIC;
    ap_done : OUT STD_LOGIC;
    ap_continue : IN STD_LOGIC;
    ap_idle : OUT STD_LOGIC;
    ap_ready : OUT STD_LOGIC;
    p_read : IN STD_LOGIC_VECTOR (19 downto 0);
    p_read1 : IN STD_LOGIC_VECTOR (19 downto 0);
    p_read2 : IN STD_LOGIC_VECTOR (19 downto 0);
    p_read3 : IN STD_LOGIC_VECTOR (31 downto 0);
    pss_id_temp : OUT STD_LOGIC_VECTOR (1 downto 0);
    pss_id_temp_ap_vld : OUT STD_LOGIC;
    peak_id_temp : OUT STD_LOGIC_VECTOR (16 downto 0);
    peak_id_temp_ap_vld : OUT STD_LOGIC;
    trunc_ln264_dout : IN STD_LOGIC_VECTOR (16 downto 0);
    trunc_ln264_empty_n : IN STD_LOGIC;
    trunc_ln264_read : OUT STD_LOGIC;
    pss_rslt_temp_address0 : OUT STD_LOGIC_VECTOR (18 downto 0);
    pss_rslt_temp_ce0 : OUT STD_LOGIC;
    pss_rslt_temp_we0 : OUT STD_LOGIC;
    pss_rslt_temp_d0 : OUT STD_LOGIC_VECTOR (11 downto 0);
    pss_rslt_temp_address1 : OUT STD_LOGIC_VECTOR (18 downto 0);
    pss_rslt_temp_ce1 : OUT STD_LOGIC;
    pss_rslt_temp_we1 : OUT STD_LOGIC;
    pss_rslt_temp_d1 : OUT STD_LOGIC_VECTOR (11 downto 0) );
end;


architecture behav of lteCellSearch_track_pss_peak is 
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_ST_fsm_state1 : STD_LOGIC_VECTOR (1 downto 0) := "01";
    constant ap_ST_fsm_state2 : STD_LOGIC_VECTOR (1 downto 0) := "10";
    constant ap_const_lv32_0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    constant ap_const_lv20_0 : STD_LOGIC_VECTOR (19 downto 0) := "00000000000000000000";
    constant ap_const_lv32_1 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000001";
    constant ap_const_lv1_1 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv17_0 : STD_LOGIC_VECTOR (16 downto 0) := "00000000000000000";
    constant ap_const_lv2_0 : STD_LOGIC_VECTOR (1 downto 0) := "00";
    constant ap_const_lv2_2 : STD_LOGIC_VECTOR (1 downto 0) := "10";
    constant ap_const_lv22_0 : STD_LOGIC_VECTOR (21 downto 0) := "0000000000000000000000";
    constant ap_const_lv78_9C4000000 : STD_LOGIC_VECTOR (77 downto 0) := "000000000000000000000000000000000000000000100111000100000000000000000000000000";
    constant ap_const_lv32_42 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000001000010";
    constant ap_const_lv32_4D : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000001001101";
    constant ap_const_lv18_17700 : STD_LOGIC_VECTOR (17 downto 0) := "010111011100000000";
    constant ap_const_lv19_2EE00 : STD_LOGIC_VECTOR (18 downto 0) := "0101110111000000000";
    constant ap_const_boolean_1 : BOOLEAN := true;

attribute shreg_extract : string;
    signal ap_done_reg : STD_LOGIC := '0';
    signal ap_CS_fsm : STD_LOGIC_VECTOR (1 downto 0) := "01";
    attribute fsm_encoding : string;
    attribute fsm_encoding of ap_CS_fsm : signal is "none";
    signal ap_CS_fsm_state1 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state1 : signal is "none";
    signal curr_max_V : STD_LOGIC_VECTOR (19 downto 0) := "00000000000000000000";
    signal trunc_ln264_blk_n : STD_LOGIC;
    signal trunc_ln264_read_reg_445 : STD_LOGIC_VECTOR (16 downto 0);
    signal ret_V_2_reg_456 : STD_LOGIC_VECTOR (11 downto 0);
    signal zext_ln534_fu_354_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal zext_ln191_fu_369_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal zext_ln192_fu_440_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal ap_CS_fsm_state2 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state2 : signal is "none";
    signal select_ln183_3_fu_290_p3 : STD_LOGIC_VECTOR (19 downto 0);
    signal ap_block_state1 : BOOLEAN;
    signal or_ln183_fu_268_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal peak_id_temp_preg : STD_LOGIC_VECTOR (16 downto 0) := "00000000000000000";
    signal or_ln183_1_fu_304_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal select_ln183_1_fu_310_p3 : STD_LOGIC_VECTOR (1 downto 0);
    signal pss_id_temp_preg : STD_LOGIC_VECTOR (1 downto 0) := "00";
    signal run_fu_146_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal zext_ln142_2_fu_160_p1 : STD_LOGIC_VECTOR (31 downto 0);
    signal zext_ln142_1_fu_156_p1 : STD_LOGIC_VECTOR (31 downto 0);
    signal zext_ln142_fu_152_p1 : STD_LOGIC_VECTOR (31 downto 0);
    signal select_ln148_fu_174_p3 : STD_LOGIC_VECTOR (19 downto 0);
    signal is_valid_0_fu_182_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln1494_fu_200_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal and_ln169_fu_206_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal select_ln169_fu_212_p3 : STD_LOGIC_VECTOR (19 downto 0);
    signal is_valid_1_fu_188_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln1494_1_fu_220_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal and_ln176_fu_226_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal select_ln176_fu_236_p3 : STD_LOGIC_VECTOR (19 downto 0);
    signal is_valid_2_fu_194_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln1494_2_fu_244_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal xor_ln148_fu_168_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal and_ln183_fu_250_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal or_ln183_3_fu_262_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal or_ln183_2_fu_256_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal select_ln183_fu_274_p3 : STD_LOGIC_VECTOR (19 downto 0);
    signal select_ln183_2_fu_282_p3 : STD_LOGIC_VECTOR (19 downto 0);
    signal or_ln183_4_fu_298_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal zext_ln176_fu_232_p1 : STD_LOGIC_VECTOR (1 downto 0);
    signal r_V_fu_319_p3 : STD_LOGIC_VECTOR (41 downto 0);
    signal r_V_6_fu_331_p0 : STD_LOGIC_VECTOR (41 downto 0);
    signal r_V_6_fu_331_p1 : STD_LOGIC_VECTOR (36 downto 0);
    signal r_V_6_fu_331_p2 : STD_LOGIC_VECTOR (77 downto 0);
    signal zext_ln190_1_fu_359_p1 : STD_LOGIC_VECTOR (17 downto 0);
    signal add_ln191_fu_363_p2 : STD_LOGIC_VECTOR (17 downto 0);
    signal r_V_2_fu_374_p3 : STD_LOGIC_VECTOR (41 downto 0);
    signal r_V_7_fu_386_p0 : STD_LOGIC_VECTOR (41 downto 0);
    signal r_V_7_fu_386_p1 : STD_LOGIC_VECTOR (36 downto 0);
    signal r_V_7_fu_386_p2 : STD_LOGIC_VECTOR (77 downto 0);
    signal r_V_4_fu_403_p3 : STD_LOGIC_VECTOR (41 downto 0);
    signal r_V_8_fu_415_p0 : STD_LOGIC_VECTOR (41 downto 0);
    signal r_V_8_fu_415_p1 : STD_LOGIC_VECTOR (36 downto 0);
    signal r_V_8_fu_415_p2 : STD_LOGIC_VECTOR (77 downto 0);
    signal zext_ln190_fu_431_p1 : STD_LOGIC_VECTOR (18 downto 0);
    signal add_ln192_fu_434_p2 : STD_LOGIC_VECTOR (18 downto 0);
    signal ap_NS_fsm : STD_LOGIC_VECTOR (1 downto 0);
    signal r_V_6_fu_331_p00 : STD_LOGIC_VECTOR (77 downto 0);
    signal r_V_7_fu_386_p00 : STD_LOGIC_VECTOR (77 downto 0);
    signal r_V_8_fu_415_p00 : STD_LOGIC_VECTOR (77 downto 0);
    signal ap_ce_reg : STD_LOGIC;

    component lteCellSearch_mul_42ns_37ns_78_1_1 IS
    generic (
        ID : INTEGER;
        NUM_STAGE : INTEGER;
        din0_WIDTH : INTEGER;
        din1_WIDTH : INTEGER;
        dout_WIDTH : INTEGER );
    port (
        din0 : IN STD_LOGIC_VECTOR (41 downto 0);
        din1 : IN STD_LOGIC_VECTOR (36 downto 0);
        dout : OUT STD_LOGIC_VECTOR (77 downto 0) );
    end component;



begin
    mul_42ns_37ns_78_1_1_U53 : component lteCellSearch_mul_42ns_37ns_78_1_1
    generic map (
        ID => 1,
        NUM_STAGE => 1,
        din0_WIDTH => 42,
        din1_WIDTH => 37,
        dout_WIDTH => 78)
    port map (
        din0 => r_V_6_fu_331_p0,
        din1 => r_V_6_fu_331_p1,
        dout => r_V_6_fu_331_p2);

    mul_42ns_37ns_78_1_1_U54 : component lteCellSearch_mul_42ns_37ns_78_1_1
    generic map (
        ID => 1,
        NUM_STAGE => 1,
        din0_WIDTH => 42,
        din1_WIDTH => 37,
        dout_WIDTH => 78)
    port map (
        din0 => r_V_7_fu_386_p0,
        din1 => r_V_7_fu_386_p1,
        dout => r_V_7_fu_386_p2);

    mul_42ns_37ns_78_1_1_U55 : component lteCellSearch_mul_42ns_37ns_78_1_1
    generic map (
        ID => 1,
        NUM_STAGE => 1,
        din0_WIDTH => 42,
        din1_WIDTH => 37,
        dout_WIDTH => 78)
    port map (
        din0 => r_V_8_fu_415_p0,
        din1 => r_V_8_fu_415_p1,
        dout => r_V_8_fu_415_p2);





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
                elsif ((ap_const_logic_1 = ap_CS_fsm_state2)) then 
                    ap_done_reg <= ap_const_logic_1;
                end if; 
            end if;
        end if;
    end process;


    peak_id_temp_preg_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                peak_id_temp_preg <= ap_const_lv17_0;
            else
                if ((not(((ap_start = ap_const_logic_0) or (trunc_ln264_empty_n = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) and (or_ln183_1_fu_304_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
                    peak_id_temp_preg <= trunc_ln264_dout;
                end if; 
            end if;
        end if;
    end process;


    pss_id_temp_preg_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                pss_id_temp_preg <= ap_const_lv2_0;
            else
                if ((not(((ap_start = ap_const_logic_0) or (trunc_ln264_empty_n = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) and (or_ln183_1_fu_304_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
                    pss_id_temp_preg <= select_ln183_1_fu_310_p3;
                end if; 
            end if;
        end if;
    end process;

    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((not(((ap_start = ap_const_logic_0) or (trunc_ln264_empty_n = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) and (or_ln183_fu_268_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state1))) then
                curr_max_V <= select_ln183_3_fu_290_p3;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state1)) then
                ret_V_2_reg_456 <= r_V_8_fu_415_p2(77 downto 66);
                trunc_ln264_read_reg_445 <= trunc_ln264_dout;
            end if;
        end if;
    end process;

    ap_NS_fsm_assign_proc : process (ap_start, ap_done_reg, ap_CS_fsm, ap_CS_fsm_state1, trunc_ln264_empty_n)
    begin
        case ap_CS_fsm is
            when ap_ST_fsm_state1 => 
                if ((not(((ap_start = ap_const_logic_0) or (trunc_ln264_empty_n = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then
                    ap_NS_fsm <= ap_ST_fsm_state2;
                else
                    ap_NS_fsm <= ap_ST_fsm_state1;
                end if;
            when ap_ST_fsm_state2 => 
                ap_NS_fsm <= ap_ST_fsm_state1;
            when others =>  
                ap_NS_fsm <= "XX";
        end case;
    end process;
    add_ln191_fu_363_p2 <= std_logic_vector(unsigned(zext_ln190_1_fu_359_p1) + unsigned(ap_const_lv18_17700));
    add_ln192_fu_434_p2 <= std_logic_vector(unsigned(zext_ln190_fu_431_p1) + unsigned(ap_const_lv19_2EE00));
    and_ln169_fu_206_p2 <= (is_valid_0_fu_182_p2 and icmp_ln1494_fu_200_p2);
    and_ln176_fu_226_p2 <= (is_valid_1_fu_188_p2 and icmp_ln1494_1_fu_220_p2);
    and_ln183_fu_250_p2 <= (is_valid_2_fu_194_p2 and icmp_ln1494_2_fu_244_p2);
    ap_CS_fsm_state1 <= ap_CS_fsm(0);
    ap_CS_fsm_state2 <= ap_CS_fsm(1);

    ap_block_state1_assign_proc : process(ap_start, ap_done_reg, trunc_ln264_empty_n)
    begin
                ap_block_state1 <= ((ap_start = ap_const_logic_0) or (trunc_ln264_empty_n = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1));
    end process;


    ap_done_assign_proc : process(ap_done_reg, ap_CS_fsm_state2)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state2)) then 
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


    ap_ready_assign_proc : process(ap_CS_fsm_state2)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state2)) then 
            ap_ready <= ap_const_logic_1;
        else 
            ap_ready <= ap_const_logic_0;
        end if; 
    end process;

    icmp_ln1494_1_fu_220_p2 <= "1" when (unsigned(select_ln169_fu_212_p3) < unsigned(p_read1)) else "0";
    icmp_ln1494_2_fu_244_p2 <= "1" when (unsigned(select_ln176_fu_236_p3) < unsigned(p_read2)) else "0";
    icmp_ln1494_fu_200_p2 <= "1" when (unsigned(select_ln148_fu_174_p3) < unsigned(p_read)) else "0";
    is_valid_0_fu_182_p2 <= "1" when (signed(zext_ln142_2_fu_160_p1) > signed(p_read3)) else "0";
    is_valid_1_fu_188_p2 <= "1" when (signed(zext_ln142_1_fu_156_p1) > signed(p_read3)) else "0";
    is_valid_2_fu_194_p2 <= "1" when (signed(zext_ln142_fu_152_p1) > signed(p_read3)) else "0";
    or_ln183_1_fu_304_p2 <= (or_ln183_4_fu_298_p2 or and_ln176_fu_226_p2);
    or_ln183_2_fu_256_p2 <= (xor_ln148_fu_168_p2 or and_ln169_fu_206_p2);
    or_ln183_3_fu_262_p2 <= (and_ln183_fu_250_p2 or and_ln176_fu_226_p2);
    or_ln183_4_fu_298_p2 <= (and_ln183_fu_250_p2 or and_ln169_fu_206_p2);
    or_ln183_fu_268_p2 <= (or_ln183_3_fu_262_p2 or or_ln183_2_fu_256_p2);

    peak_id_temp_assign_proc : process(ap_start, ap_done_reg, ap_CS_fsm_state1, trunc_ln264_dout, trunc_ln264_empty_n, peak_id_temp_preg, or_ln183_1_fu_304_p2)
    begin
        if ((not(((ap_start = ap_const_logic_0) or (trunc_ln264_empty_n = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) and (or_ln183_1_fu_304_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            peak_id_temp <= trunc_ln264_dout;
        else 
            peak_id_temp <= peak_id_temp_preg;
        end if; 
    end process;


    peak_id_temp_ap_vld_assign_proc : process(ap_start, ap_done_reg, ap_CS_fsm_state1, trunc_ln264_empty_n, or_ln183_1_fu_304_p2)
    begin
        if ((not(((ap_start = ap_const_logic_0) or (trunc_ln264_empty_n = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) and (or_ln183_1_fu_304_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            peak_id_temp_ap_vld <= ap_const_logic_1;
        else 
            peak_id_temp_ap_vld <= ap_const_logic_0;
        end if; 
    end process;


    pss_id_temp_assign_proc : process(ap_start, ap_done_reg, ap_CS_fsm_state1, trunc_ln264_empty_n, or_ln183_1_fu_304_p2, select_ln183_1_fu_310_p3, pss_id_temp_preg)
    begin
        if ((not(((ap_start = ap_const_logic_0) or (trunc_ln264_empty_n = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) and (or_ln183_1_fu_304_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            pss_id_temp <= select_ln183_1_fu_310_p3;
        else 
            pss_id_temp <= pss_id_temp_preg;
        end if; 
    end process;


    pss_id_temp_ap_vld_assign_proc : process(ap_start, ap_done_reg, ap_CS_fsm_state1, trunc_ln264_empty_n, or_ln183_1_fu_304_p2)
    begin
        if ((not(((ap_start = ap_const_logic_0) or (trunc_ln264_empty_n = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) and (or_ln183_1_fu_304_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            pss_id_temp_ap_vld <= ap_const_logic_1;
        else 
            pss_id_temp_ap_vld <= ap_const_logic_0;
        end if; 
    end process;


    pss_rslt_temp_address0_assign_proc : process(ap_CS_fsm_state1, zext_ln191_fu_369_p1, zext_ln192_fu_440_p1, ap_CS_fsm_state2)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state2)) then 
            pss_rslt_temp_address0 <= zext_ln192_fu_440_p1(19 - 1 downto 0);
        elsif ((ap_const_logic_1 = ap_CS_fsm_state1)) then 
            pss_rslt_temp_address0 <= zext_ln191_fu_369_p1(19 - 1 downto 0);
        else 
            pss_rslt_temp_address0 <= "XXXXXXXXXXXXXXXXXXX";
        end if; 
    end process;

    pss_rslt_temp_address1 <= zext_ln534_fu_354_p1(19 - 1 downto 0);

    pss_rslt_temp_ce0_assign_proc : process(ap_start, ap_done_reg, ap_CS_fsm_state1, trunc_ln264_empty_n, ap_CS_fsm_state2)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state2) or (not(((ap_start = ap_const_logic_0) or (trunc_ln264_empty_n = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) and (ap_const_logic_1 = ap_CS_fsm_state1)))) then 
            pss_rslt_temp_ce0 <= ap_const_logic_1;
        else 
            pss_rslt_temp_ce0 <= ap_const_logic_0;
        end if; 
    end process;


    pss_rslt_temp_ce1_assign_proc : process(ap_start, ap_done_reg, ap_CS_fsm_state1, trunc_ln264_empty_n)
    begin
        if ((not(((ap_start = ap_const_logic_0) or (trunc_ln264_empty_n = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            pss_rslt_temp_ce1 <= ap_const_logic_1;
        else 
            pss_rslt_temp_ce1 <= ap_const_logic_0;
        end if; 
    end process;


    pss_rslt_temp_d0_assign_proc : process(ap_CS_fsm_state1, ret_V_2_reg_456, ap_CS_fsm_state2, r_V_7_fu_386_p2)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state2)) then 
            pss_rslt_temp_d0 <= ret_V_2_reg_456;
        elsif ((ap_const_logic_1 = ap_CS_fsm_state1)) then 
            pss_rslt_temp_d0 <= r_V_7_fu_386_p2(77 downto 66);
        else 
            pss_rslt_temp_d0 <= "XXXXXXXXXXXX";
        end if; 
    end process;

    pss_rslt_temp_d1 <= r_V_6_fu_331_p2(77 downto 66);

    pss_rslt_temp_we0_assign_proc : process(ap_start, ap_done_reg, ap_CS_fsm_state1, trunc_ln264_empty_n, ap_CS_fsm_state2)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state2) or (not(((ap_start = ap_const_logic_0) or (trunc_ln264_empty_n = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) and (ap_const_logic_1 = ap_CS_fsm_state1)))) then 
            pss_rslt_temp_we0 <= ap_const_logic_1;
        else 
            pss_rslt_temp_we0 <= ap_const_logic_0;
        end if; 
    end process;


    pss_rslt_temp_we1_assign_proc : process(ap_start, ap_done_reg, ap_CS_fsm_state1, trunc_ln264_empty_n)
    begin
        if ((not(((ap_start = ap_const_logic_0) or (trunc_ln264_empty_n = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            pss_rslt_temp_we1 <= ap_const_logic_1;
        else 
            pss_rslt_temp_we1 <= ap_const_logic_0;
        end if; 
    end process;

    r_V_2_fu_374_p3 <= (p_read1 & ap_const_lv22_0);
    r_V_4_fu_403_p3 <= (p_read2 & ap_const_lv22_0);
    r_V_6_fu_331_p0 <= r_V_6_fu_331_p00(42 - 1 downto 0);
    r_V_6_fu_331_p00 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(r_V_fu_319_p3),78));
    r_V_6_fu_331_p1 <= ap_const_lv78_9C4000000(37 - 1 downto 0);
    r_V_7_fu_386_p0 <= r_V_7_fu_386_p00(42 - 1 downto 0);
    r_V_7_fu_386_p00 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(r_V_2_fu_374_p3),78));
    r_V_7_fu_386_p1 <= ap_const_lv78_9C4000000(37 - 1 downto 0);
    r_V_8_fu_415_p0 <= r_V_8_fu_415_p00(42 - 1 downto 0);
    r_V_8_fu_415_p00 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(r_V_4_fu_403_p3),78));
    r_V_8_fu_415_p1 <= ap_const_lv78_9C4000000(37 - 1 downto 0);
    r_V_fu_319_p3 <= (p_read & ap_const_lv22_0);
    run_fu_146_p2 <= "0" when (trunc_ln264_dout = ap_const_lv17_0) else "1";
    select_ln148_fu_174_p3 <= 
        curr_max_V when (run_fu_146_p2(0) = '1') else 
        ap_const_lv20_0;
    select_ln169_fu_212_p3 <= 
        p_read when (and_ln169_fu_206_p2(0) = '1') else 
        select_ln148_fu_174_p3;
    select_ln176_fu_236_p3 <= 
        p_read1 when (and_ln176_fu_226_p2(0) = '1') else 
        select_ln169_fu_212_p3;
    select_ln183_1_fu_310_p3 <= 
        ap_const_lv2_2 when (and_ln183_fu_250_p2(0) = '1') else 
        zext_ln176_fu_232_p1;
    select_ln183_2_fu_282_p3 <= 
        p_read when (and_ln169_fu_206_p2(0) = '1') else 
        ap_const_lv20_0;
    select_ln183_3_fu_290_p3 <= 
        select_ln183_fu_274_p3 when (or_ln183_3_fu_262_p2(0) = '1') else 
        select_ln183_2_fu_282_p3;
    select_ln183_fu_274_p3 <= 
        p_read2 when (and_ln183_fu_250_p2(0) = '1') else 
        p_read1;

    trunc_ln264_blk_n_assign_proc : process(ap_start, ap_done_reg, ap_CS_fsm_state1, trunc_ln264_empty_n)
    begin
        if ((not(((ap_start = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            trunc_ln264_blk_n <= trunc_ln264_empty_n;
        else 
            trunc_ln264_blk_n <= ap_const_logic_1;
        end if; 
    end process;


    trunc_ln264_read_assign_proc : process(ap_start, ap_done_reg, ap_CS_fsm_state1, trunc_ln264_empty_n)
    begin
        if ((not(((ap_start = ap_const_logic_0) or (trunc_ln264_empty_n = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            trunc_ln264_read <= ap_const_logic_1;
        else 
            trunc_ln264_read <= ap_const_logic_0;
        end if; 
    end process;

    xor_ln148_fu_168_p2 <= (run_fu_146_p2 xor ap_const_lv1_1);
    zext_ln142_1_fu_156_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(p_read1),32));
    zext_ln142_2_fu_160_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(p_read),32));
    zext_ln142_fu_152_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(p_read2),32));
    zext_ln176_fu_232_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(and_ln176_fu_226_p2),2));
    zext_ln190_1_fu_359_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(trunc_ln264_dout),18));
    zext_ln190_fu_431_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(trunc_ln264_read_reg_445),19));
    zext_ln191_fu_369_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(add_ln191_fu_363_p2),64));
    zext_ln192_fu_440_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(add_ln192_fu_434_p2),64));
    zext_ln534_fu_354_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(trunc_ln264_dout),64));
end behav;
