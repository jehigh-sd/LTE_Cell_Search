// ==============================================================
// RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2020.2 (64-bit)
// Version: 2020.2
// Copyright (C) Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

(* CORE_GENERATION_INFO="adcPassThrough_adcPassThrough,hls_ip_2020_2,{HLS_INPUT_TYPE=cxx,HLS_INPUT_FLOAT=0,HLS_INPUT_FIXED=0,HLS_INPUT_PART=xczu28dr-ffvg1517-2-e,HLS_INPUT_CLOCK=16.299999,HLS_INPUT_ARCH=others,HLS_SYN_CLOCK=0.000000,HLS_SYN_LAT=-1,HLS_SYN_TPT=none,HLS_SYN_MEM=0,HLS_SYN_DSP=0,HLS_SYN_FF=8,HLS_SYN_LUT=184,HLS_VERSION=2020_2}" *)

module adcPassThrough (
        ap_clk,
        ap_rst_n,
        IN_R_TDATA,
        IN_R_TVALID,
        IN_R_TREADY,
        IN_R_TKEEP,
        IN_R_TSTRB,
        IN_R_TLAST,
        IN_I_TDATA,
        IN_I_TVALID,
        IN_I_TREADY,
        IN_I_TKEEP,
        IN_I_TSTRB,
        IN_I_TLAST,
        OUT_R1_TDATA,
        OUT_R1_TVALID,
        OUT_R1_TREADY,
        OUT_R1_TKEEP,
        OUT_R1_TSTRB,
        OUT_R1_TLAST,
        OUT_I1_TDATA,
        OUT_I1_TVALID,
        OUT_I1_TREADY,
        OUT_I1_TKEEP,
        OUT_I1_TSTRB,
        OUT_I1_TLAST,
        OUT_R2_TDATA,
        OUT_R2_TVALID,
        OUT_R2_TREADY,
        OUT_R2_TKEEP,
        OUT_R2_TSTRB,
        OUT_R2_TLAST,
        OUT_I2_TDATA,
        OUT_I2_TVALID,
        OUT_I2_TREADY,
        OUT_I2_TKEEP,
        OUT_I2_TSTRB,
        OUT_I2_TLAST
);

parameter    ap_ST_fsm_state1 = 2'd1;
parameter    ap_ST_fsm_pp0_stage0 = 2'd2;

input   ap_clk;
input   ap_rst_n;
input  [127:0] IN_R_TDATA;
input   IN_R_TVALID;
output   IN_R_TREADY;
input  [15:0] IN_R_TKEEP;
input  [15:0] IN_R_TSTRB;
input  [0:0] IN_R_TLAST;
input  [127:0] IN_I_TDATA;
input   IN_I_TVALID;
output   IN_I_TREADY;
input  [15:0] IN_I_TKEEP;
input  [15:0] IN_I_TSTRB;
input  [0:0] IN_I_TLAST;
output  [127:0] OUT_R1_TDATA;
output   OUT_R1_TVALID;
input   OUT_R1_TREADY;
output  [15:0] OUT_R1_TKEEP;
output  [15:0] OUT_R1_TSTRB;
output  [0:0] OUT_R1_TLAST;
output  [127:0] OUT_I1_TDATA;
output   OUT_I1_TVALID;
input   OUT_I1_TREADY;
output  [15:0] OUT_I1_TKEEP;
output  [15:0] OUT_I1_TSTRB;
output  [0:0] OUT_I1_TLAST;
output  [127:0] OUT_R2_TDATA;
output   OUT_R2_TVALID;
input   OUT_R2_TREADY;
output  [15:0] OUT_R2_TKEEP;
output  [15:0] OUT_R2_TSTRB;
output  [0:0] OUT_R2_TLAST;
output  [127:0] OUT_I2_TDATA;
output   OUT_I2_TVALID;
input   OUT_I2_TREADY;
output  [15:0] OUT_I2_TKEEP;
output  [15:0] OUT_I2_TSTRB;
output  [0:0] OUT_I2_TLAST;

 reg    ap_rst_n_inv;
