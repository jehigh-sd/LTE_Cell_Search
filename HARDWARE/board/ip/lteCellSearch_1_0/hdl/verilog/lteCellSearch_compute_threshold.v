// ==============================================================
// RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2020.2 (64-bit)
// Version: 2020.2
// Copyright (C) Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module lteCellSearch_compute_threshold (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_continue,
        ap_idle,
        ap_ready,
        IN_real_V_address0,
        IN_real_V_ce0,
        IN_real_V_q0,
        trunc_ln236_dout,
        trunc_ln236_empty_n,
        trunc_ln236_read,
        IN_imag_V_address0,
        IN_imag_V_ce0,
        IN_imag_V_q0,
        trunc_ln236_out_din,
        trunc_ln236_out_full_n,
        trunc_ln236_out_write,
        ap_return
);

parameter    ap_ST_fsm_state1 = 7'd1;
parameter    ap_ST_fsm_state2 = 7'd2;
parameter    ap_ST_fsm_state3 = 7'd4;
parameter    ap_ST_fsm_state4 = 7'd8;
parameter    ap_ST_fsm_state5 = 7'd16;
parameter    ap_ST_fsm_pp1_stage0 = 7'd32;
parameter    ap_ST_fsm_state8 = 7'd64;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
input   ap_continue;
output   ap_idle;
output   ap_ready;
output  [16:0] IN_real_V_address0;
output   IN_real_V_ce0;
input  [22:0] IN_real_V_q0;
input  [16:0] trunc_ln236_dout;
input   trunc_ln236_empty_n;
output   trunc_ln236_read;
output  [16:0] IN_imag_V_address0;
output   IN_imag_V_ce0;
input  [22:0] IN_imag_V_q0;
output  [16:0] trunc_ln236_out_din;
input   trunc_ln236_out_full_n;
output   trunc_ln236_out_write;
output  [31:0] ap_return;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg IN_real_V_ce0;
reg trunc_ln236_read;
reg IN_imag_V_ce0;
reg trunc_ln236_out_write;

