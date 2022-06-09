; ModuleID = '/home/jhigh/Capstone_Project/main/Hardware/HLS_Pjts/PSS_SSS_sync_signals/hls/solution1/.autopilot/db/a.g.ld.5.gdce.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-i64:64-i128:128-i256:256-i512:512-i1024:1024-i2048:2048-i4096:4096-n8:16:32:64-S128-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024"
target triple = "fpga64-xilinx-none"

%"class.hls::stream" = type { %"struct.hls::axis" }
%"struct.hls::axis" = type { float, %struct.ap_uint, %struct.ap_uint, %struct.ap_uint.0, %struct.ap_uint.0, %struct.ap_uint.0, %struct.ap_uint.0 }
%struct.ap_uint = type { %struct.ap_int_base }
%struct.ap_int_base = type { %struct.ssdm_int }
%struct.ssdm_int = type { i4 }
%struct.ap_uint.0 = type { %struct.ap_int_base.1 }
%struct.ap_int_base.1 = type { %struct.ssdm_int.2 }
%struct.ssdm_int.2 = type { i1 }
%"class.hls::stream.7" = type { %"struct.hls::axis.3" }
%"struct.hls::axis.3" = type { %struct.C_DATA, %struct.ap_uint.4, %struct.ap_uint.4, %struct.ap_uint.0, %struct.ap_uint.0, %struct.ap_uint.0, %struct.ap_uint.0 }
%struct.C_DATA = type { float, float }
%struct.ap_uint.4 = type { %struct.ap_int_base.5 }
%struct.ap_int_base.5 = type { %struct.ssdm_int.6 }
%struct.ssdm_int.6 = type { i8 }

; Function Attrs: noinline
define void @apatb_cp_corr_pss_sss_ir(%"class.hls::stream"* %IN_R, %"class.hls::stream"* %IN_I, %"class.hls::stream.7"* %sss_1_PSS_1, %"class.hls::stream.7"* %sss_1_PSS_2, %"class.hls::stream.7"* %sss_2_PSS_1, %"class.hls::stream.7"* %sss_2_PSS_2) local_unnamed_addr #0 {
entry:
  %IN_R_copy = alloca [128 x %"class.hls::stream"], align 512
  %IN_I_copy = alloca [128 x %"class.hls::stream"], align 512
  %sss_1_PSS_1_copy = alloca [168 x %"class.hls::stream.7"], align 512
  %sss_1_PSS_2_copy = alloca [168 x %"class.hls::stream.7"], align 512
  %sss_2_PSS_1_copy = alloca [168 x %"class.hls::stream.7"], align 512
  %sss_2_PSS_2_copy = alloca [168 x %"class.hls::stream.7"], align 512
  %0 = bitcast %"class.hls::stream"* %IN_R to [128 x %"class.hls::stream"]*
  %1 = bitcast %"class.hls::stream"* %IN_I to [128 x %"class.hls::stream"]*
  %2 = bitcast %"class.hls::stream.7"* %sss_1_PSS_1 to [168 x %"class.hls::stream.7"]*
  %3 = bitcast %"class.hls::stream.7"* %sss_1_PSS_2 to [168 x %"class.hls::stream.7"]*
  %4 = bitcast %"class.hls::stream.7"* %sss_2_PSS_1 to [168 x %"class.hls::stream.7"]*
  %5 = bitcast %"class.hls::stream.7"* %sss_2_PSS_2 to [168 x %"class.hls::stream.7"]*
  call fastcc void @copy_in([128 x %"class.hls::stream"]* %0, [128 x %"class.hls::stream"]* nonnull align 512 %IN_R_copy, [128 x %"class.hls::stream"]* %1, [128 x %"class.hls::stream"]* nonnull align 512 %IN_I_copy, [168 x %"class.hls::stream.7"]* %2, [168 x %"class.hls::stream.7"]* nonnull align 512 %sss_1_PSS_1_copy, [168 x %"class.hls::stream.7"]* %3, [168 x %"class.hls::stream.7"]* nonnull align 512 %sss_1_PSS_2_copy, [168 x %"class.hls::stream.7"]* %4, [168 x %"class.hls::stream.7"]* nonnull align 512 %sss_2_PSS_1_copy, [168 x %"class.hls::stream.7"]* %5, [168 x %"class.hls::stream.7"]* nonnull align 512 %sss_2_PSS_2_copy)
  %6 = getelementptr inbounds [128 x %"class.hls::stream"], [128 x %"class.hls::stream"]* %IN_R_copy, i32 0, i32 0
  %7 = getelementptr inbounds [128 x %"class.hls::stream"], [128 x %"class.hls::stream"]* %IN_I_copy, i32 0, i32 0
  %8 = getelementptr inbounds [168 x %"class.hls::stream.7"], [168 x %"class.hls::stream.7"]* %sss_1_PSS_1_copy, i32 0, i32 0
  %9 = getelementptr inbounds [168 x %"class.hls::stream.7"], [168 x %"class.hls::stream.7"]* %sss_1_PSS_2_copy, i32 0, i32 0
  %10 = getelementptr inbounds [168 x %"class.hls::stream.7"], [168 x %"class.hls::stream.7"]* %sss_2_PSS_1_copy, i32 0, i32 0
  %11 = getelementptr inbounds [168 x %"class.hls::stream.7"], [168 x %"class.hls::stream.7"]* %sss_2_PSS_2_copy, i32 0, i32 0
  call void @apatb_cp_corr_pss_sss_hw(%"class.hls::stream"* %6, %"class.hls::stream"* %7, %"class.hls::stream.7"* %8, %"class.hls::stream.7"* %9, %"class.hls::stream.7"* %10, %"class.hls::stream.7"* %11)
  call fastcc void @copy_out([128 x %"class.hls::stream"]* %0, [128 x %"class.hls::stream"]* nonnull align 512 %IN_R_copy, [128 x %"class.hls::stream"]* %1, [128 x %"class.hls::stream"]* nonnull align 512 %IN_I_copy, [168 x %"class.hls::stream.7"]* %2, [168 x %"class.hls::stream.7"]* nonnull align 512 %sss_1_PSS_1_copy, [168 x %"class.hls::stream.7"]* %3, [168 x %"class.hls::stream.7"]* nonnull align 512 %sss_1_PSS_2_copy, [168 x %"class.hls::stream.7"]* %4, [168 x %"class.hls::stream.7"]* nonnull align 512 %sss_2_PSS_1_copy, [168 x %"class.hls::stream.7"]* %5, [168 x %"class.hls::stream.7"]* nonnull align 512 %sss_2_PSS_2_copy)
  ret void
}

; Function Attrs: noinline
define internal fastcc void @copy_in([128 x %"class.hls::stream"]*, [128 x %"class.hls::stream"]* noalias align 512, [128 x %"class.hls::stream"]*, [128 x %"class.hls::stream"]* noalias align 512, [168 x %"class.hls::stream.7"]*, [168 x %"class.hls::stream.7"]* noalias align 512, [168 x %"class.hls::stream.7"]*, [168 x %"class.hls::stream.7"]* noalias align 512, [168 x %"class.hls::stream.7"]*, [168 x %"class.hls::stream.7"]* noalias align 512, [168 x %"class.hls::stream.7"]*, [168 x %"class.hls::stream.7"]* noalias align 512) unnamed_addr #1 {
entry:
  call fastcc void @"onebyonecpy_hls.p0a128class.hls::stream"([128 x %"class.hls::stream"]* align 512 %1, [128 x %"class.hls::stream"]* %0)
  call fastcc void @"onebyonecpy_hls.p0a128class.hls::stream"([128 x %"class.hls::stream"]* align 512 %3, [128 x %"class.hls::stream"]* %2)
  call fastcc void @"onebyonecpy_hls.p0a168class.hls::stream.7"([168 x %"class.hls::stream.7"]* align 512 %5, [168 x %"class.hls::stream.7"]* %4)
  call fastcc void @"onebyonecpy_hls.p0a168class.hls::stream.7"([168 x %"class.hls::stream.7"]* align 512 %7, [168 x %"class.hls::stream.7"]* %6)
  call fastcc void @"onebyonecpy_hls.p0a168class.hls::stream.7"([168 x %"class.hls::stream.7"]* align 512 %9, [168 x %"class.hls::stream.7"]* %8)
  call fastcc void @"onebyonecpy_hls.p0a168class.hls::stream.7"([168 x %"class.hls::stream.7"]* align 512 %11, [168 x %"class.hls::stream.7"]* %10)
  ret void
}

; Function Attrs: noinline
define internal fastcc void @"onebyonecpy_hls.p0a128class.hls::stream"([128 x %"class.hls::stream"]* noalias align 512, [128 x %"class.hls::stream"]* noalias) unnamed_addr #2 {
entry:
  %2 = icmp eq [128 x %"class.hls::stream"]* %0, null
  %3 = icmp eq [128 x %"class.hls::stream"]* %1, null
  %4 = or i1 %2, %3
  br i1 %4, label %ret, label %copy

copy:                                             ; preds = %entry
  br label %for.loop

for.loop:                                         ; preds = %for.loop.head, %copy
  %for.loop.idx67 = phi i64 [ 0, %copy ], [ %for.loop.idx.next, %for.loop.head ]
  %dst.addr = getelementptr [128 x %"class.hls::stream"], [128 x %"class.hls::stream"]* %0, i64 0, i64 %for.loop.idx67
  %src.addr = getelementptr [128 x %"class.hls::stream"], [128 x %"class.hls::stream"]* %1, i64 0, i64 %for.loop.idx67
  %5 = bitcast %"class.hls::stream"* %src.addr to i8*
  %6 = call i1 @fpga_fifo_exist_12(i8* %5)
  br i1 %6, label %7, label %8

; <label>:7:                                      ; preds = %for.loop
  call fastcc void @"streamcpy_hls.p0class.hls::stream"(%"class.hls::stream"* %dst.addr, %"class.hls::stream"* %src.addr)
  br label %for.loop.head

