// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2020.2 (64-bit)
// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef XSSS_CORR_H
#define XSSS_CORR_H

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
#include "xsss_corr_hw.h"

/**************************** Type Definitions ******************************/
#ifdef __linux__
typedef uint8_t u8;
typedef uint16_t u16;
typedef uint32_t u32;
typedef uint64_t u64;
#else
typedef struct {
    u16 DeviceId;
    u32 Control_r_BaseAddress;
    u32 Control_BaseAddress;
} XSss_corr_Config;
#endif

typedef struct {
    u64 Control_r_BaseAddress;
    u64 Control_BaseAddress;
    u32 IsReady;
} XSss_corr;

typedef u32 word_type;

/***************** Macros (Inline Functions) Definitions *********************/
#ifndef __linux__
#define XSss_corr_WriteReg(BaseAddress, RegOffset, Data) \
    Xil_Out32((BaseAddress) + (RegOffset), (u32)(Data))
#define XSss_corr_ReadReg(BaseAddress, RegOffset) \
    Xil_In32((BaseAddress) + (RegOffset))
#else
#define XSss_corr_WriteReg(BaseAddress, RegOffset, Data) \
    *(volatile u32*)((BaseAddress) + (RegOffset)) = (u32)(Data)
#define XSss_corr_ReadReg(BaseAddress, RegOffset) \
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
int XSss_corr_Initialize(XSss_corr *InstancePtr, u16 DeviceId);
XSss_corr_Config* XSss_corr_LookupConfig(u16 DeviceId);
int XSss_corr_CfgInitialize(XSss_corr *InstancePtr, XSss_corr_Config *ConfigPtr);
#else
int XSss_corr_Initialize(XSss_corr *InstancePtr, const char* InstanceName);
int XSss_corr_Release(XSss_corr *InstancePtr);
#endif

void XSss_corr_Start(XSss_corr *InstancePtr);
u32 XSss_corr_IsDone(XSss_corr *InstancePtr);
u32 XSss_corr_IsIdle(XSss_corr *InstancePtr);
u32 XSss_corr_IsReady(XSss_corr *InstancePtr);
void XSss_corr_EnableAutoRestart(XSss_corr *InstancePtr);
void XSss_corr_DisableAutoRestart(XSss_corr *InstancePtr);

void XSss_corr_Set_OUT1(XSss_corr *InstancePtr, u64 Data);
u64 XSss_corr_Get_OUT1(XSss_corr *InstancePtr);
void XSss_corr_Set_OUT2(XSss_corr *InstancePtr, u64 Data);
u64 XSss_corr_Get_OUT2(XSss_corr *InstancePtr);

void XSss_corr_InterruptGlobalEnable(XSss_corr *InstancePtr);
void XSss_corr_InterruptGlobalDisable(XSss_corr *InstancePtr);
void XSss_corr_InterruptEnable(XSss_corr *InstancePtr, u32 Mask);
void XSss_corr_InterruptDisable(XSss_corr *InstancePtr, u32 Mask);
void XSss_corr_InterruptClear(XSss_corr *InstancePtr, u32 Mask);
u32 XSss_corr_InterruptGetEnabled(XSss_corr *InstancePtr);
u32 XSss_corr_InterruptGetStatus(XSss_corr *InstancePtr);

#ifdef __cplusplus
}
#endif

#endif
