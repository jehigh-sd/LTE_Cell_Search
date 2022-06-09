// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2020.2 (64-bit)
// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// ==============================================================

`timescale 1 ns / 1 ps

module lteCellSearch_mul_2ns_18ns_19_1_1_Multiplier_9(a, b, p);
input[2 - 1 : 0] a; 
input[18 - 1 : 0] b; 
output[19 - 1 : 0] p;

assign p = $signed({1'b0, a}) * $signed({1'b0, b});
endmodule
`timescale 1 ns / 1 ps
module lteCellSearch_mul_2ns_18ns_19_1_1(
    din0,
    din1,
    dout);

parameter ID = 32'd1;
parameter NUM_STAGE = 32'd1;
parameter din0_WIDTH = 32'd1;
parameter din1_WIDTH = 32'd1;
parameter dout_WIDTH = 32'd1;
input[din0_WIDTH - 1:0] din0;
input[din1_WIDTH - 1:0] din1;
output[dout_WIDTH - 1:0] dout;



lteCellSearch_mul_2ns_18ns_19_1_1_Multiplier_9 lteCellSearch_mul_2ns_18ns_19_1_1_Multiplier_9_U(
    .a( din0 ),
    .b( din1 ),
    .p( dout ));

endmodule

