// ==============================================================
// RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2020.2 (64-bit)
// Version: 2020.2
// Copyright (C) Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module fft_shift_copy_output (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        OUT_temp_R_address0,
        OUT_temp_R_ce0,
        OUT_temp_R_q0,
        OUT_temp_I_address0,
        OUT_temp_I_ce0,
        OUT_temp_I_q0,
        OUT_R_TDATA,
        OUT_R_TVALID,
        OUT_R_TREADY,
        OUT_R_TKEEP,
        OUT_R_TSTRB,
        OUT_R_TLAST,
        OUT_I_TDATA,
        OUT_I_TVALID,
        OUT_I_TREADY,
        OUT_I_TKEEP,
        OUT_I_TSTRB,
        OUT_I_TLAST
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
output  [6:0] OUT_temp_R_address0;
output   OUT_temp_R_ce0;
input  [31:0] OUT_temp_R_q0;
output  [6:0] OUT_temp_I_address0;
output   OUT_temp_I_ce0;
input  [31:0] OUT_temp_I_q0;
output  [31:0] OUT_R_TDATA;
output   OUT_R_TVALID;
input   OUT_R_TREADY;
output  [3:0] OUT_R_TKEEP;
output  [3:0] OUT_R_TSTRB;
output  [0:0] OUT_R_TLAST;
output  [31:0] OUT_I_TDATA;
output   OUT_I_TVALID;
input   OUT_I_TREADY;
output  [3:0] OUT_I_TKEEP;
output  [3:0] OUT_I_TSTRB;
output  [0:0] OUT_I_TLAST;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg[6:0] OUT_temp_R_address0;
reg OUT_temp_R_ce0;
reg[6:0] OUT_temp_I_address0;
reg OUT_temp_I_ce0;
reg[31:0] OUT_R_TDATA;
reg OUT_R_TVALID;
reg[0:0] OUT_R_TLAST;
reg[31:0] OUT_I_TDATA;
reg OUT_I_TVALID;
reg[0:0] OUT_I_TLAST;

