// ==============================================================
// RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2020.2 (64-bit)
// Version: 2020.2
// Copyright (C) Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module lteCellSearch_write_buffer_fft (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        IN_real_V_address0,
        IN_real_V_ce0,
        IN_real_V_q0,
        IN_imag_V_address0,
        IN_imag_V_ce0,
        IN_imag_V_q0,
        OUT_FFT_TDATA,
        OUT_FFT_TVALID,
        OUT_FFT_TREADY,
        OUT_FFT_TKEEP,
        OUT_FFT_TSTRB,
        OUT_FFT_TLAST,
        index,
        pss_id,
        pss_id_TDATA,
        pss_id_TVALID,
        pss_id_TREADY,
        pss_id_TKEEP,
        pss_id_TSTRB,
        pss_id_TLAST
);

parameter    ap_ST_fsm_state1 = 5'd1;
parameter    ap_ST_fsm_pp0_stage0 = 5'd2;
parameter    ap_ST_fsm_state4 = 5'd4;
parameter    ap_ST_fsm_state5 = 5'd8;
parameter    ap_ST_fsm_state6 = 5'd16;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
output  [16:0] IN_real_V_address0;
output   IN_real_V_ce0;
input  [22:0] IN_real_V_q0;
output  [16:0] IN_imag_V_address0;
output   IN_imag_V_ce0;
input  [22:0] IN_imag_V_q0;
output  [63:0] OUT_FFT_TDATA;
output   OUT_FFT_TVALID;
input   OUT_FFT_TREADY;
output  [7:0] OUT_FFT_TKEEP;
output  [7:0] OUT_FFT_TSTRB;
output  [0:0] OUT_FFT_TLAST;
input  [16:0] index;
input  [1:0] pss_id;
output  [31:0] pss_id_TDATA;
output   pss_id_TVALID;
input   pss_id_TREADY;
output  [3:0] pss_id_TKEEP;
output  [3:0] pss_id_TSTRB;
output  [0:0] pss_id_TLAST;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg[16:0] IN_real_V_address0;
reg IN_real_V_ce0;
reg IN_imag_V_ce0;
reg[63:0] OUT_FFT_TDATA;
reg OUT_FFT_TVALID;
reg[0:0] OUT_FFT_TLAST;
reg pss_id_TVALID;