reg    ap_done_reg;
(* fsm_encoding = "none" *) reg   [6:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
reg   [31:0] sum_mag_V;
reg   [5:0] mag_buff_V_0_address0;
reg    mag_buff_V_0_ce0;
reg    mag_buff_V_0_we0;
reg   [31:0] mag_buff_V_0_d0;
reg   [5:0] mag_buff_V_0_address1;
reg    mag_buff_V_0_ce1;
reg    mag_buff_V_0_we1;
wire   [31:0] mag_buff_V_0_q1;
reg   [5:0] mag_buff_V_1_address0;
reg    mag_buff_V_1_ce0;
reg    mag_buff_V_1_we0;
reg   [31:0] mag_buff_V_1_d0;
wire   [31:0] mag_buff_V_1_q0;
wire   [5:0] mag_buff_V_1_address1;
reg    mag_buff_V_1_ce1;
wire   [31:0] mag_buff_V_1_q1;
reg    trunc_ln236_blk_n;
reg    trunc_ln236_out_blk_n;
reg   [6:0] i_V_5_reg_231;
wire   [0:0] run_fu_248_p2;
reg   [0:0] run_reg_480;
reg  signed [22:0] IN_real_V_load_reg_484;
wire    ap_CS_fsm_state2;
reg  signed [22:0] IN_imag_V_load_reg_489;
wire   [7:0] i_V_2_fu_258_p2;
wire    ap_CS_fsm_state3;
reg   [22:0] trunc_ln5_reg_508;
wire    ap_CS_fsm_state5;
wire  signed [46:0] sext_ln1115_fu_344_p1;
reg  signed [46:0] sext_ln1115_reg_513;
reg   [31:0] mag_buff_V_1_load_reg_518;
wire   [0:0] icmp_ln886_fu_348_p2;
reg   [0:0] icmp_ln886_reg_523;
wire    ap_CS_fsm_pp1_stage0;
wire    ap_block_state6_pp1_stage0_iter0;
wire    ap_block_state7_pp1_stage0_iter1;
wire    ap_block_pp1_stage0_11001;
wire   [6:0] ret_fu_354_p2;
reg   [6:0] ret_reg_527;
reg    ap_enable_reg_pp1_iter0;
wire   [5:0] trunc_ln1347_fu_360_p1;
reg   [5:0] trunc_ln1347_reg_532;
reg   [0:0] tmp_77_reg_547;
reg   [0:0] tmp_78_reg_552;
wire    ap_block_pp1_stage0_subdone;
reg    ap_condition_pp1_exit_iter0_state6;
reg    ap_enable_reg_pp1_iter1;
reg   [7:0] i_V_reg_208;
wire   [0:0] icmp_ln878_fu_264_p2;
reg   [31:0] sum_mag_V_loc_0_i_i_reg_219;
wire    ap_CS_fsm_state4;
reg   [6:0] ap_phi_mux_i_V_5_phi_fu_235_p4;
wire    ap_block_pp1_stage0;
wire   [63:0] zext_ln228_fu_242_p1;
wire   [63:0] zext_ln44_fu_274_p1;
wire   [63:0] zext_ln58_fu_370_p1;
wire   [63:0] zext_ln58_1_fu_401_p1;
wire   [31:0] add_ln703_fu_444_p2;
wire    ap_CS_fsm_state8;
reg    ap_block_state1;
wire   [0:0] icmp_ln44_fu_290_p2;
wire   [31:0] select_ln58_fu_392_p3;
wire   [31:0] sext_ln708_fu_434_p1;
wire   [5:0] trunc_ln44_fu_270_p1;
wire   [1:0] tmp_fu_280_p4;
wire   [19:0] r_V_fu_299_p1;
wire   [42:0] r_V_fu_299_p2;
wire   [19:0] r_V_9_fu_318_p1;
wire   [42:0] r_V_9_fu_318_p2;
wire   [22:0] trunc_ln708_s_fu_324_p4;
wire  signed [22:0] r_V_10_fu_338_p0;
wire  signed [45:0] sext_ln1118_2_fu_334_p1;
wire  signed [22:0] r_V_10_fu_338_p1;
wire   [45:0] r_V_10_fu_338_p2;
wire   [5:0] add_ln58_fu_364_p2;
wire  signed [22:0] mul_ln1118_fu_409_p0;
wire  signed [45:0] sext_ln1118_3_fu_406_p1;
wire  signed [22:0] mul_ln1118_fu_409_p1;
wire   [45:0] mul_ln1118_fu_409_p2;
wire  signed [46:0] sext_ln1192_fu_415_p1;
wire   [46:0] add_ln1192_fu_419_p2;
wire   [26:0] trunc_ln708_1_fu_424_p4;
wire   [31:0] sub_ln703_fu_439_p2;
wire   [0:0] icmp_ln1495_fu_450_p2;
reg   [6:0] ap_NS_fsm;
reg    ap_idle_pp1;
wire    ap_enable_pp1;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_done_reg = 1'b0;
#0 ap_CS_fsm = 7'd1;
#0 sum_mag_V = 32'd0;
#0 ap_enable_reg_pp1_iter0 = 1'b0;
#0 ap_enable_reg_pp1_iter1 = 1'b0;
end

lteCellSearch_compute_threshold_mag_buff_V_0 #(
    .DataWidth( 32 ),
    .AddressRange( 64 ),
    .AddressWidth( 6 ))
mag_buff_V_0_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .address0(mag_buff_V_0_address0),
    .ce0(mag_buff_V_0_ce0),
    .we0(mag_buff_V_0_we0),
    .d0(mag_buff_V_0_d0),
    .address1(mag_buff_V_0_address1),
    .ce1(mag_buff_V_0_ce1),
    .we1(mag_buff_V_0_we1),
    .d1(sext_ln708_fu_434_p1),
    .q1(mag_buff_V_0_q1)
);

lteCellSearch_compute_threshold_mag_buff_V_1 #(
    .DataWidth( 32 ),
    .AddressRange( 64 ),
    .AddressWidth( 6 ))
