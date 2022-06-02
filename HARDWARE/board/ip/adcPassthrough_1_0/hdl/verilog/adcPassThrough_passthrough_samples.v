// ==============================================================
// RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2020.2 (64-bit)
// Version: 2020.2
// Copyright (C) Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module adcPassThrough_passthrough_samples (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        IN_R_TVALID,
        IN_I_TVALID,
        OUT_R1_TREADY,
        OUT_I1_TREADY,
        OUT_R2_TREADY,
        OUT_I2_TREADY,
        ap_ce,
        IN_R_TDATA,
        IN_R_TREADY,
        IN_R_TKEEP,
        IN_R_TSTRB,
        IN_R_TLAST,
        IN_I_TDATA,
        IN_I_TREADY,
        IN_I_TKEEP,
        IN_I_TSTRB,
        IN_I_TLAST,
        OUT_R1_TDATA,
        OUT_R1_TVALID,
        OUT_R1_TKEEP,
        OUT_R1_TSTRB,
        OUT_R1_TLAST,
        OUT_I1_TDATA,
        OUT_I1_TVALID,
        OUT_I1_TKEEP,
        OUT_I1_TSTRB,
        OUT_I1_TLAST,
        OUT_R2_TDATA,
        OUT_R2_TVALID,
        OUT_R2_TKEEP,
        OUT_R2_TSTRB,
        OUT_R2_TLAST,
        OUT_I2_TDATA,
        OUT_I2_TVALID,
        OUT_I2_TKEEP,
        OUT_I2_TSTRB,
        OUT_I2_TLAST,
        IN_R_TDATA_blk_n,
        IN_I_TDATA_blk_n,
        OUT_R1_TDATA_blk_n,
        OUT_I1_TDATA_blk_n,
        OUT_R2_TDATA_blk_n,
        OUT_I2_TDATA_blk_n
);

parameter    ap_ST_fsm_pp0_stage0 = 1'd1;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
input   IN_R_TVALID;
input   IN_I_TVALID;
input   OUT_R1_TREADY;
input   OUT_I1_TREADY;
input   OUT_R2_TREADY;
input   OUT_I2_TREADY;
input   ap_ce;
input  [127:0] IN_R_TDATA;
output   IN_R_TREADY;
input  [15:0] IN_R_TKEEP;
input  [15:0] IN_R_TSTRB;
input  [0:0] IN_R_TLAST;
input  [127:0] IN_I_TDATA;
output   IN_I_TREADY;
input  [15:0] IN_I_TKEEP;
input  [15:0] IN_I_TSTRB;
input  [0:0] IN_I_TLAST;
output  [127:0] OUT_R1_TDATA;
output   OUT_R1_TVALID;
output  [15:0] OUT_R1_TKEEP;
output  [15:0] OUT_R1_TSTRB;
output  [0:0] OUT_R1_TLAST;
output  [127:0] OUT_I1_TDATA;
output   OUT_I1_TVALID;
output  [15:0] OUT_I1_TKEEP;
output  [15:0] OUT_I1_TSTRB;
output  [0:0] OUT_I1_TLAST;
output  [127:0] OUT_R2_TDATA;
output   OUT_R2_TVALID;
output  [15:0] OUT_R2_TKEEP;
output  [15:0] OUT_R2_TSTRB;
output  [0:0] OUT_R2_TLAST;
output  [127:0] OUT_I2_TDATA;
output   OUT_I2_TVALID;
output  [15:0] OUT_I2_TKEEP;
output  [15:0] OUT_I2_TSTRB;
output  [0:0] OUT_I2_TLAST;
output   IN_R_TDATA_blk_n;
output   IN_I_TDATA_blk_n;
output   OUT_R1_TDATA_blk_n;
output   OUT_I1_TDATA_blk_n;
output   OUT_R2_TDATA_blk_n;
output   OUT_I2_TDATA_blk_n;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg IN_R_TREADY;
reg IN_I_TREADY;
reg OUT_R1_TVALID;
reg OUT_I1_TVALID;
reg OUT_R2_TVALID;
reg OUT_I2_TVALID;
reg IN_R_TDATA_blk_n;
reg IN_I_TDATA_blk_n;
reg OUT_R1_TDATA_blk_n;
reg OUT_I1_TDATA_blk_n;
reg OUT_R2_TDATA_blk_n;
reg OUT_I2_TDATA_blk_n;