wire    grp_passthrough_samples_fu_76_IN_R_TDATA_blk_n;
reg    IN_R_TDATA_blk_n;
(* fsm_encoding = "none" *) reg   [1:0] ap_CS_fsm;
wire    ap_CS_fsm_pp0_stage0;
reg    ap_enable_reg_pp0_iter1;
wire    ap_block_pp0_stage0;
wire    grp_passthrough_samples_fu_76_IN_I_TDATA_blk_n;
reg    IN_I_TDATA_blk_n;
wire    grp_passthrough_samples_fu_76_OUT_R1_TDATA_blk_n;
reg    OUT_R1_TDATA_blk_n;
wire    grp_passthrough_samples_fu_76_OUT_I1_TDATA_blk_n;
reg    OUT_I1_TDATA_blk_n;
wire    grp_passthrough_samples_fu_76_OUT_R2_TDATA_blk_n;
reg    OUT_R2_TDATA_blk_n;
wire    grp_passthrough_samples_fu_76_OUT_I2_TDATA_blk_n;
reg    OUT_I2_TDATA_blk_n;
reg    ap_enable_reg_pp0_iter0;
wire    ap_CS_fsm_state1;
wire    ap_block_state2_pp0_stage0_iter0;
reg    ap_block_state3_pp0_stage0_iter1;
wire    ap_block_state4_pp0_stage0_iter2;
reg    ap_block_pp0_stage0_subdone;
reg    ap_enable_reg_pp0_iter2;
wire    grp_passthrough_samples_fu_76_ap_start;
wire    grp_passthrough_samples_fu_76_ap_done;
wire    grp_passthrough_samples_fu_76_ap_idle;
wire    grp_passthrough_samples_fu_76_ap_ready;
wire    grp_passthrough_samples_fu_76_OUT_R1_TREADY;
wire    grp_passthrough_samples_fu_76_OUT_I1_TREADY;
wire    grp_passthrough_samples_fu_76_OUT_R2_TREADY;
wire    grp_passthrough_samples_fu_76_OUT_I2_TREADY;
reg    grp_passthrough_samples_fu_76_ap_ce;
wire    grp_passthrough_samples_fu_76_IN_R_TREADY;
wire    grp_passthrough_samples_fu_76_IN_I_TREADY;
wire   [127:0] grp_passthrough_samples_fu_76_OUT_R1_TDATA;
wire    grp_passthrough_samples_fu_76_OUT_R1_TVALID;
wire   [15:0] grp_passthrough_samples_fu_76_OUT_R1_TKEEP;
wire   [15:0] grp_passthrough_samples_fu_76_OUT_R1_TSTRB;
wire   [0:0] grp_passthrough_samples_fu_76_OUT_R1_TLAST;
wire   [127:0] grp_passthrough_samples_fu_76_OUT_I1_TDATA;
wire    grp_passthrough_samples_fu_76_OUT_I1_TVALID;
wire   [15:0] grp_passthrough_samples_fu_76_OUT_I1_TKEEP;
wire   [15:0] grp_passthrough_samples_fu_76_OUT_I1_TSTRB;
wire   [0:0] grp_passthrough_samples_fu_76_OUT_I1_TLAST;
wire   [127:0] grp_passthrough_samples_fu_76_OUT_R2_TDATA;
wire    grp_passthrough_samples_fu_76_OUT_R2_TVALID;
wire   [15:0] grp_passthrough_samples_fu_76_OUT_R2_TKEEP;
wire   [15:0] grp_passthrough_samples_fu_76_OUT_R2_TSTRB;
wire   [0:0] grp_passthrough_samples_fu_76_OUT_R2_TLAST;
wire   [127:0] grp_passthrough_samples_fu_76_OUT_I2_TDATA;
wire    grp_passthrough_samples_fu_76_OUT_I2_TVALID;
wire   [15:0] grp_passthrough_samples_fu_76_OUT_I2_TKEEP;
wire   [15:0] grp_passthrough_samples_fu_76_OUT_I2_TSTRB;
wire   [0:0] grp_passthrough_samples_fu_76_OUT_I2_TLAST;
wire    ap_block_state2_pp0_stage0_iter0_ignore_call2;
wire    ap_block_state3_pp0_stage0_iter1_ignore_call2;
wire    ap_block_state4_pp0_stage0_iter2_ignore_call2;
wire    ap_block_pp0_stage0_11001_ignoreCallOp38;
reg    grp_passthrough_samples_fu_76_ap_start_reg;
reg    ap_block_pp0_stage0_11001;
reg   [1:0] ap_NS_fsm;
reg    ap_idle_pp0;
wire    ap_enable_pp0;
wire    regslice_both_IN_R_V_data_V_U_apdone_blk;
wire   [127:0] IN_R_TDATA_int_regslice;
wire    IN_R_TVALID_int_regslice;
reg    IN_R_TREADY_int_regslice;
wire    regslice_both_IN_R_V_data_V_U_ack_in;
wire    regslice_both_IN_R_V_keep_V_U_apdone_blk;
wire   [15:0] IN_R_TKEEP_int_regslice;
wire    regslice_both_IN_R_V_keep_V_U_vld_out;
wire    regslice_both_IN_R_V_keep_V_U_ack_in;
wire    regslice_both_IN_R_V_strb_V_U_apdone_blk;
wire   [15:0] IN_R_TSTRB_int_regslice;
wire    regslice_both_IN_R_V_strb_V_U_vld_out;
wire    regslice_both_IN_R_V_strb_V_U_ack_in;
wire    regslice_both_IN_R_V_last_V_U_apdone_blk;
wire   [0:0] IN_R_TLAST_int_regslice;
wire    regslice_both_IN_R_V_last_V_U_vld_out;
wire    regslice_both_IN_R_V_last_V_U_ack_in;
wire    regslice_both_IN_I_V_data_V_U_apdone_blk;
wire   [127:0] IN_I_TDATA_int_regslice;
wire    IN_I_TVALID_int_regslice;
reg    IN_I_TREADY_int_regslice;
wire    regslice_both_IN_I_V_data_V_U_ack_in;
wire    regslice_both_IN_I_V_keep_V_U_apdone_blk;
wire   [15:0] IN_I_TKEEP_int_regslice;
wire    regslice_both_IN_I_V_keep_V_U_vld_out;
wire    regslice_both_IN_I_V_keep_V_U_ack_in;
wire    regslice_both_IN_I_V_strb_V_U_apdone_blk;
wire   [15:0] IN_I_TSTRB_int_regslice;
wire    regslice_both_IN_I_V_strb_V_U_vld_out;
wire    regslice_both_IN_I_V_strb_V_U_ack_in;
wire    regslice_both_IN_I_V_last_V_U_apdone_blk;
wire   [0:0] IN_I_TLAST_int_regslice;
wire    regslice_both_IN_I_V_last_V_U_vld_out;
wire    regslice_both_IN_I_V_last_V_U_ack_in;
wire    regslice_both_OUT_R1_V_data_V_U_apdone_blk;
wire    OUT_R1_TREADY_int_regslice;
wire    regslice_both_OUT_R1_V_data_V_U_vld_out;
wire    regslice_both_OUT_R1_V_keep_V_U_apdone_blk;
wire    regslice_both_OUT_R1_V_keep_V_U_ack_in_dummy;
wire    regslice_both_OUT_R1_V_keep_V_U_vld_out;
wire    regslice_both_OUT_R1_V_strb_V_U_apdone_blk;
wire    regslice_both_OUT_R1_V_strb_V_U_ack_in_dummy;
wire    regslice_both_OUT_R1_V_strb_V_U_vld_out;
wire    regslice_both_OUT_R1_V_last_V_U_apdone_blk;
wire    regslice_both_OUT_R1_V_last_V_U_ack_in_dummy;
wire    regslice_both_OUT_R1_V_last_V_U_vld_out;
wire    regslice_both_OUT_I1_V_data_V_U_apdone_blk;
wire    OUT_I1_TREADY_int_regslice;
wire    regslice_both_OUT_I1_V_data_V_U_vld_out;
wire    regslice_both_OUT_I1_V_keep_V_U_apdone_blk;
wire    regslice_both_OUT_I1_V_keep_V_U_ack_in_dummy;
wire    regslice_both_OUT_I1_V_keep_V_U_vld_out;
wire    regslice_both_OUT_I1_V_strb_V_U_apdone_blk;
wire    regslice_both_OUT_I1_V_strb_V_U_ack_in_dummy;
wire    regslice_both_OUT_I1_V_strb_V_U_vld_out;
wire    regslice_both_OUT_I1_V_last_V_U_apdone_blk;
wire    regslice_both_OUT_I1_V_last_V_U_ack_in_dummy;
wire    regslice_both_OUT_I1_V_last_V_U_vld_out;
wire    regslice_both_OUT_R2_V_data_V_U_apdone_blk;
wire    OUT_R2_TREADY_int_regslice;
wire    regslice_both_OUT_R2_V_data_V_U_vld_out;
wire    regslice_both_OUT_R2_V_keep_V_U_apdone_blk;
wire    regslice_both_OUT_R2_V_keep_V_U_ack_in_dummy;
wire    regslice_both_OUT_R2_V_keep_V_U_vld_out;
wire    regslice_both_OUT_R2_V_strb_V_U_apdone_blk;
wire    regslice_both_OUT_R2_V_strb_V_U_ack_in_dummy;
wire    regslice_both_OUT_R2_V_strb_V_U_vld_out;
wire    regslice_both_OUT_R2_V_last_V_U_apdone_blk;
wire    regslice_both_OUT_R2_V_last_V_U_ack_in_dummy;
wire    regslice_both_OUT_R2_V_last_V_U_vld_out;
wire    regslice_both_OUT_I2_V_data_V_U_apdone_blk;
wire    OUT_I2_TREADY_int_regslice;
wire    regslice_both_OUT_I2_V_data_V_U_vld_out;
wire    regslice_both_OUT_I2_V_keep_V_U_apdone_blk;
wire    regslice_both_OUT_I2_V_keep_V_U_ack_in_dummy;
wire    regslice_both_OUT_I2_V_keep_V_U_vld_out;
wire    regslice_both_OUT_I2_V_strb_V_U_apdone_blk;
wire    regslice_both_OUT_I2_V_strb_V_U_ack_in_dummy;
wire    regslice_both_OUT_I2_V_strb_V_U_vld_out;
wire    regslice_both_OUT_I2_V_last_V_U_apdone_blk;
wire    regslice_both_OUT_I2_V_last_V_U_ack_in_dummy;
wire    regslice_both_OUT_I2_V_last_V_U_vld_out;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_CS_fsm = 2'd1;
#0 ap_enable_reg_pp0_iter1 = 1'b0;
#0 ap_enable_reg_pp0_iter0 = 1'b0;
#0 ap_enable_reg_pp0_iter2 = 1'b0;
#0 grp_passthrough_samples_fu_76_ap_start_reg = 1'b0;
end