; <label>:8:                                      ; preds = %for.loop
  %dst.addr.0.04.gep53 = getelementptr [128 x %"class.hls::stream"], [128 x %"class.hls::stream"]* %0, i64 0, i64 %for.loop.idx67, i32 0, i32 0
  %9 = bitcast float* %dst.addr.0.04.gep53 to i8*
  %src.addr.0.03.gep54 = getelementptr [128 x %"class.hls::stream"], [128 x %"class.hls::stream"]* %1, i64 0, i64 %for.loop.idx67, i32 0, i32 0
  %10 = bitcast float* %src.addr.0.03.gep54 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %9, i8* align 1 %10, i64 4, i1 false)
  %src.addr.0.15 = getelementptr [128 x %"class.hls::stream"], [128 x %"class.hls::stream"]* %1, i64 0, i64 %for.loop.idx67, i32 0, i32 1
  %dst.addr.0.16 = getelementptr [128 x %"class.hls::stream"], [128 x %"class.hls::stream"]* %0, i64 0, i64 %for.loop.idx67, i32 0, i32 1
  %11 = bitcast %struct.ap_uint* %src.addr.0.15 to i8*
  %12 = call i1 @fpga_fifo_exist_1(i8* %11)
  br i1 %12, label %13, label %14

; <label>:13:                                     ; preds = %8
  call fastcc void @streamcpy_hls.p0struct.ap_uint(%struct.ap_uint* %dst.addr.0.16, %struct.ap_uint* %src.addr.0.15)
  br label %25

; <label>:14:                                     ; preds = %8
  %src.addr.0.1.07 = getelementptr [128 x %"class.hls::stream"], [128 x %"class.hls::stream"]* %1, i64 0, i64 %for.loop.idx67, i32 0, i32 1, i32 0
  %dst.addr.0.1.08 = getelementptr [128 x %"class.hls::stream"], [128 x %"class.hls::stream"]* %0, i64 0, i64 %for.loop.idx67, i32 0, i32 1, i32 0
  %15 = bitcast %struct.ap_int_base* %src.addr.0.1.07 to i8*
  %16 = call i1 @fpga_fifo_exist_1(i8* %15)
  br i1 %16, label %17, label %18

; <label>:17:                                     ; preds = %14
  call fastcc void @streamcpy_hls.p0struct.ap_int_base(%struct.ap_int_base* %dst.addr.0.1.08, %struct.ap_int_base* %src.addr.0.1.07)
  br label %25

; <label>:18:                                     ; preds = %14
  %src.addr.0.1.0.09 = getelementptr [128 x %"class.hls::stream"], [128 x %"class.hls::stream"]* %1, i64 0, i64 %for.loop.idx67, i32 0, i32 1, i32 0, i32 0
  %dst.addr.0.1.0.010 = getelementptr [128 x %"class.hls::stream"], [128 x %"class.hls::stream"]* %0, i64 0, i64 %for.loop.idx67, i32 0, i32 1, i32 0, i32 0
  %19 = bitcast %struct.ssdm_int* %src.addr.0.1.0.09 to i8*
  %20 = call i1 @fpga_fifo_exist_1(i8* %19)
  br i1 %20, label %21, label %22

; <label>:21:                                     ; preds = %18
  call fastcc void @streamcpy_hls.p0struct.ssdm_int(%struct.ssdm_int* %dst.addr.0.1.0.010, %struct.ssdm_int* %src.addr.0.1.0.09)
  br label %25

; <label>:22:                                     ; preds = %18
  %dst.addr.0.1.0.0.012.gep55 = getelementptr [128 x %"class.hls::stream"], [128 x %"class.hls::stream"]* %0, i64 0, i64 %for.loop.idx67, i32 0, i32 1, i32 0, i32 0, i32 0
  %23 = bitcast i4* %dst.addr.0.1.0.0.012.gep55 to i8*
  %src.addr.0.1.0.0.011.gep56 = getelementptr [128 x %"class.hls::stream"], [128 x %"class.hls::stream"]* %1, i64 0, i64 %for.loop.idx67, i32 0, i32 1, i32 0, i32 0, i32 0
  %24 = bitcast i4* %src.addr.0.1.0.0.011.gep56 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %23, i8* align 1 %24, i64 1, i1 false)
  br label %25

; <label>:25:                                     ; preds = %22, %21, %17, %13
  %src.addr.0.213 = getelementptr [128 x %"class.hls::stream"], [128 x %"class.hls::stream"]* %1, i64 0, i64 %for.loop.idx67, i32 0, i32 2
  %dst.addr.0.214 = getelementptr [128 x %"class.hls::stream"], [128 x %"class.hls::stream"]* %0, i64 0, i64 %for.loop.idx67, i32 0, i32 2
  %26 = bitcast %struct.ap_uint* %src.addr.0.213 to i8*
  %27 = call i1 @fpga_fifo_exist_1(i8* %26)
  br i1 %27, label %28, label %29

; <label>:28:                                     ; preds = %25
  call fastcc void @streamcpy_hls.p0struct.ap_uint(%struct.ap_uint* %dst.addr.0.214, %struct.ap_uint* %src.addr.0.213)
  br label %40

; <label>:29:                                     ; preds = %25
  %src.addr.0.2.015 = getelementptr [128 x %"class.hls::stream"], [128 x %"class.hls::stream"]* %1, i64 0, i64 %for.loop.idx67, i32 0, i32 2, i32 0
  %dst.addr.0.2.016 = getelementptr [128 x %"class.hls::stream"], [128 x %"class.hls::stream"]* %0, i64 0, i64 %for.loop.idx67, i32 0, i32 2, i32 0
  %30 = bitcast %struct.ap_int_base* %src.addr.0.2.015 to i8*
  %31 = call i1 @fpga_fifo_exist_1(i8* %30)
  br i1 %31, label %32, label %33

; <label>:32:                                     ; preds = %29
  call fastcc void @streamcpy_hls.p0struct.ap_int_base(%struct.ap_int_base* %dst.addr.0.2.016, %struct.ap_int_base* %src.addr.0.2.015)
  br label %40

; <label>:33:                                     ; preds = %29
  %src.addr.0.2.0.017 = getelementptr [128 x %"class.hls::stream"], [128 x %"class.hls::stream"]* %1, i64 0, i64 %for.loop.idx67, i32 0, i32 2, i32 0, i32 0
  %dst.addr.0.2.0.018 = getelementptr [128 x %"class.hls::stream"], [128 x %"class.hls::stream"]* %0, i64 0, i64 %for.loop.idx67, i32 0, i32 2, i32 0, i32 0
  %34 = bitcast %struct.ssdm_int* %src.addr.0.2.0.017 to i8*
  %35 = call i1 @fpga_fifo_exist_1(i8* %34)
  br i1 %35, label %36, label %37

; <label>:36:                                     ; preds = %33
  call fastcc void @streamcpy_hls.p0struct.ssdm_int(%struct.ssdm_int* %dst.addr.0.2.0.018, %struct.ssdm_int* %src.addr.0.2.0.017)
  br label %40

; <label>:37:                                     ; preds = %33
  %dst.addr.0.2.0.0.020.gep57 = getelementptr [128 x %"class.hls::stream"], [128 x %"class.hls::stream"]* %0, i64 0, i64 %for.loop.idx67, i32 0, i32 2, i32 0, i32 0, i32 0
  %38 = bitcast i4* %dst.addr.0.2.0.0.020.gep57 to i8*
  %src.addr.0.2.0.0.019.gep58 = getelementptr [128 x %"class.hls::stream"], [128 x %"class.hls::stream"]* %1, i64 0, i64 %for.loop.idx67, i32 0, i32 2, i32 0, i32 0, i32 0
  %39 = bitcast i4* %src.addr.0.2.0.0.019.gep58 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %38, i8* align 1 %39, i64 1, i1 false)
  br label %40

; <label>:40:                                     ; preds = %37, %36, %32, %28
  %src.addr.0.321 = getelementptr [128 x %"class.hls::stream"], [128 x %"class.hls::stream"]* %1, i64 0, i64 %for.loop.idx67, i32 0, i32 3
  %dst.addr.0.322 = getelementptr [128 x %"class.hls::stream"], [128 x %"class.hls::stream"]* %0, i64 0, i64 %for.loop.idx67, i32 0, i32 3
  %41 = bitcast %struct.ap_uint.0* %src.addr.0.321 to i8*
  %42 = call i1 @fpga_fifo_exist_1(i8* %41)
  br i1 %42, label %43, label %44

; <label>:43:                                     ; preds = %40
  call fastcc void @streamcpy_hls.p0struct.ap_uint.0(%struct.ap_uint.0* %dst.addr.0.322, %struct.ap_uint.0* %src.addr.0.321)
  br label %55

; <label>:44:                                     ; preds = %40
  %src.addr.0.3.023 = getelementptr [128 x %"class.hls::stream"], [128 x %"class.hls::stream"]* %1, i64 0, i64 %for.loop.idx67, i32 0, i32 3, i32 0
  %dst.addr.0.3.024 = getelementptr [128 x %"class.hls::stream"], [128 x %"class.hls::stream"]* %0, i64 0, i64 %for.loop.idx67, i32 0, i32 3, i32 0
  %45 = bitcast %struct.ap_int_base.1* %src.addr.0.3.023 to i8*
  %46 = call i1 @fpga_fifo_exist_1(i8* %45)
  br i1 %46, label %47, label %48

; <label>:47:                                     ; preds = %44
  call fastcc void @streamcpy_hls.p0struct.ap_int_base.1(%struct.ap_int_base.1* %dst.addr.0.3.024, %struct.ap_int_base.1* %src.addr.0.3.023)
  br label %55

; <label>:48:                                     ; preds = %44
  %src.addr.0.3.0.025 = getelementptr [128 x %"class.hls::stream"], [128 x %"class.hls::stream"]* %1, i64 0, i64 %for.loop.idx67, i32 0, i32 3, i32 0, i32 0
  %dst.addr.0.3.0.026 = getelementptr [128 x %"class.hls::stream"], [128 x %"class.hls::stream"]* %0, i64 0, i64 %for.loop.idx67, i32 0, i32 3, i32 0, i32 0
  %49 = bitcast %struct.ssdm_int.2* %src.addr.0.3.0.025 to i8*
  %50 = call i1 @fpga_fifo_exist_1(i8* %49)
  br i1 %50, label %51, label %52

