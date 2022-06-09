// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2020.2 (64-bit)
// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// ==============================================================
/***************************** Include Files *********************************/
#include "xcp_corr_pss_sss.h"

/************************** Function Implementation *************************/
#ifndef __linux__
int XCp_corr_pss_sss_CfgInitialize(XCp_corr_pss_sss *InstancePtr, XCp_corr_pss_sss_Config *ConfigPtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(ConfigPtr != NULL);

    InstancePtr->Control_BaseAddress = ConfigPtr->Control_BaseAddress;
    InstancePtr->IsReady = XIL_COMPONENT_IS_READY;

    return XST_SUCCESS;
}
#endif

void XCp_corr_pss_sss_Start(XCp_corr_pss_sss *InstancePtr) {
    u32 Data;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XCp_corr_pss_sss_ReadReg(InstancePtr->Control_BaseAddress, XCP_CORR_PSS_SSS_CONTROL_ADDR_AP_CTRL) & 0x80;
    XCp_corr_pss_sss_WriteReg(InstancePtr->Control_BaseAddress, XCP_CORR_PSS_SSS_CONTROL_ADDR_AP_CTRL, Data | 0x01);
}

u32 XCp_corr_pss_sss_IsDone(XCp_corr_pss_sss *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XCp_corr_pss_sss_ReadReg(InstancePtr->Control_BaseAddress, XCP_CORR_PSS_SSS_CONTROL_ADDR_AP_CTRL);
    return (Data >> 1) & 0x1;
}

u32 XCp_corr_pss_sss_IsIdle(XCp_corr_pss_sss *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XCp_corr_pss_sss_ReadReg(InstancePtr->Control_BaseAddress, XCP_CORR_PSS_SSS_CONTROL_ADDR_AP_CTRL);
    return (Data >> 2) & 0x1;
}

u32 XCp_corr_pss_sss_IsReady(XCp_corr_pss_sss *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XCp_corr_pss_sss_ReadReg(InstancePtr->Control_BaseAddress, XCP_CORR_PSS_SSS_CONTROL_ADDR_AP_CTRL);
    // check ap_start to see if the pcore is ready for next input
    return !(Data & 0x1);
}

void XCp_corr_pss_sss_EnableAutoRestart(XCp_corr_pss_sss *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XCp_corr_pss_sss_WriteReg(InstancePtr->Control_BaseAddress, XCP_CORR_PSS_SSS_CONTROL_ADDR_AP_CTRL, 0x80);
}

void XCp_corr_pss_sss_DisableAutoRestart(XCp_corr_pss_sss *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XCp_corr_pss_sss_WriteReg(InstancePtr->Control_BaseAddress, XCP_CORR_PSS_SSS_CONTROL_ADDR_AP_CTRL, 0);
}

void XCp_corr_pss_sss_InterruptGlobalEnable(XCp_corr_pss_sss *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XCp_corr_pss_sss_WriteReg(InstancePtr->Control_BaseAddress, XCP_CORR_PSS_SSS_CONTROL_ADDR_GIE, 1);
}

void XCp_corr_pss_sss_InterruptGlobalDisable(XCp_corr_pss_sss *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XCp_corr_pss_sss_WriteReg(InstancePtr->Control_BaseAddress, XCP_CORR_PSS_SSS_CONTROL_ADDR_GIE, 0);
}

void XCp_corr_pss_sss_InterruptEnable(XCp_corr_pss_sss *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XCp_corr_pss_sss_ReadReg(InstancePtr->Control_BaseAddress, XCP_CORR_PSS_SSS_CONTROL_ADDR_IER);
    XCp_corr_pss_sss_WriteReg(InstancePtr->Control_BaseAddress, XCP_CORR_PSS_SSS_CONTROL_ADDR_IER, Register | Mask);
}

void XCp_corr_pss_sss_InterruptDisable(XCp_corr_pss_sss *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XCp_corr_pss_sss_ReadReg(InstancePtr->Control_BaseAddress, XCP_CORR_PSS_SSS_CONTROL_ADDR_IER);
    XCp_corr_pss_sss_WriteReg(InstancePtr->Control_BaseAddress, XCP_CORR_PSS_SSS_CONTROL_ADDR_IER, Register & (~Mask));
}

void XCp_corr_pss_sss_InterruptClear(XCp_corr_pss_sss *InstancePtr, u32 Mask) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XCp_corr_pss_sss_WriteReg(InstancePtr->Control_BaseAddress, XCP_CORR_PSS_SSS_CONTROL_ADDR_ISR, Mask);
}

u32 XCp_corr_pss_sss_InterruptGetEnabled(XCp_corr_pss_sss *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XCp_corr_pss_sss_ReadReg(InstancePtr->Control_BaseAddress, XCP_CORR_PSS_SSS_CONTROL_ADDR_IER);
}

u32 XCp_corr_pss_sss_InterruptGetStatus(XCp_corr_pss_sss *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XCp_corr_pss_sss_ReadReg(InstancePtr->Control_BaseAddress, XCP_CORR_PSS_SSS_CONTROL_ADDR_ISR);
}