adcPassThrough_passthrough_samples grp_passthrough_samples_fu_76(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .ap_start(grp_passthrough_samples_fu_76_ap_start),
    .ap_done(grp_passthrough_samples_fu_76_ap_done),
    .ap_idle(grp_passthrough_samples_fu_76_ap_idle),
    .ap_ready(grp_passthrough_samples_fu_76_ap_ready),
    .IN_R_TVALID(IN_R_TVALID_int_regslice),
    .IN_I_TVALID(IN_I_TVALID_int_regslice),
    .OUT_R1_TREADY(grp_passthrough_samples_fu_76_OUT_R1_TREADY),
    .OUT_I1_TREADY(grp_passthrough_samples_fu_76_OUT_I1_TREADY),
    .OUT_R2_TREADY(grp_passthrough_samples_fu_76_OUT_R2_TREADY),
    .OUT_I2_TREADY(grp_passthrough_samples_fu_76_OUT_I2_TREADY),
    .ap_ce(grp_passthrough_samples_fu_76_ap_ce),
    .IN_R_TDATA(IN_R_TDATA_int_regslice),
    .IN_R_TREADY(grp_passthrough_samples_fu_76_IN_R_TREADY),
    .IN_R_TKEEP(IN_R_TKEEP_int_regslice),
    .IN_R_TSTRB(IN_R_TSTRB_int_regslice),
    .IN_R_TLAST(IN_R_TLAST_int_regslice),
    .IN_I_TDATA(IN_I_TDATA_int_regslice),
    .IN_I_TREADY(grp_passthrough_samples_fu_76_IN_I_TREADY),
    .IN_I_TKEEP(IN_I_TKEEP_int_regslice),
    .IN_I_TSTRB(IN_I_TSTRB_int_regslice),
    .IN_I_TLAST(IN_I_TLAST_int_regslice),
    .OUT_R1_TDATA(grp_passthrough_samples_fu_76_OUT_R1_TDATA),
    .OUT_R1_TVALID(grp_passthrough_samples_fu_76_OUT_R1_TVALID),
    .OUT_R1_TKEEP(grp_passthrough_samples_fu_76_OUT_R1_TKEEP),
    .OUT_R1_TSTRB(grp_passthrough_samples_fu_76_OUT_R1_TSTRB),
    .OUT_R1_TLAST(grp_passthrough_samples_fu_76_OUT_R1_TLAST),
    .OUT_I1_TDATA(grp_passthrough_samples_fu_76_OUT_I1_TDATA),
    .OUT_I1_TVALID(grp_passthrough_samples_fu_76_OUT_I1_TVALID),
    .OUT_I1_TKEEP(grp_passthrough_samples_fu_76_OUT_I1_TKEEP),
    .OUT_I1_TSTRB(grp_passthrough_samples_fu_76_OUT_I1_TSTRB),
    .OUT_I1_TLAST(grp_passthrough_samples_fu_76_OUT_I1_TLAST),
    .OUT_R2_TDATA(grp_passthrough_samples_fu_76_OUT_R2_TDATA),
    .OUT_R2_TVALID(grp_passthrough_samples_fu_76_OUT_R2_TVALID),
    .OUT_R2_TKEEP(grp_passthrough_samples_fu_76_OUT_R2_TKEEP),
    .OUT_R2_TSTRB(grp_passthrough_samples_fu_76_OUT_R2_TSTRB),
    .OUT_R2_TLAST(grp_passthrough_samples_fu_76_OUT_R2_TLAST),
    .OUT_I2_TDATA(grp_passthrough_samples_fu_76_OUT_I2_TDATA),
    .OUT_I2_TVALID(grp_passthrough_samples_fu_76_OUT_I2_TVALID),
    .OUT_I2_TKEEP(grp_passthrough_samples_fu_76_OUT_I2_TKEEP),
    .OUT_I2_TSTRB(grp_passthrough_samples_fu_76_OUT_I2_TSTRB),
    .OUT_I2_TLAST(grp_passthrough_samples_fu_76_OUT_I2_TLAST),
    .IN_R_TDATA_blk_n(grp_passthrough_samples_fu_76_IN_R_TDATA_blk_n),
    .IN_I_TDATA_blk_n(grp_passthrough_samples_fu_76_IN_I_TDATA_blk_n),
    .OUT_R1_TDATA_blk_n(grp_passthrough_samples_fu_76_OUT_R1_TDATA_blk_n),
    .OUT_I1_TDATA_blk_n(grp_passthrough_samples_fu_76_OUT_I1_TDATA_blk_n),
    .OUT_R2_TDATA_blk_n(grp_passthrough_samples_fu_76_OUT_R2_TDATA_blk_n),
    .OUT_I2_TDATA_blk_n(grp_passthrough_samples_fu_76_OUT_I2_TDATA_blk_n)
);

