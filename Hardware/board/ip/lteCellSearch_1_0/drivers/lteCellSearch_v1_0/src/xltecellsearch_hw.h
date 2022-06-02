// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2020.2 (64-bit)
// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// ==============================================================
// control
// 0x00 : Control signals
//        bit 0  - ap_start (Read/Write/COH)
//        bit 1  - ap_done (Read/COR)
//        bit 2  - ap_idle (Read)
//        bit 3  - ap_ready (Read)
//        bit 7  - auto_restart (Read/Write)
//        others - reserved
// 0x04 : Global Interrupt Enable Register
//        bit 0  - Global Interrupt Enable (Read/Write)
//        others - reserved
// 0x08 : IP Interrupt Enable Register (Read/Write)
//        bit 0  - enable ap_done interrupt (Read/Write)
//        bit 1  - enable ap_ready interrupt (Read/Write)
//        others - reserved
// 0x0c : IP Interrupt Status Register (Read/TOW)
//        bit 0  - ap_done (COR/TOW)
//        bit 1  - ap_ready (COR/TOW)
//        others - reserved
// 0x10 : Data signal of OUT_PSS_ID
//        bit 31~0 - OUT_PSS_ID[31:0] (Read)
// 0x14 : Control signal of OUT_PSS_ID
//        bit 0  - OUT_PSS_ID_ap_vld (Read/COR)
//        others - reserved
// 0x20 : Data signal of OUT_PEAK_INDEX
//        bit 31~0 - OUT_PEAK_INDEX[31:0] (Read)
// 0x24 : Control signal of OUT_PEAK_INDEX
//        bit 0  - OUT_PEAK_INDEX_ap_vld (Read/COR)
//        others - reserved
// 0x30 : Data signal of OUT_RSLT
//        bit 31~0 - OUT_RSLT[31:0] (Read/Write)
// 0x34 : Data signal of OUT_RSLT
//        bit 31~0 - OUT_RSLT[63:32] (Read/Write)
// 0x38 : reserved
// (SC = Self Clear, COR = Clear on Read, TOW = Toggle on Write, COH = Clear on Handshake)

#define XLTECELLSEARCH_CONTROL_ADDR_AP_CTRL             0x00
#define XLTECELLSEARCH_CONTROL_ADDR_GIE                 0x04
#define XLTECELLSEARCH_CONTROL_ADDR_IER                 0x08
#define XLTECELLSEARCH_CONTROL_ADDR_ISR                 0x0c
#define XLTECELLSEARCH_CONTROL_ADDR_OUT_PSS_ID_DATA     0x10
#define XLTECELLSEARCH_CONTROL_BITS_OUT_PSS_ID_DATA     32
#define XLTECELLSEARCH_CONTROL_ADDR_OUT_PSS_ID_CTRL     0x14
#define XLTECELLSEARCH_CONTROL_ADDR_OUT_PEAK_INDEX_DATA 0x20
#define XLTECELLSEARCH_CONTROL_BITS_OUT_PEAK_INDEX_DATA 32
#define XLTECELLSEARCH_CONTROL_ADDR_OUT_PEAK_INDEX_CTRL 0x24
#define XLTECELLSEARCH_CONTROL_ADDR_OUT_RSLT_DATA       0x30
#define XLTECELLSEARCH_CONTROL_BITS_OUT_RSLT_DATA       64