; <label>:51:                                     ; preds = %48
  call fastcc void @streamcpy_hls.p0struct.ssdm_int.2(%struct.ssdm_int.2* %dst.addr.0.3.0.026, %struct.ssdm_int.2* %src.addr.0.3.0.025)
  br label %55

; <label>:52:                                     ; preds = %48
  %dst.addr.0.3.0.0.028.gep59 = getelementptr [128 x %"class.hls::stream"], [128 x %"class.hls::stream"]* %0, i64 0, i64 %for.loop.idx67, i32 0, i32 3, i32 0, i32 0, i32 0
  %53 = bitcast i1* %dst.addr.0.3.0.0.028.gep59 to i8*
  %src.addr.0.3.0.0.027.gep60 = getelementptr [128 x %"class.hls::stream"], [128 x %"class.hls::stream"]* %1, i64 0, i64 %for.loop.idx67, i32 0, i32 3, i32 0, i32 0, i32 0
  %54 = bitcast i1* %src.addr.0.3.0.0.027.gep60 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %53, i8* align 1 %54, i64 1, i1 false)
  br label %55

; <label>:55:                                     ; preds = %52, %51, %47, %43
  %src.addr.0.429 = getelementptr [128 x %"class.hls::stream"], [128 x %"class.hls::stream"]* %1, i64 0, i64 %for.loop.idx67, i32 0, i32 4
  %dst.addr.0.430 = getelementptr [128 x %"class.hls::stream"], [128 x %"class.hls::stream"]* %0, i64 0, i64 %for.loop.idx67, i32 0, i32 4
  %56 = bitcast %struct.ap_uint.0* %src.addr.0.429 to i8*
  %57 = call i1 @fpga_fifo_exist_1(i8* %56)
  br i1 %57, label %58, label %59

; <label>:58:                                     ; preds = %55
  call fastcc void @streamcpy_hls.p0struct.ap_uint.0(%struct.ap_uint.0* %dst.addr.0.430, %struct.ap_uint.0* %src.addr.0.429)
  br label %70

; <label>:59:                                     ; preds = %55
  %src.addr.0.4.031 = getelementptr [128 x %"class.hls::stream"], [128 x %"class.hls::stream"]* %1, i64 0, i64 %for.loop.idx67, i32 0, i32 4, i32 0
  %dst.addr.0.4.032 = getelementptr [128 x %"class.hls::stream"], [128 x %"class.hls::stream"]* %0, i64 0, i64 %for.loop.idx67, i32 0, i32 4, i32 0
  %60 = bitcast %struct.ap_int_base.1* %src.addr.0.4.031 to i8*
  %61 = call i1 @fpga_fifo_exist_1(i8* %60)
  br i1 %61, label %62, label %63

; <label>:62:                                     ; preds = %59
  call fastcc void @streamcpy_hls.p0struct.ap_int_base.1(%struct.ap_int_base.1* %dst.addr.0.4.032, %struct.ap_int_base.1* %src.addr.0.4.031)
  br label %70

; <label>:63:                                     ; preds = %59
  %src.addr.0.4.0.033 = getelementptr [128 x %"class.hls::stream"], [128 x %"class.hls::stream"]* %1, i64 0, i64 %for.loop.idx67, i32 0, i32 4, i32 0, i32 0
  %dst.addr.0.4.0.034 = getelementptr [128 x %"class.hls::stream"], [128 x %"class.hls::stream"]* %0, i64 0, i64 %for.loop.idx67, i32 0, i32 4, i32 0, i32 0
  %64 = bitcast %struct.ssdm_int.2* %src.addr.0.4.0.033 to i8*
  %65 = call i1 @fpga_fifo_exist_1(i8* %64)
  br i1 %65, label %66, label %67

; <label>:66:                                     ; preds = %63
  call fastcc void @streamcpy_hls.p0struct.ssdm_int.2(%struct.ssdm_int.2* %dst.addr.0.4.0.034, %struct.ssdm_int.2* %src.addr.0.4.0.033)
  br label %70

; <label>:67:                                     ; preds = %63
  %dst.addr.0.4.0.0.036.gep61 = getelementptr [128 x %"class.hls::stream"], [128 x %"class.hls::stream"]* %0, i64 0, i64 %for.loop.idx67, i32 0, i32 4, i32 0, i32 0, i32 0
  %68 = bitcast i1* %dst.addr.0.4.0.0.036.gep61 to i8*
  %src.addr.0.4.0.0.035.gep62 = getelementptr [128 x %"class.hls::stream"], [128 x %"class.hls::stream"]* %1, i64 0, i64 %for.loop.idx67, i32 0, i32 4, i32 0, i32 0, i32 0
  %69 = bitcast i1* %src.addr.0.4.0.0.035.gep62 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %68, i8* align 1 %69, i64 1, i1 false)
  br label %70

; <label>:70:                                     ; preds = %67, %66, %62, %58
  %src.addr.0.537 = getelementptr [128 x %"class.hls::stream"], [128 x %"class.hls::stream"]* %1, i64 0, i64 %for.loop.idx67, i32 0, i32 5
  %dst.addr.0.538 = getelementptr [128 x %"class.hls::stream"], [128 x %"class.hls::stream"]* %0, i64 0, i64 %for.loop.idx67, i32 0, i32 5
  %71 = bitcast %struct.ap_uint.0* %src.addr.0.537 to i8*
  %72 = call i1 @fpga_fifo_exist_1(i8* %71)
  br i1 %72, label %73, label %74

; <label>:73:                                     ; preds = %70
  call fastcc void @streamcpy_hls.p0struct.ap_uint.0(%struct.ap_uint.0* %dst.addr.0.538, %struct.ap_uint.0* %src.addr.0.537)
  br label %85

; <label>:74:                                     ; preds = %70
  %src.addr.0.5.039 = getelementptr [128 x %"class.hls::stream"], [128 x %"class.hls::stream"]* %1, i64 0, i64 %for.loop.idx67, i32 0, i32 5, i32 0
  %dst.addr.0.5.040 = getelementptr [128 x %"class.hls::stream"], [128 x %"class.hls::stream"]* %0, i64 0, i64 %for.loop.idx67, i32 0, i32 5, i32 0
  %75 = bitcast %struct.ap_int_base.1* %src.addr.0.5.039 to i8*
  %76 = call i1 @fpga_fifo_exist_1(i8* %75)
  br i1 %76, label %77, label %78

; <label>:77:                                     ; preds = %74
  call fastcc void @streamcpy_hls.p0struct.ap_int_base.1(%struct.ap_int_base.1* %dst.addr.0.5.040, %struct.ap_int_base.1* %src.addr.0.5.039)
  br label %85

; <label>:78:                                     ; preds = %74
  %src.addr.0.5.0.041 = getelementptr [128 x %"class.hls::stream"], [128 x %"class.hls::stream"]* %1, i64 0, i64 %for.loop.idx67, i32 0, i32 5, i32 0, i32 0
  %dst.addr.0.5.0.042 = getelementptr [128 x %"class.hls::stream"], [128 x %"class.hls::stream"]* %0, i64 0, i64 %for.loop.idx67, i32 0, i32 5, i32 0, i32 0
  %79 = bitcast %struct.ssdm_int.2* %src.addr.0.5.0.041 to i8*
  %80 = call i1 @fpga_fifo_exist_1(i8* %79)
  br i1 %80, label %81, label %82

; <label>:81:                                     ; preds = %78
  call fastcc void @streamcpy_hls.p0struct.ssdm_int.2(%struct.ssdm_int.2* %dst.addr.0.5.0.042, %struct.ssdm_int.2* %src.addr.0.5.0.041)
  br label %85

; <label>:82:                                     ; preds = %78
  %dst.addr.0.5.0.0.044.gep63 = getelementptr [128 x %"class.hls::stream"], [128 x %"class.hls::stream"]* %0, i64 0, i64 %for.loop.idx67, i32 0, i32 5, i32 0, i32 0, i32 0
  %83 = bitcast i1* %dst.addr.0.5.0.0.044.gep63 to i8*
  %src.addr.0.5.0.0.043.gep64 = getelementptr [128 x %"class.hls::stream"], [128 x %"class.hls::stream"]* %1, i64 0, i64 %for.loop.idx67, i32 0, i32 5, i32 0, i32 0, i32 0
  %84 = bitcast i1* %src.addr.0.5.0.0.043.gep64 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %83, i8* align 1 %84, i64 1, i1 false)
  br label %85

; <label>:85:                                     ; preds = %82, %81, %77, %73
  %src.addr.0.645 = getelementptr [128 x %"class.hls::stream"], [128 x %"class.hls::stream"]* %1, i64 0, i64 %for.loop.idx67, i32 0, i32 6
  %dst.addr.0.646 = getelementptr [128 x %"class.hls::stream"], [128 x %"class.hls::stream"]* %0, i64 0, i64 %for.loop.idx67, i32 0, i32 6
  %86 = bitcast %struct.ap_uint.0* %src.addr.0.645 to i8*
  %87 = call i1 @fpga_fifo_exist_1(i8* %86)
  br i1 %87, label %88, label %89

; <label>:88:                                     ; preds = %85
  call fastcc void @streamcpy_hls.p0struct.ap_uint.0(%struct.ap_uint.0* %dst.addr.0.646, %struct.ap_uint.0* %src.addr.0.645)
  br label %for.loop.head

; <label>:89:                                     ; preds = %85
  %src.addr.0.6.047 = getelementptr [128 x %"class.hls::stream"], [128 x %"class.hls::stream"]* %1, i64 0, i64 %for.loop.idx67, i32 0, i32 6, i32 0
  %dst.addr.0.6.048 = getelementptr [128 x %"class.hls::stream"], [128 x %"class.hls::stream"]* %0, i64 0, i64 %for.loop.idx67, i32 0, i32 6, i32 0
  %90 = bitcast %struct.ap_int_base.1* %src.addr.0.6.047 to i8*
  %91 = call i1 @fpga_fifo_exist_1(i8* %90)
  br i1 %91, label %92, label %93