adcPassThrough_regslice_both #(
    .DataWidth( 128 ))
regslice_both_IN_R_V_data_V_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .data_in(IN_R_TDATA),
    .vld_in(IN_R_TVALID),
    .ack_in(regslice_both_IN_R_V_data_V_U_ack_in),
    .data_out(IN_R_TDATA_int_regslice),
    .vld_out(IN_R_TVALID_int_regslice),
    .ack_out(IN_R_TREADY_int_regslice),
    .apdone_blk(regslice_both_IN_R_V_data_V_U_apdone_blk)
);

adcPassThrough_regslice_both #(
    .DataWidth( 16 ))
regslice_both_IN_R_V_keep_V_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .data_in(IN_R_TKEEP),
    .vld_in(IN_R_TVALID),
    .ack_in(regslice_both_IN_R_V_keep_V_U_ack_in),
    .data_out(IN_R_TKEEP_int_regslice),
    .vld_out(regslice_both_IN_R_V_keep_V_U_vld_out),
    .ack_out(IN_R_TREADY_int_regslice),
    .apdone_blk(regslice_both_IN_R_V_keep_V_U_apdone_blk)
);

adcPassThrough_regslice_both #(
    .DataWidth( 16 ))
regslice_both_IN_R_V_strb_V_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .data_in(IN_R_TSTRB),
    .vld_in(IN_R_TVALID),
    .ack_in(regslice_both_IN_R_V_strb_V_U_ack_in),
    .data_out(IN_R_TSTRB_int_regslice),
    .vld_out(regslice_both_IN_R_V_strb_V_U_vld_out),
    .ack_out(IN_R_TREADY_int_regslice),
    .apdone_blk(regslice_both_IN_R_V_strb_V_U_apdone_blk)
);

