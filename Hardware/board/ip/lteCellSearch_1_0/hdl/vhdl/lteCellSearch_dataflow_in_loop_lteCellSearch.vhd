-- ==============================================================
-- RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2020.2 (64-bit)
-- Version: 2020.2
-- Copyright (C) Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
-- 
-- ===========================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity lteCellSearch_dataflow_in_loop_lteCellSearch is
port (
    IN_real_V_address0 : OUT STD_LOGIC_VECTOR (16 downto 0);
    IN_real_V_ce0 : OUT STD_LOGIC;
    IN_real_V_d0 : OUT STD_LOGIC_VECTOR (22 downto 0);
    IN_real_V_q0 : IN STD_LOGIC_VECTOR (22 downto 0);
    IN_real_V_we0 : OUT STD_LOGIC;
    IN_real_V_address1 : OUT STD_LOGIC_VECTOR (16 downto 0);
    IN_real_V_ce1 : OUT STD_LOGIC;
    IN_real_V_d1 : OUT STD_LOGIC_VECTOR (22 downto 0);
    IN_real_V_q1 : IN STD_LOGIC_VECTOR (22 downto 0);
    IN_real_V_we1 : OUT STD_LOGIC;
    trunc_ln236 : IN STD_LOGIC_VECTOR (16 downto 0);
    IN_imag_V_address0 : OUT STD_LOGIC_VECTOR (16 downto 0);
    IN_imag_V_ce0 : OUT STD_LOGIC;
    IN_imag_V_d0 : OUT STD_LOGIC_VECTOR (22 downto 0);
    IN_imag_V_q0 : IN STD_LOGIC_VECTOR (22 downto 0);
    IN_imag_V_we0 : OUT STD_LOGIC;
    IN_imag_V_address1 : OUT STD_LOGIC_VECTOR (16 downto 0);
    IN_imag_V_ce1 : OUT STD_LOGIC;
    IN_imag_V_d1 : OUT STD_LOGIC_VECTOR (22 downto 0);
    IN_imag_V_q1 : IN STD_LOGIC_VECTOR (22 downto 0);
    IN_imag_V_we1 : OUT STD_LOGIC;
    pss_id_temp : OUT STD_LOGIC_VECTOR (1 downto 0);
    peak_id_temp : OUT STD_LOGIC_VECTOR (16 downto 0);
    pss_rslt_temp_address0 : OUT STD_LOGIC_VECTOR (18 downto 0);
    pss_rslt_temp_ce0 : OUT STD_LOGIC;
    pss_rslt_temp_d0 : OUT STD_LOGIC_VECTOR (11 downto 0);
    pss_rslt_temp_q0 : IN STD_LOGIC_VECTOR (11 downto 0);
    pss_rslt_temp_we0 : OUT STD_LOGIC;
    pss_rslt_temp_address1 : OUT STD_LOGIC_VECTOR (18 downto 0);
    pss_rslt_temp_ce1 : OUT STD_LOGIC;
    pss_rslt_temp_d1 : OUT STD_LOGIC_VECTOR (11 downto 0);
    pss_rslt_temp_q1 : IN STD_LOGIC_VECTOR (11 downto 0);
    pss_rslt_temp_we1 : OUT STD_LOGIC;
    ap_clk : IN STD_LOGIC;
    ap_rst : IN STD_LOGIC;
    trunc_ln236_ap_vld : IN STD_LOGIC;
    ap_start : IN STD_LOGIC;
    pss_id_temp_ap_vld : OUT STD_LOGIC;
    peak_id_temp_ap_vld : OUT STD_LOGIC;
    ap_done : OUT STD_LOGIC;
    ap_ready : OUT STD_LOGIC;
    ap_idle : OUT STD_LOGIC;
    ap_continue : IN STD_LOGIC );
end;


architecture behav of lteCellSearch_dataflow_in_loop_lteCellSearch is 
    constant ap_const_lv17_0 : STD_LOGIC_VECTOR (16 downto 0) := "00000000000000000";
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_const_lv23_0 : STD_LOGIC_VECTOR (22 downto 0) := "00000000000000000000000";
    constant ap_const_lv2_0 : STD_LOGIC_VECTOR (1 downto 0) := "00";
    constant ap_const_lv19_0 : STD_LOGIC_VECTOR (18 downto 0) := "0000000000000000000";
    constant ap_const_lv12_0 : STD_LOGIC_VECTOR (11 downto 0) := "000000000000";
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_boolean_1 : BOOLEAN := true;