; <label>:92:                                     ; preds = %89
  call fastcc void @streamcpy_hls.p0struct.ap_int_base.1(%struct.ap_int_base.1* %dst.addr.0.6.048, %struct.ap_int_base.1* %src.addr.0.6.047)
  br label %for.loop.head

; <label>:93:                                     ; preds = %89
  %src.addr.0.6.0.049 = getelementptr [128 x %"class.hls::stream"], [128 x %"class.hls::stream"]* %1, i64 0, i64 %for.loop.idx67, i32 0, i32 6, i32 0, i32 0
  %dst.addr.0.6.0.050 = getelementptr [128 x %"class.hls::stream"], [128 x %"class.hls::stream"]* %0, i64 0, i64 %for.loop.idx67, i32 0, i32 6, i32 0, i32 0
  %94 = bitcast %struct.ssdm_int.2* %src.addr.0.6.0.049 to i8*
  %95 = call i1 @fpga_fifo_exist_1(i8* %94)
  br i1 %95, label %96, label %97

; <label>:96:                                     ; preds = %93
  call fastcc void @streamcpy_hls.p0struct.ssdm_int.2(%struct.ssdm_int.2* %dst.addr.0.6.0.050, %struct.ssdm_int.2* %src.addr.0.6.0.049)
  br label %for.loop.head

; <label>:97:                                     ; preds = %93
  %dst.addr.0.6.0.0.052.gep65 = getelementptr [128 x %"class.hls::stream"], [128 x %"class.hls::stream"]* %0, i64 0, i64 %for.loop.idx67, i32 0, i32 6, i32 0, i32 0, i32 0
  %98 = bitcast i1* %dst.addr.0.6.0.0.052.gep65 to i8*
  %src.addr.0.6.0.0.051.gep66 = getelementptr [128 x %"class.hls::stream"], [128 x %"class.hls::stream"]* %1, i64 0, i64 %for.loop.idx67, i32 0, i32 6, i32 0, i32 0, i32 0
  %99 = bitcast i1* %src.addr.0.6.0.0.051.gep66 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %98, i8* align 1 %99, i64 1, i1 false)
  br label %for.loop.head

for.loop.head:                                    ; preds = %97, %96, %92, %88, %7
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx67, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, 128
  br i1 %exitcond, label %for.loop, label %ret

ret:                                              ; preds = %for.loop.head, %entry
  ret void
}

declare i1 @fpga_fifo_exist_12(i8*) local_unnamed_addr

; Function Attrs: argmemonly noinline
define internal fastcc void @"streamcpy_hls.p0class.hls::stream"(%"class.hls::stream"* noalias nocapture, %"class.hls::stream"* noalias nocapture) unnamed_addr #3 {
entry:
  %2 = alloca %"class.hls::stream"
  br label %empty

empty:                                            ; preds = %push, %entry
  %3 = bitcast %"class.hls::stream"* %1 to i8*
  %4 = call i1 @fpga_fifo_not_empty_12(i8* %3)
  br i1 %4, label %push, label %ret

push:                                             ; preds = %empty
  %5 = bitcast %"class.hls::stream"* %2 to i8*
  %6 = bitcast %"class.hls::stream"* %1 to i8*
  call void @fpga_fifo_pop_12(i8* %5, i8* %6)
  %7 = load volatile %"class.hls::stream", %"class.hls::stream"* %2
  %8 = bitcast %"class.hls::stream"* %2 to i8*
  %9 = bitcast %"class.hls::stream"* %0 to i8*
  call void @fpga_fifo_push_12(i8* %8, i8* %9)
  br label %empty, !llvm.loop !5

ret:                                              ; preds = %empty
  %10 = bitcast %"class.hls::stream"* %1 to i8*
  %11 = bitcast %"class.hls::stream"* %0 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %11, i8* align 1 %10, i64 12, i1 false)
  ret void
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1) #4

declare i1 @fpga_fifo_exist_1(i8*) local_unnamed_addr

; Function Attrs: argmemonly noinline
define internal fastcc void @streamcpy_hls.p0struct.ap_uint(%struct.ap_uint* noalias nocapture, %struct.ap_uint* noalias nocapture) unnamed_addr #3 {
entry:
  %2 = alloca %struct.ap_uint
  br label %empty

empty:                                            ; preds = %push, %entry
  %3 = bitcast %struct.ap_uint* %1 to i8*
  %4 = call i1 @fpga_fifo_not_empty_1(i8* %3)
  br i1 %4, label %push, label %ret

push:                                             ; preds = %empty
  %5 = bitcast %struct.ap_uint* %2 to i8*
  %6 = bitcast %struct.ap_uint* %1 to i8*
  call void @fpga_fifo_pop_1(i8* %5, i8* %6)
  %7 = load volatile %struct.ap_uint, %struct.ap_uint* %2
  %8 = bitcast %struct.ap_uint* %2 to i8*
  %9 = bitcast %struct.ap_uint* %0 to i8*
  call void @fpga_fifo_push_1(i8* %8, i8* %9)
  br label %empty, !llvm.loop !7

ret:                                              ; preds = %empty
  %10 = bitcast %struct.ap_uint* %1 to i8*
  %11 = bitcast %struct.ap_uint* %0 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %11, i8* align 1 %10, i64 1, i1 false)
  ret void
}

; Function Attrs: argmemonly noinline
define internal fastcc void @streamcpy_hls.p0struct.ap_int_base(%struct.ap_int_base* noalias nocapture, %struct.ap_int_base* noalias nocapture) unnamed_addr #3 {
entry:
  %2 = alloca %struct.ap_int_base
  br label %empty

empty:                                            ; preds = %push, %entry
  %3 = bitcast %struct.ap_int_base* %1 to i8*
  %4 = call i1 @fpga_fifo_not_empty_1(i8* %3)
  br i1 %4, label %push, label %ret

push:                                             ; preds = %empty
  %5 = bitcast %struct.ap_int_base* %2 to i8*
  %6 = bitcast %struct.ap_int_base* %1 to i8*
  call void @fpga_fifo_pop_1(i8* %5, i8* %6)
  %7 = load volatile %struct.ap_int_base, %struct.ap_int_base* %2
  %8 = bitcast %struct.ap_int_base* %2 to i8*
  %9 = bitcast %struct.ap_int_base* %0 to i8*
  call void @fpga_fifo_push_1(i8* %8, i8* %9)
  br label %empty, !llvm.loop !8

ret:                                              ; preds = %empty
  %10 = bitcast %struct.ap_int_base* %1 to i8*
  %11 = bitcast %struct.ap_int_base* %0 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %11, i8* align 1 %10, i64 1, i1 false)
  ret void
}

; Function Attrs: argmemonly noinline
define internal fastcc void @streamcpy_hls.p0struct.ssdm_int(%struct.ssdm_int* noalias nocapture, %struct.ssdm_int* noalias nocapture) unnamed_addr #3 {
entry:
  %2 = alloca %struct.ssdm_int
  br label %empty

empty:                                            ; preds = %push, %entry
  %3 = bitcast %struct.ssdm_int* %1 to i8*
  %4 = call i1 @fpga_fifo_not_empty_1(i8* %3)
  br i1 %4, label %push, label %ret

push:                                             ; preds = %empty
  %5 = bitcast %struct.ssdm_int* %2 to i8*
  %6 = bitcast %struct.ssdm_int* %1 to i8*
  call void @fpga_fifo_pop_1(i8* %5, i8* %6)
  %7 = load volatile %struct.ssdm_int, %struct.ssdm_int* %2
  %8 = bitcast %struct.ssdm_int* %2 to i8*
  %9 = bitcast %struct.ssdm_int* %0 to i8*
  call void @fpga_fifo_push_1(i8* %8, i8* %9)
  br label %empty, !llvm.loop !9

ret:                                              ; preds = %empty
  %10 = bitcast %struct.ssdm_int* %1 to i8*
  %11 = bitcast %struct.ssdm_int* %0 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %11, i8* align 1 %10, i64 1, i1 false)
  ret void
}

; Function Attrs: argmemonly noinline
define internal fastcc void @streamcpy_hls.p0struct.ap_uint.0(%struct.ap_uint.0* noalias nocapture, %struct.ap_uint.0* noalias nocapture) unnamed_addr #3 {
entry:
  %2 = alloca %struct.ap_uint.0
  br label %empty

empty:                                            ; preds = %push, %entry
  %3 = bitcast %struct.ap_uint.0* %1 to i8*
  %4 = call i1 @fpga_fifo_not_empty_1(i8* %3)
  br i1 %4, label %push, label %ret

push:                                             ; preds = %empty
  %5 = bitcast %struct.ap_uint.0* %2 to i8*
  %6 = bitcast %struct.ap_uint.0* %1 to i8*
  call void @fpga_fifo_pop_1(i8* %5, i8* %6)
  %7 = load volatile %struct.ap_uint.0, %struct.ap_uint.0* %2
  %8 = bitcast %struct.ap_uint.0* %2 to i8*
  %9 = bitcast %struct.ap_uint.0* %0 to i8*
  call void @fpga_fifo_push_1(i8* %8, i8* %9)
  br label %empty, !llvm.loop !10

ret:                                              ; preds = %empty
  %10 = bitcast %struct.ap_uint.0* %1 to i8*
  %11 = bitcast %struct.ap_uint.0* %0 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %11, i8* align 1 %10, i64 1, i1 false)
  ret void
}

; Function Attrs: argmemonly noinline
define internal fastcc void @streamcpy_hls.p0struct.ap_int_base.1(%struct.ap_int_base.1* noalias nocapture, %struct.ap_int_base.1* noalias nocapture) unnamed_addr #3 {
entry:
  %2 = alloca %struct.ap_int_base.1
  br label %empty

empty:                                            ; preds = %push, %entry
  %3 = bitcast %struct.ap_int_base.1* %1 to i8*
  %4 = call i1 @fpga_fifo_not_empty_1(i8* %3)
  br i1 %4, label %push, label %ret

