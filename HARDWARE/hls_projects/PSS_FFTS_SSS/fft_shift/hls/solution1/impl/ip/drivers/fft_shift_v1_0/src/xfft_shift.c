// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2020.2 (64-bit)
// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// ==============================================================
/***************************** Include Files *********************************/
#include "xfft_shift.h"

/************************** Function Implementation *************************/
#ifndef __linux__
int XFft_shift_CfgInitialize(XFft_shift *InstancePtr, XFft_shift_Config *ConfigPtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(ConfigPtr != NULL);

    InstancePtr->Control_BaseAddress = ConfigPtr->Control_BaseAddress;
    InstancePtr->IsReady = XIL_COMPONENT_IS_READY;

    return XST_SUCCESS;
}
#endif

void XFft_shift_Start(XFft_shift *InstancePtr) {
    u32 Data;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XFft_shift_ReadReg(InstancePtr->Control_BaseAddress, XFFT_SHIFT_CONTROL_ADDR_AP_CTRL) & 0x80;
    XFft_shift_WriteReg(InstancePtr->Control_BaseAddress, XFFT_SHIFT_CONTROL_ADDR_AP_CTRL, Data | 0x01);
}

u32 XFft_shift_IsDone(XFft_shift *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XFft_shift_ReadReg(InstancePtr->Control_BaseAddress, XFFT_SHIFT_CONTROL_ADDR_AP_CTRL);
    return (Data >> 1) & 0x1;
}

u32 XFft_shift_IsIdle(XFft_shift *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XFft_shift_ReadReg(InstancePtr->Control_BaseAddress, XFFT_SHIFT_CONTROL_ADDR_AP_CTRL);
    return (Data >> 2) & 0x1;
}

u32 XFft_shift_IsReady(XFft_shift *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XFft_shift_ReadReg(InstancePtr->Control_BaseAddress, XFFT_SHIFT_CONTROL_ADDR_AP_CTRL);
    // check ap_start to see if the pcore is ready for next input
    return !(Data & 0x1);
}

void XFft_shift_EnableAutoRestart(XFft_shift *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XFft_shift_WriteReg(InstancePtr->Control_BaseAddress, XFFT_SHIFT_CONTROL_ADDR_AP_CTRL, 0x80);
}

void XFft_shift_DisableAutoRestart(XFft_shift *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XFft_shift_WriteReg(InstancePtr->Control_BaseAddress, XFFT_SHIFT_CONTROL_ADDR_AP_CTRL, 0);
}

void XFft_shift_InterruptGlobalEnable(XFft_shift *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XFft_shift_WriteReg(InstancePtr->Control_BaseAddress, XFFT_SHIFT_CONTROL_ADDR_GIE, 1);
}

void XFft_shift_InterruptGlobalDisable(XFft_shift *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XFft_shift_WriteReg(InstancePtr->Control_BaseAddress, XFFT_SHIFT_CONTROL_ADDR_GIE, 0);
}

void XFft_shift_InterruptEnable(XFft_shift *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XFft_shift_ReadReg(InstancePtr->Control_BaseAddress, XFFT_SHIFT_CONTROL_ADDR_IER);
    XFft_shift_WriteReg(InstancePtr->Control_BaseAddress, XFFT_SHIFT_CONTROL_ADDR_IER, Register | Mask);
}

void XFft_shift_InterruptDisable(XFft_shift *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XFft_shift_ReadReg(InstancePtr->Control_BaseAddress, XFFT_SHIFT_CONTROL_ADDR_IER);
    XFft_shift_WriteReg(InstancePtr->Control_BaseAddress, XFFT_SHIFT_CONTROL_ADDR_IER, Register & (~Mask));
}

void XFft_shift_InterruptClear(XFft_shift *InstancePtr, u32 Mask) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XFft_shift_WriteReg(InstancePtr->Control_BaseAddress, XFFT_SHIFT_CONTROL_ADDR_ISR, Mask);
}

u32 XFft_shift_InterruptGetEnabled(XFft_shift *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XFft_shift_ReadReg(InstancePtr->Control_BaseAddress, XFFT_SHIFT_CONTROL_ADDR_IER);
}

u32 XFft_shift_InterruptGetStatus(XFft_shift *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XFft_shift_ReadReg(InstancePtr->Control_BaseAddress, XFFT_SHIFT_CONTROL_ADDR_ISR);
}