adcPassThrough_regslice_both #(
    .DataWidth( 1 ))
regslice_both_IN_R_V_last_V_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .data_in(IN_R_TLAST),
    .vld_in(IN_R_TVALID),
    .ack_in(regslice_both_IN_R_V_last_V_U_ack_in),
    .data_out(IN_R_TLAST_int_regslice),
    .vld_out(regslice_both_IN_R_V_last_V_U_vld_out),
    .ack_out(IN_R_TREADY_int_regslice),
    .apdone_blk(regslice_both_IN_R_V_last_V_U_apdone_blk)
);

adcPassThrough_regslice_both #(
    .DataWidth( 128 ))
regslice_both_IN_I_V_data_V_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .data_in(IN_I_TDATA),
    .vld_in(IN_I_TVALID),
    .ack_in(regslice_both_IN_I_V_data_V_U_ack_in),
    .data_out(IN_I_TDATA_int_regslice),
    .vld_out(IN_I_TVALID_int_regslice),
    .ack_out(IN_I_TREADY_int_regslice),
    .apdone_blk(regslice_both_IN_I_V_data_V_U_apdone_blk)
);

adcPassThrough_regslice_both #(
    .DataWidth( 16 ))
regslice_both_IN_I_V_keep_V_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .data_in(IN_I_TKEEP),
    .vld_in(IN_I_TVALID),
    .ack_in(regslice_both_IN_I_V_keep_V_U_ack_in),
    .data_out(IN_I_TKEEP_int_regslice),
    .vld_out(regslice_both_IN_I_V_keep_V_U_vld_out),
    .ack_out(IN_I_TREADY_int_regslice),
    .apdone_blk(regslice_both_IN_I_V_keep_V_U_apdone_blk)
);

adcPassThrough_regslice_both #(
    .DataWidth( 16 ))
regslice_both_IN_I_V_strb_V_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .data_in(IN_I_TSTRB),
    .vld_in(IN_I_TVALID),
    .ack_in(regslice_both_IN_I_V_strb_V_U_ack_in),
    .data_out(IN_I_TSTRB_int_regslice),
    .vld_out(regslice_both_IN_I_V_strb_V_U_vld_out),
    .ack_out(IN_I_TREADY_int_regslice),
    .apdone_blk(regslice_both_IN_I_V_strb_V_U_apdone_blk)
);

adcPassThrough_regslice_both #(
    .DataWidth( 1 ))
regslice_both_IN_I_V_last_V_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .data_in(IN_I_TLAST),
    .vld_in(IN_I_TVALID),
    .ack_in(regslice_both_IN_I_V_last_V_U_ack_in),
    .data_out(IN_I_TLAST_int_regslice),
    .vld_out(regslice_both_IN_I_V_last_V_U_vld_out),
    .ack_out(IN_I_TREADY_int_regslice),
    .apdone_blk(regslice_both_IN_I_V_last_V_U_apdone_blk)
);

adcPassThrough_regslice_both #(
    .DataWidth( 128 ))
regslice_both_OUT_R1_V_data_V_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .data_in(grp_passthrough_samples_fu_76_OUT_R1_TDATA),
    .vld_in(grp_passthrough_samples_fu_76_OUT_R1_TVALID),
    .ack_in(OUT_R1_TREADY_int_regslice),
    .data_out(OUT_R1_TDATA),
    .vld_out(regslice_both_OUT_R1_V_data_V_U_vld_out),
    .ack_out(OUT_R1_TREADY),
    .apdone_blk(regslice_both_OUT_R1_V_data_V_U_apdone_blk)
);

adcPassThrough_regslice_both #(
    .DataWidth( 16 ))
regslice_both_OUT_R1_V_keep_V_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .data_in(grp_passthrough_samples_fu_76_OUT_R1_TKEEP),
    .vld_in(grp_passthrough_samples_fu_76_OUT_R1_TVALID),
    .ack_in(regslice_both_OUT_R1_V_keep_V_U_ack_in_dummy),
    .data_out(OUT_R1_TKEEP),
    .vld_out(regslice_both_OUT_R1_V_keep_V_U_vld_out),
    .ack_out(OUT_R1_TREADY),
    .apdone_blk(regslice_both_OUT_R1_V_keep_V_U_apdone_blk)
);

adcPassThrough_regslice_both #(
    .DataWidth( 16 ))
regslice_both_OUT_R1_V_strb_V_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .data_in(grp_passthrough_samples_fu_76_OUT_R1_TSTRB),
    .vld_in(grp_passthrough_samples_fu_76_OUT_R1_TVALID),
    .ack_in(regslice_both_OUT_R1_V_strb_V_U_ack_in_dummy),
    .data_out(OUT_R1_TSTRB),
    .vld_out(regslice_both_OUT_R1_V_strb_V_U_vld_out),
    .ack_out(OUT_R1_TREADY),
    .apdone_blk(regslice_both_OUT_R1_V_strb_V_U_apdone_blk)
);

adcPassThrough_regslice_both #(
    .DataWidth( 1 ))
