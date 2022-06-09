// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2020.2 (64-bit)
// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef XFFT_SHIFT_H
#define XFFT_SHIFT_H

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
#include "xfft_shift_hw.h"

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
} XFft_shift_Config;
#endif

typedef struct {
    u64 Control_BaseAddress;
    u32 IsReady;
} XFft_shift;

typedef u32 word_type;

/***************** Macros (Inline Functions) Definitions *********************/
#ifndef __linux__
#define XFft_shift_WriteReg(BaseAddress, RegOffset, Data) \
    Xil_Out32((BaseAddress) + (RegOffset), (u32)(Data))
#define XFft_shift_ReadReg(BaseAddress, RegOffset) \
    Xil_In32((BaseAddress) + (RegOffset))
#else
#define XFft_shift_WriteReg(BaseAddress, RegOffset, Data) \
    *(volatile u32*)((BaseAddress) + (RegOffset)) = (u32)(Data)
#define XFft_shift_ReadReg(BaseAddress, RegOffset) \
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
int XFft_shift_Initialize(XFft_shift *InstancePtr, u16 DeviceId);
XFft_shift_Config* XFft_shift_LookupConfig(u16 DeviceId);
int XFft_shift_CfgInitialize(XFft_shift *InstancePtr, XFft_shift_Config *ConfigPtr);
#else
int XFft_shift_Initialize(XFft_shift *InstancePtr, const char* InstanceName);
int XFft_shift_Release(XFft_shift *InstancePtr);
#endif

void XFft_shift_Start(XFft_shift *InstancePtr);
u32 XFft_shift_IsDone(XFft_shift *InstancePtr);
u32 XFft_shift_IsIdle(XFft_shift *InstancePtr);
u32 XFft_shift_IsReady(XFft_shift *InstancePtr);
void XFft_shift_EnableAutoRestart(XFft_shift *InstancePtr);
void XFft_shift_DisableAutoRestart(XFft_shift *InstancePtr);


void XFft_shift_InterruptGlobalEnable(XFft_shift *InstancePtr);
void XFft_shift_InterruptGlobalDisable(XFft_shift *InstancePtr);
void XFft_shift_InterruptEnable(XFft_shift *InstancePtr, u32 Mask);
void XFft_shift_InterruptDisable(XFft_shift *InstancePtr, u32 Mask);
void XFft_shift_InterruptClear(XFft_shift *InstancePtr, u32 Mask);
u32 XFft_shift_InterruptGetEnabled(XFft_shift *InstancePtr);
u32 XFft_shift_InterruptGetStatus(XFft_shift *InstancePtr);

#ifdef __cplusplus
}
#endif

#endif