mag_buff_V_1_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .address0(mag_buff_V_1_address0),
    .ce0(mag_buff_V_1_ce0),
    .we0(mag_buff_V_1_we0),
    .d0(mag_buff_V_1_d0),
    .q0(mag_buff_V_1_q0),
    .address1(mag_buff_V_1_address1),
    .ce1(mag_buff_V_1_ce1),
    .q1(mag_buff_V_1_q1)
);

lteCellSearch_mul_23s_20ns_43_1_1 #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .din0_WIDTH( 23 ),
    .din1_WIDTH( 20 ),
    .dout_WIDTH( 43 ))
mul_23s_20ns_43_1_1_U4(
    .din0(IN_real_V_load_reg_484),
    .din1(r_V_fu_299_p1),
    .dout(r_V_fu_299_p2)
);

lteCellSearch_mul_23s_20ns_43_1_1 #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .din0_WIDTH( 23 ),
    .din1_WIDTH( 20 ),
    .dout_WIDTH( 43 ))
mul_23s_20ns_43_1_1_U5(
    .din0(IN_imag_V_load_reg_489),
    .din1(r_V_9_fu_318_p1),
    .dout(r_V_9_fu_318_p2)
);

lteCellSearch_mul_23s_23s_46_1_1 #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .din0_WIDTH( 23 ),
    .din1_WIDTH( 23 ),
    .dout_WIDTH( 46 ))
mul_23s_23s_46_1_1_U6(
    .din0(r_V_10_fu_338_p0),
    .din1(r_V_10_fu_338_p1),
    .dout(r_V_10_fu_338_p2)
);

lteCellSearch_mul_23s_23s_46_1_1 #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .din0_WIDTH( 23 ),
    .din1_WIDTH( 23 ),
    .dout_WIDTH( 46 ))