regslice_both_OUT_R1_V_last_V_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .data_in(grp_passthrough_samples_fu_76_OUT_R1_TLAST),
    .vld_in(grp_passthrough_samples_fu_76_OUT_R1_TVALID),
    .ack_in(regslice_both_OUT_R1_V_last_V_U_ack_in_dummy),
    .data_out(OUT_R1_TLAST),
    .vld_out(regslice_both_OUT_R1_V_last_V_U_vld_out),
    .ack_out(OUT_R1_TREADY),
    .apdone_blk(regslice_both_OUT_R1_V_last_V_U_apdone_blk)
);

adcPassThrough_regslice_both #(
    .DataWidth( 128 ))
regslice_both_OUT_I1_V_data_V_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .data_in(grp_passthrough_samples_fu_76_OUT_I1_TDATA),
    .vld_in(grp_passthrough_samples_fu_76_OUT_I1_TVALID),
    .ack_in(OUT_I1_TREADY_int_regslice),
    .data_out(OUT_I1_TDATA),
    .vld_out(regslice_both_OUT_I1_V_data_V_U_vld_out),
    .ack_out(OUT_I1_TREADY),
    .apdone_blk(regslice_both_OUT_I1_V_data_V_U_apdone_blk)
);

adcPassThrough_regslice_both #(
    .DataWidth( 16 ))
regslice_both_OUT_I1_V_keep_V_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .data_in(grp_passthrough_samples_fu_76_OUT_I1_TKEEP),
    .vld_in(grp_passthrough_samples_fu_76_OUT_I1_TVALID),
    .ack_in(regslice_both_OUT_I1_V_keep_V_U_ack_in_dummy),
    .data_out(OUT_I1_TKEEP),
    .vld_out(regslice_both_OUT_I1_V_keep_V_U_vld_out),
    .ack_out(OUT_I1_TREADY),
    .apdone_blk(regslice_both_OUT_I1_V_keep_V_U_apdone_blk)
);

adcPassThrough_regslice_both #(
    .DataWidth( 16 ))
regslice_both_OUT_I1_V_strb_V_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .data_in(grp_passthrough_samples_fu_76_OUT_I1_TSTRB),
    .vld_in(grp_passthrough_samples_fu_76_OUT_I1_TVALID),
    .ack_in(regslice_both_OUT_I1_V_strb_V_U_ack_in_dummy),
    .data_out(OUT_I1_TSTRB),
    .vld_out(regslice_both_OUT_I1_V_strb_V_U_vld_out),
    .ack_out(OUT_I1_TREADY),
    .apdone_blk(regslice_both_OUT_I1_V_strb_V_U_apdone_blk)
);

adcPassThrough_regslice_both #(
    .DataWidth( 1 ))
regslice_both_OUT_I1_V_last_V_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .data_in(grp_passthrough_samples_fu_76_OUT_I1_TLAST),
    .vld_in(grp_passthrough_samples_fu_76_OUT_I1_TVALID),
    .ack_in(regslice_both_OUT_I1_V_last_V_U_ack_in_dummy),
    .data_out(OUT_I1_TLAST),
    .vld_out(regslice_both_OUT_I1_V_last_V_U_vld_out),
    .ack_out(OUT_I1_TREADY),
    .apdone_blk(regslice_both_OUT_I1_V_last_V_U_apdone_blk)
);

adcPassThrough_regslice_both #(
    .DataWidth( 128 ))
regslice_both_OUT_R2_V_data_V_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .data_in(grp_passthrough_samples_fu_76_OUT_R2_TDATA),
    .vld_in(grp_passthrough_samples_fu_76_OUT_R2_TVALID),
    .ack_in(OUT_R2_TREADY_int_regslice),
    .data_out(OUT_R2_TDATA),
    .vld_out(regslice_both_OUT_R2_V_data_V_U_vld_out),
    .ack_out(OUT_R2_TREADY),
    .apdone_blk(regslice_both_OUT_R2_V_data_V_U_apdone_blk)
);

adcPassThrough_regslice_both #(
    .DataWidth( 16 ))
regslice_both_OUT_R2_V_keep_V_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .data_in(grp_passthrough_samples_fu_76_OUT_R2_TKEEP),
    .vld_in(grp_passthrough_samples_fu_76_OUT_R2_TVALID),
    .ack_in(regslice_both_OUT_R2_V_keep_V_U_ack_in_dummy),
    .data_out(OUT_R2_TKEEP),
    .vld_out(regslice_both_OUT_R2_V_keep_V_U_vld_out),
    .ack_out(OUT_R2_TREADY),
    .apdone_blk(regslice_both_OUT_R2_V_keep_V_U_apdone_blk)
);

adcPassThrough_regslice_both #(
    .DataWidth( 16 ))
regslice_both_OUT_R2_V_strb_V_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .data_in(grp_passthrough_samples_fu_76_OUT_R2_TSTRB),
    .vld_in(grp_passthrough_samples_fu_76_OUT_R2_TVALID),
    .ack_in(regslice_both_OUT_R2_V_strb_V_U_ack_in_dummy),
    .data_out(OUT_R2_TSTRB),
    .vld_out(regslice_both_OUT_R2_V_strb_V_U_vld_out),
    .ack_out(OUT_R2_TREADY),
    .apdone_blk(regslice_both_OUT_R2_V_strb_V_U_apdone_blk)
);

