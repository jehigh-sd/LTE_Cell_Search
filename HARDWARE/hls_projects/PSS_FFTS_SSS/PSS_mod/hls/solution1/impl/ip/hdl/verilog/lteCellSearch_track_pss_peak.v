// ==============================================================
// RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2020.2 (64-bit)
// Version: 2020.2
// Copyright (C) Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module lteCellSearch_track_pss_peak (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_continue,
        ap_idle,
        ap_ready,
        p_read,
        p_read1,
        p_read2,
        p_read3,
        pss_id_temp,
        pss_id_temp_ap_vld,
        peak_id_temp,
        peak_id_temp_ap_vld,
        trunc_ln264_dout,
        trunc_ln264_empty_n,
        trunc_ln264_read,
        pss_rslt_temp_address0,
        pss_rslt_temp_ce0,
        pss_rslt_temp_we0,
        pss_rslt_temp_d0,
        pss_rslt_temp_address1,
        pss_rslt_temp_ce1,
        pss_rslt_temp_we1,
        pss_rslt_temp_d1
);

parameter    ap_ST_fsm_state1 = 2'd1;
parameter    ap_ST_fsm_state2 = 2'd2;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
input   ap_continue;
output   ap_idle;
output   ap_ready;
input  [19:0] p_read;
input  [19:0] p_read1;
input  [19:0] p_read2;
input  [31:0] p_read3;
output  [1:0] pss_id_temp;
output   pss_id_temp_ap_vld;
output  [16:0] peak_id_temp;
output   peak_id_temp_ap_vld;
input  [16:0] trunc_ln264_dout;
input   trunc_ln264_empty_n;
output   trunc_ln264_read;
output  [18:0] pss_rslt_temp_address0;
output   pss_rslt_temp_ce0;
output   pss_rslt_temp_we0;
output  [11:0] pss_rslt_temp_d0;
output  [18:0] pss_rslt_temp_address1;
output   pss_rslt_temp_ce1;
output   pss_rslt_temp_we1;
output  [11:0] pss_rslt_temp_d1;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg[1:0] pss_id_temp;
reg pss_id_temp_ap_vld;
reg[16:0] peak_id_temp;
reg peak_id_temp_ap_vld;
reg trunc_ln264_read;
reg[18:0] pss_rslt_temp_address0;
reg pss_rslt_temp_ce0;
reg pss_rslt_temp_we0;
reg[11:0] pss_rslt_temp_d0;
reg pss_rslt_temp_ce1;
reg pss_rslt_temp_we1;