attribute shreg_extract : string;
    signal dataflow_in_loop_lteCellSearch_entry21_U0_ap_start : STD_LOGIC;
    signal dataflow_in_loop_lteCellSearch_entry21_U0_ap_done : STD_LOGIC;
    signal dataflow_in_loop_lteCellSearch_entry21_U0_ap_continue : STD_LOGIC;
    signal dataflow_in_loop_lteCellSearch_entry21_U0_ap_idle : STD_LOGIC;
    signal dataflow_in_loop_lteCellSearch_entry21_U0_ap_ready : STD_LOGIC;
    signal dataflow_in_loop_lteCellSearch_entry21_U0_trunc_ln236_out_din : STD_LOGIC_VECTOR (16 downto 0);
    signal dataflow_in_loop_lteCellSearch_entry21_U0_trunc_ln236_out_write : STD_LOGIC;
    signal dataflow_in_loop_lteCellSearch_entry21_U0_trunc_ln236_out1_din : STD_LOGIC_VECTOR (16 downto 0);
    signal dataflow_in_loop_lteCellSearch_entry21_U0_trunc_ln236_out1_write : STD_LOGIC;
    signal compute_threshold_U0_ap_start : STD_LOGIC;
    signal compute_threshold_U0_ap_done : STD_LOGIC;
    signal compute_threshold_U0_ap_continue : STD_LOGIC;
    signal compute_threshold_U0_ap_idle : STD_LOGIC;
    signal compute_threshold_U0_ap_ready : STD_LOGIC;
    signal compute_threshold_U0_IN_real_V_address0 : STD_LOGIC_VECTOR (16 downto 0);
    signal compute_threshold_U0_IN_real_V_ce0 : STD_LOGIC;
    signal compute_threshold_U0_trunc_ln236_read : STD_LOGIC;
    signal compute_threshold_U0_IN_imag_V_address0 : STD_LOGIC_VECTOR (16 downto 0);
    signal compute_threshold_U0_IN_imag_V_ce0 : STD_LOGIC;
    signal compute_threshold_U0_trunc_ln236_out_din : STD_LOGIC_VECTOR (16 downto 0);
    signal compute_threshold_U0_trunc_ln236_out_write : STD_LOGIC;
    signal compute_threshold_U0_ap_return : STD_LOGIC_VECTOR (31 downto 0);
    signal ap_channel_done_thresh_V : STD_LOGIC;
    signal thresh_V_full_n : STD_LOGIC;
    signal compute_pss_U0_ap_start : STD_LOGIC;
    signal compute_pss_U0_ap_done : STD_LOGIC;
    signal compute_pss_U0_ap_continue : STD_LOGIC;
    signal compute_pss_U0_ap_idle : STD_LOGIC;
    signal compute_pss_U0_ap_ready : STD_LOGIC;
    signal compute_pss_U0_IN_real_V_address1 : STD_LOGIC_VECTOR (16 downto 0);
    signal compute_pss_U0_IN_real_V_ce1 : STD_LOGIC;
    signal compute_pss_U0_trunc_ln236_read : STD_LOGIC;
    signal compute_pss_U0_IN_imag_V_address1 : STD_LOGIC_VECTOR (16 downto 0);
    signal compute_pss_U0_IN_imag_V_ce1 : STD_LOGIC;
    signal compute_pss_U0_ap_return_0 : STD_LOGIC_VECTOR (19 downto 0);
    signal compute_pss_U0_ap_return_1 : STD_LOGIC_VECTOR (19 downto 0);
    signal compute_pss_U0_ap_return_2 : STD_LOGIC_VECTOR (19 downto 0);
    signal ap_channel_done_pss_rslt_2_V : STD_LOGIC;
    signal pss_rslt_2_V_full_n : STD_LOGIC;
    signal ap_sync_reg_channel_write_pss_rslt_2_V : STD_LOGIC := '0';
    signal ap_sync_channel_write_pss_rslt_2_V : STD_LOGIC;
    signal ap_channel_done_pss_rslt_1_V : STD_LOGIC;
    signal pss_rslt_1_V_full_n : STD_LOGIC;
    signal ap_sync_reg_channel_write_pss_rslt_1_V : STD_LOGIC := '0';
    signal ap_sync_channel_write_pss_rslt_1_V : STD_LOGIC;
    signal ap_channel_done_pss_rslt_0_V : STD_LOGIC;
    signal pss_rslt_0_V_full_n : STD_LOGIC;
    signal ap_sync_reg_channel_write_pss_rslt_0_V : STD_LOGIC := '0';
    signal ap_sync_channel_write_pss_rslt_0_V : STD_LOGIC;
    signal track_pss_peak_U0_ap_start : STD_LOGIC;
    signal track_pss_peak_U0_ap_done : STD_LOGIC;
    signal track_pss_peak_U0_ap_continue : STD_LOGIC;
    signal track_pss_peak_U0_ap_idle : STD_LOGIC;
    signal track_pss_peak_U0_ap_ready : STD_LOGIC;
    signal track_pss_peak_U0_pss_id_temp : STD_LOGIC_VECTOR (1 downto 0);
    signal track_pss_peak_U0_pss_id_temp_ap_vld : STD_LOGIC;
    signal track_pss_peak_U0_peak_id_temp : STD_LOGIC_VECTOR (16 downto 0);
    signal track_pss_peak_U0_peak_id_temp_ap_vld : STD_LOGIC;
    signal track_pss_peak_U0_trunc_ln236_read : STD_LOGIC;
    signal track_pss_peak_U0_pss_rslt_temp_address0 : STD_LOGIC_VECTOR (18 downto 0);
    signal track_pss_peak_U0_pss_rslt_temp_ce0 : STD_LOGIC;
    signal track_pss_peak_U0_pss_rslt_temp_we0 : STD_LOGIC;
    signal track_pss_peak_U0_pss_rslt_temp_d0 : STD_LOGIC_VECTOR (11 downto 0);
    signal track_pss_peak_U0_pss_rslt_temp_address1 : STD_LOGIC_VECTOR (18 downto 0);
    signal track_pss_peak_U0_pss_rslt_temp_ce1 : STD_LOGIC;
    signal track_pss_peak_U0_pss_rslt_temp_we1 : STD_LOGIC;
    signal track_pss_peak_U0_pss_rslt_temp_d1 : STD_LOGIC_VECTOR (11 downto 0);
    signal ap_sync_continue : STD_LOGIC;
    signal trunc_ln236_c_full_n : STD_LOGIC;
    signal trunc_ln236_c_dout : STD_LOGIC_VECTOR (16 downto 0);
    signal trunc_ln236_c_empty_n : STD_LOGIC;
    signal trunc_ln236_c1_full_n : STD_LOGIC;
    signal trunc_ln236_c1_dout : STD_LOGIC_VECTOR (16 downto 0);
    signal trunc_ln236_c1_empty_n : STD_LOGIC;
    signal trunc_ln236_c2_full_n : STD_LOGIC;
    signal trunc_ln236_c2_dout : STD_LOGIC_VECTOR (16 downto 0);
    signal trunc_ln236_c2_empty_n : STD_LOGIC;
    signal thresh_V_dout : STD_LOGIC_VECTOR (31 downto 0);
    signal thresh_V_empty_n : STD_LOGIC;
    signal pss_rslt_0_V_dout : STD_LOGIC_VECTOR (19 downto 0);
    signal pss_rslt_0_V_empty_n : STD_LOGIC;
    signal pss_rslt_1_V_dout : STD_LOGIC_VECTOR (19 downto 0);
    signal pss_rslt_1_V_empty_n : STD_LOGIC;
    signal pss_rslt_2_V_dout : STD_LOGIC_VECTOR (19 downto 0);
    signal pss_rslt_2_V_empty_n : STD_LOGIC;
    signal ap_sync_done : STD_LOGIC;
    signal ap_sync_ready : STD_LOGIC;
    signal ap_sync_reg_dataflow_in_loop_lteCellSearch_entry21_U0_ap_ready : STD_LOGIC := '0';
    signal ap_sync_dataflow_in_loop_lteCellSearch_entry21_U0_ap_ready : STD_LOGIC;
    signal ap_sync_reg_compute_threshold_U0_ap_ready : STD_LOGIC := '0';
    signal ap_sync_compute_threshold_U0_ap_ready : STD_LOGIC;
    signal ap_sync_reg_compute_pss_U0_ap_ready : STD_LOGIC := '0';
    signal ap_sync_compute_pss_U0_ap_ready : STD_LOGIC;
    signal dataflow_in_loop_lteCellSearch_entry21_U0_start_full_n : STD_LOGIC;
    signal dataflow_in_loop_lteCellSearch_entry21_U0_start_write : STD_LOGIC;
    signal compute_threshold_U0_start_full_n : STD_LOGIC;
    signal compute_threshold_U0_start_write : STD_LOGIC;
    signal compute_pss_U0_start_full_n : STD_LOGIC;
    signal compute_pss_U0_start_write : STD_LOGIC;
    signal track_pss_peak_U0_start_full_n : STD_LOGIC;
    signal track_pss_peak_U0_start_write : STD_LOGIC;
    signal ap_ce_reg : STD_LOGIC;

    component lteCellSearch_dataflow_in_loop_lteCellSearch_entry21 IS
    port (
        ap_clk : IN STD_LOGIC;
        ap_rst : IN STD_LOGIC;
        ap_start : IN STD_LOGIC;
        ap_done : OUT STD_LOGIC;
        ap_continue : IN STD_LOGIC;
        ap_idle : OUT STD_LOGIC;
        ap_ready : OUT STD_LOGIC;
        trunc_ln236 : IN STD_LOGIC_VECTOR (16 downto 0);
        trunc_ln236_out_din : OUT STD_LOGIC_VECTOR (16 downto 0);
        trunc_ln236_out_full_n : IN STD_LOGIC;
        trunc_ln236_out_write : OUT STD_LOGIC;
        trunc_ln236_out1_din : OUT STD_LOGIC_VECTOR (16 downto 0);
        trunc_ln236_out1_full_n : IN STD_LOGIC;
        trunc_ln236_out1_write : OUT STD_LOGIC );
    end component;


    component lteCellSearch_compute_threshold IS
    port (
        ap_clk : IN STD_LOGIC;
        ap_rst : IN STD_LOGIC;
        ap_start : IN STD_LOGIC;
        ap_done : OUT STD_LOGIC;
        ap_continue : IN STD_LOGIC;
        ap_idle : OUT STD_LOGIC;
        ap_ready : OUT STD_LOGIC;
        IN_real_V_address0 : OUT STD_LOGIC_VECTOR (16 downto 0);
        IN_real_V_ce0 : OUT STD_LOGIC;
        IN_real_V_q0 : IN STD_LOGIC_VECTOR (22 downto 0);
        trunc_ln236_dout : IN STD_LOGIC_VECTOR (16 downto 0);
        trunc_ln236_empty_n : IN STD_LOGIC;
        trunc_ln236_read : OUT STD_LOGIC;
        IN_imag_V_address0 : OUT STD_LOGIC_VECTOR (16 downto 0);
        IN_imag_V_ce0 : OUT STD_LOGIC;
        IN_imag_V_q0 : IN STD_LOGIC_VECTOR (22 downto 0);
        trunc_ln236_out_din : OUT STD_LOGIC_VECTOR (16 downto 0);
        trunc_ln236_out_full_n : IN STD_LOGIC;
        trunc_ln236_out_write : OUT STD_LOGIC;
        ap_return : OUT STD_LOGIC_VECTOR (31 downto 0) );
    end component;


    component lteCellSearch_compute_pss IS
    port (
        ap_clk : IN STD_LOGIC;
        ap_rst : IN STD_LOGIC;
        ap_start : IN STD_LOGIC;
        ap_done : OUT STD_LOGIC;
        ap_continue : IN STD_LOGIC;
        ap_idle : OUT STD_LOGIC;
        ap_ready : OUT STD_LOGIC;
        IN_real_V_address1 : OUT STD_LOGIC_VECTOR (16 downto 0);
        IN_real_V_ce1 : OUT STD_LOGIC;
        IN_real_V_q1 : IN STD_LOGIC_VECTOR (22 downto 0);
        trunc_ln236_dout : IN STD_LOGIC_VECTOR (16 downto 0);
        trunc_ln236_empty_n : IN STD_LOGIC;
        trunc_ln236_read : OUT STD_LOGIC;
        IN_imag_V_address1 : OUT STD_LOGIC_VECTOR (16 downto 0);
        IN_imag_V_ce1 : OUT STD_LOGIC;
        IN_imag_V_q1 : IN STD_LOGIC_VECTOR (22 downto 0);
        ap_return_0 : OUT STD_LOGIC_VECTOR (19 downto 0);
        ap_return_1 : OUT STD_LOGIC_VECTOR (19 downto 0);
        ap_return_2 : OUT STD_LOGIC_VECTOR (19 downto 0) );
    end component;


    component lteCellSearch_track_pss_peak IS
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
        trunc_ln236_dout : IN STD_LOGIC_VECTOR (16 downto 0);
        trunc_ln236_empty_n : IN STD_LOGIC;
        trunc_ln236_read : OUT STD_LOGIC;
        pss_rslt_temp_address0 : OUT STD_LOGIC_VECTOR (18 downto 0);
        pss_rslt_temp_ce0 : OUT STD_LOGIC;
        pss_rslt_temp_we0 : OUT STD_LOGIC;
        pss_rslt_temp_d0 : OUT STD_LOGIC_VECTOR (11 downto 0);
        pss_rslt_temp_address1 : OUT STD_LOGIC_VECTOR (18 downto 0);
        pss_rslt_temp_ce1 : OUT STD_LOGIC;
        pss_rslt_temp_we1 : OUT STD_LOGIC;
        pss_rslt_temp_d1 : OUT STD_LOGIC_VECTOR (11 downto 0) );
    end component;


    component lteCellSearch_fifo_w17_d2_S IS
    port (
        clk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        if_read_ce : IN STD_LOGIC;
        if_write_ce : IN STD_LOGIC;
        if_din : IN STD_LOGIC_VECTOR (16 downto 0);
        if_full_n : OUT STD_LOGIC;
        if_write : IN STD_LOGIC;
        if_dout : OUT STD_LOGIC_VECTOR (16 downto 0);
        if_empty_n : OUT STD_LOGIC;
        if_read : IN STD_LOGIC );
    end component;


    component lteCellSearch_fifo_w32_d2_S IS
    port (
        clk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        if_read_ce : IN STD_LOGIC;
        if_write_ce : IN STD_LOGIC;
        if_din : IN STD_LOGIC_VECTOR (31 downto 0);
        if_full_n : OUT STD_LOGIC;
        if_write : IN STD_LOGIC;
        if_dout : OUT STD_LOGIC_VECTOR (31 downto 0);
        if_empty_n : OUT STD_LOGIC;
        if_read : IN STD_LOGIC );
    end component;


    component lteCellSearch_fifo_w20_d2_S IS
    port (
        clk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        if_read_ce : IN STD_LOGIC;
        if_write_ce : IN STD_LOGIC;
        if_din : IN STD_LOGIC_VECTOR (19 downto 0);
        if_full_n : OUT STD_LOGIC;
        if_write : IN STD_LOGIC;
        if_dout : OUT STD_LOGIC_VECTOR (19 downto 0);
        if_empty_n : OUT STD_LOGIC;
        if_read : IN STD_LOGIC );
    end component;