adcPassThrough_regslice_both #(
    .DataWidth( 1 ))
regslice_both_OUT_R2_V_last_V_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .data_in(grp_passthrough_samples_fu_76_OUT_R2_TLAST),
    .vld_in(grp_passthrough_samples_fu_76_OUT_R2_TVALID),
    .ack_in(regslice_both_OUT_R2_V_last_V_U_ack_in_dummy),
    .data_out(OUT_R2_TLAST),
    .vld_out(regslice_both_OUT_R2_V_last_V_U_vld_out),
    .ack_out(OUT_R2_TREADY),
    .apdone_blk(regslice_both_OUT_R2_V_last_V_U_apdone_blk)
);

adcPassThrough_regslice_both #(
    .DataWidth( 128 ))
regslice_both_OUT_I2_V_data_V_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .data_in(grp_passthrough_samples_fu_76_OUT_I2_TDATA),
    .vld_in(grp_passthrough_samples_fu_76_OUT_I2_TVALID),
    .ack_in(OUT_I2_TREADY_int_regslice),
    .data_out(OUT_I2_TDATA),
    .vld_out(regslice_both_OUT_I2_V_data_V_U_vld_out),
    .ack_out(OUT_I2_TREADY),
    .apdone_blk(regslice_both_OUT_I2_V_data_V_U_apdone_blk)
);

adcPassThrough_regslice_both #(
    .DataWidth( 16 ))
regslice_both_OUT_I2_V_keep_V_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .data_in(grp_passthrough_samples_fu_76_OUT_I2_TKEEP),
    .vld_in(grp_passthrough_samples_fu_76_OUT_I2_TVALID),
    .ack_in(regslice_both_OUT_I2_V_keep_V_U_ack_in_dummy),
    .data_out(OUT_I2_TKEEP),
    .vld_out(regslice_both_OUT_I2_V_keep_V_U_vld_out),
    .ack_out(OUT_I2_TREADY),
    .apdone_blk(regslice_both_OUT_I2_V_keep_V_U_apdone_blk)
);

adcPassThrough_regslice_both #(
    .DataWidth( 16 ))
regslice_both_OUT_I2_V_strb_V_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .data_in(grp_passthrough_samples_fu_76_OUT_I2_TSTRB),
    .vld_in(grp_passthrough_samples_fu_76_OUT_I2_TVALID),
    .ack_in(regslice_both_OUT_I2_V_strb_V_U_ack_in_dummy),
    .data_out(OUT_I2_TSTRB),
    .vld_out(regslice_both_OUT_I2_V_strb_V_U_vld_out),
    .ack_out(OUT_I2_TREADY),
    .apdone_blk(regslice_both_OUT_I2_V_strb_V_U_apdone_blk)
);

adcPassThrough_regslice_both #(
    .DataWidth( 1 ))