(* fsm_encoding = "none" *) reg   [4:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
reg    OUT_FFT_TDATA_blk_n;
wire    ap_CS_fsm_pp0_stage0;
reg    ap_enable_reg_pp0_iter1;
wire    ap_block_pp0_stage0;
reg   [0:0] icmp_ln216_reg_1225;
wire    ap_CS_fsm_state5;
reg    pss_id_TDATA_blk_n;
reg   [63:0] i_reg_213;
wire   [31:0] tmp_i_data_0_fu_238_p1;
reg   [31:0] tmp_i_data_0_reg_1210;
wire  signed [31:0] sext_ln216_1_fu_252_p1;
reg  signed [31:0] sext_ln216_1_reg_1215;
wire  signed [63:0] sext_ln216_fu_262_p1;
wire   [0:0] icmp_ln216_fu_270_p2;
wire    ap_block_state2_pp0_stage0_iter0;
reg    ap_block_state3_pp0_stage0_iter1;
reg    ap_block_state3_io;
reg    ap_block_pp0_stage0_11001;
wire   [63:0] add_ln216_1_fu_275_p2;
reg    ap_enable_reg_pp0_iter0;
wire    ap_CS_fsm_state4;
reg    ap_block_pp0_stage0_subdone;
reg    ap_condition_pp0_exit_iter0_state2;
wire   [63:0] zext_ln225_fu_897_p1;
wire   [63:0] or_ln303_1_fu_883_p3;
reg    ap_block_pp0_stage0_01001;
wire   [63:0] tmp_i4_data_fu_1196_p3;
reg    ap_block_state5;
reg    ap_block_state5_io;
wire  signed [22:0] grp_fu_224_p0;
wire  signed [22:0] grp_fu_230_p1;
wire   [17:0] index_cast2_fu_242_p1;
wire   [17:0] sub3_fu_246_p2;
wire   [17:0] add_ln216_fu_256_p2;
wire   [31:0] trunc_ln216_fu_266_p1;
wire  signed [22:0] p_Val2_cast_fu_281_p0;
wire  signed [23:0] p_Val2_cast_fu_281_p1;
wire   [0:0] grp_fu_230_p3;
wire   [23:0] tmp_V_fu_285_p2;
wire   [23:0] m_16_fu_291_p3;
wire  signed [31:0] sext_ln937_fu_299_p1;
reg   [31:0] p_Result_13_fu_303_p4;
reg   [31:0] l_fu_313_p3;
wire   [31:0] sub_ln944_fu_321_p2;
wire   [31:0] lsb_index_fu_327_p2;
wire   [30:0] tmp_4_fu_333_p4;
wire   [5:0] trunc_ln947_fu_349_p1;
wire   [5:0] sub_ln947_fu_353_p2;
wire   [31:0] zext_ln947_fu_359_p1;
wire   [31:0] lshr_ln947_fu_363_p2;
wire   [31:0] shl_ln949_fu_369_p2;
wire   [31:0] or_ln949_3_fu_375_p2;
wire   [31:0] and_ln949_fu_381_p2;
wire   [0:0] tmp_5_fu_393_p3;
wire   [0:0] p_Result_14_fu_407_p3;
wire   [0:0] xor_ln949_fu_401_p2;
wire   [31:0] sub_ln959_fu_431_p2;
wire   [63:0] zext_ln959_2_fu_427_p1;
wire   [63:0] zext_ln959_fu_437_p1;
wire   [0:0] icmp_ln946_fu_343_p2;
wire   [0:0] icmp_ln949_fu_387_p2;
wire   [31:0] add_ln958_fu_455_p2;
wire   [63:0] zext_ln958_fu_461_p1;
wire   [0:0] icmp_ln958_fu_415_p2;
wire   [0:0] select_ln946_fu_447_p3;
wire   [0:0] and_ln949_1_fu_421_p2;
wire   [63:0] lshr_ln958_fu_465_p2;
wire   [63:0] shl_ln959_fu_441_p2;
wire   [0:0] select_ln958_fu_471_p3;
wire   [63:0] m_fu_479_p3;
wire   [63:0] zext_ln961_fu_487_p1;
wire   [63:0] m_5_fu_491_p2;
wire   [62:0] m_17_fu_497_p4;
wire   [0:0] p_Result_s_fu_511_p3;
wire   [7:0] trunc_ln943_fu_527_p1;
wire   [7:0] sub_ln964_fu_531_p2;
wire   [7:0] select_ln943_fu_519_p3;
wire   [7:0] add_ln964_fu_537_p2;
wire   [63:0] zext_ln962_fu_507_p1;
wire   [8:0] tmp_fu_543_p3;
wire   [63:0] p_Result_15_fu_551_p5;
wire   [0:0] grp_fu_224_p2;
wire   [31:0] LD_fu_563_p1;
wire  signed [22:0] p_Val2_7_cast_fu_575_p0;
wire  signed [22:0] icmp_ln935_2_fu_579_p0;
wire  signed [22:0] p_Result_16_fu_585_p1;
wire  signed [23:0] p_Val2_7_cast_fu_575_p1;
wire   [0:0] p_Result_16_fu_585_p3;
wire   [23:0] tmp_V_2_fu_593_p2;
wire   [23:0] m_18_fu_599_p3;
wire  signed [31:0] sext_ln937_2_fu_607_p1;
reg   [31:0] p_Result_17_fu_611_p4;
reg   [31:0] l_2_fu_621_p3;
wire   [31:0] sub_ln944_2_fu_629_p2;
wire   [31:0] lsb_index_1_fu_635_p2;
wire   [30:0] tmp_8_fu_641_p4;
wire   [5:0] trunc_ln947_1_fu_657_p1;
wire   [5:0] sub_ln947_1_fu_661_p2;
wire   [31:0] zext_ln947_1_fu_667_p1;
wire   [31:0] lshr_ln947_1_fu_671_p2;
wire   [31:0] shl_ln949_2_fu_677_p2;
wire   [31:0] or_ln949_fu_683_p2;
wire   [31:0] and_ln949_2_fu_689_p2;
wire   [0:0] tmp_9_fu_701_p3;
wire   [0:0] p_Result_18_fu_715_p3;
wire   [0:0] xor_ln949_1_fu_709_p2;
wire   [31:0] sub_ln959_2_fu_739_p2;
wire   [63:0] zext_ln959_4_fu_735_p1;
wire   [63:0] zext_ln959_3_fu_745_p1;
wire   [0:0] icmp_ln946_1_fu_651_p2;
wire   [0:0] icmp_ln949_1_fu_695_p2;
wire   [31:0] add_ln958_2_fu_763_p2;
wire   [63:0] zext_ln958_2_fu_769_p1;
wire   [0:0] icmp_ln958_2_fu_723_p2;
wire   [0:0] select_ln946_1_fu_755_p3;
wire   [0:0] and_ln949_3_fu_729_p2;
wire   [63:0] lshr_ln958_2_fu_773_p2;
wire   [63:0] shl_ln959_2_fu_749_p2;
wire   [0:0] select_ln958_2_fu_779_p3;
wire   [63:0] m_9_fu_787_p3;
wire   [63:0] zext_ln961_2_fu_795_p1;
wire   [63:0] m_10_fu_799_p2;
wire   [62:0] m_19_fu_805_p4;
wire   [0:0] p_Result_5_fu_819_p3;
wire   [7:0] trunc_ln943_1_fu_835_p1;
wire   [7:0] sub_ln964_1_fu_839_p2;
wire   [7:0] select_ln943_1_fu_827_p3;
wire   [7:0] add_ln964_1_fu_845_p2;
wire   [63:0] zext_ln962_1_fu_815_p1;
wire   [8:0] tmp_3_fu_851_p3;
wire   [63:0] p_Result_19_fu_859_p5;
wire   [0:0] icmp_ln935_2_fu_579_p2;
wire   [31:0] LD_1_fu_871_p1;
wire   [31:0] select_ln935_1_fu_875_p3;
wire   [31:0] select_ln935_fu_567_p3;
wire   [16:0] add_ln225_fu_892_p2;
wire  signed [22:0] p_Val2_2_cast_fu_902_p0;
wire  signed [23:0] p_Val2_2_cast_fu_902_p1;
wire   [23:0] tmp_V_4_fu_906_p2;
wire   [23:0] m_20_fu_912_p3;
wire  signed [31:0] sext_ln937_1_fu_920_p1;
reg   [31:0] p_Result_21_fu_924_p4;
reg   [31:0] l_1_fu_934_p3;
wire   [7:0] trunc_ln943_2_fu_942_p1;
wire   [31:0] sub_ln944_1_fu_952_p2;
wire   [31:0] lsb_index_2_fu_958_p2;
wire   [30:0] tmp_12_fu_964_p4;
wire   [5:0] trunc_ln947_2_fu_980_p1;
wire   [5:0] sub_ln947_2_fu_984_p2;
wire   [31:0] zext_ln947_2_fu_990_p1;
wire   [31:0] lshr_ln947_2_fu_994_p2;
wire   [31:0] shl_ln949_1_fu_1000_p2;
wire   [31:0] or_ln949_4_fu_1006_p2;
wire   [31:0] and_ln949_4_fu_1012_p2;
wire   [0:0] tmp_13_fu_1024_p3;
wire   [0:0] p_Result_22_fu_1038_p3;
wire   [0:0] xor_ln949_2_fu_1032_p2;
wire   [31:0] sub_ln959_1_fu_1062_p2;
wire   [63:0] zext_ln959_5_fu_1058_p1;
wire   [63:0] zext_ln959_1_fu_1068_p1;
wire   [0:0] icmp_ln946_2_fu_974_p2;
wire   [0:0] icmp_ln949_2_fu_1018_p2;
wire   [31:0] add_ln958_1_fu_1086_p2;
wire   [63:0] zext_ln958_1_fu_1092_p1;
wire   [0:0] icmp_ln958_1_fu_1046_p2;
wire   [0:0] select_ln946_2_fu_1078_p3;
wire   [0:0] and_ln949_5_fu_1052_p2;
wire   [63:0] lshr_ln958_1_fu_1096_p2;
wire   [63:0] shl_ln959_1_fu_1072_p2;
wire   [0:0] select_ln958_4_fu_1102_p3;
wire   [63:0] m_13_fu_1110_p3;
wire   [63:0] zext_ln961_1_fu_1118_p1;
wire   [63:0] m_14_fu_1122_p2;
wire   [62:0] m_21_fu_1128_p4;
wire   [0:0] p_Result_10_fu_1142_p3;
wire   [7:0] sub_ln943_fu_946_p2;
wire   [7:0] select_ln964_fu_1150_p3;
wire   [7:0] add_ln964_2_fu_1158_p2;
wire   [63:0] zext_ln962_2_fu_1138_p1;
wire   [8:0] tmp_1_fu_1164_p3;
wire   [63:0] p_Result_23_fu_1172_p5;
wire   [31:0] LD_2_fu_1184_p1;
wire   [31:0] select_ln935_2_fu_1188_p3;
wire    ap_CS_fsm_state6;
reg   [4:0] ap_NS_fsm;
reg    ap_idle_pp0;
wire    ap_enable_pp0;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_CS_fsm = 5'd1;
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
        if (((1'b0 == ap_block_pp0_stage0_subdone) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b1 == ap_condition_pp0_exit_iter0_state2))) begin
            ap_enable_reg_pp0_iter0 <= 1'b0;
        end else if (((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1))) begin
            ap_enable_reg_pp0_iter0 <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter1 <= 1'b0;
    end else begin
        if (((1'b0 == ap_block_pp0_stage0_subdone) & (1'b1 == ap_condition_pp0_exit_iter0_state2))) begin
            ap_enable_reg_pp0_iter1 <= (1'b1 ^ ap_condition_pp0_exit_iter0_state2);
        end else if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter1 <= ap_enable_reg_pp0_iter0;
        end else if (((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1))) begin
            ap_enable_reg_pp0_iter1 <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln216_fu_270_p2 == 1'd1) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter0 == 1'b1))) begin
        i_reg_213 <= add_ln216_1_fu_275_p2;
    end else if (((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1))) begin
        i_reg_213 <= sext_ln216_fu_262_p1;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        icmp_ln216_reg_1225 <= icmp_ln216_fu_270_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state1)) begin
        sext_ln216_1_reg_1215 <= sext_ln216_1_fu_252_p1;
        tmp_i_data_0_reg_1210[1 : 0] <= tmp_i_data_0_fu_238_p1[1 : 0];
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter0 == 1'b1))) begin
        IN_imag_V_ce0 = 1'b1;
    end else begin
        IN_imag_V_ce0 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state4)) begin
        IN_real_V_address0 = zext_ln225_fu_897_p1;
    end else if (((1'b0 == ap_block_pp0_stage0) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter0 == 1'b1))) begin
        IN_real_V_address0 = i_reg_213;
    end else begin
        IN_real_V_address0 = 'bx;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state4) | ((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter0 == 1'b1)))) begin
        IN_real_V_ce0 = 1'b1;
    end else begin
        IN_real_V_ce0 = 1'b0;
    end