(* fsm_encoding = "none" *) reg   [0:0] ap_CS_fsm;
wire    ap_CS_fsm_pp0_stage0;
wire    ap_enable_reg_pp0_iter0;
wire    ap_block_pp0_stage0;
reg    ap_enable_reg_pp0_iter1;
reg    ap_idle_pp0;
reg    ap_block_state1_pp0_stage0_iter0;
reg    ap_block_state1_io;
wire    ap_block_state2_pp0_stage0_iter1;
reg    ap_block_pp0_stage0_11001;
reg    ap_block_pp0_stage0_subdone;
reg    ap_block_pp0_stage0_01001;
reg   [0:0] ap_NS_fsm;
reg    ap_idle_pp0_0to0;
reg    ap_reset_idle_pp0;
wire    ap_enable_pp0;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_CS_fsm = 1'd1;
#0 ap_enable_reg_pp0_iter1 = 1'b0;
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_CS_fsm <= ap_ST_fsm_pp0_stage0;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter1 <= 1'b0;
    end else begin
        if (((1'b0 == ap_block_pp0_stage0_subdone) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
            ap_enable_reg_pp0_iter1 <= ap_start;
        end
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_start == 1'b1))) begin
        IN_I_TDATA_blk_n = IN_I_TVALID;
    end else begin
        IN_I_TDATA_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_ce) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_start == 1'b1))) begin
        IN_I_TREADY = 1'b1;
    end else begin
        IN_I_TREADY = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_start == 1'b1))) begin
        IN_R_TDATA_blk_n = IN_R_TVALID;
    end else begin
        IN_R_TDATA_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_ce) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_start == 1'b1))) begin
        IN_R_TREADY = 1'b1;
    end else begin
        IN_R_TREADY = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_start == 1'b1))) begin
        OUT_I1_TDATA_blk_n = OUT_I1_TREADY;
    end else begin
        OUT_I1_TDATA_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_ce) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_start == 1'b1))) begin
        OUT_I1_TVALID = 1'b1;
    end else begin
        OUT_I1_TVALID = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_start == 1'b1))) begin
        OUT_I2_TDATA_blk_n = OUT_I2_TREADY;
    end else begin
        OUT_I2_TDATA_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_ce) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_start == 1'b1))) begin
        OUT_I2_TVALID = 1'b1;
    end else begin
        OUT_I2_TVALID = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_start == 1'b1))) begin
        OUT_R1_TDATA_blk_n = OUT_R1_TREADY;
    end else begin
        OUT_R1_TDATA_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_ce) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_start == 1'b1))) begin
        OUT_R1_TVALID = 1'b1;
    end else begin
        OUT_R1_TVALID = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_start == 1'b1))) begin
        OUT_R2_TDATA_blk_n = OUT_R2_TREADY;
    end else begin
        OUT_R2_TDATA_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_ce) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_start == 1'b1))) begin
        OUT_R2_TVALID = 1'b1;
    end else begin
        OUT_R2_TVALID = 1'b0;
    end
end

always @ (*) begin
    if ((((ap_start == 1'b0) & (1'b0 == ap_block_pp0_stage0) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_start == 1'b1)) | ((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_ce) & (1'b1 == ap_CS_fsm_pp0_stage0)))) begin
        ap_done = 1'b1;
    end else begin
        ap_done = 1'b0;
    end
end

