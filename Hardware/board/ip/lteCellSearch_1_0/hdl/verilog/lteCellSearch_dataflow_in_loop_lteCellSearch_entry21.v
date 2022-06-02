// ==============================================================
// RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2020.2 (64-bit)
// Version: 2020.2
// Copyright (C) Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module lteCellSearch_dataflow_in_loop_lteCellSearch_entry21 (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_continue,
        ap_idle,
        ap_ready,
        trunc_ln236,
        trunc_ln236_out_din,
        trunc_ln236_out_full_n,
        trunc_ln236_out_write,
        trunc_ln236_out1_din,
        trunc_ln236_out1_full_n,
        trunc_ln236_out1_write
);

parameter    ap_ST_fsm_state1 = 1'd1;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
input   ap_continue;
output   ap_idle;
output   ap_ready;
input  [16:0] trunc_ln236;
output  [16:0] trunc_ln236_out_din;
input   trunc_ln236_out_full_n;
output   trunc_ln236_out_write;
output  [16:0] trunc_ln236_out1_din;
input   trunc_ln236_out1_full_n;
output   trunc_ln236_out1_write;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg trunc_ln236_out_write;
reg trunc_ln236_out1_write;

reg    ap_done_reg;
(* fsm_encoding = "none" *) reg   [0:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
reg    trunc_ln236_out_blk_n;
reg    trunc_ln236_out1_blk_n;
reg    ap_block_state1;
reg   [0:0] ap_NS_fsm;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_done_reg = 1'b0;
#0 ap_CS_fsm = 1'd1;
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
        ap_done_reg <= 1'b0;
    end else begin
        if ((ap_continue == 1'b1)) begin
            ap_done_reg <= 1'b0;
        end else if ((~((ap_start == 1'b0) | (trunc_ln236_out1_full_n == 1'b0) | (trunc_ln236_out_full_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
            ap_done_reg <= 1'b1;
        end
    end
end

always @ (*) begin
    if ((~((ap_start == 1'b0) | (trunc_ln236_out1_full_n == 1'b0) | (trunc_ln236_out_full_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        ap_done = 1'b1;
    end else begin
        ap_done = ap_done_reg;
    end
end

always @ (*) begin
    if (((ap_start == 1'b0) & (1'b1 == ap_CS_fsm_state1))) begin
        ap_idle = 1'b1;
    end else begin
        ap_idle = 1'b0;
    end
end

always @ (*) begin
    if ((~((ap_start == 1'b0) | (trunc_ln236_out1_full_n == 1'b0) | (trunc_ln236_out_full_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        trunc_ln236_out1_blk_n = trunc_ln236_out1_full_n;
    end else begin
        trunc_ln236_out1_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((~((ap_start == 1'b0) | (trunc_ln236_out1_full_n == 1'b0) | (trunc_ln236_out_full_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        trunc_ln236_out1_write = 1'b1;
    end else begin
        trunc_ln236_out1_write = 1'b0;
    end
end

always @ (*) begin
    if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        trunc_ln236_out_blk_n = trunc_ln236_out_full_n;
    end else begin
        trunc_ln236_out_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((~((ap_start == 1'b0) | (trunc_ln236_out1_full_n == 1'b0) | (trunc_ln236_out_full_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        trunc_ln236_out_write = 1'b1;
    end else begin
        trunc_ln236_out_write = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            ap_NS_fsm = ap_ST_fsm_state1;
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

always @ (*) begin
    ap_block_state1 = ((ap_start == 1'b0) | (trunc_ln236_out1_full_n == 1'b0) | (trunc_ln236_out_full_n == 1'b0) | (ap_done_reg == 1'b1));
end

assign trunc_ln236_out1_din = trunc_ln236;

assign trunc_ln236_out_din = trunc_ln236;

endmodule //lteCellSearch_dataflow_in_loop_lteCellSearch_entry21