reg    ap_done_reg;
(* fsm_encoding = "none" *) reg   [1:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
reg   [19:0] curr_max_V;
reg    trunc_ln264_blk_n;
reg   [16:0] trunc_ln264_read_reg_445;
reg   [11:0] ret_V_2_reg_456;
wire   [63:0] zext_ln534_fu_354_p1;
wire   [63:0] zext_ln191_fu_369_p1;
wire   [63:0] zext_ln192_fu_440_p1;
wire    ap_CS_fsm_state2;
wire   [19:0] select_ln183_3_fu_290_p3;
reg    ap_block_state1;
wire   [0:0] or_ln183_fu_268_p2;
reg   [16:0] peak_id_temp_preg;
wire   [0:0] or_ln183_1_fu_304_p2;
wire   [1:0] select_ln183_1_fu_310_p3;
reg   [1:0] pss_id_temp_preg;
wire   [0:0] run_fu_146_p2;
wire   [31:0] zext_ln142_2_fu_160_p1;
wire   [31:0] zext_ln142_1_fu_156_p1;
wire   [31:0] zext_ln142_fu_152_p1;
wire   [19:0] select_ln148_fu_174_p3;
wire   [0:0] is_valid_0_fu_182_p2;
wire   [0:0] icmp_ln1494_fu_200_p2;
wire   [0:0] and_ln169_fu_206_p2;
wire   [19:0] select_ln169_fu_212_p3;
wire   [0:0] is_valid_1_fu_188_p2;
wire   [0:0] icmp_ln1494_1_fu_220_p2;
wire   [0:0] and_ln176_fu_226_p2;
wire   [19:0] select_ln176_fu_236_p3;
wire   [0:0] is_valid_2_fu_194_p2;
wire   [0:0] icmp_ln1494_2_fu_244_p2;
wire   [0:0] xor_ln148_fu_168_p2;
wire   [0:0] and_ln183_fu_250_p2;
wire   [0:0] or_ln183_3_fu_262_p2;
wire   [0:0] or_ln183_2_fu_256_p2;
wire   [19:0] select_ln183_fu_274_p3;
wire   [19:0] select_ln183_2_fu_282_p3;
wire   [0:0] or_ln183_4_fu_298_p2;
wire   [1:0] zext_ln176_fu_232_p1;
wire   [41:0] r_V_fu_319_p3;
wire   [41:0] r_V_6_fu_331_p0;
wire   [36:0] r_V_6_fu_331_p1;
wire   [77:0] r_V_6_fu_331_p2;
wire   [17:0] zext_ln190_1_fu_359_p1;
wire   [17:0] add_ln191_fu_363_p2;
wire   [41:0] r_V_2_fu_374_p3;
wire   [41:0] r_V_7_fu_386_p0;
wire   [36:0] r_V_7_fu_386_p1;
wire   [77:0] r_V_7_fu_386_p2;
wire   [41:0] r_V_4_fu_403_p3;
wire   [41:0] r_V_8_fu_415_p0;
wire   [36:0] r_V_8_fu_415_p1;
wire   [77:0] r_V_8_fu_415_p2;
wire   [18:0] zext_ln190_fu_431_p1;
wire   [18:0] add_ln192_fu_434_p2;
reg   [1:0] ap_NS_fsm;
wire   [77:0] r_V_6_fu_331_p00;
wire   [77:0] r_V_7_fu_386_p00;
wire   [77:0] r_V_8_fu_415_p00;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_done_reg = 1'b0;
#0 ap_CS_fsm = 2'd1;
#0 curr_max_V = 20'd0;
#0 peak_id_temp_preg = 17'd0;
#0 pss_id_temp_preg = 2'd0;
end

lteCellSearch_mul_42ns_37ns_78_1_1 #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .din0_WIDTH( 42 ),
    .din1_WIDTH( 37 ),
    .dout_WIDTH( 78 ))
mul_42ns_37ns_78_1_1_U53(
    .din0(r_V_6_fu_331_p0),
    .din1(r_V_6_fu_331_p1),
    .dout(r_V_6_fu_331_p2)
);

lteCellSearch_mul_42ns_37ns_78_1_1 #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .din0_WIDTH( 42 ),
    .din1_WIDTH( 37 ),
    .dout_WIDTH( 78 ))
mul_42ns_37ns_78_1_1_U54(
    .din0(r_V_7_fu_386_p0),
    .din1(r_V_7_fu_386_p1),
    .dout(r_V_7_fu_386_p2)
);

lteCellSearch_mul_42ns_37ns_78_1_1 #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .din0_WIDTH( 42 ),
    .din1_WIDTH( 37 ),
    .dout_WIDTH( 78 ))
