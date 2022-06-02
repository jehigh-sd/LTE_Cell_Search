// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2020.2 (64-bit)
// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef __linux__

#include "xstatus.h"
#include "xparameters.h"
#include "xcp_corr_pss_sss.h"

extern XCp_corr_pss_sss_Config XCp_corr_pss_sss_ConfigTable[];

XCp_corr_pss_sss_Config *XCp_corr_pss_sss_LookupConfig(u16 DeviceId) {
	XCp_corr_pss_sss_Config *ConfigPtr = NULL;

	int Index;

	for (Index = 0; Index < XPAR_XCP_CORR_PSS_SSS_NUM_INSTANCES; Index++) {
		if (XCp_corr_pss_sss_ConfigTable[Index].DeviceId == DeviceId) {
			ConfigPtr = &XCp_corr_pss_sss_ConfigTable[Index];
			break;
		}
	}

	return ConfigPtr;
}

int XCp_corr_pss_sss_Initialize(XCp_corr_pss_sss *InstancePtr, u16 DeviceId) {
	XCp_corr_pss_sss_Config *ConfigPtr;

	Xil_AssertNonvoid(InstancePtr != NULL);

	ConfigPtr = XCp_corr_pss_sss_LookupConfig(DeviceId);
	if (ConfigPtr == NULL) {
		InstancePtr->IsReady = 0;
		return (XST_DEVICE_NOT_FOUND);
	}

	return XCp_corr_pss_sss_CfgInitialize(InstancePtr, ConfigPtr);
}

#endif

