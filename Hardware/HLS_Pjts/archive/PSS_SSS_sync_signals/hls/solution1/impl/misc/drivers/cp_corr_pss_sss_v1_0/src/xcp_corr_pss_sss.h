// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2020.2 (64-bit)
// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef XCP_CORR_PSS_SSS_H
#define XCP_CORR_PSS_SSS_H

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
#include "xcp_corr_pss_sss_hw.h"

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
} XCp_corr_pss_sss_Config;
#endif

typedef struct {
    u64 Control_BaseAddress;
    u32 IsReady;
} XCp_corr_pss_sss;

typedef u32 word_type;

/***************** Macros (Inline Functions) Definitions *********************/
#ifndef __linux__
#define XCp_corr_pss_sss_WriteReg(BaseAddress, RegOffset, Data) \
    Xil_Out32((BaseAddress) + (RegOffset), (u32)(Data))
#define XCp_corr_pss_sss_ReadReg(BaseAddress, RegOffset) \
    Xil_In32((BaseAddress) + (RegOffset))
#else
#define XCp_corr_pss_sss_WriteReg(BaseAddress, RegOffset, Data) \
    *(volatile u32*)((BaseAddress) + (RegOffset)) = (u32)(Data)
#define XCp_corr_pss_sss_ReadReg(BaseAddress, RegOffset) \
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
int XCp_corr_pss_sss_Initialize(XCp_corr_pss_sss *InstancePtr, u16 DeviceId);
XCp_corr_pss_sss_Config* XCp_corr_pss_sss_LookupConfig(u16 DeviceId);
int XCp_corr_pss_sss_CfgInitialize(XCp_corr_pss_sss *InstancePtr, XCp_corr_pss_sss_Config *ConfigPtr);
#else
int XCp_corr_pss_sss_Initialize(XCp_corr_pss_sss *InstancePtr, const char* InstanceName);
int XCp_corr_pss_sss_Release(XCp_corr_pss_sss *InstancePtr);
#endif

void XCp_corr_pss_sss_Start(XCp_corr_pss_sss *InstancePtr);
u32 XCp_corr_pss_sss_IsDone(XCp_corr_pss_sss *InstancePtr);
u32 XCp_corr_pss_sss_IsIdle(XCp_corr_pss_sss *InstancePtr);
u32 XCp_corr_pss_sss_IsReady(XCp_corr_pss_sss *InstancePtr);
void XCp_corr_pss_sss_EnableAutoRestart(XCp_corr_pss_sss *InstancePtr);
void XCp_corr_pss_sss_DisableAutoRestart(XCp_corr_pss_sss *InstancePtr);


void XCp_corr_pss_sss_InterruptGlobalEnable(XCp_corr_pss_sss *InstancePtr);
void XCp_corr_pss_sss_InterruptGlobalDisable(XCp_corr_pss_sss *InstancePtr);
void XCp_corr_pss_sss_InterruptEnable(XCp_corr_pss_sss *InstancePtr, u32 Mask);
void XCp_corr_pss_sss_InterruptDisable(XCp_corr_pss_sss *InstancePtr, u32 Mask);
void XCp_corr_pss_sss_InterruptClear(XCp_corr_pss_sss *InstancePtr, u32 Mask);
u32 XCp_corr_pss_sss_InterruptGetEnabled(XCp_corr_pss_sss *InstancePtr);
u32 XCp_corr_pss_sss_InterruptGetStatus(XCp_corr_pss_sss *InstancePtr);

#ifdef __cplusplus
}
#endif

#endif