push:                                             ; preds = %empty
  %5 = bitcast %struct.ap_int_base.1* %2 to i8*
  %6 = bitcast %struct.ap_int_base.1* %1 to i8*
  call void @fpga_fifo_pop_1(i8* %5, i8* %6)
  %7 = load volatile %struct.ap_int_base.1, %struct.ap_int_base.1* %2
  %8 = bitcast %struct.ap_int_base.1* %2 to i8*
  %9 = bitcast %struct.ap_int_base.1* %0 to i8*
  call void @fpga_fifo_push_1(i8* %8, i8* %9)
  br label %empty, !llvm.loop !11

ret:                                              ; preds = %empty
  %10 = bitcast %struct.ap_int_base.1* %1 to i8*
  %11 = bitcast %struct.ap_int_base.1* %0 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %11, i8* align 1 %10, i64 1, i1 false)
  ret void
}

; Function Attrs: argmemonly noinline
define internal fastcc void @streamcpy_hls.p0struct.ssdm_int.2(%struct.ssdm_int.2* noalias nocapture, %struct.ssdm_int.2* noalias nocapture) unnamed_addr #3 {
entry:
  %2 = alloca %struct.ssdm_int.2
  br label %empty

empty:                                            ; preds = %push, %entry
  %3 = bitcast %struct.ssdm_int.2* %1 to i8*
  %4 = call i1 @fpga_fifo_not_empty_1(i8* %3)
  br i1 %4, label %push, label %ret

push:                                             ; preds = %empty
  %5 = bitcast %struct.ssdm_int.2* %2 to i8*
  %6 = bitcast %struct.ssdm_int.2* %1 to i8*
  call void @fpga_fifo_pop_1(i8* %5, i8* %6)
  %7 = load volatile %struct.ssdm_int.2, %struct.ssdm_int.2* %2
  %8 = bitcast %struct.ssdm_int.2* %2 to i8*
  %9 = bitcast %struct.ssdm_int.2* %0 to i8*
  call void @fpga_fifo_push_1(i8* %8, i8* %9)
  br label %empty, !llvm.loop !12

ret:                                              ; preds = %empty
  %10 = bitcast %struct.ssdm_int.2* %1 to i8*
  %11 = bitcast %struct.ssdm_int.2* %0 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %11, i8* align 1 %10, i64 1, i1 false)
  ret void
}

; Function Attrs: noinline
define internal fastcc void @"onebyonecpy_hls.p0a168class.hls::stream.7"([168 x %"class.hls::stream.7"]* noalias align 512, [168 x %"class.hls::stream.7"]* noalias) unnamed_addr #2 {
entry:
  %2 = icmp eq [168 x %"class.hls::stream.7"]* %0, null
  %3 = icmp eq [168 x %"class.hls::stream.7"]* %1, null
  %4 = or i1 %2, %3
  br i1 %4, label %ret, label %copy

copy:                                             ; preds = %entry
  br label %for.loop

for.loop:                                         ; preds = %for.loop.head, %copy
  %for.loop.idx69 = phi i64 [ 0, %copy ], [ %for.loop.idx.next, %for.loop.head ]
  %dst.addr = getelementptr [168 x %"class.hls::stream.7"], [168 x %"class.hls::stream.7"]* %0, i64 0, i64 %for.loop.idx69
  %src.addr = getelementptr [168 x %"class.hls::stream.7"], [168 x %"class.hls::stream.7"]* %1, i64 0, i64 %for.loop.idx69
  %5 = bitcast %"class.hls::stream.7"* %src.addr to i8*
  %6 = call i1 @fpga_fifo_exist_16(i8* %5)
  br i1 %6, label %7, label %8

; <label>:7:                                      ; preds = %for.loop
  call fastcc void @"streamcpy_hls.p0class.hls::stream.7"(%"class.hls::stream.7"* align 16 %dst.addr, %"class.hls::stream.7"* %src.addr)
  br label %for.loop.head

; <label>:8:                                      ; preds = %for.loop
  %dst.addr.0.0.06.gep57 = getelementptr [168 x %"class.hls::stream.7"], [168 x %"class.hls::stream.7"]* %0, i64 0, i64 %for.loop.idx69, i32 0, i32 0, i32 0
  %9 = bitcast float* %dst.addr.0.0.06.gep57 to i8*
  %src.addr.0.0.05.gep58 = getelementptr [168 x %"class.hls::stream.7"], [168 x %"class.hls::stream.7"]* %1, i64 0, i64 %for.loop.idx69, i32 0, i32 0, i32 0
  %10 = bitcast float* %src.addr.0.0.05.gep58 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %9, i8* align 1 %10, i64 4, i1 false)
  %dst.addr.0.0.18.gep59 = getelementptr [168 x %"class.hls::stream.7"], [168 x %"class.hls::stream.7"]* %0, i64 0, i64 %for.loop.idx69, i32 0, i32 0, i32 1
  %11 = bitcast float* %dst.addr.0.0.18.gep59 to i8*
  %src.addr.0.0.17.gep60 = getelementptr [168 x %"class.hls::stream.7"], [168 x %"class.hls::stream.7"]* %1, i64 0, i64 %for.loop.idx69, i32 0, i32 0, i32 1
  %12 = bitcast float* %src.addr.0.0.17.gep60 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %11, i8* align 1 %12, i64 4, i1 false)
  %src.addr.0.19 = getelementptr [168 x %"class.hls::stream.7"], [168 x %"class.hls::stream.7"]* %1, i64 0, i64 %for.loop.idx69, i32 0, i32 1
  %dst.addr.0.110 = getelementptr [168 x %"class.hls::stream.7"], [168 x %"class.hls::stream.7"]* %0, i64 0, i64 %for.loop.idx69, i32 0, i32 1
  %13 = getelementptr [168 x %"class.hls::stream.7"], [168 x %"class.hls::stream.7"]* %1, i64 0, i64 %for.loop.idx69, i32 0, i32 1, i32 0, i32 0, i32 0
  %14 = call i1 @fpga_fifo_exist_1(i8* %13)
  br i1 %14, label %15, label %16

; <label>:15:                                     ; preds = %8
  call fastcc void @streamcpy_hls.p0struct.ap_uint.4(%struct.ap_uint.4* %dst.addr.0.110, %struct.ap_uint.4* %src.addr.0.19)
  br label %23

; <label>:16:                                     ; preds = %8
  %src.addr.0.1.011 = getelementptr [168 x %"class.hls::stream.7"], [168 x %"class.hls::stream.7"]* %1, i64 0, i64 %for.loop.idx69, i32 0, i32 1, i32 0
  %dst.addr.0.1.012 = getelementptr [168 x %"class.hls::stream.7"], [168 x %"class.hls::stream.7"]* %0, i64 0, i64 %for.loop.idx69, i32 0, i32 1, i32 0
  %17 = call i1 @fpga_fifo_exist_1(i8* %13)
  br i1 %17, label %18, label %19

; <label>:18:                                     ; preds = %16
  call fastcc void @streamcpy_hls.p0struct.ap_int_base.5(%struct.ap_int_base.5* %dst.addr.0.1.012, %struct.ap_int_base.5* %src.addr.0.1.011)
  br label %23

; <label>:19:                                     ; preds = %16
  %src.addr.0.1.0.013 = getelementptr [168 x %"class.hls::stream.7"], [168 x %"class.hls::stream.7"]* %1, i64 0, i64 %for.loop.idx69, i32 0, i32 1, i32 0, i32 0
  %dst.addr.0.1.0.014 = getelementptr [168 x %"class.hls::stream.7"], [168 x %"class.hls::stream.7"]* %0, i64 0, i64 %for.loop.idx69, i32 0, i32 1, i32 0, i32 0
  %20 = call i1 @fpga_fifo_exist_1(i8* %13)
  br i1 %20, label %21, label %22

; <label>:21:                                     ; preds = %19
  call fastcc void @streamcpy_hls.p0struct.ssdm_int.6(%struct.ssdm_int.6* %dst.addr.0.1.0.014, %struct.ssdm_int.6* %src.addr.0.1.0.013)
  br label %23

; <label>:22:                                     ; preds = %19
  %dst.addr.0.1.0.0.016 = getelementptr [168 x %"class.hls::stream.7"], [168 x %"class.hls::stream.7"]* %0, i64 0, i64 %for.loop.idx69, i32 0, i32 1, i32 0, i32 0, i32 0
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %dst.addr.0.1.0.0.016, i8* align 1 %13, i64 1, i1 false)
  br label %23

; <label>:23:                                     ; preds = %22, %21, %18, %15
  %src.addr.0.217 = getelementptr [168 x %"class.hls::stream.7"], [168 x %"class.hls::stream.7"]* %1, i64 0, i64 %for.loop.idx69, i32 0, i32 2
  %dst.addr.0.218 = getelementptr [168 x %"class.hls::stream.7"], [168 x %"class.hls::stream.7"]* %0, i64 0, i64 %for.loop.idx69, i32 0, i32 2
  %24 = getelementptr [168 x %"class.hls::stream.7"], [168 x %"class.hls::stream.7"]* %1, i64 0, i64 %for.loop.idx69, i32 0, i32 2, i32 0, i32 0, i32 0
  %25 = call i1 @fpga_fifo_exist_1(i8* %24)
  br i1 %25, label %26, label %27

; <label>:26:                                     ; preds = %23
  call fastcc void @streamcpy_hls.p0struct.ap_uint.4(%struct.ap_uint.4* %dst.addr.0.218, %struct.ap_uint.4* %src.addr.0.217)
  br label %34

; <label>:27:                                     ; preds = %23
  %src.addr.0.2.019 = getelementptr [168 x %"class.hls::stream.7"], [168 x %"class.hls::stream.7"]* %1, i64 0, i64 %for.loop.idx69, i32 0, i32 2, i32 0
  %dst.addr.0.2.020 = getelementptr [168 x %"class.hls::stream.7"], [168 x %"class.hls::stream.7"]* %0, i64 0, i64 %for.loop.idx69, i32 0, i32 2, i32 0
  %28 = call i1 @fpga_fifo_exist_1(i8* %24)
  br i1 %28, label %29, label %30

; <label>:29:                                     ; preds = %27
  call fastcc void @streamcpy_hls.p0struct.ap_int_base.5(%struct.ap_int_base.5* %dst.addr.0.2.020, %struct.ap_int_base.5* %src.addr.0.2.019)
  br label %34

