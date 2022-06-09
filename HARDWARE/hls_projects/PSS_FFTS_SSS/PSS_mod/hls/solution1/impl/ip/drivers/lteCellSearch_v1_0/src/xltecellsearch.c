// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2020.2 (64-bit)
// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// ==============================================================
/***************************** Include Files *********************************/
#include "xltecellsearch.h"

/************************** Function Implementation *************************/
#ifndef __linux__
int XLtecellsearch_CfgInitialize(XLtecellsearch *InstancePtr, XLtecellsearch_Config *ConfigPtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(ConfigPtr != NULL);

    InstancePtr->Control_BaseAddress = ConfigPtr->Control_BaseAddress;
    InstancePtr->IsReady = XIL_COMPONENT_IS_READY;

    return XST_SUCCESS;
}
#endif

void XLtecellsearch_Start(XLtecellsearch *InstancePtr) {
    u32 Data;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XLtecellsearch_ReadReg(InstancePtr->Control_BaseAddress, XLTECELLSEARCH_CONTROL_ADDR_AP_CTRL) & 0x80;
    XLtecellsearch_WriteReg(InstancePtr->Control_BaseAddress, XLTECELLSEARCH_CONTROL_ADDR_AP_CTRL, Data | 0x01);
}

u32 XLtecellsearch_IsDone(XLtecellsearch *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XLtecellsearch_ReadReg(InstancePtr->Control_BaseAddress, XLTECELLSEARCH_CONTROL_ADDR_AP_CTRL);
    return (Data >> 1) & 0x1;
}

u32 XLtecellsearch_IsIdle(XLtecellsearch *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XLtecellsearch_ReadReg(InstancePtr->Control_BaseAddress, XLTECELLSEARCH_CONTROL_ADDR_AP_CTRL);
    return (Data >> 2) & 0x1;
}

u32 XLtecellsearch_IsReady(XLtecellsearch *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XLtecellsearch_ReadReg(InstancePtr->Control_BaseAddress, XLTECELLSEARCH_CONTROL_ADDR_AP_CTRL);
    // check ap_start to see if the pcore is ready for next input
    return !(Data & 0x1);
}

void XLtecellsearch_EnableAutoRestart(XLtecellsearch *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XLtecellsearch_WriteReg(InstancePtr->Control_BaseAddress, XLTECELLSEARCH_CONTROL_ADDR_AP_CTRL, 0x80);
}

void XLtecellsearch_DisableAutoRestart(XLtecellsearch *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XLtecellsearch_WriteReg(InstancePtr->Control_BaseAddress, XLTECELLSEARCH_CONTROL_ADDR_AP_CTRL, 0);
}

u32 XLtecellsearch_Get_OUT_PSS_ID(XLtecellsearch *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XLtecellsearch_ReadReg(InstancePtr->Control_BaseAddress, XLTECELLSEARCH_CONTROL_ADDR_OUT_PSS_ID_DATA);
    return Data;
}

u32 XLtecellsearch_Get_OUT_PSS_ID_vld(XLtecellsearch *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XLtecellsearch_ReadReg(InstancePtr->Control_BaseAddress, XLTECELLSEARCH_CONTROL_ADDR_OUT_PSS_ID_CTRL);
    return Data & 0x1;
}

u32 XLtecellsearch_Get_OUT_PEAK_INDEX(XLtecellsearch *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XLtecellsearch_ReadReg(InstancePtr->Control_BaseAddress, XLTECELLSEARCH_CONTROL_ADDR_OUT_PEAK_INDEX_DATA);
    return Data;
}

u32 XLtecellsearch_Get_OUT_PEAK_INDEX_vld(XLtecellsearch *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XLtecellsearch_ReadReg(InstancePtr->Control_BaseAddress, XLTECELLSEARCH_CONTROL_ADDR_OUT_PEAK_INDEX_CTRL);
    return Data & 0x1;
}

void XLtecellsearch_Set_OUT_RSLT(XLtecellsearch *InstancePtr, u64 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XLtecellsearch_WriteReg(InstancePtr->Control_BaseAddress, XLTECELLSEARCH_CONTROL_ADDR_OUT_RSLT_DATA, (u32)(Data));
    XLtecellsearch_WriteReg(InstancePtr->Control_BaseAddress, XLTECELLSEARCH_CONTROL_ADDR_OUT_RSLT_DATA + 4, (u32)(Data >> 32));
}

u64 XLtecellsearch_Get_OUT_RSLT(XLtecellsearch *InstancePtr) {
    u64 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XLtecellsearch_ReadReg(InstancePtr->Control_BaseAddress, XLTECELLSEARCH_CONTROL_ADDR_OUT_RSLT_DATA);
    Data += (u64)XLtecellsearch_ReadReg(InstancePtr->Control_BaseAddress, XLTECELLSEARCH_CONTROL_ADDR_OUT_RSLT_DATA + 4) << 32;
    return Data;
}

void XLtecellsearch_InterruptGlobalEnable(XLtecellsearch *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XLtecellsearch_WriteReg(InstancePtr->Control_BaseAddress, XLTECELLSEARCH_CONTROL_ADDR_GIE, 1);
}

void XLtecellsearch_InterruptGlobalDisable(XLtecellsearch *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XLtecellsearch_WriteReg(InstancePtr->Control_BaseAddress, XLTECELLSEARCH_CONTROL_ADDR_GIE, 0);
}

void XLtecellsearch_InterruptEnable(XLtecellsearch *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XLtecellsearch_ReadReg(InstancePtr->Control_BaseAddress, XLTECELLSEARCH_CONTROL_ADDR_IER);
    XLtecellsearch_WriteReg(InstancePtr->Control_BaseAddress, XLTECELLSEARCH_CONTROL_ADDR_IER, Register | Mask);
}

void XLtecellsearch_InterruptDisable(XLtecellsearch *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XLtecellsearch_ReadReg(InstancePtr->Control_BaseAddress, XLTECELLSEARCH_CONTROL_ADDR_IER);
    XLtecellsearch_WriteReg(InstancePtr->Control_BaseAddress, XLTECELLSEARCH_CONTROL_ADDR_IER, Register & (~Mask));
}

void XLtecellsearch_InterruptClear(XLtecellsearch *InstancePtr, u32 Mask) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XLtecellsearch_WriteReg(InstancePtr->Control_BaseAddress, XLTECELLSEARCH_CONTROL_ADDR_ISR, Mask);
}

u32 XLtecellsearch_InterruptGetEnabled(XLtecellsearch *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XLtecellsearch_ReadReg(InstancePtr->Control_BaseAddress, XLTECELLSEARCH_CONTROL_ADDR_IER);
}

u32 XLtecellsearch_InterruptGetStatus(XLtecellsearch *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XLtecellsearch_ReadReg(InstancePtr->Control_BaseAddress, XLTECELLSEARCH_CONTROL_ADDR_ISR);
}

