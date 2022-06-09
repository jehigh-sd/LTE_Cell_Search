// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2020.2 (64-bit)
// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef __linux__

#include "xstatus.h"
#include "xparameters.h"
#include "xfft_shift.h"

extern XFft_shift_Config XFft_shift_ConfigTable[];

XFft_shift_Config *XFft_shift_LookupConfig(u16 DeviceId) {
	XFft_shift_Config *ConfigPtr = NULL;

	int Index;

	for (Index = 0; Index < XPAR_XFFT_SHIFT_NUM_INSTANCES; Index++) {
		if (XFft_shift_ConfigTable[Index].DeviceId == DeviceId) {
			ConfigPtr = &XFft_shift_ConfigTable[Index];
			break;
		}
	}

	return ConfigPtr;
}

int XFft_shift_Initialize(XFft_shift *InstancePtr, u16 DeviceId) {
	XFft_shift_Config *ConfigPtr;

	Xil_AssertNonvoid(InstancePtr != NULL);

	ConfigPtr = XFft_shift_LookupConfig(DeviceId);
	if (ConfigPtr == NULL) {
		InstancePtr->IsReady = 0;
		return (XST_DEVICE_NOT_FOUND);
	}

	return XFft_shift_CfgInitialize(InstancePtr, ConfigPtr);
}

#endif