; <label>:30:                                     ; preds = %27
  %src.addr.0.2.0.021 = getelementptr [168 x %"class.hls::stream.7"], [168 x %"class.hls::stream.7"]* %1, i64 0, i64 %for.loop.idx69, i32 0, i32 2, i32 0, i32 0
  %dst.addr.0.2.0.022 = getelementptr [168 x %"class.hls::stream.7"], [168 x %"class.hls::stream.7"]* %0, i64 0, i64 %for.loop.idx69, i32 0, i32 2, i32 0, i32 0
  %31 = call i1 @fpga_fifo_exist_1(i8* %24)
  br i1 %31, label %32, label %33

; <label>:32:                                     ; preds = %30
  call fastcc void @streamcpy_hls.p0struct.ssdm_int.6(%struct.ssdm_int.6* %dst.addr.0.2.0.022, %struct.ssdm_int.6* %src.addr.0.2.0.021)
  br label %34

; <label>:33:                                     ; preds = %30
  %dst.addr.0.2.0.0.024 = getelementptr [168 x %"class.hls::stream.7"], [168 x %"class.hls::stream.7"]* %0, i64 0, i64 %for.loop.idx69, i32 0, i32 2, i32 0, i32 0, i32 0
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %dst.addr.0.2.0.0.024, i8* align 1 %24, i64 1, i1 false)
  br label %34

; <label>:34:                                     ; preds = %33, %32, %29, %26
  %src.addr.0.325 = getelementptr [168 x %"class.hls::stream.7"], [168 x %"class.hls::stream.7"]* %1, i64 0, i64 %for.loop.idx69, i32 0, i32 3
  %dst.addr.0.326 = getelementptr [168 x %"class.hls::stream.7"], [168 x %"class.hls::stream.7"]* %0, i64 0, i64 %for.loop.idx69, i32 0, i32 3
  %35 = bitcast %struct.ap_uint.0* %src.addr.0.325 to i8*
  %36 = call i1 @fpga_fifo_exist_1(i8* %35)
  br i1 %36, label %37, label %38

; <label>:37:                                     ; preds = %34
  call fastcc void @streamcpy_hls.p0struct.ap_uint.0(%struct.ap_uint.0* %dst.addr.0.326, %struct.ap_uint.0* %src.addr.0.325)
  br label %49

; <label>:38:                                     ; preds = %34
  %src.addr.0.3.027 = getelementptr [168 x %"class.hls::stream.7"], [168 x %"class.hls::stream.7"]* %1, i64 0, i64 %for.loop.idx69, i32 0, i32 3, i32 0
  %dst.addr.0.3.028 = getelementptr [168 x %"class.hls::stream.7"], [168 x %"class.hls::stream.7"]* %0, i64 0, i64 %for.loop.idx69, i32 0, i32 3, i32 0
  %39 = bitcast %struct.ap_int_base.1* %src.addr.0.3.027 to i8*
  %40 = call i1 @fpga_fifo_exist_1(i8* %39)
  br i1 %40, label %41, label %42

; <label>:41:                                     ; preds = %38
  call fastcc void @streamcpy_hls.p0struct.ap_int_base.1(%struct.ap_int_base.1* %dst.addr.0.3.028, %struct.ap_int_base.1* %src.addr.0.3.027)
  br label %49

; <label>:42:                                     ; preds = %38
  %src.addr.0.3.0.029 = getelementptr [168 x %"class.hls::stream.7"], [168 x %"class.hls::stream.7"]* %1, i64 0, i64 %for.loop.idx69, i32 0, i32 3, i32 0, i32 0
  %dst.addr.0.3.0.030 = getelementptr [168 x %"class.hls::stream.7"], [168 x %"class.hls::stream.7"]* %0, i64 0, i64 %for.loop.idx69, i32 0, i32 3, i32 0, i32 0
  %43 = bitcast %struct.ssdm_int.2* %src.addr.0.3.0.029 to i8*
  %44 = call i1 @fpga_fifo_exist_1(i8* %43)
  br i1 %44, label %45, label %46

; <label>:45:                                     ; preds = %42
  call fastcc void @streamcpy_hls.p0struct.ssdm_int.2(%struct.ssdm_int.2* %dst.addr.0.3.0.030, %struct.ssdm_int.2* %src.addr.0.3.0.029)
  br label %49

; <label>:46:                                     ; preds = %42
  %dst.addr.0.3.0.0.032.gep61 = getelementptr [168 x %"class.hls::stream.7"], [168 x %"class.hls::stream.7"]* %0, i64 0, i64 %for.loop.idx69, i32 0, i32 3, i32 0, i32 0, i32 0
  %47 = bitcast i1* %dst.addr.0.3.0.0.032.gep61 to i8*
  %src.addr.0.3.0.0.031.gep62 = getelementptr [168 x %"class.hls::stream.7"], [168 x %"class.hls::stream.7"]* %1, i64 0, i64 %for.loop.idx69, i32 0, i32 3, i32 0, i32 0, i32 0
  %48 = bitcast i1* %src.addr.0.3.0.0.031.gep62 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %47, i8* align 1 %48, i64 1, i1 false)
  br label %49

; <label>:49:                                     ; preds = %46, %45, %41, %37
  %src.addr.0.433 = getelementptr [168 x %"class.hls::stream.7"], [168 x %"class.hls::stream.7"]* %1, i64 0, i64 %for.loop.idx69, i32 0, i32 4
  %dst.addr.0.434 = getelementptr [168 x %"class.hls::stream.7"], [168 x %"class.hls::stream.7"]* %0, i64 0, i64 %for.loop.idx69, i32 0, i32 4
  %50 = bitcast %struct.ap_uint.0* %src.addr.0.433 to i8*
  %51 = call i1 @fpga_fifo_exist_1(i8* %50)
  br i1 %51, label %52, label %53

; <label>:52:                                     ; preds = %49
  call fastcc void @streamcpy_hls.p0struct.ap_uint.0(%struct.ap_uint.0* %dst.addr.0.434, %struct.ap_uint.0* %src.addr.0.433)
  br label %64

; <label>:53:                                     ; preds = %49
  %src.addr.0.4.035 = getelementptr [168 x %"class.hls::stream.7"], [168 x %"class.hls::stream.7"]* %1, i64 0, i64 %for.loop.idx69, i32 0, i32 4, i32 0
  %dst.addr.0.4.036 = getelementptr [168 x %"class.hls::stream.7"], [168 x %"class.hls::stream.7"]* %0, i64 0, i64 %for.loop.idx69, i32 0, i32 4, i32 0
  %54 = bitcast %struct.ap_int_base.1* %src.addr.0.4.035 to i8*
  %55 = call i1 @fpga_fifo_exist_1(i8* %54)
  br i1 %55, label %56, label %57

; <label>:56:                                     ; preds = %53
  call fastcc void @streamcpy_hls.p0struct.ap_int_base.1(%struct.ap_int_base.1* %dst.addr.0.4.036, %struct.ap_int_base.1* %src.addr.0.4.035)
  br label %64

; <label>:57:                                     ; preds = %53
  %src.addr.0.4.0.037 = getelementptr [168 x %"class.hls::stream.7"], [168 x %"class.hls::stream.7"]* %1, i64 0, i64 %for.loop.idx69, i32 0, i32 4, i32 0, i32 0
  %dst.addr.0.4.0.038 = getelementptr [168 x %"class.hls::stream.7"], [168 x %"class.hls::stream.7"]* %0, i64 0, i64 %for.loop.idx69, i32 0, i32 4, i32 0, i32 0
  %58 = bitcast %struct.ssdm_int.2* %src.addr.0.4.0.037 to i8*
  %59 = call i1 @fpga_fifo_exist_1(i8* %58)
  br i1 %59, label %60, label %61

; <label>:60:                                     ; preds = %57
  call fastcc void @streamcpy_hls.p0struct.ssdm_int.2(%struct.ssdm_int.2* %dst.addr.0.4.0.038, %struct.ssdm_int.2* %src.addr.0.4.0.037)
  br label %64

; <label>:61:                                     ; preds = %57
  %dst.addr.0.4.0.0.040.gep63 = getelementptr [168 x %"class.hls::stream.7"], [168 x %"class.hls::stream.7"]* %0, i64 0, i64 %for.loop.idx69, i32 0, i32 4, i32 0, i32 0, i32 0
  %62 = bitcast i1* %dst.addr.0.4.0.0.040.gep63 to i8*
  %src.addr.0.4.0.0.039.gep64 = getelementptr [168 x %"class.hls::stream.7"], [168 x %"class.hls::stream.7"]* %1, i64 0, i64 %for.loop.idx69, i32 0, i32 4, i32 0, i32 0, i32 0
  %63 = bitcast i1* %src.addr.0.4.0.0.039.gep64 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %62, i8* align 1 %63, i64 1, i1 false)
  br label %64

; <label>:64:                                     ; preds = %61, %60, %56, %52
  %src.addr.0.541 = getelementptr [168 x %"class.hls::stream.7"], [168 x %"class.hls::stream.7"]* %1, i64 0, i64 %for.loop.idx69, i32 0, i32 5
  %dst.addr.0.542 = getelementptr [168 x %"class.hls::stream.7"], [168 x %"class.hls::stream.7"]* %0, i64 0, i64 %for.loop.idx69, i32 0, i32 5
  %65 = bitcast %struct.ap_uint.0* %src.addr.0.541 to i8*
  %66 = call i1 @fpga_fifo_exist_1(i8* %65)
  br i1 %66, label %67, label %68

; <label>:67:                                     ; preds = %64
  call fastcc void @streamcpy_hls.p0struct.ap_uint.0(%struct.ap_uint.0* %dst.addr.0.542, %struct.ap_uint.0* %src.addr.0.541)
  br label %79

; <label>:68:                                     ; preds = %64
  %src.addr.0.5.043 = getelementptr [168 x %"class.hls::stream.7"], [168 x %"class.hls::stream.7"]* %1, i64 0, i64 %for.loop.idx69, i32 0, i32 5, i32 0
  %dst.addr.0.5.044 = getelementptr [168 x %"class.hls::stream.7"], [168 x %"class.hls::stream.7"]* %0, i64 0, i64 %for.loop.idx69, i32 0, i32 5, i32 0
  %69 = bitcast %struct.ap_int_base.1* %src.addr.0.5.043 to i8*
  %70 = call i1 @fpga_fifo_exist_1(i8* %69)
  br i1 %70, label %71, label %72