always @ (*) begin
    if (((ap_start == 1'b0) & (ap_idle_pp0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
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
    if ((ap_enable_reg_pp0_iter0 == 1'b0)) begin
        ap_idle_pp0_0to0 = 1'b1;
    end else begin
        ap_idle_pp0_0to0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_ce) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_start == 1'b1))) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    if (((ap_start == 1'b0) & (ap_idle_pp0_0to0 == 1'b1))) begin
        ap_reset_idle_pp0 = 1'b1;
    end else begin
        ap_reset_idle_pp0 = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_pp0_stage0 : begin
            ap_NS_fsm = ap_ST_fsm_pp0_stage0;
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign OUT_I1_TDATA = IN_I_TDATA;

assign OUT_I1_TKEEP = IN_I_TKEEP;

assign OUT_I1_TLAST = IN_I_TLAST;

assign OUT_I1_TSTRB = IN_I_TSTRB;

assign OUT_I2_TDATA = IN_I_TDATA;

assign OUT_I2_TKEEP = IN_I_TKEEP;

assign OUT_I2_TLAST = IN_I_TLAST;

assign OUT_I2_TSTRB = IN_I_TSTRB;

assign OUT_R1_TDATA = IN_R_TDATA;

assign OUT_R1_TKEEP = IN_R_TKEEP;

assign OUT_R1_TLAST = IN_R_TLAST;

assign OUT_R1_TSTRB = IN_R_TSTRB;

assign OUT_R2_TDATA = IN_R_TDATA;

assign OUT_R2_TKEEP = IN_R_TKEEP;

assign OUT_R2_TLAST = IN_R_TLAST;

assign OUT_R2_TSTRB = IN_R_TSTRB;

assign ap_CS_fsm_pp0_stage0 = ap_CS_fsm[32'd0];

assign ap_block_pp0_stage0 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_pp0_stage0_01001 = ((ap_start == 1'b1) & ((1'b0 == OUT_I2_TREADY) | (1'b0 == OUT_R2_TREADY) | (1'b0 == OUT_I1_TREADY) | (1'b0 == OUT_R1_TREADY) | (1'b0 == IN_I_TVALID) | (1'b0 == IN_R_TVALID)));
end

always @ (*) begin
    ap_block_pp0_stage0_11001 = ((ap_start == 1'b1) & ((1'b1 == ap_block_state1_io) | (1'b0 == OUT_I2_TREADY) | (1'b0 == OUT_R2_TREADY) | (1'b0 == OUT_I1_TREADY) | (1'b0 == OUT_R1_TREADY) | (1'b0 == IN_I_TVALID) | (1'b0 == IN_R_TVALID)));
end

always @ (*) begin
    ap_block_pp0_stage0_subdone = ((1'b0 == ap_ce) | ((ap_start == 1'b1) & ((1'b1 == ap_block_state1_io) | (1'b0 == OUT_I2_TREADY) | (1'b0 == OUT_R2_TREADY) | (1'b0 == OUT_I1_TREADY) | (1'b0 == OUT_R1_TREADY) | (1'b0 == IN_I_TVALID) | (1'b0 == IN_R_TVALID))));
end

always @ (*) begin
    ap_block_state1_io = ((1'b0 == OUT_I2_TREADY) | (1'b0 == OUT_R2_TREADY) | (1'b0 == OUT_I1_TREADY) | (1'b0 == OUT_R1_TREADY));
end

always @ (*) begin
    ap_block_state1_pp0_stage0_iter0 = ((1'b0 == OUT_I2_TREADY) | (1'b0 == OUT_R2_TREADY) | (1'b0 == OUT_I1_TREADY) | (1'b0 == OUT_R1_TREADY) | (1'b0 == IN_I_TVALID) | (1'b0 == IN_R_TVALID));
end

assign ap_block_state2_pp0_stage0_iter1 = ~(1'b1 == 1'b1);

assign ap_enable_pp0 = (ap_idle_pp0 ^ 1'b1);

assign ap_enable_reg_pp0_iter0 = ap_start;

endmodule //adcPassThrough_passthrough_samples