(* fsm_encoding = "none" *) reg   [4:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
reg    OUT_R_TDATA_blk_n;
wire    ap_CS_fsm_pp0_stage0;
reg    ap_enable_reg_pp0_iter1;
wire    ap_block_pp0_stage0;
reg   [0:0] icmp_ln39_reg_202;
wire    ap_CS_fsm_state5;
reg    OUT_I_TDATA_blk_n;
reg   [6:0] i_reg_148;
wire   [6:0] add_ln39_fu_159_p2;
reg    ap_enable_reg_pp0_iter0;
wire    ap_block_state2_pp0_stage0_iter0;
reg    ap_block_state3_pp0_stage0_iter1;
reg    ap_block_state3_io;
reg    ap_block_pp0_stage0_11001;
wire   [0:0] icmp_ln39_fu_165_p2;
wire    ap_CS_fsm_state4;
reg    ap_block_pp0_stage0_subdone;
reg    ap_condition_pp0_exit_iter0_state2;
wire   [63:0] i_cast_fu_171_p1;
wire   [31:0] bitcast_ln303_2_fu_177_p1;
reg    ap_block_pp0_stage0_01001;
wire   [31:0] bitcast_ln303_fu_187_p1;
reg    ap_block_state5;
reg    ap_block_state5_io;
wire   [31:0] bitcast_ln303_3_fu_182_p1;
wire   [31:0] bitcast_ln303_1_fu_192_p1;
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
    if (((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1))) begin
        i_reg_148 <= 7'd0;
    end else if (((icmp_ln39_fu_165_p2 == 1'd0) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        i_reg_148 <= add_ln39_fu_159_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        icmp_ln39_reg_202 <= icmp_ln39_fu_165_p2;
    end
end

always @ (*) begin
    if ((~((1'b0 == OUT_I_TREADY) | (1'b0 == OUT_R_TREADY)) & (1'b1 == ap_CS_fsm_state5))) begin
        OUT_I_TDATA = bitcast_ln303_1_fu_192_p1;
    end else if (((icmp_ln39_reg_202 == 1'd0) & (1'b0 == ap_block_pp0_stage0_01001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        OUT_I_TDATA = bitcast_ln303_3_fu_182_p1;
    end else begin
        OUT_I_TDATA = 'bx;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state5) | ((icmp_ln39_reg_202 == 1'd0) & (1'b0 == ap_block_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0)))) begin
        OUT_I_TDATA_blk_n = OUT_I_TREADY;
    end else begin
        OUT_I_TDATA_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((~((1'b0 == OUT_I_TREADY) | (1'b0 == OUT_R_TREADY)) & (1'b1 == ap_CS_fsm_state5))) begin
        OUT_I_TLAST = 1'd1;
    end else if (((icmp_ln39_reg_202 == 1'd0) & (1'b0 == ap_block_pp0_stage0_01001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        OUT_I_TLAST = 1'd0;
    end else begin
        OUT_I_TLAST = 'bx;
    end
end

always @ (*) begin
    if ((((icmp_ln39_reg_202 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0)) | (~((1'b0 == OUT_I_TREADY) | (1'b0 == OUT_R_TREADY) | (1'b1 == ap_block_state5_io)) & (1'b1 == ap_CS_fsm_state5)))) begin
        OUT_I_TVALID = 1'b1;
    end else begin
        OUT_I_TVALID = 1'b0;
    end
end

always @ (*) begin
    if ((~((1'b0 == OUT_I_TREADY) | (1'b0 == OUT_R_TREADY)) & (1'b1 == ap_CS_fsm_state5))) begin
        OUT_R_TDATA = bitcast_ln303_fu_187_p1;
    end else if (((icmp_ln39_reg_202 == 1'd0) & (1'b0 == ap_block_pp0_stage0_01001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        OUT_R_TDATA = bitcast_ln303_2_fu_177_p1;
    end else begin
        OUT_R_TDATA = 'bx;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state5) | ((icmp_ln39_reg_202 == 1'd0) & (1'b0 == ap_block_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0)))) begin
        OUT_R_TDATA_blk_n = OUT_R_TREADY;
    end else begin
        OUT_R_TDATA_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((~((1'b0 == OUT_I_TREADY) | (1'b0 == OUT_R_TREADY)) & (1'b1 == ap_CS_fsm_state5))) begin
        OUT_R_TLAST = 1'd1;
    end else if (((icmp_ln39_reg_202 == 1'd0) & (1'b0 == ap_block_pp0_stage0_01001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        OUT_R_TLAST = 1'd0;
    end else begin
        OUT_R_TLAST = 'bx;
    end
end

always @ (*) begin
    if ((((icmp_ln39_reg_202 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0)) | (~((1'b0 == OUT_I_TREADY) | (1'b0 == OUT_R_TREADY) | (1'b1 == ap_block_state5_io)) & (1'b1 == ap_CS_fsm_state5)))) begin
        OUT_R_TVALID = 1'b1;
    end else begin
        OUT_R_TVALID = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state4)) begin
        OUT_temp_I_address0 = 64'd127;
    end else if (((ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage0) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        OUT_temp_I_address0 = i_cast_fu_171_p1;
    end else begin
        OUT_temp_I_address0 = 'bx;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state4) | ((ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0)))) begin
        OUT_temp_I_ce0 = 1'b1;
    end else begin
        OUT_temp_I_ce0 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state4)) begin
        OUT_temp_R_address0 = 64'd127;
    end else if (((ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage0) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        OUT_temp_R_address0 = i_cast_fu_171_p1;
    end else begin
        OUT_temp_R_address0 = 'bx;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state4) | ((ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0)))) begin
        OUT_temp_R_ce0 = 1'b1;
    end else begin
        OUT_temp_R_ce0 = 1'b0;
    end
end

always @ (*) begin
    if ((icmp_ln39_fu_165_p2 == 1'd1)) begin
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
    if (((ap_enable_reg_pp0_iter0 == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b0))) begin
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
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            if (((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1))) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end
        end
        ap_ST_fsm_pp0_stage0 : begin
            if (~((icmp_ln39_fu_165_p2 == 1'd1) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage0_subdone))) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end else if (((icmp_ln39_fu_165_p2 == 1'd1) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage0_subdone))) begin
                ap_NS_fsm = ap_ST_fsm_state4;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end
        end
        ap_ST_fsm_state4 : begin
            ap_NS_fsm = ap_ST_fsm_state5;
        end
        ap_ST_fsm_state5 : begin
            if ((~((1'b0 == OUT_I_TREADY) | (1'b0 == OUT_R_TREADY) | (1'b1 == ap_block_state5_io)) & (1'b1 == ap_CS_fsm_state5))) begin
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

assign OUT_I_TKEEP = 4'd15;

assign OUT_I_TSTRB = 4'd1;

assign OUT_R_TKEEP = 4'd15;

assign OUT_R_TSTRB = 4'd1;

assign add_ln39_fu_159_p2 = (i_reg_148 + 7'd1);

assign ap_CS_fsm_pp0_stage0 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state4 = ap_CS_fsm[32'd2];

assign ap_CS_fsm_state5 = ap_CS_fsm[32'd3];

assign ap_CS_fsm_state6 = ap_CS_fsm[32'd4];

assign ap_block_pp0_stage0 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_pp0_stage0_01001 = ((ap_enable_reg_pp0_iter1 == 1'b1) & (((icmp_ln39_reg_202 == 1'd0) & (1'b0 == OUT_I_TREADY)) | ((icmp_ln39_reg_202 == 1'd0) & (1'b0 == OUT_R_TREADY))));
end

always @ (*) begin
    ap_block_pp0_stage0_11001 = ((ap_enable_reg_pp0_iter1 == 1'b1) & ((1'b1 == ap_block_state3_io) | ((icmp_ln39_reg_202 == 1'd0) & (1'b0 == OUT_I_TREADY)) | ((icmp_ln39_reg_202 == 1'd0) & (1'b0 == OUT_R_TREADY))));
end

always @ (*) begin
    ap_block_pp0_stage0_subdone = ((ap_enable_reg_pp0_iter1 == 1'b1) & ((1'b1 == ap_block_state3_io) | ((icmp_ln39_reg_202 == 1'd0) & (1'b0 == OUT_I_TREADY)) | ((icmp_ln39_reg_202 == 1'd0) & (1'b0 == OUT_R_TREADY))));
end

assign ap_block_state2_pp0_stage0_iter0 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_state3_io = (((icmp_ln39_reg_202 == 1'd0) & (1'b0 == OUT_I_TREADY)) | ((icmp_ln39_reg_202 == 1'd0) & (1'b0 == OUT_R_TREADY)));
end

always @ (*) begin
    ap_block_state3_pp0_stage0_iter1 = (((icmp_ln39_reg_202 == 1'd0) & (1'b0 == OUT_I_TREADY)) | ((icmp_ln39_reg_202 == 1'd0) & (1'b0 == OUT_R_TREADY)));
end

always @ (*) begin
    ap_block_state5 = ((1'b0 == OUT_I_TREADY) | (1'b0 == OUT_R_TREADY));
end

always @ (*) begin
    ap_block_state5_io = ((1'b0 == OUT_I_TREADY) | (1'b0 == OUT_R_TREADY));
end

assign ap_enable_pp0 = (ap_idle_pp0 ^ 1'b1);

assign bitcast_ln303_1_fu_192_p1 = OUT_temp_I_q0;

assign bitcast_ln303_2_fu_177_p1 = OUT_temp_R_q0;

assign bitcast_ln303_3_fu_182_p1 = OUT_temp_I_q0;

assign bitcast_ln303_fu_187_p1 = OUT_temp_R_q0;

assign i_cast_fu_171_p1 = i_reg_148;

assign icmp_ln39_fu_165_p2 = ((i_reg_148 == 7'd127) ? 1'b1 : 1'b0);

endmodule //fft_shift_copy_output