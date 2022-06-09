// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2020.2 (64-bit)
// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// ==============================================================
// control_r
// 0x00 : reserved
// 0x04 : reserved
// 0x08 : reserved
// 0x0c : reserved
// 0x10 : Data signal of OUT1
//        bit 31~0 - OUT1[31:0] (Read/Write)
// 0x14 : Data signal of OUT1
//        bit 31~0 - OUT1[63:32] (Read/Write)
// 0x18 : reserved
// 0x1c : Data signal of OUT2
//        bit 31~0 - OUT2[31:0] (Read/Write)
// 0x20 : Data signal of OUT2
//        bit 31~0 - OUT2[63:32] (Read/Write)
// 0x24 : reserved
// (SC = Self Clear, COR = Clear on Read, TOW = Toggle on Write, COH = Clear on Handshake)

#define XSSS_CORR_CONTROL_R_ADDR_OUT1_DATA 0x10
#define XSSS_CORR_CONTROL_R_BITS_OUT1_DATA 64
#define XSSS_CORR_CONTROL_R_ADDR_OUT2_DATA 0x1c
#define XSSS_CORR_CONTROL_R_BITS_OUT2_DATA 64

// control
// 0x0 : Control signals
//       bit 0  - ap_start (Read/Write/COH)
//       bit 1  - ap_done (Read/COR)
//       bit 2  - ap_idle (Read)
//       bit 3  - ap_ready (Read)
//       bit 7  - auto_restart (Read/Write)
//       others - reserved
// 0x4 : Global Interrupt Enable Register
//       bit 0  - Global Interrupt Enable (Read/Write)
//       others - reserved
// 0x8 : IP Interrupt Enable Register (Read/Write)
//       bit 0  - enable ap_done interrupt (Read/Write)
//       bit 1  - enable ap_ready interrupt (Read/Write)
//       others - reserved
// 0xc : IP Interrupt Status Register (Read/TOW)
//       bit 0  - ap_done (COR/TOW)
//       bit 1  - ap_ready (COR/TOW)
//       others - reserved
// (SC = Self Clear, COR = Clear on Read, TOW = Toggle on Write, COH = Clear on Handshake)

#define XSSS_CORR_CONTROL_ADDR_AP_CTRL 0x0
#define XSSS_CORR_CONTROL_ADDR_GIE     0x4
#define XSSS_CORR_CONTROL_ADDR_IER     0x8
#define XSSS_CORR_CONTROL_ADDR_ISR     0xc

