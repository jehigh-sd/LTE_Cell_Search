// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2020.2 (64-bit)
// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef __linux__

#include "xstatus.h"
#include "xparameters.h"
#include "xltecellsearch.h"

extern XLtecellsearch_Config XLtecellsearch_ConfigTable[];

XLtecellsearch_Config *XLtecellsearch_LookupConfig(u16 DeviceId) {
	XLtecellsearch_Config *ConfigPtr = NULL;

	int Index;

	for (Index = 0; Index < XPAR_XLTECELLSEARCH_NUM_INSTANCES; Index++) {
		if (XLtecellsearch_ConfigTable[Index].DeviceId == DeviceId) {
			ConfigPtr = &XLtecellsearch_ConfigTable[Index];
			break;
		}
	}

	return ConfigPtr;
}

int XLtecellsearch_Initialize(XLtecellsearch *InstancePtr, u16 DeviceId) {
	XLtecellsearch_Config *ConfigPtr;

	Xil_AssertNonvoid(InstancePtr != NULL);

	ConfigPtr = XLtecellsearch_LookupConfig(DeviceId);
	if (ConfigPtr == NULL) {
		InstancePtr->IsReady = 0;
		return (XST_DEVICE_NOT_FOUND);
	}

	return XLtecellsearch_CfgInitialize(InstancePtr, ConfigPtr);
}

#endif