regslice_both_OUT_I2_V_last_V_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .data_in(grp_passthrough_samples_fu_76_OUT_I2_TLAST),
    .vld_in(grp_passthrough_samples_fu_76_OUT_I2_TVALID),
    .ack_in(regslice_both_OUT_I2_V_last_V_U_ack_in_dummy),
    .data_out(OUT_I2_TLAST),
    .vld_out(regslice_both_OUT_I2_V_last_V_U_vld_out),
    .ack_out(OUT_I2_TREADY),
    .apdone_blk(regslice_both_OUT_I2_V_last_V_U_apdone_blk)
);

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        ap_CS_fsm <= ap_ST_fsm_state1;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        ap_enable_reg_pp0_iter0 <= 1'b0;
    end else begin
        if ((1'b1 == ap_CS_fsm_state1)) begin
            ap_enable_reg_pp0_iter0 <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        ap_enable_reg_pp0_iter1 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter1 <= ap_enable_reg_pp0_iter0;
        end else if ((1'b1 == ap_CS_fsm_state1)) begin
            ap_enable_reg_pp0_iter1 <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        ap_enable_reg_pp0_iter2 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter2 <= ap_enable_reg_pp0_iter1;
        end else if ((1'b1 == ap_CS_fsm_state1)) begin
            ap_enable_reg_pp0_iter2 <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        grp_passthrough_samples_fu_76_ap_start_reg <= 1'b0;
    end else begin
        if (((ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
            grp_passthrough_samples_fu_76_ap_start_reg <= 1'b1;
        end else if ((grp_passthrough_samples_fu_76_ap_ready == 1'b1)) begin
            grp_passthrough_samples_fu_76_ap_start_reg <= 1'b0;
        end
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        IN_I_TDATA_blk_n = grp_passthrough_samples_fu_76_IN_I_TDATA_blk_n;
    end else begin
        IN_I_TDATA_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        IN_I_TREADY_int_regslice = grp_passthrough_samples_fu_76_IN_I_TREADY;
    end else begin
        IN_I_TREADY_int_regslice = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        IN_R_TDATA_blk_n = grp_passthrough_samples_fu_76_IN_R_TDATA_blk_n;
    end else begin
        IN_R_TDATA_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        IN_R_TREADY_int_regslice = grp_passthrough_samples_fu_76_IN_R_TREADY;
    end else begin
        IN_R_TREADY_int_regslice = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        OUT_I1_TDATA_blk_n = grp_passthrough_samples_fu_76_OUT_I1_TDATA_blk_n;
    end else begin
        OUT_I1_TDATA_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        OUT_I2_TDATA_blk_n = grp_passthrough_samples_fu_76_OUT_I2_TDATA_blk_n;
    end else begin
        OUT_I2_TDATA_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        OUT_R1_TDATA_blk_n = grp_passthrough_samples_fu_76_OUT_R1_TDATA_blk_n;
    end else begin
        OUT_R1_TDATA_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        OUT_R2_TDATA_blk_n = grp_passthrough_samples_fu_76_OUT_R2_TDATA_blk_n;
    end else begin
        OUT_R2_TDATA_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter2 == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b0))) begin
        ap_idle_pp0 = 1'b1;
    end else begin
        ap_idle_pp0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001_ignoreCallOp38) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        grp_passthrough_samples_fu_76_ap_ce = 1'b1;
    end else begin
        grp_passthrough_samples_fu_76_ap_ce = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            ap_NS_fsm = ap_ST_fsm_pp0_stage0;
        end
        ap_ST_fsm_pp0_stage0 : begin
            ap_NS_fsm = ap_ST_fsm_pp0_stage0;
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign IN_I_TREADY = regslice_both_IN_I_V_data_V_U_ack_in;

assign IN_R_TREADY = regslice_both_IN_R_V_data_V_U_ack_in;

assign OUT_I1_TVALID = regslice_both_OUT_I1_V_data_V_U_vld_out;

assign OUT_I2_TVALID = regslice_both_OUT_I2_V_data_V_U_vld_out;

assign OUT_R1_TVALID = regslice_both_OUT_R1_V_data_V_U_vld_out;

assign OUT_R2_TVALID = regslice_both_OUT_R2_V_data_V_U_vld_out;

assign ap_CS_fsm_pp0_stage0 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_block_pp0_stage0 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_pp0_stage0_11001 = ((ap_enable_reg_pp0_iter1 == 1'b1) & ((grp_passthrough_samples_fu_76_OUT_I2_TDATA_blk_n == 1'b0) | (grp_passthrough_samples_fu_76_OUT_R2_TDATA_blk_n == 1'b0) | (grp_passthrough_samples_fu_76_OUT_I1_TDATA_blk_n == 1'b0) | (grp_passthrough_samples_fu_76_OUT_R1_TDATA_blk_n == 1'b0) | (grp_passthrough_samples_fu_76_IN_I_TDATA_blk_n == 1'b0) | (grp_passthrough_samples_fu_76_IN_R_TDATA_blk_n == 1'b0)));
end

assign ap_block_pp0_stage0_11001_ignoreCallOp38 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_pp0_stage0_subdone = ((ap_enable_reg_pp0_iter1 == 1'b1) & ((grp_passthrough_samples_fu_76_OUT_I2_TDATA_blk_n == 1'b0) | (grp_passthrough_samples_fu_76_OUT_R2_TDATA_blk_n == 1'b0) | (grp_passthrough_samples_fu_76_OUT_I1_TDATA_blk_n == 1'b0) | (grp_passthrough_samples_fu_76_OUT_R1_TDATA_blk_n == 1'b0) | (grp_passthrough_samples_fu_76_IN_I_TDATA_blk_n == 1'b0) | (grp_passthrough_samples_fu_76_IN_R_TDATA_blk_n == 1'b0)));
end

assign ap_block_state2_pp0_stage0_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state2_pp0_stage0_iter0_ignore_call2 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_state3_pp0_stage0_iter1 = ((grp_passthrough_samples_fu_76_OUT_I2_TDATA_blk_n == 1'b0) | (grp_passthrough_samples_fu_76_OUT_R2_TDATA_blk_n == 1'b0) | (grp_passthrough_samples_fu_76_OUT_I1_TDATA_blk_n == 1'b0) | (grp_passthrough_samples_fu_76_OUT_R1_TDATA_blk_n == 1'b0) | (grp_passthrough_samples_fu_76_IN_I_TDATA_blk_n == 1'b0) | (grp_passthrough_samples_fu_76_IN_R_TDATA_blk_n == 1'b0));
end

assign ap_block_state3_pp0_stage0_iter1_ignore_call2 = ~(1'b1 == 1'b1);

assign ap_block_state4_pp0_stage0_iter2 = ~(1'b1 == 1'b1);

assign ap_block_state4_pp0_stage0_iter2_ignore_call2 = ~(1'b1 == 1'b1);

assign ap_enable_pp0 = (ap_idle_pp0 ^ 1'b1);

always @ (*) begin
    ap_rst_n_inv = ~ap_rst_n;
end

assign grp_passthrough_samples_fu_76_OUT_I1_TREADY = (ap_CS_fsm_pp0_stage0 & OUT_I1_TREADY_int_regslice);

assign grp_passthrough_samples_fu_76_OUT_I2_TREADY = (ap_CS_fsm_pp0_stage0 & OUT_I2_TREADY_int_regslice);

assign grp_passthrough_samples_fu_76_OUT_R1_TREADY = (ap_CS_fsm_pp0_stage0 & OUT_R1_TREADY_int_regslice);

assign grp_passthrough_samples_fu_76_OUT_R2_TREADY = (ap_CS_fsm_pp0_stage0 & OUT_R2_TREADY_int_regslice);

assign grp_passthrough_samples_fu_76_ap_start = grp_passthrough_samples_fu_76_ap_start_reg;

endmodule //adcPassThrough