begin
    dataflow_in_loop_lteCellSearch_entry21_U0 : component lteCellSearch_dataflow_in_loop_lteCellSearch_entry21
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst,
        ap_start => dataflow_in_loop_lteCellSearch_entry21_U0_ap_start,
        ap_done => dataflow_in_loop_lteCellSearch_entry21_U0_ap_done,
        ap_continue => dataflow_in_loop_lteCellSearch_entry21_U0_ap_continue,
        ap_idle => dataflow_in_loop_lteCellSearch_entry21_U0_ap_idle,
        ap_ready => dataflow_in_loop_lteCellSearch_entry21_U0_ap_ready,
        trunc_ln236 => trunc_ln236,
        trunc_ln236_out_din => dataflow_in_loop_lteCellSearch_entry21_U0_trunc_ln236_out_din,
        trunc_ln236_out_full_n => trunc_ln236_c_full_n,
        trunc_ln236_out_write => dataflow_in_loop_lteCellSearch_entry21_U0_trunc_ln236_out_write,
        trunc_ln236_out1_din => dataflow_in_loop_lteCellSearch_entry21_U0_trunc_ln236_out1_din,
        trunc_ln236_out1_full_n => trunc_ln236_c1_full_n,
        trunc_ln236_out1_write => dataflow_in_loop_lteCellSearch_entry21_U0_trunc_ln236_out1_write);

    compute_threshold_U0 : component lteCellSearch_compute_threshold
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst,
        ap_start => compute_threshold_U0_ap_start,
        ap_done => compute_threshold_U0_ap_done,
        ap_continue => compute_threshold_U0_ap_continue,
        ap_idle => compute_threshold_U0_ap_idle,
        ap_ready => compute_threshold_U0_ap_ready,
        IN_real_V_address0 => compute_threshold_U0_IN_real_V_address0,
        IN_real_V_ce0 => compute_threshold_U0_IN_real_V_ce0,
        IN_real_V_q0 => IN_real_V_q0,
        trunc_ln236_dout => trunc_ln236_c_dout,
        trunc_ln236_empty_n => trunc_ln236_c_empty_n,
        trunc_ln236_read => compute_threshold_U0_trunc_ln236_read,
        IN_imag_V_address0 => compute_threshold_U0_IN_imag_V_address0,
        IN_imag_V_ce0 => compute_threshold_U0_IN_imag_V_ce0,
        IN_imag_V_q0 => IN_imag_V_q0,
        trunc_ln236_out_din => compute_threshold_U0_trunc_ln236_out_din,
        trunc_ln236_out_full_n => trunc_ln236_c2_full_n,
        trunc_ln236_out_write => compute_threshold_U0_trunc_ln236_out_write,
        ap_return => compute_threshold_U0_ap_return);

    compute_pss_U0 : component lteCellSearch_compute_pss
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst,
        ap_start => compute_pss_U0_ap_start,
        ap_done => compute_pss_U0_ap_done,
        ap_continue => compute_pss_U0_ap_continue,
        ap_idle => compute_pss_U0_ap_idle,
        ap_ready => compute_pss_U0_ap_ready,
        IN_real_V_address1 => compute_pss_U0_IN_real_V_address1,
        IN_real_V_ce1 => compute_pss_U0_IN_real_V_ce1,
        IN_real_V_q1 => IN_real_V_q1,
        trunc_ln236_dout => trunc_ln236_c1_dout,
        trunc_ln236_empty_n => trunc_ln236_c1_empty_n,
        trunc_ln236_read => compute_pss_U0_trunc_ln236_read,
        IN_imag_V_address1 => compute_pss_U0_IN_imag_V_address1,
        IN_imag_V_ce1 => compute_pss_U0_IN_imag_V_ce1,
        IN_imag_V_q1 => IN_imag_V_q1,
        ap_return_0 => compute_pss_U0_ap_return_0,
        ap_return_1 => compute_pss_U0_ap_return_1,
        ap_return_2 => compute_pss_U0_ap_return_2);

    track_pss_peak_U0 : component lteCellSearch_track_pss_peak
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst,
        ap_start => track_pss_peak_U0_ap_start,
        ap_done => track_pss_peak_U0_ap_done,
        ap_continue => track_pss_peak_U0_ap_continue,
        ap_idle => track_pss_peak_U0_ap_idle,
        ap_ready => track_pss_peak_U0_ap_ready,
        p_read => pss_rslt_0_V_dout,
        p_read1 => pss_rslt_1_V_dout,
        p_read2 => pss_rslt_2_V_dout,
        p_read3 => thresh_V_dout,
        pss_id_temp => track_pss_peak_U0_pss_id_temp,
        pss_id_temp_ap_vld => track_pss_peak_U0_pss_id_temp_ap_vld,
        peak_id_temp => track_pss_peak_U0_peak_id_temp,
        peak_id_temp_ap_vld => track_pss_peak_U0_peak_id_temp_ap_vld,
        trunc_ln236_dout => trunc_ln236_c2_dout,
        trunc_ln236_empty_n => trunc_ln236_c2_empty_n,
        trunc_ln236_read => track_pss_peak_U0_trunc_ln236_read,
        pss_rslt_temp_address0 => track_pss_peak_U0_pss_rslt_temp_address0,
        pss_rslt_temp_ce0 => track_pss_peak_U0_pss_rslt_temp_ce0,
        pss_rslt_temp_we0 => track_pss_peak_U0_pss_rslt_temp_we0,
        pss_rslt_temp_d0 => track_pss_peak_U0_pss_rslt_temp_d0,
        pss_rslt_temp_address1 => track_pss_peak_U0_pss_rslt_temp_address1,
        pss_rslt_temp_ce1 => track_pss_peak_U0_pss_rslt_temp_ce1,
        pss_rslt_temp_we1 => track_pss_peak_U0_pss_rslt_temp_we1,
        pss_rslt_temp_d1 => track_pss_peak_U0_pss_rslt_temp_d1);

    trunc_ln236_c_U : component lteCellSearch_fifo_w17_d2_S
    port map (
        clk => ap_clk,
        reset => ap_rst,
        if_read_ce => ap_const_logic_1,
        if_write_ce => ap_const_logic_1,
        if_din => dataflow_in_loop_lteCellSearch_entry21_U0_trunc_ln236_out_din,
        if_full_n => trunc_ln236_c_full_n,
        if_write => dataflow_in_loop_lteCellSearch_entry21_U0_trunc_ln236_out_write,
        if_dout => trunc_ln236_c_dout,
        if_empty_n => trunc_ln236_c_empty_n,
        if_read => compute_threshold_U0_trunc_ln236_read);

    trunc_ln236_c1_U : component lteCellSearch_fifo_w17_d2_S
    port map (
        clk => ap_clk,
        reset => ap_rst,
        if_read_ce => ap_const_logic_1,
        if_write_ce => ap_const_logic_1,
        if_din => dataflow_in_loop_lteCellSearch_entry21_U0_trunc_ln236_out1_din,
        if_full_n => trunc_ln236_c1_full_n,
        if_write => dataflow_in_loop_lteCellSearch_entry21_U0_trunc_ln236_out1_write,
        if_dout => trunc_ln236_c1_dout,
        if_empty_n => trunc_ln236_c1_empty_n,
        if_read => compute_pss_U0_trunc_ln236_read);

    trunc_ln236_c2_U : component lteCellSearch_fifo_w17_d2_S
    port map (
        clk => ap_clk,
        reset => ap_rst,
        if_read_ce => ap_const_logic_1,
        if_write_ce => ap_const_logic_1,
        if_din => compute_threshold_U0_trunc_ln236_out_din,
        if_full_n => trunc_ln236_c2_full_n,
        if_write => compute_threshold_U0_trunc_ln236_out_write,
        if_dout => trunc_ln236_c2_dout,
        if_empty_n => trunc_ln236_c2_empty_n,
        if_read => track_pss_peak_U0_trunc_ln236_read);

    thresh_V_U : component lteCellSearch_fifo_w32_d2_S
    port map (
        clk => ap_clk,
        reset => ap_rst,
        if_read_ce => ap_const_logic_1,
        if_write_ce => ap_const_logic_1,
        if_din => compute_threshold_U0_ap_return,
        if_full_n => thresh_V_full_n,
        if_write => compute_threshold_U0_ap_done,
        if_dout => thresh_V_dout,
        if_empty_n => thresh_V_empty_n,
        if_read => track_pss_peak_U0_ap_ready);

    pss_rslt_0_V_U : component lteCellSearch_fifo_w20_d2_S
    port map (
        clk => ap_clk,
        reset => ap_rst,
        if_read_ce => ap_const_logic_1,
        if_write_ce => ap_const_logic_1,
        if_din => compute_pss_U0_ap_return_0,
        if_full_n => pss_rslt_0_V_full_n,
        if_write => ap_channel_done_pss_rslt_0_V,
        if_dout => pss_rslt_0_V_dout,
        if_empty_n => pss_rslt_0_V_empty_n,
        if_read => track_pss_peak_U0_ap_ready);

    pss_rslt_1_V_U : component lteCellSearch_fifo_w20_d2_S
    port map (
        clk => ap_clk,
        reset => ap_rst,
        if_read_ce => ap_const_logic_1,
        if_write_ce => ap_const_logic_1,
        if_din => compute_pss_U0_ap_return_1,
        if_full_n => pss_rslt_1_V_full_n,
        if_write => ap_channel_done_pss_rslt_1_V,
        if_dout => pss_rslt_1_V_dout,
        if_empty_n => pss_rslt_1_V_empty_n,
        if_read => track_pss_peak_U0_ap_ready);

    pss_rslt_2_V_U : component lteCellSearch_fifo_w20_d2_S
    port map (
        clk => ap_clk,
        reset => ap_rst,
        if_read_ce => ap_const_logic_1,
        if_write_ce => ap_const_logic_1,
        if_din => compute_pss_U0_ap_return_2,
        if_full_n => pss_rslt_2_V_full_n,
        if_write => ap_channel_done_pss_rslt_2_V,
        if_dout => pss_rslt_2_V_dout,
        if_empty_n => pss_rslt_2_V_empty_n,
        if_read => track_pss_peak_U0_ap_ready);





    ap_sync_reg_channel_write_pss_rslt_0_V_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_sync_reg_channel_write_pss_rslt_0_V <= ap_const_logic_0;
            else
                if (((compute_pss_U0_ap_done and compute_pss_U0_ap_continue) = ap_const_logic_1)) then 
                    ap_sync_reg_channel_write_pss_rslt_0_V <= ap_const_logic_0;
                else 
                    ap_sync_reg_channel_write_pss_rslt_0_V <= ap_sync_channel_write_pss_rslt_0_V;
                end if; 
            end if;
        end if;
    end process;


    ap_sync_reg_channel_write_pss_rslt_1_V_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_sync_reg_channel_write_pss_rslt_1_V <= ap_const_logic_0;
            else
                if (((compute_pss_U0_ap_done and compute_pss_U0_ap_continue) = ap_const_logic_1)) then 
                    ap_sync_reg_channel_write_pss_rslt_1_V <= ap_const_logic_0;
                else 
                    ap_sync_reg_channel_write_pss_rslt_1_V <= ap_sync_channel_write_pss_rslt_1_V;
                end if; 
            end if;
        end if;
    end process;


    ap_sync_reg_channel_write_pss_rslt_2_V_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_sync_reg_channel_write_pss_rslt_2_V <= ap_const_logic_0;
            else
                if (((compute_pss_U0_ap_done and compute_pss_U0_ap_continue) = ap_const_logic_1)) then 
                    ap_sync_reg_channel_write_pss_rslt_2_V <= ap_const_logic_0;
                else 
                    ap_sync_reg_channel_write_pss_rslt_2_V <= ap_sync_channel_write_pss_rslt_2_V;
                end if; 
            end if;
        end if;
    end process;


    ap_sync_reg_compute_pss_U0_ap_ready_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_sync_reg_compute_pss_U0_ap_ready <= ap_const_logic_0;
            else
                if (((ap_sync_ready and ap_start) = ap_const_logic_1)) then 
                    ap_sync_reg_compute_pss_U0_ap_ready <= ap_const_logic_0;
                else 
                    ap_sync_reg_compute_pss_U0_ap_ready <= ap_sync_compute_pss_U0_ap_ready;
                end if; 
            end if;
        end if;
    end process;


    ap_sync_reg_compute_threshold_U0_ap_ready_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_sync_reg_compute_threshold_U0_ap_ready <= ap_const_logic_0;
            else
                if (((ap_sync_ready and ap_start) = ap_const_logic_1)) then 
                    ap_sync_reg_compute_threshold_U0_ap_ready <= ap_const_logic_0;
                else 
                    ap_sync_reg_compute_threshold_U0_ap_ready <= ap_sync_compute_threshold_U0_ap_ready;
                end if; 
            end if;
        end if;
    end process;


    ap_sync_reg_dataflow_in_loop_lteCellSearch_entry21_U0_ap_ready_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_sync_reg_dataflow_in_loop_lteCellSearch_entry21_U0_ap_ready <= ap_const_logic_0;
            else
                if (((ap_sync_ready and ap_start) = ap_const_logic_1)) then 
                    ap_sync_reg_dataflow_in_loop_lteCellSearch_entry21_U0_ap_ready <= ap_const_logic_0;
                else 
                    ap_sync_reg_dataflow_in_loop_lteCellSearch_entry21_U0_ap_ready <= ap_sync_dataflow_in_loop_lteCellSearch_entry21_U0_ap_ready;
                end if; 
            end if;
        end if;
    end process;

    IN_imag_V_address0 <= compute_threshold_U0_IN_imag_V_address0;
    IN_imag_V_address1 <= compute_pss_U0_IN_imag_V_address1;
    IN_imag_V_ce0 <= compute_threshold_U0_IN_imag_V_ce0;
    IN_imag_V_ce1 <= compute_pss_U0_IN_imag_V_ce1;
    IN_imag_V_d0 <= ap_const_lv23_0;
    IN_imag_V_d1 <= ap_const_lv23_0;
    IN_imag_V_we0 <= ap_const_logic_0;
    IN_imag_V_we1 <= ap_const_logic_0;
    IN_real_V_address0 <= compute_threshold_U0_IN_real_V_address0;
    IN_real_V_address1 <= compute_pss_U0_IN_real_V_address1;
    IN_real_V_ce0 <= compute_threshold_U0_IN_real_V_ce0;
    IN_real_V_ce1 <= compute_pss_U0_IN_real_V_ce1;
    IN_real_V_d0 <= ap_const_lv23_0;
    IN_real_V_d1 <= ap_const_lv23_0;
    IN_real_V_we0 <= ap_const_logic_0;
    IN_real_V_we1 <= ap_const_logic_0;
    ap_channel_done_pss_rslt_0_V <= ((ap_sync_reg_channel_write_pss_rslt_0_V xor ap_const_logic_1) and compute_pss_U0_ap_done);
    ap_channel_done_pss_rslt_1_V <= ((ap_sync_reg_channel_write_pss_rslt_1_V xor ap_const_logic_1) and compute_pss_U0_ap_done);
    ap_channel_done_pss_rslt_2_V <= ((ap_sync_reg_channel_write_pss_rslt_2_V xor ap_const_logic_1) and compute_pss_U0_ap_done);
    ap_channel_done_thresh_V <= compute_threshold_U0_ap_done;
    ap_done <= track_pss_peak_U0_ap_done;
    ap_idle <= (track_pss_peak_U0_ap_idle and (pss_rslt_2_V_empty_n xor ap_const_logic_1) and (pss_rslt_1_V_empty_n xor ap_const_logic_1) and (pss_rslt_0_V_empty_n xor ap_const_logic_1) and (thresh_V_empty_n xor ap_const_logic_1) and dataflow_in_loop_lteCellSearch_entry21_U0_ap_idle and compute_threshold_U0_ap_idle and compute_pss_U0_ap_idle);
    ap_ready <= ap_sync_ready;
    ap_sync_channel_write_pss_rslt_0_V <= ((pss_rslt_0_V_full_n and ap_channel_done_pss_rslt_0_V) or ap_sync_reg_channel_write_pss_rslt_0_V);
    ap_sync_channel_write_pss_rslt_1_V <= ((pss_rslt_1_V_full_n and ap_channel_done_pss_rslt_1_V) or ap_sync_reg_channel_write_pss_rslt_1_V);
    ap_sync_channel_write_pss_rslt_2_V <= ((pss_rslt_2_V_full_n and ap_channel_done_pss_rslt_2_V) or ap_sync_reg_channel_write_pss_rslt_2_V);
    ap_sync_compute_pss_U0_ap_ready <= (compute_pss_U0_ap_ready or ap_sync_reg_compute_pss_U0_ap_ready);
    ap_sync_compute_threshold_U0_ap_ready <= (compute_threshold_U0_ap_ready or ap_sync_reg_compute_threshold_U0_ap_ready);
    ap_sync_continue <= ap_continue;
    ap_sync_dataflow_in_loop_lteCellSearch_entry21_U0_ap_ready <= (dataflow_in_loop_lteCellSearch_entry21_U0_ap_ready or ap_sync_reg_dataflow_in_loop_lteCellSearch_entry21_U0_ap_ready);
    ap_sync_done <= track_pss_peak_U0_ap_done;
    ap_sync_ready <= (ap_sync_dataflow_in_loop_lteCellSearch_entry21_U0_ap_ready and ap_sync_compute_threshold_U0_ap_ready and ap_sync_compute_pss_U0_ap_ready);
    compute_pss_U0_ap_continue <= (ap_sync_channel_write_pss_rslt_2_V and ap_sync_channel_write_pss_rslt_1_V and ap_sync_channel_write_pss_rslt_0_V);
    compute_pss_U0_ap_start <= ((ap_sync_reg_compute_pss_U0_ap_ready xor ap_const_logic_1) and ap_start);
    compute_pss_U0_start_full_n <= ap_const_logic_1;
    compute_pss_U0_start_write <= ap_const_logic_0;
    compute_threshold_U0_ap_continue <= thresh_V_full_n;
    compute_threshold_U0_ap_start <= ((ap_sync_reg_compute_threshold_U0_ap_ready xor ap_const_logic_1) and ap_start);
    compute_threshold_U0_start_full_n <= ap_const_logic_1;
    compute_threshold_U0_start_write <= ap_const_logic_0;
    dataflow_in_loop_lteCellSearch_entry21_U0_ap_continue <= ap_const_logic_1;
    dataflow_in_loop_lteCellSearch_entry21_U0_ap_start <= ((ap_sync_reg_dataflow_in_loop_lteCellSearch_entry21_U0_ap_ready xor ap_const_logic_1) and ap_start);
    dataflow_in_loop_lteCellSearch_entry21_U0_start_full_n <= ap_const_logic_1;
    dataflow_in_loop_lteCellSearch_entry21_U0_start_write <= ap_const_logic_0;
    peak_id_temp <= track_pss_peak_U0_peak_id_temp;
    peak_id_temp_ap_vld <= track_pss_peak_U0_peak_id_temp_ap_vld;
    pss_id_temp <= track_pss_peak_U0_pss_id_temp;
    pss_id_temp_ap_vld <= track_pss_peak_U0_pss_id_temp_ap_vld;
    pss_rslt_temp_address0 <= track_pss_peak_U0_pss_rslt_temp_address0;
    pss_rslt_temp_address1 <= track_pss_peak_U0_pss_rslt_temp_address1;
    pss_rslt_temp_ce0 <= track_pss_peak_U0_pss_rslt_temp_ce0;
    pss_rslt_temp_ce1 <= track_pss_peak_U0_pss_rslt_temp_ce1;
    pss_rslt_temp_d0 <= track_pss_peak_U0_pss_rslt_temp_d0;
    pss_rslt_temp_d1 <= track_pss_peak_U0_pss_rslt_temp_d1;
    pss_rslt_temp_we0 <= track_pss_peak_U0_pss_rslt_temp_we0;
    pss_rslt_temp_we1 <= track_pss_peak_U0_pss_rslt_temp_we1;
    track_pss_peak_U0_ap_continue <= ap_continue;
    track_pss_peak_U0_ap_start <= (thresh_V_empty_n and pss_rslt_2_V_empty_n and pss_rslt_1_V_empty_n and pss_rslt_0_V_empty_n);
    track_pss_peak_U0_start_full_n <= ap_const_logic_1;
    track_pss_peak_U0_start_write <= ap_const_logic_0;
end behav;