mul_23s_23s_46_1_1_U7(
    .din0(mul_ln1118_fu_409_p0),
    .din1(mul_ln1118_fu_409_p1),
    .dout(mul_ln1118_fu_409_p2)
);

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_CS_fsm <= ap_ST_fsm_state1;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_done_reg <= 1'b0;
    end else begin
        if ((ap_continue == 1'b1)) begin
            ap_done_reg <= 1'b0;
        end else if ((1'b1 == ap_CS_fsm_state8)) begin
            ap_done_reg <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp1_iter0 <= 1'b0;
    end else begin
        if (((1'b1 == ap_condition_pp1_exit_iter0_state6) & (1'b1 == ap_CS_fsm_pp1_stage0) & (1'b0 == ap_block_pp1_stage0_subdone))) begin
            ap_enable_reg_pp1_iter0 <= 1'b0;
        end else if ((1'b1 == ap_CS_fsm_state5)) begin
            ap_enable_reg_pp1_iter0 <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp1_iter1 <= 1'b0;
    end else begin
        if (((1'b1 == ap_condition_pp1_exit_iter0_state6) & (1'b0 == ap_block_pp1_stage0_subdone))) begin
            ap_enable_reg_pp1_iter1 <= (1'b1 ^ ap_condition_pp1_exit_iter0_state6);
        end else if ((1'b0 == ap_block_pp1_stage0_subdone)) begin
            ap_enable_reg_pp1_iter1 <= ap_enable_reg_pp1_iter0;
        end else if ((1'b1 == ap_CS_fsm_state5)) begin
            ap_enable_reg_pp1_iter1 <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_pp1_stage0) & (ap_enable_reg_pp1_iter1 == 1'b1) & (1'b0 == ap_block_pp1_stage0_11001) & (icmp_ln886_reg_523 == 1'd0))) begin
        i_V_5_reg_231 <= ret_reg_527;
    end else if ((1'b1 == ap_CS_fsm_state5)) begin
        i_V_5_reg_231 <= 7'd127;
    end
end

always @ (posedge ap_clk) begin
    if (((run_reg_480 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
        i_V_reg_208 <= 8'd0;
    end else if (((1'b1 == ap_CS_fsm_state3) & (icmp_ln878_fu_264_p2 == 1'd0))) begin
        i_V_reg_208 <= i_V_2_fu_258_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((run_reg_480 == 1'd1) & (1'b1 == ap_CS_fsm_state4))) begin
        sum_mag_V_loc_0_i_i_reg_219 <= 32'd0;
    end else if (((run_reg_480 == 1'd0) & (1'b1 == ap_CS_fsm_state2))) begin
        sum_mag_V_loc_0_i_i_reg_219 <= sum_mag_V;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state2)) begin
        IN_imag_V_load_reg_489 <= IN_imag_V_q0;
        IN_real_V_load_reg_484 <= IN_real_V_q0;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_pp1_stage0) & (1'b0 == ap_block_pp1_stage0_11001))) begin
        icmp_ln886_reg_523 <= icmp_ln886_fu_348_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state5)) begin
        mag_buff_V_1_load_reg_518 <= mag_buff_V_1_q0;
        sext_ln1115_reg_513 <= sext_ln1115_fu_344_p1;
        trunc_ln5_reg_508 <= {{r_V_fu_299_p2[42:20]}};
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_pp1_stage0) & (ap_enable_reg_pp1_iter0 == 1'b1) & (1'b0 == ap_block_pp1_stage0_11001) & (icmp_ln886_fu_348_p2 == 1'd0))) begin
        ret_reg_527 <= ret_fu_354_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state1)) begin
        run_reg_480 <= run_fu_248_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state8)) begin
        sum_mag_V <= add_ln703_fu_444_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_pp1_stage0) & (1'b0 == ap_block_pp1_stage0_11001) & (icmp_ln886_fu_348_p2 == 1'd0))) begin
        tmp_77_reg_547 <= ret_fu_354_p2[32'd6];
        tmp_78_reg_552 <= ap_phi_mux_i_V_5_phi_fu_235_p4[32'd6];
        trunc_ln1347_reg_532 <= trunc_ln1347_fu_360_p1;
    end
end

always @ (*) begin
    if ((~((trunc_ln236_out_full_n == 1'b0) | (trunc_ln236_empty_n == 1'b0) | (ap_done_reg == 1'b1) | (ap_start == 1'b0)) & (1'b1 == ap_CS_fsm_state1))) begin
        IN_imag_V_ce0 = 1'b1;
    end else begin
        IN_imag_V_ce0 = 1'b0;
    end
end

always @ (*) begin
    if ((~((trunc_ln236_out_full_n == 1'b0) | (trunc_ln236_empty_n == 1'b0) | (ap_done_reg == 1'b1) | (ap_start == 1'b0)) & (1'b1 == ap_CS_fsm_state1))) begin
        IN_real_V_ce0 = 1'b1;
    end else begin
        IN_real_V_ce0 = 1'b0;
    end
end

always @ (*) begin
    if ((icmp_ln886_fu_348_p2 == 1'd1)) begin
        ap_condition_pp1_exit_iter0_state6 = 1'b1;
    end else begin
        ap_condition_pp1_exit_iter0_state6 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state8)) begin
        ap_done = 1'b1;
    end else begin
        ap_done = ap_done_reg;
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
    if (((ap_enable_reg_pp1_iter1 == 1'b0) & (ap_enable_reg_pp1_iter0 == 1'b0))) begin
        ap_idle_pp1 = 1'b1;
    end else begin
        ap_idle_pp1 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_pp1_stage0) & (ap_enable_reg_pp1_iter1 == 1'b1) & (1'b0 == ap_block_pp1_stage0) & (icmp_ln886_reg_523 == 1'd0))) begin
        ap_phi_mux_i_V_5_phi_fu_235_p4 = ret_reg_527;
    end else begin
        ap_phi_mux_i_V_5_phi_fu_235_p4 = i_V_5_reg_231;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state8)) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_pp1_stage0) & (ap_enable_reg_pp1_iter1 == 1'b1) & (1'b0 == ap_block_pp1_stage0))) begin
        mag_buff_V_0_address0 = zext_ln58_1_fu_401_p1;
    end else if ((1'b1 == ap_CS_fsm_state3)) begin
        mag_buff_V_0_address0 = zext_ln44_fu_274_p1;
    end else begin
        mag_buff_V_0_address0 = 'bx;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state8)) begin
        mag_buff_V_0_address1 = 6'd0;
    end else if (((1'b1 == ap_CS_fsm_pp1_stage0) & (ap_enable_reg_pp1_iter0 == 1'b1) & (1'b0 == ap_block_pp1_stage0))) begin
        mag_buff_V_0_address1 = zext_ln58_fu_370_p1;
    end else begin
        mag_buff_V_0_address1 = 'bx;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state3) | ((1'b1 == ap_CS_fsm_pp1_stage0) & (ap_enable_reg_pp1_iter1 == 1'b1) & (1'b0 == ap_block_pp1_stage0_11001)))) begin
        mag_buff_V_0_ce0 = 1'b1;
    end else begin
        mag_buff_V_0_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state8) | ((1'b1 == ap_CS_fsm_pp1_stage0) & (ap_enable_reg_pp1_iter0 == 1'b1) & (1'b0 == ap_block_pp1_stage0_11001)))) begin
        mag_buff_V_0_ce1 = 1'b1;
    end else begin
        mag_buff_V_0_ce1 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_pp1_stage0) & (ap_enable_reg_pp1_iter1 == 1'b1) & (1'b0 == ap_block_pp1_stage0))) begin
        mag_buff_V_0_d0 = select_ln58_fu_392_p3;
    end else if ((1'b1 == ap_CS_fsm_state3)) begin
        mag_buff_V_0_d0 = 32'd0;
    end else begin
        mag_buff_V_0_d0 = 'bx;
    end
end

always @ (*) begin
    if ((((icmp_ln44_fu_290_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state3) & (icmp_ln878_fu_264_p2 == 1'd0)) | ((1'b1 == ap_CS_fsm_pp1_stage0) & (ap_enable_reg_pp1_iter1 == 1'b1) & (tmp_78_reg_552 == 1'd0) & (1'b0 == ap_block_pp1_stage0_11001)))) begin
        mag_buff_V_0_we0 = 1'b1;
    end else begin
        mag_buff_V_0_we0 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state8)) begin
        mag_buff_V_0_we1 = 1'b1;
    end else begin
        mag_buff_V_0_we1 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_pp1_stage0) & (ap_enable_reg_pp1_iter1 == 1'b1) & (1'b0 == ap_block_pp1_stage0))) begin
        mag_buff_V_1_address0 = zext_ln58_1_fu_401_p1;
    end else if ((1'b1 == ap_CS_fsm_state4)) begin
        mag_buff_V_1_address0 = 6'd63;
    end else if ((1'b1 == ap_CS_fsm_state3)) begin
        mag_buff_V_1_address0 = zext_ln44_fu_274_p1;
    end else begin
        mag_buff_V_1_address0 = 'bx;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state4) | (1'b1 == ap_CS_fsm_state3) | ((1'b1 == ap_CS_fsm_pp1_stage0) & (ap_enable_reg_pp1_iter1 == 1'b1) & (1'b0 == ap_block_pp1_stage0_11001)))) begin
        mag_buff_V_1_ce0 = 1'b1;
    end else begin
        mag_buff_V_1_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_pp1_stage0) & (ap_enable_reg_pp1_iter0 == 1'b1) & (1'b0 == ap_block_pp1_stage0_11001))) begin
        mag_buff_V_1_ce1 = 1'b1;
    end else begin
        mag_buff_V_1_ce1 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_pp1_stage0) & (ap_enable_reg_pp1_iter1 == 1'b1) & (1'b0 == ap_block_pp1_stage0))) begin
        mag_buff_V_1_d0 = select_ln58_fu_392_p3;
    end else if ((1'b1 == ap_CS_fsm_state3)) begin
        mag_buff_V_1_d0 = 32'd0;
    end else begin
        mag_buff_V_1_d0 = 'bx;
    end
end

always @ (*) begin
    if ((((icmp_ln44_fu_290_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state3) & (icmp_ln878_fu_264_p2 == 1'd0)) | ((1'b1 == ap_CS_fsm_pp1_stage0) & (ap_enable_reg_pp1_iter1 == 1'b1) & (tmp_78_reg_552 == 1'd1) & (1'b0 == ap_block_pp1_stage0_11001)))) begin
        mag_buff_V_1_we0 = 1'b1;
    end else begin
        mag_buff_V_1_we0 = 1'b0;
    end
end

always @ (*) begin
    if ((~((ap_done_reg == 1'b1) | (ap_start == 1'b0)) & (1'b1 == ap_CS_fsm_state1))) begin
        trunc_ln236_blk_n = trunc_ln236_empty_n;
    end else begin
        trunc_ln236_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((~((ap_done_reg == 1'b1) | (ap_start == 1'b0)) & (1'b1 == ap_CS_fsm_state1))) begin
        trunc_ln236_out_blk_n = trunc_ln236_out_full_n;
    end else begin
        trunc_ln236_out_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((~((trunc_ln236_out_full_n == 1'b0) | (trunc_ln236_empty_n == 1'b0) | (ap_done_reg == 1'b1) | (ap_start == 1'b0)) & (1'b1 == ap_CS_fsm_state1))) begin
        trunc_ln236_out_write = 1'b1;
    end else begin
        trunc_ln236_out_write = 1'b0;
    end
end

always @ (*) begin
    if ((~((trunc_ln236_out_full_n == 1'b0) | (trunc_ln236_empty_n == 1'b0) | (ap_done_reg == 1'b1) | (ap_start == 1'b0)) & (1'b1 == ap_CS_fsm_state1))) begin
        trunc_ln236_read = 1'b1;
    end else begin
        trunc_ln236_read = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            if ((~((trunc_ln236_out_full_n == 1'b0) | (trunc_ln236_empty_n == 1'b0) | (ap_done_reg == 1'b1) | (ap_start == 1'b0)) & (1'b1 == ap_CS_fsm_state1))) begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end
        end
        ap_ST_fsm_state2 : begin
            if (((run_reg_480 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
                ap_NS_fsm = ap_ST_fsm_state3;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state4;
            end
        end
        ap_ST_fsm_state3 : begin
            if (((1'b1 == ap_CS_fsm_state3) & (icmp_ln878_fu_264_p2 == 1'd0))) begin
                ap_NS_fsm = ap_ST_fsm_state3;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state4;
            end
        end
        ap_ST_fsm_state4 : begin
            ap_NS_fsm = ap_ST_fsm_state5;
        end
        ap_ST_fsm_state5 : begin
            ap_NS_fsm = ap_ST_fsm_pp1_stage0;
        end
        ap_ST_fsm_pp1_stage0 : begin
            if (~((ap_enable_reg_pp1_iter0 == 1'b1) & (1'b0 == ap_block_pp1_stage0_subdone) & (icmp_ln886_fu_348_p2 == 1'd1))) begin
                ap_NS_fsm = ap_ST_fsm_pp1_stage0;
            end else if (((ap_enable_reg_pp1_iter0 == 1'b1) & (1'b0 == ap_block_pp1_stage0_subdone) & (icmp_ln886_fu_348_p2 == 1'd1))) begin
                ap_NS_fsm = ap_ST_fsm_state8;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp1_stage0;
            end
        end
        ap_ST_fsm_state8 : begin
            ap_NS_fsm = ap_ST_fsm_state1;
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign IN_imag_V_address0 = zext_ln228_fu_242_p1;

assign IN_real_V_address0 = zext_ln228_fu_242_p1;

assign add_ln1192_fu_419_p2 = ($signed(sext_ln1115_reg_513) + $signed(sext_ln1192_fu_415_p1));

assign add_ln58_fu_364_p2 = (trunc_ln1347_fu_360_p1 + 6'd63);

assign add_ln703_fu_444_p2 = (sum_mag_V_loc_0_i_i_reg_219 + sub_ln703_fu_439_p2);

assign ap_CS_fsm_pp1_stage0 = ap_CS_fsm[32'd5];

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_state3 = ap_CS_fsm[32'd2];

assign ap_CS_fsm_state4 = ap_CS_fsm[32'd3];

assign ap_CS_fsm_state5 = ap_CS_fsm[32'd4];

assign ap_CS_fsm_state8 = ap_CS_fsm[32'd6];

assign ap_block_pp1_stage0 = ~(1'b1 == 1'b1);

assign ap_block_pp1_stage0_11001 = ~(1'b1 == 1'b1);

assign ap_block_pp1_stage0_subdone = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_state1 = ((trunc_ln236_out_full_n == 1'b0) | (trunc_ln236_empty_n == 1'b0) | (ap_done_reg == 1'b1) | (ap_start == 1'b0));
end

assign ap_block_state6_pp1_stage0_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state7_pp1_stage0_iter1 = ~(1'b1 == 1'b1);

assign ap_enable_pp1 = (ap_idle_pp1 ^ 1'b1);

assign ap_return = ((icmp_ln1495_fu_450_p2[0:0] == 1'b1) ? add_ln703_fu_444_p2 : 32'd10485);

assign i_V_2_fu_258_p2 = (i_V_reg_208 + 8'd1);

assign icmp_ln1495_fu_450_p2 = (($signed(add_ln703_fu_444_p2) < $signed(32'd10485)) ? 1'b1 : 1'b0);

assign icmp_ln44_fu_290_p2 = ((tmp_fu_280_p4 == 2'd0) ? 1'b1 : 1'b0);

assign icmp_ln878_fu_264_p2 = ((i_V_reg_208 == 8'd128) ? 1'b1 : 1'b0);

assign icmp_ln886_fu_348_p2 = ((ap_phi_mux_i_V_5_phi_fu_235_p4 == 7'd0) ? 1'b1 : 1'b0);

assign mag_buff_V_1_address1 = zext_ln58_fu_370_p1;

assign mul_ln1118_fu_409_p0 = sext_ln1118_3_fu_406_p1;

assign mul_ln1118_fu_409_p1 = sext_ln1118_3_fu_406_p1;

assign r_V_10_fu_338_p0 = sext_ln1118_2_fu_334_p1;

assign r_V_10_fu_338_p1 = sext_ln1118_2_fu_334_p1;

assign r_V_9_fu_318_p1 = 43'd501848;

assign r_V_fu_299_p1 = 43'd501848;

assign ret_fu_354_p2 = ($signed(ap_phi_mux_i_V_5_phi_fu_235_p4) + $signed(7'd127));

assign run_fu_248_p2 = ((trunc_ln236_dout == 17'd0) ? 1'b1 : 1'b0);

assign select_ln58_fu_392_p3 = ((tmp_77_reg_547[0:0] == 1'b1) ? mag_buff_V_1_q1 : mag_buff_V_0_q1);

assign sext_ln1115_fu_344_p1 = $signed(r_V_10_fu_338_p2);

assign sext_ln1118_2_fu_334_p1 = $signed(trunc_ln708_s_fu_324_p4);

assign sext_ln1118_3_fu_406_p1 = $signed(trunc_ln5_reg_508);

assign sext_ln1192_fu_415_p1 = $signed(mul_ln1118_fu_409_p2);

assign sext_ln708_fu_434_p1 = $signed(trunc_ln708_1_fu_424_p4);

assign sub_ln703_fu_439_p2 = (sext_ln708_fu_434_p1 - mag_buff_V_1_load_reg_518);

assign tmp_fu_280_p4 = {{i_V_reg_208[7:6]}};

assign trunc_ln1347_fu_360_p1 = ap_phi_mux_i_V_5_phi_fu_235_p4[5:0];

assign trunc_ln236_out_din = trunc_ln236_dout;

assign trunc_ln44_fu_270_p1 = i_V_reg_208[5:0];

assign trunc_ln708_1_fu_424_p4 = {{add_ln1192_fu_419_p2[46:20]}};

assign trunc_ln708_s_fu_324_p4 = {{r_V_9_fu_318_p2[42:20]}};

assign zext_ln228_fu_242_p1 = trunc_ln236_dout;

assign zext_ln44_fu_274_p1 = trunc_ln44_fu_270_p1;

assign zext_ln58_1_fu_401_p1 = trunc_ln1347_reg_532;

assign zext_ln58_fu_370_p1 = add_ln58_fu_364_p2;

endmodule //lteCellSearch_compute_threshold