; <label>:71:                                     ; preds = %68
  call fastcc void @streamcpy_hls.p0struct.ap_int_base.1(%struct.ap_int_base.1* %dst.addr.0.5.044, %struct.ap_int_base.1* %src.addr.0.5.043)
  br label %79

; <label>:72:                                     ; preds = %68
  %src.addr.0.5.0.045 = getelementptr [168 x %"class.hls::stream.7"], [168 x %"class.hls::stream.7"]* %1, i64 0, i64 %for.loop.idx69, i32 0, i32 5, i32 0, i32 0
  %dst.addr.0.5.0.046 = getelementptr [168 x %"class.hls::stream.7"], [168 x %"class.hls::stream.7"]* %0, i64 0, i64 %for.loop.idx69, i32 0, i32 5, i32 0, i32 0
  %73 = bitcast %struct.ssdm_int.2* %src.addr.0.5.0.045 to i8*
  %74 = call i1 @fpga_fifo_exist_1(i8* %73)
  br i1 %74, label %75, label %76

; <label>:75:                                     ; preds = %72
  call fastcc void @streamcpy_hls.p0struct.ssdm_int.2(%struct.ssdm_int.2* %dst.addr.0.5.0.046, %struct.ssdm_int.2* %src.addr.0.5.0.045)
  br label %79

; <label>:76:                                     ; preds = %72
  %dst.addr.0.5.0.0.048.gep65 = getelementptr [168 x %"class.hls::stream.7"], [168 x %"class.hls::stream.7"]* %0, i64 0, i64 %for.loop.idx69, i32 0, i32 5, i32 0, i32 0, i32 0
  %77 = bitcast i1* %dst.addr.0.5.0.0.048.gep65 to i8*
  %src.addr.0.5.0.0.047.gep66 = getelementptr [168 x %"class.hls::stream.7"], [168 x %"class.hls::stream.7"]* %1, i64 0, i64 %for.loop.idx69, i32 0, i32 5, i32 0, i32 0, i32 0
  %78 = bitcast i1* %src.addr.0.5.0.0.047.gep66 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %77, i8* align 1 %78, i64 1, i1 false)
  br label %79

; <label>:79:                                     ; preds = %76, %75, %71, %67
  %src.addr.0.649 = getelementptr [168 x %"class.hls::stream.7"], [168 x %"class.hls::stream.7"]* %1, i64 0, i64 %for.loop.idx69, i32 0, i32 6
  %dst.addr.0.650 = getelementptr [168 x %"class.hls::stream.7"], [168 x %"class.hls::stream.7"]* %0, i64 0, i64 %for.loop.idx69, i32 0, i32 6
  %80 = bitcast %struct.ap_uint.0* %src.addr.0.649 to i8*
  %81 = call i1 @fpga_fifo_exist_1(i8* %80)
  br i1 %81, label %82, label %83

; <label>:82:                                     ; preds = %79
  call fastcc void @streamcpy_hls.p0struct.ap_uint.0(%struct.ap_uint.0* %dst.addr.0.650, %struct.ap_uint.0* %src.addr.0.649)
  br label %for.loop.head

; <label>:83:                                     ; preds = %79
  %src.addr.0.6.051 = getelementptr [168 x %"class.hls::stream.7"], [168 x %"class.hls::stream.7"]* %1, i64 0, i64 %for.loop.idx69, i32 0, i32 6, i32 0
  %dst.addr.0.6.052 = getelementptr [168 x %"class.hls::stream.7"], [168 x %"class.hls::stream.7"]* %0, i64 0, i64 %for.loop.idx69, i32 0, i32 6, i32 0
  %84 = bitcast %struct.ap_int_base.1* %src.addr.0.6.051 to i8*
  %85 = call i1 @fpga_fifo_exist_1(i8* %84)
  br i1 %85, label %86, label %87

; <label>:86:                                     ; preds = %83
  call fastcc void @streamcpy_hls.p0struct.ap_int_base.1(%struct.ap_int_base.1* %dst.addr.0.6.052, %struct.ap_int_base.1* %src.addr.0.6.051)
  br label %for.loop.head

; <label>:87:                                     ; preds = %83
  %src.addr.0.6.0.053 = getelementptr [168 x %"class.hls::stream.7"], [168 x %"class.hls::stream.7"]* %1, i64 0, i64 %for.loop.idx69, i32 0, i32 6, i32 0, i32 0
  %dst.addr.0.6.0.054 = getelementptr [168 x %"class.hls::stream.7"], [168 x %"class.hls::stream.7"]* %0, i64 0, i64 %for.loop.idx69, i32 0, i32 6, i32 0, i32 0
  %88 = bitcast %struct.ssdm_int.2* %src.addr.0.6.0.053 to i8*
  %89 = call i1 @fpga_fifo_exist_1(i8* %88)
  br i1 %89, label %90, label %91

; <label>:90:                                     ; preds = %87
  call fastcc void @streamcpy_hls.p0struct.ssdm_int.2(%struct.ssdm_int.2* %dst.addr.0.6.0.054, %struct.ssdm_int.2* %src.addr.0.6.0.053)
  br label %for.loop.head

; <label>:91:                                     ; preds = %87
  %dst.addr.0.6.0.0.056.gep67 = getelementptr [168 x %"class.hls::stream.7"], [168 x %"class.hls::stream.7"]* %0, i64 0, i64 %for.loop.idx69, i32 0, i32 6, i32 0, i32 0, i32 0
  %92 = bitcast i1* %dst.addr.0.6.0.0.056.gep67 to i8*
  %src.addr.0.6.0.0.055.gep68 = getelementptr [168 x %"class.hls::stream.7"], [168 x %"class.hls::stream.7"]* %1, i64 0, i64 %for.loop.idx69, i32 0, i32 6, i32 0, i32 0, i32 0
  %93 = bitcast i1* %src.addr.0.6.0.0.055.gep68 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %92, i8* align 1 %93, i64 1, i1 false)
  br label %for.loop.head

for.loop.head:                                    ; preds = %91, %90, %86, %82, %7
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx69, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, 168
  br i1 %exitcond, label %for.loop, label %ret

ret:                                              ; preds = %for.loop.head, %entry
  ret void
}

declare i1 @fpga_fifo_exist_16(i8*) local_unnamed_addr

; Function Attrs: argmemonly noinline
define internal fastcc void @"streamcpy_hls.p0class.hls::stream.7"(%"class.hls::stream.7"* noalias nocapture align 16, %"class.hls::stream.7"* noalias nocapture) unnamed_addr #3 {
entry:
  %2 = alloca %"class.hls::stream.7"
  br label %empty

empty:                                            ; preds = %push, %entry
  %3 = bitcast %"class.hls::stream.7"* %1 to i8*
  %4 = call i1 @fpga_fifo_not_empty_16(i8* %3)
  br i1 %4, label %push, label %ret

push:                                             ; preds = %empty
  %5 = bitcast %"class.hls::stream.7"* %2 to i8*
  %6 = bitcast %"class.hls::stream.7"* %1 to i8*
  call void @fpga_fifo_pop_16(i8* %5, i8* %6)
  %7 = load volatile %"class.hls::stream.7", %"class.hls::stream.7"* %2
  %8 = bitcast %"class.hls::stream.7"* %2 to i8*
  %9 = bitcast %"class.hls::stream.7"* %0 to i8*
  call void @fpga_fifo_push_16(i8* %8, i8* %9)
  br label %empty, !llvm.loop !13

ret:                                              ; preds = %empty
  %10 = bitcast %"class.hls::stream.7"* %1 to i8*
  %11 = bitcast %"class.hls::stream.7"* %0 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %11, i8* align 1 %10, i64 16, i1 false)
  ret void
}

; Function Attrs: argmemonly noinline
define internal fastcc void @streamcpy_hls.p0struct.ap_uint.4(%struct.ap_uint.4* noalias nocapture, %struct.ap_uint.4* noalias nocapture) unnamed_addr #3 {
entry:
  %2 = alloca %struct.ap_uint.4
  br label %empty

empty:                                            ; preds = %push, %entry
  %3 = bitcast %struct.ap_uint.4* %1 to i8*
  %4 = call i1 @fpga_fifo_not_empty_1(i8* %3)
  br i1 %4, label %push, label %ret

push:                                             ; preds = %empty
  %5 = bitcast %struct.ap_uint.4* %2 to i8*
  %6 = bitcast %struct.ap_uint.4* %1 to i8*
  call void @fpga_fifo_pop_1(i8* %5, i8* %6)
  %7 = load volatile %struct.ap_uint.4, %struct.ap_uint.4* %2
  %8 = bitcast %struct.ap_uint.4* %2 to i8*
  %9 = bitcast %struct.ap_uint.4* %0 to i8*
  call void @fpga_fifo_push_1(i8* %8, i8* %9)
  br label %empty, !llvm.loop !14

ret:                                              ; preds = %empty
  %10 = getelementptr inbounds %struct.ap_uint.4, %struct.ap_uint.4* %1, i32 0, i32 0, i32 0, i32 0
  %11 = getelementptr inbounds %struct.ap_uint.4, %struct.ap_uint.4* %0, i32 0, i32 0, i32 0, i32 0
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %11, i8* align 1 %10, i64 1, i1 false)
  ret void
}

; Function Attrs: argmemonly noinline
define internal fastcc void @streamcpy_hls.p0struct.ap_int_base.5(%struct.ap_int_base.5* noalias nocapture, %struct.ap_int_base.5* noalias nocapture) unnamed_addr #3 {
entry:
  %2 = alloca %struct.ap_int_base.5
  br label %empty

empty:                                            ; preds = %push, %entry
  %3 = bitcast %struct.ap_int_base.5* %1 to i8*
  %4 = call i1 @fpga_fifo_not_empty_1(i8* %3)
  br i1 %4, label %push, label %ret

