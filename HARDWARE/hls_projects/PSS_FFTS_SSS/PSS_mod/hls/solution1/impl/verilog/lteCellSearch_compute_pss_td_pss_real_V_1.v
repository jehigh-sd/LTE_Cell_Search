// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2020.2 (64-bit)
// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// ==============================================================
`timescale 1 ns / 1 ps
module lteCellSearch_compute_pss_td_pss_real_V_1_rom (
addr0, ce0, q0, clk);

parameter DWIDTH = 22;
parameter AWIDTH = 7;
parameter MEM_SIZE = 128;

input[AWIDTH-1:0] addr0;
input ce0;
output reg[DWIDTH-1:0] q0;
input clk;

reg [DWIDTH-1:0] ram[0:MEM_SIZE-1];

initial begin
    $readmemh("./lteCellSearch_compute_pss_td_pss_real_V_1_rom.dat", ram);
end



always @(posedge clk)  
begin 
    if (ce0) 
    begin
        q0 <= ram[addr0];
    end
end



endmodule

`timescale 1 ns / 1 ps
module lteCellSearch_compute_pss_td_pss_real_V_1(
    reset,
    clk,
    address0,
    ce0,
    q0);

parameter DataWidth = 32'd22;
parameter AddressRange = 32'd128;
parameter AddressWidth = 32'd7;
input reset;
input clk;
input[AddressWidth - 1:0] address0;
input ce0;
output[DataWidth - 1:0] q0;



lteCellSearch_compute_pss_td_pss_real_V_1_rom lteCellSearch_compute_pss_td_pss_real_V_1_rom_U(
    .clk( clk ),
    .addr0( address0 ),
    .ce0( ce0 ),
    .q0( q0 ));

endmodule