mul_42ns_37ns_78_1_1_U55(
    .din0(r_V_8_fu_415_p0),
    .din1(r_V_8_fu_415_p1),
    .dout(r_V_8_fu_415_p2)
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
        end else if ((1'b1 == ap_CS_fsm_state2)) begin
            ap_done_reg <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        peak_id_temp_preg <= 17'd0;
    end else begin
        if ((~((ap_start == 1'b0) | (trunc_ln264_empty_n == 1'b0) | (ap_done_reg == 1'b1)) & (or_ln183_1_fu_304_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state1))) begin
            peak_id_temp_preg <= trunc_ln264_dout;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        pss_id_temp_preg <= 2'd0;
    end else begin
        if ((~((ap_start == 1'b0) | (trunc_ln264_empty_n == 1'b0) | (ap_done_reg == 1'b1)) & (or_ln183_1_fu_304_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state1))) begin
            pss_id_temp_preg <= select_ln183_1_fu_310_p3;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((~((ap_start == 1'b0) | (trunc_ln264_empty_n == 1'b0) | (ap_done_reg == 1'b1)) & (or_ln183_fu_268_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state1))) begin
        curr_max_V <= select_ln183_3_fu_290_p3;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state1)) begin
        ret_V_2_reg_456 <= {{r_V_8_fu_415_p2[77:66]}};
        trunc_ln264_read_reg_445 <= trunc_ln264_dout;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state2)) begin
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
    if ((1'b1 == ap_CS_fsm_state2)) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    if ((~((ap_start == 1'b0) | (trunc_ln264_empty_n == 1'b0) | (ap_done_reg == 1'b1)) & (or_ln183_1_fu_304_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state1))) begin
        peak_id_temp = trunc_ln264_dout;
    end else begin
        peak_id_temp = peak_id_temp_preg;
    end
end

always @ (*) begin
    if ((~((ap_start == 1'b0) | (trunc_ln264_empty_n == 1'b0) | (ap_done_reg == 1'b1)) & (or_ln183_1_fu_304_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state1))) begin
        peak_id_temp_ap_vld = 1'b1;
    end else begin
        peak_id_temp_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if ((~((ap_start == 1'b0) | (trunc_ln264_empty_n == 1'b0) | (ap_done_reg == 1'b1)) & (or_ln183_1_fu_304_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state1))) begin
        pss_id_temp = select_ln183_1_fu_310_p3;
    end else begin
        pss_id_temp = pss_id_temp_preg;
    end
end

always @ (*) begin
    if ((~((ap_start == 1'b0) | (trunc_ln264_empty_n == 1'b0) | (ap_done_reg == 1'b1)) & (or_ln183_1_fu_304_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state1))) begin
        pss_id_temp_ap_vld = 1'b1;
    end else begin
        pss_id_temp_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state2)) begin
        pss_rslt_temp_address0 = zext_ln192_fu_440_p1;
    end else if ((1'b1 == ap_CS_fsm_state1)) begin
        pss_rslt_temp_address0 = zext_ln191_fu_369_p1;
    end else begin
        pss_rslt_temp_address0 = 'bx;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state2) | (~((ap_start == 1'b0) | (trunc_ln264_empty_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1)))) begin
        pss_rslt_temp_ce0 = 1'b1;
    end else begin
        pss_rslt_temp_ce0 = 1'b0;
    end
end

always @ (*) begin
    if ((~((ap_start == 1'b0) | (trunc_ln264_empty_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        pss_rslt_temp_ce1 = 1'b1;
    end else begin
        pss_rslt_temp_ce1 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state2)) begin
        pss_rslt_temp_d0 = ret_V_2_reg_456;
    end else if ((1'b1 == ap_CS_fsm_state1)) begin
        pss_rslt_temp_d0 = {{r_V_7_fu_386_p2[77:66]}};
    end else begin
        pss_rslt_temp_d0 = 'bx;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state2) | (~((ap_start == 1'b0) | (trunc_ln264_empty_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1)))) begin
        pss_rslt_temp_we0 = 1'b1;
    end else begin
        pss_rslt_temp_we0 = 1'b0;
    end
end

always @ (*) begin
    if ((~((ap_start == 1'b0) | (trunc_ln264_empty_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        pss_rslt_temp_we1 = 1'b1;
    end else begin
        pss_rslt_temp_we1 = 1'b0;
    end
end

always @ (*) begin
    if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        trunc_ln264_blk_n = trunc_ln264_empty_n;
    end else begin
        trunc_ln264_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((~((ap_start == 1'b0) | (trunc_ln264_empty_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
        trunc_ln264_read = 1'b1;
    end else begin
        trunc_ln264_read = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            if ((~((ap_start == 1'b0) | (trunc_ln264_empty_n == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end
        end
        ap_ST_fsm_state2 : begin
            ap_NS_fsm = ap_ST_fsm_state1;
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign add_ln191_fu_363_p2 = (zext_ln190_1_fu_359_p1 + 18'd96000);

assign add_ln192_fu_434_p2 = (zext_ln190_fu_431_p1 + 19'd192000);

assign and_ln169_fu_206_p2 = (is_valid_0_fu_182_p2 & icmp_ln1494_fu_200_p2);

assign and_ln176_fu_226_p2 = (is_valid_1_fu_188_p2 & icmp_ln1494_1_fu_220_p2);

assign and_ln183_fu_250_p2 = (is_valid_2_fu_194_p2 & icmp_ln1494_2_fu_244_p2);

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];

always @ (*) begin
    ap_block_state1 = ((ap_start == 1'b0) | (trunc_ln264_empty_n == 1'b0) | (ap_done_reg == 1'b1));
end

assign icmp_ln1494_1_fu_220_p2 = ((select_ln169_fu_212_p3 < p_read1) ? 1'b1 : 1'b0);

assign icmp_ln1494_2_fu_244_p2 = ((select_ln176_fu_236_p3 < p_read2) ? 1'b1 : 1'b0);

assign icmp_ln1494_fu_200_p2 = ((select_ln148_fu_174_p3 < p_read) ? 1'b1 : 1'b0);

assign is_valid_0_fu_182_p2 = (($signed(zext_ln142_2_fu_160_p1) > $signed(p_read3)) ? 1'b1 : 1'b0);

assign is_valid_1_fu_188_p2 = (($signed(zext_ln142_1_fu_156_p1) > $signed(p_read3)) ? 1'b1 : 1'b0);

assign is_valid_2_fu_194_p2 = (($signed(zext_ln142_fu_152_p1) > $signed(p_read3)) ? 1'b1 : 1'b0);

assign or_ln183_1_fu_304_p2 = (or_ln183_4_fu_298_p2 | and_ln176_fu_226_p2);

assign or_ln183_2_fu_256_p2 = (xor_ln148_fu_168_p2 | and_ln169_fu_206_p2);

assign or_ln183_3_fu_262_p2 = (and_ln183_fu_250_p2 | and_ln176_fu_226_p2);

assign or_ln183_4_fu_298_p2 = (and_ln183_fu_250_p2 | and_ln169_fu_206_p2);

assign or_ln183_fu_268_p2 = (or_ln183_3_fu_262_p2 | or_ln183_2_fu_256_p2);

assign pss_rslt_temp_address1 = zext_ln534_fu_354_p1;

assign pss_rslt_temp_d1 = {{r_V_6_fu_331_p2[77:66]}};

assign r_V_2_fu_374_p3 = {{p_read1}, {22'd0}};

assign r_V_4_fu_403_p3 = {{p_read2}, {22'd0}};

assign r_V_6_fu_331_p0 = r_V_6_fu_331_p00;

assign r_V_6_fu_331_p00 = r_V_fu_319_p3;

assign r_V_6_fu_331_p1 = 78'd41943040000;

assign r_V_7_fu_386_p0 = r_V_7_fu_386_p00;

assign r_V_7_fu_386_p00 = r_V_2_fu_374_p3;

assign r_V_7_fu_386_p1 = 78'd41943040000;

assign r_V_8_fu_415_p0 = r_V_8_fu_415_p00;

assign r_V_8_fu_415_p00 = r_V_4_fu_403_p3;

assign r_V_8_fu_415_p1 = 78'd41943040000;

assign r_V_fu_319_p3 = {{p_read}, {22'd0}};

assign run_fu_146_p2 = ((trunc_ln264_dout != 17'd0) ? 1'b1 : 1'b0);

assign select_ln148_fu_174_p3 = ((run_fu_146_p2[0:0] == 1'b1) ? curr_max_V : 20'd0);

assign select_ln169_fu_212_p3 = ((and_ln169_fu_206_p2[0:0] == 1'b1) ? p_read : select_ln148_fu_174_p3);

assign select_ln176_fu_236_p3 = ((and_ln176_fu_226_p2[0:0] == 1'b1) ? p_read1 : select_ln169_fu_212_p3);

assign select_ln183_1_fu_310_p3 = ((and_ln183_fu_250_p2[0:0] == 1'b1) ? 2'd2 : zext_ln176_fu_232_p1);

assign select_ln183_2_fu_282_p3 = ((and_ln169_fu_206_p2[0:0] == 1'b1) ? p_read : 20'd0);

assign select_ln183_3_fu_290_p3 = ((or_ln183_3_fu_262_p2[0:0] == 1'b1) ? select_ln183_fu_274_p3 : select_ln183_2_fu_282_p3);

assign select_ln183_fu_274_p3 = ((and_ln183_fu_250_p2[0:0] == 1'b1) ? p_read2 : p_read1);

assign xor_ln148_fu_168_p2 = (run_fu_146_p2 ^ 1'd1);

assign zext_ln142_1_fu_156_p1 = p_read1;

assign zext_ln142_2_fu_160_p1 = p_read;

assign zext_ln142_fu_152_p1 = p_read2;

assign zext_ln176_fu_232_p1 = and_ln176_fu_226_p2;

assign zext_ln190_1_fu_359_p1 = trunc_ln264_dout;

assign zext_ln190_fu_431_p1 = trunc_ln264_read_reg_445;

assign zext_ln191_fu_369_p1 = add_ln191_fu_363_p2;

assign zext_ln192_fu_440_p1 = add_ln192_fu_434_p2;

assign zext_ln534_fu_354_p1 = trunc_ln264_dout;

endmodule //lteCellSearch_track_pss_peak
