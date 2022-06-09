// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2020.2 (64-bit)
// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef XLTECELLSEARCH_H
#define XLTECELLSEARCH_H

#ifdef __cplusplus
extern "C" {
#endif

/***************************** Include Files *********************************/
#ifndef __linux__
#include "xil_types.h"
#include "xil_assert.h"
#include "xstatus.h"
#include "xil_io.h"
#else
#include <stdint.h>
#include <assert.h>
#include <dirent.h>
#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/mman.h>
#include <unistd.h>
#include <stddef.h>
#endif
#include "xltecellsearch_hw.h"

/**************************** Type Definitions ******************************/
#ifdef __linux__
typedef uint8_t u8;
typedef uint16_t u16;
typedef uint32_t u32;
typedef uint64_t u64;
#else
typedef struct {
    u16 DeviceId;
    u32 Control_BaseAddress;
} XLtecellsearch_Config;
#endif

typedef struct {
    u64 Control_BaseAddress;
    u32 IsReady;
} XLtecellsearch;

typedef u32 word_type;

/***************** Macros (Inline Functions) Definitions *********************/
#ifndef __linux__
#define XLtecellsearch_WriteReg(BaseAddress, RegOffset, Data) \
    Xil_Out32((BaseAddress) + (RegOffset), (u32)(Data))
#define XLtecellsearch_ReadReg(BaseAddress, RegOffset) \
    Xil_In32((BaseAddress) + (RegOffset))
#else
#define XLtecellsearch_WriteReg(BaseAddress, RegOffset, Data) \
    *(volatile u32*)((BaseAddress) + (RegOffset)) = (u32)(Data)
#define XLtecellsearch_ReadReg(BaseAddress, RegOffset) \
    *(volatile u32*)((BaseAddress) + (RegOffset))

#define Xil_AssertVoid(expr)    assert(expr)
#define Xil_AssertNonvoid(expr) assert(expr)

#define XST_SUCCESS             0
#define XST_DEVICE_NOT_FOUND    2
#define XST_OPEN_DEVICE_FAILED  3
#define XIL_COMPONENT_IS_READY  1
#endif

/************************** Function Prototypes *****************************/
#ifndef __linux__
int XLtecellsearch_Initialize(XLtecellsearch *InstancePtr, u16 DeviceId);
XLtecellsearch_Config* XLtecellsearch_LookupConfig(u16 DeviceId);
int XLtecellsearch_CfgInitialize(XLtecellsearch *InstancePtr, XLtecellsearch_Config *ConfigPtr);
#else
int XLtecellsearch_Initialize(XLtecellsearch *InstancePtr, const char* InstanceName);
int XLtecellsearch_Release(XLtecellsearch *InstancePtr);
#endif

void XLtecellsearch_Start(XLtecellsearch *InstancePtr);
u32 XLtecellsearch_IsDone(XLtecellsearch *InstancePtr);
u32 XLtecellsearch_IsIdle(XLtecellsearch *InstancePtr);
u32 XLtecellsearch_IsReady(XLtecellsearch *InstancePtr);
void XLtecellsearch_EnableAutoRestart(XLtecellsearch *InstancePtr);
void XLtecellsearch_DisableAutoRestart(XLtecellsearch *InstancePtr);

u32 XLtecellsearch_Get_OUT_PSS_ID(XLtecellsearch *InstancePtr);
u32 XLtecellsearch_Get_OUT_PSS_ID_vld(XLtecellsearch *InstancePtr);
u32 XLtecellsearch_Get_OUT_PEAK_INDEX(XLtecellsearch *InstancePtr);
u32 XLtecellsearch_Get_OUT_PEAK_INDEX_vld(XLtecellsearch *InstancePtr);
void XLtecellsearch_Set_OUT_RSLT(XLtecellsearch *InstancePtr, u64 Data);
u64 XLtecellsearch_Get_OUT_RSLT(XLtecellsearch *InstancePtr);

void XLtecellsearch_InterruptGlobalEnable(XLtecellsearch *InstancePtr);
void XLtecellsearch_InterruptGlobalDisable(XLtecellsearch *InstancePtr);
void XLtecellsearch_InterruptEnable(XLtecellsearch *InstancePtr, u32 Mask);
void XLtecellsearch_InterruptDisable(XLtecellsearch *InstancePtr, u32 Mask);
void XLtecellsearch_InterruptClear(XLtecellsearch *InstancePtr, u32 Mask);
u32 XLtecellsearch_InterruptGetEnabled(XLtecellsearch *InstancePtr);
u32 XLtecellsearch_InterruptGetStatus(XLtecellsearch *InstancePtr);

#ifdef __cplusplus
}
#endif

#endif
