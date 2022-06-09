// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2020.2 (64-bit)
// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef __linux__

#include "xstatus.h"
#include "xparameters.h"
#include "xsss_corr.h"

extern XSss_corr_Config XSss_corr_ConfigTable[];

XSss_corr_Config *XSss_corr_LookupConfig(u16 DeviceId) {
	XSss_corr_Config *ConfigPtr = NULL;

	int Index;

	for (Index = 0; Index < XPAR_XSSS_CORR_NUM_INSTANCES; Index++) {
		if (XSss_corr_ConfigTable[Index].DeviceId == DeviceId) {
			ConfigPtr = &XSss_corr_ConfigTable[Index];
			break;
		}
	}

	return ConfigPtr;
}

int XSss_corr_Initialize(XSss_corr *InstancePtr, u16 DeviceId) {
	XSss_corr_Config *ConfigPtr;

	Xil_AssertNonvoid(InstancePtr != NULL);

	ConfigPtr = XSss_corr_LookupConfig(DeviceId);
	if (ConfigPtr == NULL) {
		InstancePtr->IsReady = 0;
		return (XST_DEVICE_NOT_FOUND);
	}

	return XSss_corr_CfgInitialize(InstancePtr, ConfigPtr);
}

#endif