end

always @ (*) begin
    if ((~((pss_id_TREADY == 1'b0) | (1'b0 == OUT_FFT_TREADY)) & (1'b1 == ap_CS_fsm_state5))) begin
        OUT_FFT_TDATA = tmp_i4_data_fu_1196_p3;
    end else if (((icmp_ln216_reg_1225 == 1'd1) & (1'b0 == ap_block_pp0_stage0_01001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        OUT_FFT_TDATA = or_ln303_1_fu_883_p3;
    end else begin
        OUT_FFT_TDATA = 'bx;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state5) | ((icmp_ln216_reg_1225 == 1'd1) & (1'b0 == ap_block_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0)))) begin
        OUT_FFT_TDATA_blk_n = OUT_FFT_TREADY;
    end else begin
        OUT_FFT_TDATA_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((~((pss_id_TREADY == 1'b0) | (1'b0 == OUT_FFT_TREADY)) & (1'b1 == ap_CS_fsm_state5))) begin
        OUT_FFT_TLAST = 1'd1;
    end else if (((icmp_ln216_reg_1225 == 1'd1) & (1'b0 == ap_block_pp0_stage0_01001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        OUT_FFT_TLAST = 1'd0;
    end else begin
        OUT_FFT_TLAST = 'bx;
    end
end

always @ (*) begin
    if ((((icmp_ln216_reg_1225 == 1'd1) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0)) | (~((pss_id_TREADY == 1'b0) | (1'b0 == OUT_FFT_TREADY) | (1'b1 == ap_block_state5_io)) & (1'b1 == ap_CS_fsm_state5)))) begin
        OUT_FFT_TVALID = 1'b1;
    end else begin
        OUT_FFT_TVALID = 1'b0;
    end
end

always @ (*) begin
    if ((icmp_ln216_fu_270_p2 == 1'd0)) begin
        ap_condition_pp0_exit_iter0_state2 = 1'b1;
    end else begin
        ap_condition_pp0_exit_iter0_state2 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state6) | ((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b0)))) begin
        ap_done = 1'b1;
    end else begin
        ap_done = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b0))) begin
        ap_idle = 1'b1;
    end else begin
        ap_idle = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b0))) begin
        ap_idle_pp0 = 1'b1;
    end else begin
        ap_idle_pp0 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state6)) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state5)) begin
        pss_id_TDATA_blk_n = pss_id_TREADY;
    end else begin
        pss_id_TDATA_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((~((pss_id_TREADY == 1'b0) | (1'b0 == OUT_FFT_TREADY) | (1'b1 == ap_block_state5_io)) & (1'b1 == ap_CS_fsm_state5))) begin
        pss_id_TVALID = 1'b1;
    end else begin
        pss_id_TVALID = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            if (((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1))) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end
        end
        ap_ST_fsm_pp0_stage0 : begin
            if (~((icmp_ln216_fu_270_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter0 == 1'b1))) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end else if (((icmp_ln216_fu_270_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter0 == 1'b1))) begin
                ap_NS_fsm = ap_ST_fsm_state4;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end
        end
        ap_ST_fsm_state4 : begin
            ap_NS_fsm = ap_ST_fsm_state5;
        end
        ap_ST_fsm_state5 : begin
            if ((~((pss_id_TREADY == 1'b0) | (1'b0 == OUT_FFT_TREADY) | (1'b1 == ap_block_state5_io)) & (1'b1 == ap_CS_fsm_state5))) begin
                ap_NS_fsm = ap_ST_fsm_state6;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state5;
            end
        end
        ap_ST_fsm_state6 : begin
            ap_NS_fsm = ap_ST_fsm_state1;
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign IN_imag_V_address0 = i_reg_213;

assign LD_1_fu_871_p1 = p_Result_19_fu_859_p5[31:0];

assign LD_2_fu_1184_p1 = p_Result_23_fu_1172_p5[31:0];

assign LD_fu_563_p1 = p_Result_15_fu_551_p5[31:0];

assign OUT_FFT_TKEEP = 8'd255;

assign OUT_FFT_TSTRB = 8'd1;

assign add_ln216_1_fu_275_p2 = (i_reg_213 + 64'd1);

assign add_ln216_fu_256_p2 = ($signed(index_cast2_fu_242_p1) + $signed(18'd261880));

assign add_ln225_fu_892_p2 = ($signed(index) + $signed(17'd130935));

assign add_ln958_1_fu_1086_p2 = ($signed(sub_ln944_1_fu_952_p2) + $signed(32'd4294967271));

assign add_ln958_2_fu_763_p2 = ($signed(sub_ln944_2_fu_629_p2) + $signed(32'd4294967271));

assign add_ln958_fu_455_p2 = ($signed(sub_ln944_fu_321_p2) + $signed(32'd4294967271));

assign add_ln964_1_fu_845_p2 = (sub_ln964_1_fu_839_p2 + select_ln943_1_fu_827_p3);

assign add_ln964_2_fu_1158_p2 = (sub_ln943_fu_946_p2 + select_ln964_fu_1150_p3);

assign add_ln964_fu_537_p2 = (sub_ln964_fu_531_p2 + select_ln943_fu_519_p3);

assign and_ln949_1_fu_421_p2 = (xor_ln949_fu_401_p2 & p_Result_14_fu_407_p3);

assign and_ln949_2_fu_689_p2 = (sext_ln937_2_fu_607_p1 & or_ln949_fu_683_p2);

assign and_ln949_3_fu_729_p2 = (xor_ln949_1_fu_709_p2 & p_Result_18_fu_715_p3);

assign and_ln949_4_fu_1012_p2 = (sext_ln937_1_fu_920_p1 & or_ln949_4_fu_1006_p2);

assign and_ln949_5_fu_1052_p2 = (xor_ln949_2_fu_1032_p2 & p_Result_22_fu_1038_p3);

assign and_ln949_fu_381_p2 = (sext_ln937_fu_299_p1 & or_ln949_3_fu_375_p2);

assign ap_CS_fsm_pp0_stage0 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state4 = ap_CS_fsm[32'd2];

assign ap_CS_fsm_state5 = ap_CS_fsm[32'd3];

assign ap_CS_fsm_state6 = ap_CS_fsm[32'd4];

assign ap_block_pp0_stage0 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_pp0_stage0_01001 = ((icmp_ln216_reg_1225 == 1'd1) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b0 == OUT_FFT_TREADY));
end

always @ (*) begin
    ap_block_pp0_stage0_11001 = ((ap_enable_reg_pp0_iter1 == 1'b1) & ((1'b1 == ap_block_state3_io) | ((icmp_ln216_reg_1225 == 1'd1) & (1'b0 == OUT_FFT_TREADY))));
end

always @ (*) begin
    ap_block_pp0_stage0_subdone = ((ap_enable_reg_pp0_iter1 == 1'b1) & ((1'b1 == ap_block_state3_io) | ((icmp_ln216_reg_1225 == 1'd1) & (1'b0 == OUT_FFT_TREADY))));
end

assign ap_block_state2_pp0_stage0_iter0 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_state3_io = ((icmp_ln216_reg_1225 == 1'd1) & (1'b0 == OUT_FFT_TREADY));
end

always @ (*) begin
    ap_block_state3_pp0_stage0_iter1 = ((icmp_ln216_reg_1225 == 1'd1) & (1'b0 == OUT_FFT_TREADY));
end

always @ (*) begin
    ap_block_state5 = ((pss_id_TREADY == 1'b0) | (1'b0 == OUT_FFT_TREADY));
end

always @ (*) begin
    ap_block_state5_io = ((pss_id_TREADY == 1'b0) | (1'b0 == OUT_FFT_TREADY));
end

assign ap_enable_pp0 = (ap_idle_pp0 ^ 1'b1);

assign grp_fu_224_p0 = IN_real_V_q0;

assign grp_fu_224_p2 = ((grp_fu_224_p0 == 23'd0) ? 1'b1 : 1'b0);

assign grp_fu_230_p1 = IN_real_V_q0;

assign grp_fu_230_p3 = grp_fu_230_p1[32'd22];

assign icmp_ln216_fu_270_p2 = (($signed(trunc_ln216_fu_266_p1) < $signed(sext_ln216_1_reg_1215)) ? 1'b1 : 1'b0);

assign icmp_ln935_2_fu_579_p0 = IN_imag_V_q0;

assign icmp_ln935_2_fu_579_p2 = ((icmp_ln935_2_fu_579_p0 == 23'd0) ? 1'b1 : 1'b0);

assign icmp_ln946_1_fu_651_p2 = (($signed(tmp_8_fu_641_p4) > $signed(31'd0)) ? 1'b1 : 1'b0);

assign icmp_ln946_2_fu_974_p2 = (($signed(tmp_12_fu_964_p4) > $signed(31'd0)) ? 1'b1 : 1'b0);

assign icmp_ln946_fu_343_p2 = (($signed(tmp_4_fu_333_p4) > $signed(31'd0)) ? 1'b1 : 1'b0);

assign icmp_ln949_1_fu_695_p2 = ((and_ln949_2_fu_689_p2 != 32'd0) ? 1'b1 : 1'b0);

assign icmp_ln949_2_fu_1018_p2 = ((and_ln949_4_fu_1012_p2 != 32'd0) ? 1'b1 : 1'b0);

assign icmp_ln949_fu_387_p2 = ((and_ln949_fu_381_p2 != 32'd0) ? 1'b1 : 1'b0);

assign icmp_ln958_1_fu_1046_p2 = (($signed(lsb_index_2_fu_958_p2) > $signed(32'd0)) ? 1'b1 : 1'b0);

assign icmp_ln958_2_fu_723_p2 = (($signed(lsb_index_1_fu_635_p2) > $signed(32'd0)) ? 1'b1 : 1'b0);

assign icmp_ln958_fu_415_p2 = (($signed(lsb_index_fu_327_p2) > $signed(32'd0)) ? 1'b1 : 1'b0);

assign index_cast2_fu_242_p1 = index;


always @ (p_Result_21_fu_924_p4) begin
    if (p_Result_21_fu_924_p4[0] == 1'b1) begin
        l_1_fu_934_p3 = 32'd0;
    end else if (p_Result_21_fu_924_p4[1] == 1'b1) begin
        l_1_fu_934_p3 = 32'd1;
    end else if (p_Result_21_fu_924_p4[2] == 1'b1) begin
        l_1_fu_934_p3 = 32'd2;
    end else if (p_Result_21_fu_924_p4[3] == 1'b1) begin
        l_1_fu_934_p3 = 32'd3;
    end else if (p_Result_21_fu_924_p4[4] == 1'b1) begin
        l_1_fu_934_p3 = 32'd4;
    end else if (p_Result_21_fu_924_p4[5] == 1'b1) begin
        l_1_fu_934_p3 = 32'd5;
    end else if (p_Result_21_fu_924_p4[6] == 1'b1) begin
        l_1_fu_934_p3 = 32'd6;
    end else if (p_Result_21_fu_924_p4[7] == 1'b1) begin
        l_1_fu_934_p3 = 32'd7;
    end else if (p_Result_21_fu_924_p4[8] == 1'b1) begin
        l_1_fu_934_p3 = 32'd8;
    end else if (p_Result_21_fu_924_p4[9] == 1'b1) begin
        l_1_fu_934_p3 = 32'd9;
    end else if (p_Result_21_fu_924_p4[10] == 1'b1) begin
        l_1_fu_934_p3 = 32'd10;
    end else if (p_Result_21_fu_924_p4[11] == 1'b1) begin
        l_1_fu_934_p3 = 32'd11;
    end else if (p_Result_21_fu_924_p4[12] == 1'b1) begin
        l_1_fu_934_p3 = 32'd12;
    end else if (p_Result_21_fu_924_p4[13] == 1'b1) begin
        l_1_fu_934_p3 = 32'd13;
    end else if (p_Result_21_fu_924_p4[14] == 1'b1) begin
        l_1_fu_934_p3 = 32'd14;
    end else if (p_Result_21_fu_924_p4[15] == 1'b1) begin
        l_1_fu_934_p3 = 32'd15;
    end else if (p_Result_21_fu_924_p4[16] == 1'b1) begin
        l_1_fu_934_p3 = 32'd16;
    end else if (p_Result_21_fu_924_p4[17] == 1'b1) begin
        l_1_fu_934_p3 = 32'd17;
    end else if (p_Result_21_fu_924_p4[18] == 1'b1) begin
        l_1_fu_934_p3 = 32'd18;
    end else if (p_Result_21_fu_924_p4[19] == 1'b1) begin
        l_1_fu_934_p3 = 32'd19;
    end else if (p_Result_21_fu_924_p4[20] == 1'b1) begin
        l_1_fu_934_p3 = 32'd20;
    end else if (p_Result_21_fu_924_p4[21] == 1'b1) begin
        l_1_fu_934_p3 = 32'd21;
    end else if (p_Result_21_fu_924_p4[22] == 1'b1) begin
        l_1_fu_934_p3 = 32'd22;
    end else if (p_Result_21_fu_924_p4[23] == 1'b1) begin
        l_1_fu_934_p3 = 32'd23;
    end else if (p_Result_21_fu_924_p4[24] == 1'b1) begin
        l_1_fu_934_p3 = 32'd24;
    end else if (p_Result_21_fu_924_p4[25] == 1'b1) begin
        l_1_fu_934_p3 = 32'd25;
    end else if (p_Result_21_fu_924_p4[26] == 1'b1) begin
        l_1_fu_934_p3 = 32'd26;
    end else if (p_Result_21_fu_924_p4[27] == 1'b1) begin
        l_1_fu_934_p3 = 32'd27;
    end else if (p_Result_21_fu_924_p4[28] == 1'b1) begin
        l_1_fu_934_p3 = 32'd28;
    end else if (p_Result_21_fu_924_p4[29] == 1'b1) begin
        l_1_fu_934_p3 = 32'd29;
    end else if (p_Result_21_fu_924_p4[30] == 1'b1) begin
        l_1_fu_934_p3 = 32'd30;
    end else if (p_Result_21_fu_924_p4[31] == 1'b1) begin
        l_1_fu_934_p3 = 32'd31;
    end else begin
        l_1_fu_934_p3 = 32'd32;
    end
end


always @ (p_Result_17_fu_611_p4) begin
    if (p_Result_17_fu_611_p4[0] == 1'b1) begin
        l_2_fu_621_p3 = 32'd0;
    end else if (p_Result_17_fu_611_p4[1] == 1'b1) begin
        l_2_fu_621_p3 = 32'd1;
    end else if (p_Result_17_fu_611_p4[2] == 1'b1) begin
        l_2_fu_621_p3 = 32'd2;
    end else if (p_Result_17_fu_611_p4[3] == 1'b1) begin
        l_2_fu_621_p3 = 32'd3;
    end else if (p_Result_17_fu_611_p4[4] == 1'b1) begin
        l_2_fu_621_p3 = 32'd4;
    end else if (p_Result_17_fu_611_p4[5] == 1'b1) begin
        l_2_fu_621_p3 = 32'd5;
    end else if (p_Result_17_fu_611_p4[6] == 1'b1) begin
        l_2_fu_621_p3 = 32'd6;
    end else if (p_Result_17_fu_611_p4[7] == 1'b1) begin
        l_2_fu_621_p3 = 32'd7;
    end else if (p_Result_17_fu_611_p4[8] == 1'b1) begin
        l_2_fu_621_p3 = 32'd8;
    end else if (p_Result_17_fu_611_p4[9] == 1'b1) begin
        l_2_fu_621_p3 = 32'd9;
    end else if (p_Result_17_fu_611_p4[10] == 1'b1) begin
        l_2_fu_621_p3 = 32'd10;
    end else if (p_Result_17_fu_611_p4[11] == 1'b1) begin
        l_2_fu_621_p3 = 32'd11;
    end else if (p_Result_17_fu_611_p4[12] == 1'b1) begin
        l_2_fu_621_p3 = 32'd12;
    end else if (p_Result_17_fu_611_p4[13] == 1'b1) begin
        l_2_fu_621_p3 = 32'd13;
    end else if (p_Result_17_fu_611_p4[14] == 1'b1) begin
        l_2_fu_621_p3 = 32'd14;
    end else if (p_Result_17_fu_611_p4[15] == 1'b1) begin
        l_2_fu_621_p3 = 32'd15;
    end else if (p_Result_17_fu_611_p4[16] == 1'b1) begin
        l_2_fu_621_p3 = 32'd16;
    end else if (p_Result_17_fu_611_p4[17] == 1'b1) begin
        l_2_fu_621_p3 = 32'd17;
    end else if (p_Result_17_fu_611_p4[18] == 1'b1) begin
        l_2_fu_621_p3 = 32'd18;
    end else if (p_Result_17_fu_611_p4[19] == 1'b1) begin
        l_2_fu_621_p3 = 32'd19;
    end else if (p_Result_17_fu_611_p4[20] == 1'b1) begin
        l_2_fu_621_p3 = 32'd20;
    end else if (p_Result_17_fu_611_p4[21] == 1'b1) begin
        l_2_fu_621_p3 = 32'd21;
    end else if (p_Result_17_fu_611_p4[22] == 1'b1) begin
        l_2_fu_621_p3 = 32'd22;
    end else if (p_Result_17_fu_611_p4[23] == 1'b1) begin
        l_2_fu_621_p3 = 32'd23;
    end else if (p_Result_17_fu_611_p4[24] == 1'b1) begin
        l_2_fu_621_p3 = 32'd24;
    end else if (p_Result_17_fu_611_p4[25] == 1'b1) begin
        l_2_fu_621_p3 = 32'd25;
    end else if (p_Result_17_fu_611_p4[26] == 1'b1) begin
        l_2_fu_621_p3 = 32'd26;
    end else if (p_Result_17_fu_611_p4[27] == 1'b1) begin
        l_2_fu_621_p3 = 32'd27;
    end else if (p_Result_17_fu_611_p4[28] == 1'b1) begin
        l_2_fu_621_p3 = 32'd28;
    end else if (p_Result_17_fu_611_p4[29] == 1'b1) begin
        l_2_fu_621_p3 = 32'd29;
    end else if (p_Result_17_fu_611_p4[30] == 1'b1) begin
        l_2_fu_621_p3 = 32'd30;
    end else if (p_Result_17_fu_611_p4[31] == 1'b1) begin
        l_2_fu_621_p3 = 32'd31;
    end else begin
        l_2_fu_621_p3 = 32'd32;
    end
end


always @ (p_Result_13_fu_303_p4) begin
    if (p_Result_13_fu_303_p4[0] == 1'b1) begin
        l_fu_313_p3 = 32'd0;
    end else if (p_Result_13_fu_303_p4[1] == 1'b1) begin
        l_fu_313_p3 = 32'd1;
    end else if (p_Result_13_fu_303_p4[2] == 1'b1) begin
        l_fu_313_p3 = 32'd2;
    end else if (p_Result_13_fu_303_p4[3] == 1'b1) begin
        l_fu_313_p3 = 32'd3;
    end else if (p_Result_13_fu_303_p4[4] == 1'b1) begin
        l_fu_313_p3 = 32'd4;
    end else if (p_Result_13_fu_303_p4[5] == 1'b1) begin
        l_fu_313_p3 = 32'd5;
    end else if (p_Result_13_fu_303_p4[6] == 1'b1) begin
        l_fu_313_p3 = 32'd6;
    end else if (p_Result_13_fu_303_p4[7] == 1'b1) begin
        l_fu_313_p3 = 32'd7;
    end else if (p_Result_13_fu_303_p4[8] == 1'b1) begin
        l_fu_313_p3 = 32'd8;
    end else if (p_Result_13_fu_303_p4[9] == 1'b1) begin
        l_fu_313_p3 = 32'd9;
    end else if (p_Result_13_fu_303_p4[10] == 1'b1) begin
        l_fu_313_p3 = 32'd10;
    end else if (p_Result_13_fu_303_p4[11] == 1'b1) begin
        l_fu_313_p3 = 32'd11;
    end else if (p_Result_13_fu_303_p4[12] == 1'b1) begin
        l_fu_313_p3 = 32'd12;
    end else if (p_Result_13_fu_303_p4[13] == 1'b1) begin
        l_fu_313_p3 = 32'd13;
    end else if (p_Result_13_fu_303_p4[14] == 1'b1) begin
        l_fu_313_p3 = 32'd14;
    end else if (p_Result_13_fu_303_p4[15] == 1'b1) begin
        l_fu_313_p3 = 32'd15;
    end else if (p_Result_13_fu_303_p4[16] == 1'b1) begin
        l_fu_313_p3 = 32'd16;
    end else if (p_Result_13_fu_303_p4[17] == 1'b1) begin
        l_fu_313_p3 = 32'd17;
    end else if (p_Result_13_fu_303_p4[18] == 1'b1) begin
        l_fu_313_p3 = 32'd18;
    end else if (p_Result_13_fu_303_p4[19] == 1'b1) begin
        l_fu_313_p3 = 32'd19;
    end else if (p_Result_13_fu_303_p4[20] == 1'b1) begin
        l_fu_313_p3 = 32'd20;
    end else if (p_Result_13_fu_303_p4[21] == 1'b1) begin
        l_fu_313_p3 = 32'd21;
    end else if (p_Result_13_fu_303_p4[22] == 1'b1) begin
        l_fu_313_p3 = 32'd22;
    end else if (p_Result_13_fu_303_p4[23] == 1'b1) begin
        l_fu_313_p3 = 32'd23;
    end else if (p_Result_13_fu_303_p4[24] == 1'b1) begin
        l_fu_313_p3 = 32'd24;
    end else if (p_Result_13_fu_303_p4[25] == 1'b1) begin
        l_fu_313_p3 = 32'd25;
    end else if (p_Result_13_fu_303_p4[26] == 1'b1) begin
        l_fu_313_p3 = 32'd26;
    end else if (p_Result_13_fu_303_p4[27] == 1'b1) begin
        l_fu_313_p3 = 32'd27;
    end else if (p_Result_13_fu_303_p4[28] == 1'b1) begin
        l_fu_313_p3 = 32'd28;
    end else if (p_Result_13_fu_303_p4[29] == 1'b1) begin
        l_fu_313_p3 = 32'd29;
    end else if (p_Result_13_fu_303_p4[30] == 1'b1) begin
        l_fu_313_p3 = 32'd30;
    end else if (p_Result_13_fu_303_p4[31] == 1'b1) begin
        l_fu_313_p3 = 32'd31;
    end else begin
        l_fu_313_p3 = 32'd32;
    end
end

assign lsb_index_1_fu_635_p2 = ($signed(sub_ln944_2_fu_629_p2) + $signed(32'd4294967272));

assign lsb_index_2_fu_958_p2 = ($signed(sub_ln944_1_fu_952_p2) + $signed(32'd4294967272));

assign lsb_index_fu_327_p2 = ($signed(sub_ln944_fu_321_p2) + $signed(32'd4294967272));

assign lshr_ln947_1_fu_671_p2 = 32'd4294967295 >> zext_ln947_1_fu_667_p1;

assign lshr_ln947_2_fu_994_p2 = 32'd4294967295 >> zext_ln947_2_fu_990_p1;

assign lshr_ln947_fu_363_p2 = 32'd4294967295 >> zext_ln947_fu_359_p1;

assign lshr_ln958_1_fu_1096_p2 = zext_ln959_5_fu_1058_p1 >> zext_ln958_1_fu_1092_p1;

assign lshr_ln958_2_fu_773_p2 = zext_ln959_4_fu_735_p1 >> zext_ln958_2_fu_769_p1;

assign lshr_ln958_fu_465_p2 = zext_ln959_2_fu_427_p1 >> zext_ln958_fu_461_p1;

assign m_10_fu_799_p2 = (m_9_fu_787_p3 + zext_ln961_2_fu_795_p1);

assign m_13_fu_1110_p3 = ((icmp_ln958_1_fu_1046_p2[0:0] == 1'b1) ? lshr_ln958_1_fu_1096_p2 : shl_ln959_1_fu_1072_p2);

assign m_14_fu_1122_p2 = (m_13_fu_1110_p3 + zext_ln961_1_fu_1118_p1);

assign m_16_fu_291_p3 = ((grp_fu_230_p3[0:0] == 1'b1) ? tmp_V_fu_285_p2 : p_Val2_cast_fu_281_p1);

assign m_17_fu_497_p4 = {{m_5_fu_491_p2[63:1]}};

assign m_18_fu_599_p3 = ((p_Result_16_fu_585_p3[0:0] == 1'b1) ? tmp_V_2_fu_593_p2 : p_Val2_7_cast_fu_575_p1);

assign m_19_fu_805_p4 = {{m_10_fu_799_p2[63:1]}};

assign m_20_fu_912_p3 = ((grp_fu_230_p3[0:0] == 1'b1) ? tmp_V_4_fu_906_p2 : p_Val2_2_cast_fu_902_p1);

assign m_21_fu_1128_p4 = {{m_14_fu_1122_p2[63:1]}};

assign m_5_fu_491_p2 = (m_fu_479_p3 + zext_ln961_fu_487_p1);

assign m_9_fu_787_p3 = ((icmp_ln958_2_fu_723_p2[0:0] == 1'b1) ? lshr_ln958_2_fu_773_p2 : shl_ln959_2_fu_749_p2);

assign m_fu_479_p3 = ((icmp_ln958_fu_415_p2[0:0] == 1'b1) ? lshr_ln958_fu_465_p2 : shl_ln959_fu_441_p2);

assign or_ln303_1_fu_883_p3 = {{select_ln935_1_fu_875_p3}, {select_ln935_fu_567_p3}};

assign or_ln949_3_fu_375_p2 = (shl_ln949_fu_369_p2 | lshr_ln947_fu_363_p2);

assign or_ln949_4_fu_1006_p2 = (shl_ln949_1_fu_1000_p2 | lshr_ln947_2_fu_994_p2);

assign or_ln949_fu_683_p2 = (shl_ln949_2_fu_677_p2 | lshr_ln947_1_fu_671_p2);

assign p_Result_10_fu_1142_p3 = m_14_fu_1122_p2[32'd25];

integer ap_tvar_int_0;

always @ (sext_ln937_fu_299_p1) begin
    for (ap_tvar_int_0 = 32 - 1; ap_tvar_int_0 >= 0; ap_tvar_int_0 = ap_tvar_int_0 - 1) begin
        if (ap_tvar_int_0 > 31 - 0) begin
            p_Result_13_fu_303_p4[ap_tvar_int_0] = 1'b0;
        end else begin
            p_Result_13_fu_303_p4[ap_tvar_int_0] = sext_ln937_fu_299_p1[31 - ap_tvar_int_0];
        end
    end
end

assign p_Result_14_fu_407_p3 = sext_ln937_fu_299_p1[lsb_index_fu_327_p2];

assign p_Result_15_fu_551_p5 = {{zext_ln962_fu_507_p1[63:32]}, {tmp_fu_543_p3}, {zext_ln962_fu_507_p1[22:0]}};

assign p_Result_16_fu_585_p1 = IN_imag_V_q0;

assign p_Result_16_fu_585_p3 = p_Result_16_fu_585_p1[32'd22];

integer ap_tvar_int_1;

always @ (sext_ln937_2_fu_607_p1) begin
    for (ap_tvar_int_1 = 32 - 1; ap_tvar_int_1 >= 0; ap_tvar_int_1 = ap_tvar_int_1 - 1) begin
        if (ap_tvar_int_1 > 31 - 0) begin
            p_Result_17_fu_611_p4[ap_tvar_int_1] = 1'b0;
        end else begin
            p_Result_17_fu_611_p4[ap_tvar_int_1] = sext_ln937_2_fu_607_p1[31 - ap_tvar_int_1];
        end
    end
end

assign p_Result_18_fu_715_p3 = sext_ln937_2_fu_607_p1[lsb_index_1_fu_635_p2];

assign p_Result_19_fu_859_p5 = {{zext_ln962_1_fu_815_p1[63:32]}, {tmp_3_fu_851_p3}, {zext_ln962_1_fu_815_p1[22:0]}};

integer ap_tvar_int_2;

always @ (sext_ln937_1_fu_920_p1) begin
    for (ap_tvar_int_2 = 32 - 1; ap_tvar_int_2 >= 0; ap_tvar_int_2 = ap_tvar_int_2 - 1) begin
        if (ap_tvar_int_2 > 31 - 0) begin
            p_Result_21_fu_924_p4[ap_tvar_int_2] = 1'b0;
        end else begin
            p_Result_21_fu_924_p4[ap_tvar_int_2] = sext_ln937_1_fu_920_p1[31 - ap_tvar_int_2];
        end
    end
end

assign p_Result_22_fu_1038_p3 = sext_ln937_1_fu_920_p1[lsb_index_2_fu_958_p2];

assign p_Result_23_fu_1172_p5 = {{zext_ln962_2_fu_1138_p1[63:32]}, {tmp_1_fu_1164_p3}, {zext_ln962_2_fu_1138_p1[22:0]}};

assign p_Result_5_fu_819_p3 = m_10_fu_799_p2[32'd25];

assign p_Result_s_fu_511_p3 = m_5_fu_491_p2[32'd25];

assign p_Val2_2_cast_fu_902_p0 = IN_real_V_q0;

assign p_Val2_2_cast_fu_902_p1 = p_Val2_2_cast_fu_902_p0;

assign p_Val2_7_cast_fu_575_p0 = IN_imag_V_q0;

assign p_Val2_7_cast_fu_575_p1 = p_Val2_7_cast_fu_575_p0;

assign p_Val2_cast_fu_281_p0 = IN_real_V_q0;

assign p_Val2_cast_fu_281_p1 = p_Val2_cast_fu_281_p0;

assign pss_id_TDATA = tmp_i_data_0_reg_1210;

assign pss_id_TKEEP = 4'd15;

assign pss_id_TLAST = 1'd1;

assign pss_id_TSTRB = 4'd1;

assign select_ln935_1_fu_875_p3 = ((icmp_ln935_2_fu_579_p2[0:0] == 1'b1) ? 32'd0 : LD_1_fu_871_p1);

assign select_ln935_2_fu_1188_p3 = ((grp_fu_224_p2[0:0] == 1'b1) ? 32'd0 : LD_2_fu_1184_p1);

assign select_ln935_fu_567_p3 = ((grp_fu_224_p2[0:0] == 1'b1) ? 32'd0 : LD_fu_563_p1);

assign select_ln943_1_fu_827_p3 = ((p_Result_5_fu_819_p3[0:0] == 1'b1) ? 8'd127 : 8'd126);

assign select_ln943_fu_519_p3 = ((p_Result_s_fu_511_p3[0:0] == 1'b1) ? 8'd127 : 8'd126);

assign select_ln946_1_fu_755_p3 = ((icmp_ln946_1_fu_651_p2[0:0] == 1'b1) ? icmp_ln949_1_fu_695_p2 : p_Result_18_fu_715_p3);

assign select_ln946_2_fu_1078_p3 = ((icmp_ln946_2_fu_974_p2[0:0] == 1'b1) ? icmp_ln949_2_fu_1018_p2 : p_Result_22_fu_1038_p3);

assign select_ln946_fu_447_p3 = ((icmp_ln946_fu_343_p2[0:0] == 1'b1) ? icmp_ln949_fu_387_p2 : p_Result_14_fu_407_p3);

assign select_ln958_2_fu_779_p3 = ((icmp_ln958_2_fu_723_p2[0:0] == 1'b1) ? select_ln946_1_fu_755_p3 : and_ln949_3_fu_729_p2);

assign select_ln958_4_fu_1102_p3 = ((icmp_ln958_1_fu_1046_p2[0:0] == 1'b1) ? select_ln946_2_fu_1078_p3 : and_ln949_5_fu_1052_p2);

assign select_ln958_fu_471_p3 = ((icmp_ln958_fu_415_p2[0:0] == 1'b1) ? select_ln946_fu_447_p3 : and_ln949_1_fu_421_p2);

assign select_ln964_fu_1150_p3 = ((p_Result_10_fu_1142_p3[0:0] == 1'b1) ? 8'd127 : 8'd126);

assign sext_ln216_1_fu_252_p1 = $signed(sub3_fu_246_p2);

assign sext_ln216_fu_262_p1 = $signed(add_ln216_fu_256_p2);

assign sext_ln937_1_fu_920_p1 = $signed(m_20_fu_912_p3);

assign sext_ln937_2_fu_607_p1 = $signed(m_18_fu_599_p3);

assign sext_ln937_fu_299_p1 = $signed(m_16_fu_291_p3);

assign shl_ln949_1_fu_1000_p2 = 32'd1 << lsb_index_2_fu_958_p2;

assign shl_ln949_2_fu_677_p2 = 32'd1 << lsb_index_1_fu_635_p2;

assign shl_ln949_fu_369_p2 = 32'd1 << lsb_index_fu_327_p2;

assign shl_ln959_1_fu_1072_p2 = zext_ln959_5_fu_1058_p1 << zext_ln959_1_fu_1068_p1;

assign shl_ln959_2_fu_749_p2 = zext_ln959_4_fu_735_p1 << zext_ln959_3_fu_745_p1;

assign shl_ln959_fu_441_p2 = zext_ln959_2_fu_427_p1 << zext_ln959_fu_437_p1;

assign sub3_fu_246_p2 = ($signed(index_cast2_fu_242_p1) + $signed(18'd262007));

assign sub_ln943_fu_946_p2 = (8'd12 - trunc_ln943_2_fu_942_p1);

assign sub_ln944_1_fu_952_p2 = (32'd32 - l_1_fu_934_p3);

assign sub_ln944_2_fu_629_p2 = (32'd32 - l_2_fu_621_p3);

assign sub_ln944_fu_321_p2 = (32'd32 - l_fu_313_p3);

assign sub_ln947_1_fu_661_p2 = ($signed(6'd57) - $signed(trunc_ln947_1_fu_657_p1));

assign sub_ln947_2_fu_984_p2 = ($signed(6'd57) - $signed(trunc_ln947_2_fu_980_p1));

assign sub_ln947_fu_353_p2 = ($signed(6'd57) - $signed(trunc_ln947_fu_349_p1));

assign sub_ln959_1_fu_1062_p2 = (32'd25 - sub_ln944_1_fu_952_p2);

assign sub_ln959_2_fu_739_p2 = (32'd25 - sub_ln944_2_fu_629_p2);

assign sub_ln959_fu_431_p2 = (32'd25 - sub_ln944_fu_321_p2);

assign sub_ln964_1_fu_839_p2 = (8'd12 - trunc_ln943_1_fu_835_p1);

assign sub_ln964_fu_531_p2 = (8'd12 - trunc_ln943_fu_527_p1);

assign tmp_12_fu_964_p4 = {{lsb_index_2_fu_958_p2[31:1]}};

assign tmp_13_fu_1024_p3 = lsb_index_2_fu_958_p2[32'd31];

assign tmp_1_fu_1164_p3 = {{grp_fu_230_p3}, {add_ln964_2_fu_1158_p2}};

assign tmp_3_fu_851_p3 = {{p_Result_16_fu_585_p3}, {add_ln964_1_fu_845_p2}};

assign tmp_4_fu_333_p4 = {{lsb_index_fu_327_p2[31:1]}};

assign tmp_5_fu_393_p3 = lsb_index_fu_327_p2[32'd31];

assign tmp_8_fu_641_p4 = {{lsb_index_1_fu_635_p2[31:1]}};

assign tmp_9_fu_701_p3 = lsb_index_1_fu_635_p2[32'd31];

assign tmp_V_2_fu_593_p2 = ($signed(24'd0) - $signed(p_Val2_7_cast_fu_575_p1));

assign tmp_V_4_fu_906_p2 = ($signed(24'd0) - $signed(p_Val2_2_cast_fu_902_p1));

assign tmp_V_fu_285_p2 = ($signed(24'd0) - $signed(p_Val2_cast_fu_281_p1));

assign tmp_fu_543_p3 = {{grp_fu_230_p3}, {add_ln964_fu_537_p2}};

assign tmp_i4_data_fu_1196_p3 = {{select_ln935_2_fu_1188_p3}, {select_ln935_2_fu_1188_p3}};

assign tmp_i_data_0_fu_238_p1 = pss_id;

assign trunc_ln216_fu_266_p1 = i_reg_213[31:0];

assign trunc_ln943_1_fu_835_p1 = l_2_fu_621_p3[7:0];

assign trunc_ln943_2_fu_942_p1 = l_1_fu_934_p3[7:0];

assign trunc_ln943_fu_527_p1 = l_fu_313_p3[7:0];

assign trunc_ln947_1_fu_657_p1 = sub_ln944_2_fu_629_p2[5:0];

assign trunc_ln947_2_fu_980_p1 = sub_ln944_1_fu_952_p2[5:0];

assign trunc_ln947_fu_349_p1 = sub_ln944_fu_321_p2[5:0];

assign xor_ln949_1_fu_709_p2 = (tmp_9_fu_701_p3 ^ 1'd1);

assign xor_ln949_2_fu_1032_p2 = (tmp_13_fu_1024_p3 ^ 1'd1);

assign xor_ln949_fu_401_p2 = (tmp_5_fu_393_p3 ^ 1'd1);

assign zext_ln225_fu_897_p1 = add_ln225_fu_892_p2;

assign zext_ln947_1_fu_667_p1 = sub_ln947_1_fu_661_p2;

assign zext_ln947_2_fu_990_p1 = sub_ln947_2_fu_984_p2;

assign zext_ln947_fu_359_p1 = sub_ln947_fu_353_p2;

assign zext_ln958_1_fu_1092_p1 = add_ln958_1_fu_1086_p2;

assign zext_ln958_2_fu_769_p1 = add_ln958_2_fu_763_p2;

assign zext_ln958_fu_461_p1 = add_ln958_fu_455_p2;

assign zext_ln959_1_fu_1068_p1 = sub_ln959_1_fu_1062_p2;

assign zext_ln959_2_fu_427_p1 = $unsigned(sext_ln937_fu_299_p1);

assign zext_ln959_3_fu_745_p1 = sub_ln959_2_fu_739_p2;

assign zext_ln959_4_fu_735_p1 = $unsigned(sext_ln937_2_fu_607_p1);

assign zext_ln959_5_fu_1058_p1 = $unsigned(sext_ln937_1_fu_920_p1);

assign zext_ln959_fu_437_p1 = sub_ln959_fu_431_p2;

assign zext_ln961_1_fu_1118_p1 = select_ln958_4_fu_1102_p3;

assign zext_ln961_2_fu_795_p1 = select_ln958_2_fu_779_p3;

assign zext_ln961_fu_487_p1 = select_ln958_fu_471_p3;

assign zext_ln962_1_fu_815_p1 = m_19_fu_805_p4;

assign zext_ln962_2_fu_1138_p1 = m_21_fu_1128_p4;

assign zext_ln962_fu_507_p1 = m_17_fu_497_p4;

always @ (posedge ap_clk) begin
    tmp_i_data_0_reg_1210[31:2] <= 30'b000000000000000000000000000000;
end

endmodule //lteCellSearch_write_buffer_fft