push:                                             ; preds = %empty
  %5 = bitcast %struct.ap_int_base.5* %2 to i8*
  %6 = bitcast %struct.ap_int_base.5* %1 to i8*
  call void @fpga_fifo_pop_1(i8* %5, i8* %6)
  %7 = load volatile %struct.ap_int_base.5, %struct.ap_int_base.5* %2
  %8 = bitcast %struct.ap_int_base.5* %2 to i8*
  %9 = bitcast %struct.ap_int_base.5* %0 to i8*
  call void @fpga_fifo_push_1(i8* %8, i8* %9)
  br label %empty, !llvm.loop !15

ret:                                              ; preds = %empty
  %10 = getelementptr inbounds %struct.ap_int_base.5, %struct.ap_int_base.5* %1, i32 0, i32 0, i32 0
  %11 = getelementptr inbounds %struct.ap_int_base.5, %struct.ap_int_base.5* %0, i32 0, i32 0, i32 0
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %11, i8* align 1 %10, i64 1, i1 false)
  ret void
}

; Function Attrs: argmemonly noinline
define internal fastcc void @streamcpy_hls.p0struct.ssdm_int.6(%struct.ssdm_int.6* noalias nocapture, %struct.ssdm_int.6* noalias nocapture) unnamed_addr #3 {
entry:
  %2 = alloca %struct.ssdm_int.6
  br label %empty

empty:                                            ; preds = %push, %entry
  %3 = bitcast %struct.ssdm_int.6* %1 to i8*
  %4 = call i1 @fpga_fifo_not_empty_1(i8* %3)
  br i1 %4, label %push, label %ret

push:                                             ; preds = %empty
  %5 = bitcast %struct.ssdm_int.6* %2 to i8*
  %6 = bitcast %struct.ssdm_int.6* %1 to i8*
  call void @fpga_fifo_pop_1(i8* %5, i8* %6)
  %7 = load volatile %struct.ssdm_int.6, %struct.ssdm_int.6* %2
  %8 = bitcast %struct.ssdm_int.6* %2 to i8*
  %9 = bitcast %struct.ssdm_int.6* %0 to i8*
  call void @fpga_fifo_push_1(i8* %8, i8* %9)
  br label %empty, !llvm.loop !16

ret:                                              ; preds = %empty
  %10 = getelementptr inbounds %struct.ssdm_int.6, %struct.ssdm_int.6* %1, i32 0, i32 0
  %11 = getelementptr inbounds %struct.ssdm_int.6, %struct.ssdm_int.6* %0, i32 0, i32 0
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %11, i8* align 1 %10, i64 1, i1 false)
  ret void
}

; Function Attrs: noinline
define internal fastcc void @copy_out([128 x %"class.hls::stream"]*, [128 x %"class.hls::stream"]* noalias align 512, [128 x %"class.hls::stream"]*, [128 x %"class.hls::stream"]* noalias align 512, [168 x %"class.hls::stream.7"]*, [168 x %"class.hls::stream.7"]* noalias align 512, [168 x %"class.hls::stream.7"]*, [168 x %"class.hls::stream.7"]* noalias align 512, [168 x %"class.hls::stream.7"]*, [168 x %"class.hls::stream.7"]* noalias align 512, [168 x %"class.hls::stream.7"]*, [168 x %"class.hls::stream.7"]* noalias align 512) unnamed_addr #5 {
entry:
  call fastcc void @"onebyonecpy_hls.p0a128class.hls::stream"([128 x %"class.hls::stream"]* %0, [128 x %"class.hls::stream"]* align 512 %1)
  call fastcc void @"onebyonecpy_hls.p0a128class.hls::stream"([128 x %"class.hls::stream"]* %2, [128 x %"class.hls::stream"]* align 512 %3)
  call fastcc void @"onebyonecpy_hls.p0a168class.hls::stream.7"([168 x %"class.hls::stream.7"]* %4, [168 x %"class.hls::stream.7"]* align 512 %5)
  call fastcc void @"onebyonecpy_hls.p0a168class.hls::stream.7"([168 x %"class.hls::stream.7"]* %6, [168 x %"class.hls::stream.7"]* align 512 %7)
  call fastcc void @"onebyonecpy_hls.p0a168class.hls::stream.7"([168 x %"class.hls::stream.7"]* %8, [168 x %"class.hls::stream.7"]* align 512 %9)
  call fastcc void @"onebyonecpy_hls.p0a168class.hls::stream.7"([168 x %"class.hls::stream.7"]* %10, [168 x %"class.hls::stream.7"]* align 512 %11)
  ret void
}

declare void @apatb_cp_corr_pss_sss_hw(%"class.hls::stream"*, %"class.hls::stream"*, %"class.hls::stream.7"*, %"class.hls::stream.7"*, %"class.hls::stream.7"*, %"class.hls::stream.7"*)

define void @cp_corr_pss_sss_hw_stub_wrapper(%"class.hls::stream"*, %"class.hls::stream"*, %"class.hls::stream.7"*, %"class.hls::stream.7"*, %"class.hls::stream.7"*, %"class.hls::stream.7"*) #6 {
entry:
  %6 = bitcast %"class.hls::stream"* %0 to [128 x %"class.hls::stream"]*
  %7 = bitcast %"class.hls::stream"* %1 to [128 x %"class.hls::stream"]*
  %8 = bitcast %"class.hls::stream.7"* %2 to [168 x %"class.hls::stream.7"]*
  %9 = bitcast %"class.hls::stream.7"* %3 to [168 x %"class.hls::stream.7"]*
  %10 = bitcast %"class.hls::stream.7"* %4 to [168 x %"class.hls::stream.7"]*
  %11 = bitcast %"class.hls::stream.7"* %5 to [168 x %"class.hls::stream.7"]*
  call void @copy_out([128 x %"class.hls::stream"]* null, [128 x %"class.hls::stream"]* %6, [128 x %"class.hls::stream"]* null, [128 x %"class.hls::stream"]* %7, [168 x %"class.hls::stream.7"]* null, [168 x %"class.hls::stream.7"]* %8, [168 x %"class.hls::stream.7"]* null, [168 x %"class.hls::stream.7"]* %9, [168 x %"class.hls::stream.7"]* null, [168 x %"class.hls::stream.7"]* %10, [168 x %"class.hls::stream.7"]* null, [168 x %"class.hls::stream.7"]* %11)
  %12 = bitcast [128 x %"class.hls::stream"]* %6 to %"class.hls::stream"*
  %13 = bitcast [128 x %"class.hls::stream"]* %7 to %"class.hls::stream"*
  %14 = bitcast [168 x %"class.hls::stream.7"]* %8 to %"class.hls::stream.7"*
  %15 = bitcast [168 x %"class.hls::stream.7"]* %9 to %"class.hls::stream.7"*
  %16 = bitcast [168 x %"class.hls::stream.7"]* %10 to %"class.hls::stream.7"*
  %17 = bitcast [168 x %"class.hls::stream.7"]* %11 to %"class.hls::stream.7"*
  call void @cp_corr_pss_sss_hw_stub(%"class.hls::stream"* %12, %"class.hls::stream"* %13, %"class.hls::stream.7"* %14, %"class.hls::stream.7"* %15, %"class.hls::stream.7"* %16, %"class.hls::stream.7"* %17)
  call void @copy_in([128 x %"class.hls::stream"]* null, [128 x %"class.hls::stream"]* %6, [128 x %"class.hls::stream"]* null, [128 x %"class.hls::stream"]* %7, [168 x %"class.hls::stream.7"]* null, [168 x %"class.hls::stream.7"]* %8, [168 x %"class.hls::stream.7"]* null, [168 x %"class.hls::stream.7"]* %9, [168 x %"class.hls::stream.7"]* null, [168 x %"class.hls::stream.7"]* %10, [168 x %"class.hls::stream.7"]* null, [168 x %"class.hls::stream.7"]* %11)
  ret void
}

declare void @cp_corr_pss_sss_hw_stub(%"class.hls::stream"*, %"class.hls::stream"*, %"class.hls::stream.7"*, %"class.hls::stream.7"*, %"class.hls::stream.7"*, %"class.hls::stream.7"*)

declare i1 @fpga_fifo_not_empty_12(i8*)

declare i1 @fpga_fifo_not_empty_1(i8*)

declare i1 @fpga_fifo_not_empty_16(i8*)

declare void @fpga_fifo_pop_12(i8*, i8*)

declare void @fpga_fifo_pop_1(i8*, i8*)

declare void @fpga_fifo_pop_16(i8*, i8*)

declare void @fpga_fifo_push_12(i8*, i8*)

declare void @fpga_fifo_push_1(i8*, i8*)

declare void @fpga_fifo_push_16(i8*, i8*)

attributes #0 = { noinline "fpga.wrapper.func"="wrapper" }
attributes #1 = { noinline "fpga.wrapper.func"="copyin" }
attributes #2 = { noinline "fpga.wrapper.func"="onebyonecpy_hls" }
attributes #3 = { argmemonly noinline "fpga.wrapper.func"="streamcpy_hls" }
attributes #4 = { argmemonly nounwind }
attributes #5 = { noinline "fpga.wrapper.func"="copyout" }
attributes #6 = { "fpga.wrapper.func"="stub" }

!llvm.dbg.cu = !{}
!llvm.ident = !{!0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0}
!llvm.module.flags = !{!1, !2, !3}
!blackbox_cfg = !{!4}

!0 = !{!"clang version 7.0.0 "}
!1 = !{i32 2, !"Dwarf Version", i32 4}
!2 = !{i32 2, !"Debug Info Version", i32 3}
!3 = !{i32 1, !"wchar_size", i32 4}
!4 = !{}
!5 = distinct !{!5, !6}
!6 = !{!"llvm.loop.rotate.disable"}
!7 = distinct !{!7, !6}
!8 = distinct !{!8, !6}
!9 = distinct !{!9, !6}
!10 = distinct !{!10, !6}
!11 = distinct !{!11, !6}
!12 = distinct !{!12, !6}
!13 = distinct !{!13, !6}
!14 = distinct !{!14, !6}
!15 = distinct !{!15, !6}
!16 = distinct !{!16, !6}
