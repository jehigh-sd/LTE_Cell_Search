; ModuleID = '/home/jhigh/Capstone_Project/main/HARDWARE/HLS_Pjts/PSS_FFTS_SSS/SSS_core/hls/solution1/.autopilot/db/a.g.ld.5.gdce.bc'
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
%"class.hls::stream.3" = type { %"struct.hls::axis.4" }
%"struct.hls::axis.4" = type { i32, %struct.ap_uint, %struct.ap_uint, %struct.ap_uint.0, %struct.ap_uint.0, %struct.ap_uint.0, %struct.ap_uint.0 }

; Function Attrs: noinline
define void @apatb_sss_corr_ir(%"class.hls::stream"* %IN_R, %"class.hls::stream"* %IN_I, float* %OUT1, float* %OUT2, %"class.hls::stream.3"* %pss_id) local_unnamed_addr #0 {
entry:
  %IN_R_copy = alloca %"class.hls::stream", align 512
  %IN_I_copy = alloca %"class.hls::stream", align 512
  %OUT1_copy = alloca [168 x float], align 512
  %OUT2_copy = alloca [168 x float], align 512
  %pss_id_copy = alloca %"class.hls::stream.3", align 512
  %0 = bitcast float* %OUT1 to [168 x float]*
  %1 = bitcast float* %OUT2 to [168 x float]*
  call fastcc void @copy_in(%"class.hls::stream"* %IN_R, %"class.hls::stream"* nonnull align 512 %IN_R_copy, %"class.hls::stream"* %IN_I, %"class.hls::stream"* nonnull align 512 %IN_I_copy, [168 x float]* %0, [168 x float]* nonnull align 512 %OUT1_copy, [168 x float]* %1, [168 x float]* nonnull align 512 %OUT2_copy, %"class.hls::stream.3"* %pss_id, %"class.hls::stream.3"* nonnull align 512 %pss_id_copy)
  %2 = getelementptr inbounds [168 x float], [168 x float]* %OUT1_copy, i32 0, i32 0
  %3 = getelementptr inbounds [168 x float], [168 x float]* %OUT2_copy, i32 0, i32 0
  call void @apatb_sss_corr_hw(%"class.hls::stream"* %IN_R_copy, %"class.hls::stream"* %IN_I_copy, float* %2, float* %3, %"class.hls::stream.3"* %pss_id_copy)
  call fastcc void @copy_out(%"class.hls::stream"* %IN_R, %"class.hls::stream"* nonnull align 512 %IN_R_copy, %"class.hls::stream"* %IN_I, %"class.hls::stream"* nonnull align 512 %IN_I_copy, [168 x float]* %0, [168 x float]* nonnull align 512 %OUT1_copy, [168 x float]* %1, [168 x float]* nonnull align 512 %OUT2_copy, %"class.hls::stream.3"* %pss_id, %"class.hls::stream.3"* nonnull align 512 %pss_id_copy)
  ret void
}

; Function Attrs: noinline
define internal fastcc void @copy_in(%"class.hls::stream"*, %"class.hls::stream"* noalias align 512, %"class.hls::stream"*, %"class.hls::stream"* noalias align 512, [168 x float]* readonly, [168 x float]* noalias align 512, [168 x float]* readonly, [168 x float]* noalias align 512, %"class.hls::stream.3"*, %"class.hls::stream.3"* noalias align 512) unnamed_addr #1 {
entry:
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream"(%"class.hls::stream"* align 512 %1, %"class.hls::stream"* %0)
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream"(%"class.hls::stream"* align 512 %3, %"class.hls::stream"* %2)
  call fastcc void @onebyonecpy_hls.p0a168f32([168 x float]* align 512 %5, [168 x float]* %4)
  call fastcc void @onebyonecpy_hls.p0a168f32([168 x float]* align 512 %7, [168 x float]* %6)
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream.3"(%"class.hls::stream.3"* align 512 %9, %"class.hls::stream.3"* %8)
  ret void
}

; Function Attrs: noinline
define internal fastcc void @"onebyonecpy_hls.p0class.hls::stream"(%"class.hls::stream"* noalias align 512, %"class.hls::stream"* noalias) unnamed_addr #2 {
entry:
  %2 = icmp eq %"class.hls::stream"* %0, null
  %3 = icmp eq %"class.hls::stream"* %1, null
  %4 = or i1 %2, %3
  br i1 %4, label %ret, label %copy

copy:                                             ; preds = %entry
  %5 = bitcast %"class.hls::stream"* %1 to i8*
  %6 = call i1 @fpga_fifo_exist_12(i8* %5)
  br i1 %6, label %7, label %8

; <label>:7:                                      ; preds = %copy
  call fastcc void @"streamcpy_hls.p0class.hls::stream"(%"class.hls::stream"* nonnull align 512 %0, %"class.hls::stream"* nonnull %1)
  br label %ret

; <label>:8:                                      ; preds = %copy
  %9 = bitcast %"class.hls::stream"* %0 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %9, i8* align 1 %5, i64 4, i1 false)
  %.0.14 = getelementptr %"class.hls::stream", %"class.hls::stream"* %1, i32 0, i32 0, i32 1
  %.01.15 = getelementptr %"class.hls::stream", %"class.hls::stream"* %0, i32 0, i32 0, i32 1
  %10 = bitcast %struct.ap_uint* %.0.14 to i8*
  %11 = call i1 @fpga_fifo_exist_1(i8* %10)
  br i1 %11, label %12, label %13

; <label>:12:                                     ; preds = %8
  call fastcc void @streamcpy_hls.p0struct.ap_uint(%struct.ap_uint* %.01.15, %struct.ap_uint* %.0.14)
  br label %24

; <label>:13:                                     ; preds = %8
  %.0.1.06 = getelementptr %"class.hls::stream", %"class.hls::stream"* %1, i32 0, i32 0, i32 1, i32 0
  %.01.1.07 = getelementptr %"class.hls::stream", %"class.hls::stream"* %0, i32 0, i32 0, i32 1, i32 0
  %14 = bitcast %struct.ap_int_base* %.0.1.06 to i8*
  %15 = call i1 @fpga_fifo_exist_1(i8* %14)
  br i1 %15, label %16, label %17

; <label>:16:                                     ; preds = %13
  call fastcc void @streamcpy_hls.p0struct.ap_int_base(%struct.ap_int_base* %.01.1.07, %struct.ap_int_base* %.0.1.06)
  br label %24

; <label>:17:                                     ; preds = %13
  %.0.1.0.08 = getelementptr %"class.hls::stream", %"class.hls::stream"* %1, i32 0, i32 0, i32 1, i32 0, i32 0
  %.01.1.0.09 = getelementptr %"class.hls::stream", %"class.hls::stream"* %0, i32 0, i32 0, i32 1, i32 0, i32 0
  %18 = bitcast %struct.ssdm_int* %.0.1.0.08 to i8*
  %19 = call i1 @fpga_fifo_exist_1(i8* %18)
  br i1 %19, label %20, label %21

; <label>:20:                                     ; preds = %17
  call fastcc void @streamcpy_hls.p0struct.ssdm_int(%struct.ssdm_int* %.01.1.0.09, %struct.ssdm_int* %.0.1.0.08)
  br label %24

; <label>:21:                                     ; preds = %17
  %.01.1.0.0.011.gep53 = getelementptr %"class.hls::stream", %"class.hls::stream"* %0, i32 0, i32 0, i32 1, i32 0, i32 0, i32 0
  %22 = bitcast i4* %.01.1.0.0.011.gep53 to i8*
  %.0.1.0.0.010.gep54 = getelementptr %"class.hls::stream", %"class.hls::stream"* %1, i32 0, i32 0, i32 1, i32 0, i32 0, i32 0
  %23 = bitcast i4* %.0.1.0.0.010.gep54 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %22, i8* align 1 %23, i64 1, i1 false)
  br label %24

; <label>:24:                                     ; preds = %21, %20, %16, %12
  %.0.212 = getelementptr %"class.hls::stream", %"class.hls::stream"* %1, i32 0, i32 0, i32 2
  %.01.213 = getelementptr %"class.hls::stream", %"class.hls::stream"* %0, i32 0, i32 0, i32 2
  %25 = bitcast %struct.ap_uint* %.0.212 to i8*
  %26 = call i1 @fpga_fifo_exist_1(i8* %25)
  br i1 %26, label %27, label %28

; <label>:27:                                     ; preds = %24
  call fastcc void @streamcpy_hls.p0struct.ap_uint(%struct.ap_uint* %.01.213, %struct.ap_uint* %.0.212)
  br label %39

; <label>:28:                                     ; preds = %24
  %.0.2.014 = getelementptr %"class.hls::stream", %"class.hls::stream"* %1, i32 0, i32 0, i32 2, i32 0
  %.01.2.015 = getelementptr %"class.hls::stream", %"class.hls::stream"* %0, i32 0, i32 0, i32 2, i32 0
  %29 = bitcast %struct.ap_int_base* %.0.2.014 to i8*
  %30 = call i1 @fpga_fifo_exist_1(i8* %29)
  br i1 %30, label %31, label %32

; <label>:31:                                     ; preds = %28
  call fastcc void @streamcpy_hls.p0struct.ap_int_base(%struct.ap_int_base* %.01.2.015, %struct.ap_int_base* %.0.2.014)
  br label %39

; <label>:32:                                     ; preds = %28
  %.0.2.0.016 = getelementptr %"class.hls::stream", %"class.hls::stream"* %1, i32 0, i32 0, i32 2, i32 0, i32 0
  %.01.2.0.017 = getelementptr %"class.hls::stream", %"class.hls::stream"* %0, i32 0, i32 0, i32 2, i32 0, i32 0
  %33 = bitcast %struct.ssdm_int* %.0.2.0.016 to i8*
  %34 = call i1 @fpga_fifo_exist_1(i8* %33)
  br i1 %34, label %35, label %36

; <label>:35:                                     ; preds = %32
  call fastcc void @streamcpy_hls.p0struct.ssdm_int(%struct.ssdm_int* %.01.2.0.017, %struct.ssdm_int* %.0.2.0.016)
  br label %39

; <label>:36:                                     ; preds = %32
  %.01.2.0.0.019.gep55 = getelementptr %"class.hls::stream", %"class.hls::stream"* %0, i32 0, i32 0, i32 2, i32 0, i32 0, i32 0
  %37 = bitcast i4* %.01.2.0.0.019.gep55 to i8*
  %.0.2.0.0.018.gep56 = getelementptr %"class.hls::stream", %"class.hls::stream"* %1, i32 0, i32 0, i32 2, i32 0, i32 0, i32 0
  %38 = bitcast i4* %.0.2.0.0.018.gep56 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %37, i8* align 1 %38, i64 1, i1 false)
  br label %39

; <label>:39:                                     ; preds = %36, %35, %31, %27
  %.0.320 = getelementptr %"class.hls::stream", %"class.hls::stream"* %1, i32 0, i32 0, i32 3
  %.01.321 = getelementptr %"class.hls::stream", %"class.hls::stream"* %0, i32 0, i32 0, i32 3
  %40 = bitcast %struct.ap_uint.0* %.0.320 to i8*
  %41 = call i1 @fpga_fifo_exist_1(i8* %40)
  br i1 %41, label %42, label %43

; <label>:42:                                     ; preds = %39
  call fastcc void @streamcpy_hls.p0struct.ap_uint.0(%struct.ap_uint.0* %.01.321, %struct.ap_uint.0* %.0.320)
  br label %54

; <label>:43:                                     ; preds = %39
  %.0.3.022 = getelementptr %"class.hls::stream", %"class.hls::stream"* %1, i32 0, i32 0, i32 3, i32 0
  %.01.3.023 = getelementptr %"class.hls::stream", %"class.hls::stream"* %0, i32 0, i32 0, i32 3, i32 0
  %44 = bitcast %struct.ap_int_base.1* %.0.3.022 to i8*
  %45 = call i1 @fpga_fifo_exist_1(i8* %44)
  br i1 %45, label %46, label %47

; <label>:46:                                     ; preds = %43
  call fastcc void @streamcpy_hls.p0struct.ap_int_base.1(%struct.ap_int_base.1* %.01.3.023, %struct.ap_int_base.1* %.0.3.022)
  br label %54

; <label>:47:                                     ; preds = %43
  %.0.3.0.024 = getelementptr %"class.hls::stream", %"class.hls::stream"* %1, i32 0, i32 0, i32 3, i32 0, i32 0
  %.01.3.0.025 = getelementptr %"class.hls::stream", %"class.hls::stream"* %0, i32 0, i32 0, i32 3, i32 0, i32 0
  %48 = bitcast %struct.ssdm_int.2* %.0.3.0.024 to i8*
  %49 = call i1 @fpga_fifo_exist_1(i8* %48)
  br i1 %49, label %50, label %51

; <label>:50:                                     ; preds = %47
  call fastcc void @streamcpy_hls.p0struct.ssdm_int.2(%struct.ssdm_int.2* %.01.3.0.025, %struct.ssdm_int.2* %.0.3.0.024)
  br label %54

; <label>:51:                                     ; preds = %47
  %.01.3.0.0.027.gep57 = getelementptr %"class.hls::stream", %"class.hls::stream"* %0, i32 0, i32 0, i32 3, i32 0, i32 0, i32 0
  %52 = bitcast i1* %.01.3.0.0.027.gep57 to i8*
  %.0.3.0.0.026.gep58 = getelementptr %"class.hls::stream", %"class.hls::stream"* %1, i32 0, i32 0, i32 3, i32 0, i32 0, i32 0
  %53 = bitcast i1* %.0.3.0.0.026.gep58 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %52, i8* align 1 %53, i64 1, i1 false)
  br label %54

; <label>:54:                                     ; preds = %51, %50, %46, %42
  %.0.428 = getelementptr %"class.hls::stream", %"class.hls::stream"* %1, i32 0, i32 0, i32 4
  %.01.429 = getelementptr %"class.hls::stream", %"class.hls::stream"* %0, i32 0, i32 0, i32 4
  %55 = bitcast %struct.ap_uint.0* %.0.428 to i8*
  %56 = call i1 @fpga_fifo_exist_1(i8* %55)
  br i1 %56, label %57, label %58

; <label>:57:                                     ; preds = %54
  call fastcc void @streamcpy_hls.p0struct.ap_uint.0(%struct.ap_uint.0* %.01.429, %struct.ap_uint.0* %.0.428)
  br label %69

; <label>:58:                                     ; preds = %54
  %.0.4.030 = getelementptr %"class.hls::stream", %"class.hls::stream"* %1, i32 0, i32 0, i32 4, i32 0
  %.01.4.031 = getelementptr %"class.hls::stream", %"class.hls::stream"* %0, i32 0, i32 0, i32 4, i32 0
  %59 = bitcast %struct.ap_int_base.1* %.0.4.030 to i8*
  %60 = call i1 @fpga_fifo_exist_1(i8* %59)
  br i1 %60, label %61, label %62

; <label>:61:                                     ; preds = %58
  call fastcc void @streamcpy_hls.p0struct.ap_int_base.1(%struct.ap_int_base.1* %.01.4.031, %struct.ap_int_base.1* %.0.4.030)
  br label %69

; <label>:62:                                     ; preds = %58
  %.0.4.0.032 = getelementptr %"class.hls::stream", %"class.hls::stream"* %1, i32 0, i32 0, i32 4, i32 0, i32 0
  %.01.4.0.033 = getelementptr %"class.hls::stream", %"class.hls::stream"* %0, i32 0, i32 0, i32 4, i32 0, i32 0
  %63 = bitcast %struct.ssdm_int.2* %.0.4.0.032 to i8*
  %64 = call i1 @fpga_fifo_exist_1(i8* %63)
  br i1 %64, label %65, label %66

; <label>:65:                                     ; preds = %62
  call fastcc void @streamcpy_hls.p0struct.ssdm_int.2(%struct.ssdm_int.2* %.01.4.0.033, %struct.ssdm_int.2* %.0.4.0.032)
  br label %69

; <label>:66:                                     ; preds = %62
  %.01.4.0.0.035.gep59 = getelementptr %"class.hls::stream", %"class.hls::stream"* %0, i32 0, i32 0, i32 4, i32 0, i32 0, i32 0
  %67 = bitcast i1* %.01.4.0.0.035.gep59 to i8*
  %.0.4.0.0.034.gep60 = getelementptr %"class.hls::stream", %"class.hls::stream"* %1, i32 0, i32 0, i32 4, i32 0, i32 0, i32 0
  %68 = bitcast i1* %.0.4.0.0.034.gep60 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %67, i8* align 1 %68, i64 1, i1 false)
  br label %69

; <label>:69:                                     ; preds = %66, %65, %61, %57
  %.0.536 = getelementptr %"class.hls::stream", %"class.hls::stream"* %1, i32 0, i32 0, i32 5
  %.01.537 = getelementptr %"class.hls::stream", %"class.hls::stream"* %0, i32 0, i32 0, i32 5
  %70 = bitcast %struct.ap_uint.0* %.0.536 to i8*
  %71 = call i1 @fpga_fifo_exist_1(i8* %70)
  br i1 %71, label %72, label %73

; <label>:72:                                     ; preds = %69
  call fastcc void @streamcpy_hls.p0struct.ap_uint.0(%struct.ap_uint.0* %.01.537, %struct.ap_uint.0* %.0.536)
  br label %84

; <label>:73:                                     ; preds = %69
  %.0.5.038 = getelementptr %"class.hls::stream", %"class.hls::stream"* %1, i32 0, i32 0, i32 5, i32 0
  %.01.5.039 = getelementptr %"class.hls::stream", %"class.hls::stream"* %0, i32 0, i32 0, i32 5, i32 0
  %74 = bitcast %struct.ap_int_base.1* %.0.5.038 to i8*
  %75 = call i1 @fpga_fifo_exist_1(i8* %74)
  br i1 %75, label %76, label %77

; <label>:76:                                     ; preds = %73
  call fastcc void @streamcpy_hls.p0struct.ap_int_base.1(%struct.ap_int_base.1* %.01.5.039, %struct.ap_int_base.1* %.0.5.038)
  br label %84

; <label>:77:                                     ; preds = %73
  %.0.5.0.040 = getelementptr %"class.hls::stream", %"class.hls::stream"* %1, i32 0, i32 0, i32 5, i32 0, i32 0
  %.01.5.0.041 = getelementptr %"class.hls::stream", %"class.hls::stream"* %0, i32 0, i32 0, i32 5, i32 0, i32 0
  %78 = bitcast %struct.ssdm_int.2* %.0.5.0.040 to i8*
  %79 = call i1 @fpga_fifo_exist_1(i8* %78)
  br i1 %79, label %80, label %81

; <label>:80:                                     ; preds = %77
  call fastcc void @streamcpy_hls.p0struct.ssdm_int.2(%struct.ssdm_int.2* %.01.5.0.041, %struct.ssdm_int.2* %.0.5.0.040)
  br label %84

; <label>:81:                                     ; preds = %77
  %.01.5.0.0.043.gep61 = getelementptr %"class.hls::stream", %"class.hls::stream"* %0, i32 0, i32 0, i32 5, i32 0, i32 0, i32 0
  %82 = bitcast i1* %.01.5.0.0.043.gep61 to i8*
  %.0.5.0.0.042.gep62 = getelementptr %"class.hls::stream", %"class.hls::stream"* %1, i32 0, i32 0, i32 5, i32 0, i32 0, i32 0
  %83 = bitcast i1* %.0.5.0.0.042.gep62 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %82, i8* align 1 %83, i64 1, i1 false)
  br label %84

; <label>:84:                                     ; preds = %81, %80, %76, %72
  %.0.644 = getelementptr %"class.hls::stream", %"class.hls::stream"* %1, i32 0, i32 0, i32 6
  %.01.645 = getelementptr %"class.hls::stream", %"class.hls::stream"* %0, i32 0, i32 0, i32 6
  %85 = bitcast %struct.ap_uint.0* %.0.644 to i8*
  %86 = call i1 @fpga_fifo_exist_1(i8* %85)
  br i1 %86, label %87, label %88

; <label>:87:                                     ; preds = %84
  call fastcc void @streamcpy_hls.p0struct.ap_uint.0(%struct.ap_uint.0* %.01.645, %struct.ap_uint.0* %.0.644)
  br label %ret

; <label>:88:                                     ; preds = %84
  %.0.6.046 = getelementptr %"class.hls::stream", %"class.hls::stream"* %1, i32 0, i32 0, i32 6, i32 0
  %.01.6.047 = getelementptr %"class.hls::stream", %"class.hls::stream"* %0, i32 0, i32 0, i32 6, i32 0
  %89 = bitcast %struct.ap_int_base.1* %.0.6.046 to i8*
  %90 = call i1 @fpga_fifo_exist_1(i8* %89)
  br i1 %90, label %91, label %92

; <label>:91:                                     ; preds = %88
  call fastcc void @streamcpy_hls.p0struct.ap_int_base.1(%struct.ap_int_base.1* %.01.6.047, %struct.ap_int_base.1* %.0.6.046)
  br label %ret

; <label>:92:                                     ; preds = %88
  %.0.6.0.048 = getelementptr %"class.hls::stream", %"class.hls::stream"* %1, i32 0, i32 0, i32 6, i32 0, i32 0
  %.01.6.0.049 = getelementptr %"class.hls::stream", %"class.hls::stream"* %0, i32 0, i32 0, i32 6, i32 0, i32 0
  %93 = bitcast %struct.ssdm_int.2* %.0.6.0.048 to i8*
  %94 = call i1 @fpga_fifo_exist_1(i8* %93)
  br i1 %94, label %95, label %96

; <label>:95:                                     ; preds = %92
  call fastcc void @streamcpy_hls.p0struct.ssdm_int.2(%struct.ssdm_int.2* %.01.6.0.049, %struct.ssdm_int.2* %.0.6.0.048)
  br label %ret

; <label>:96:                                     ; preds = %92
  %.01.6.0.0.051.gep63 = getelementptr %"class.hls::stream", %"class.hls::stream"* %0, i32 0, i32 0, i32 6, i32 0, i32 0, i32 0
  %97 = bitcast i1* %.01.6.0.0.051.gep63 to i8*
  %.0.6.0.0.050.gep64 = getelementptr %"class.hls::stream", %"class.hls::stream"* %1, i32 0, i32 0, i32 6, i32 0, i32 0, i32 0
  %98 = bitcast i1* %.0.6.0.0.050.gep64 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %97, i8* align 1 %98, i64 1, i1 false)
  br label %ret

ret:                                              ; preds = %96, %95, %91, %87, %7, %entry
  ret void
}

declare i1 @fpga_fifo_exist_12(i8*) local_unnamed_addr

; Function Attrs: argmemonly noinline
define internal fastcc void @"streamcpy_hls.p0class.hls::stream"(%"class.hls::stream"* noalias nocapture align 512, %"class.hls::stream"* noalias nocapture) unnamed_addr #3 {
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

; Function Attrs: argmemonly noinline
define internal fastcc void @onebyonecpy_hls.p0a168f32([168 x float]* noalias align 512, [168 x float]* noalias readonly) unnamed_addr #5 {
entry:
  %2 = icmp eq [168 x float]* %0, null
  %3 = icmp eq [168 x float]* %1, null
  %4 = or i1 %2, %3
  br i1 %4, label %ret, label %copy

copy:                                             ; preds = %entry
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %copy
  %for.loop.idx3 = phi i64 [ 0, %copy ], [ %for.loop.idx.next, %for.loop ]
  %dst.addr.gep1 = getelementptr [168 x float], [168 x float]* %0, i64 0, i64 %for.loop.idx3
  %5 = bitcast float* %dst.addr.gep1 to i8*
  %src.addr.gep2 = getelementptr [168 x float], [168 x float]* %1, i64 0, i64 %for.loop.idx3
  %6 = bitcast float* %src.addr.gep2 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %5, i8* align 1 %6, i64 4, i1 false)
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx3, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, 168
  br i1 %exitcond, label %for.loop, label %ret

ret:                                              ; preds = %for.loop, %entry
  ret void
}

; Function Attrs: noinline
define internal fastcc void @"onebyonecpy_hls.p0class.hls::stream.3"(%"class.hls::stream.3"* noalias align 512, %"class.hls::stream.3"* noalias) unnamed_addr #2 {
entry:
  %2 = icmp eq %"class.hls::stream.3"* %0, null
  %3 = icmp eq %"class.hls::stream.3"* %1, null
  %4 = or i1 %2, %3
  br i1 %4, label %ret, label %copy

copy:                                             ; preds = %entry
  %5 = bitcast %"class.hls::stream.3"* %1 to i8*
  %6 = call i1 @fpga_fifo_exist_12(i8* %5)
  br i1 %6, label %7, label %8

; <label>:7:                                      ; preds = %copy
  call fastcc void @"streamcpy_hls.p0class.hls::stream.3"(%"class.hls::stream.3"* nonnull align 512 %0, %"class.hls::stream.3"* nonnull %1)
  br label %ret

; <label>:8:                                      ; preds = %copy
  %9 = bitcast %"class.hls::stream.3"* %0 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %9, i8* align 1 %5, i64 4, i1 false)
  %.0.14 = getelementptr %"class.hls::stream.3", %"class.hls::stream.3"* %1, i32 0, i32 0, i32 1
  %.01.15 = getelementptr %"class.hls::stream.3", %"class.hls::stream.3"* %0, i32 0, i32 0, i32 1
  %10 = bitcast %struct.ap_uint* %.0.14 to i8*
  %11 = call i1 @fpga_fifo_exist_1(i8* %10)
  br i1 %11, label %12, label %13

; <label>:12:                                     ; preds = %8
  call fastcc void @streamcpy_hls.p0struct.ap_uint(%struct.ap_uint* %.01.15, %struct.ap_uint* %.0.14)
  br label %24

; <label>:13:                                     ; preds = %8
  %.0.1.06 = getelementptr %"class.hls::stream.3", %"class.hls::stream.3"* %1, i32 0, i32 0, i32 1, i32 0
  %.01.1.07 = getelementptr %"class.hls::stream.3", %"class.hls::stream.3"* %0, i32 0, i32 0, i32 1, i32 0
  %14 = bitcast %struct.ap_int_base* %.0.1.06 to i8*
  %15 = call i1 @fpga_fifo_exist_1(i8* %14)
  br i1 %15, label %16, label %17

; <label>:16:                                     ; preds = %13
  call fastcc void @streamcpy_hls.p0struct.ap_int_base(%struct.ap_int_base* %.01.1.07, %struct.ap_int_base* %.0.1.06)
  br label %24

; <label>:17:                                     ; preds = %13
  %.0.1.0.08 = getelementptr %"class.hls::stream.3", %"class.hls::stream.3"* %1, i32 0, i32 0, i32 1, i32 0, i32 0
  %.01.1.0.09 = getelementptr %"class.hls::stream.3", %"class.hls::stream.3"* %0, i32 0, i32 0, i32 1, i32 0, i32 0
  %18 = bitcast %struct.ssdm_int* %.0.1.0.08 to i8*
  %19 = call i1 @fpga_fifo_exist_1(i8* %18)
  br i1 %19, label %20, label %21

; <label>:20:                                     ; preds = %17
  call fastcc void @streamcpy_hls.p0struct.ssdm_int(%struct.ssdm_int* %.01.1.0.09, %struct.ssdm_int* %.0.1.0.08)
  br label %24

; <label>:21:                                     ; preds = %17
  %.01.1.0.0.011.gep53 = getelementptr %"class.hls::stream.3", %"class.hls::stream.3"* %0, i32 0, i32 0, i32 1, i32 0, i32 0, i32 0
  %22 = bitcast i4* %.01.1.0.0.011.gep53 to i8*
  %.0.1.0.0.010.gep54 = getelementptr %"class.hls::stream.3", %"class.hls::stream.3"* %1, i32 0, i32 0, i32 1, i32 0, i32 0, i32 0
  %23 = bitcast i4* %.0.1.0.0.010.gep54 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %22, i8* align 1 %23, i64 1, i1 false)
  br label %24

; <label>:24:                                     ; preds = %21, %20, %16, %12
  %.0.212 = getelementptr %"class.hls::stream.3", %"class.hls::stream.3"* %1, i32 0, i32 0, i32 2
  %.01.213 = getelementptr %"class.hls::stream.3", %"class.hls::stream.3"* %0, i32 0, i32 0, i32 2
  %25 = bitcast %struct.ap_uint* %.0.212 to i8*
  %26 = call i1 @fpga_fifo_exist_1(i8* %25)
  br i1 %26, label %27, label %28

; <label>:27:                                     ; preds = %24
  call fastcc void @streamcpy_hls.p0struct.ap_uint(%struct.ap_uint* %.01.213, %struct.ap_uint* %.0.212)
  br label %39

; <label>:28:                                     ; preds = %24
  %.0.2.014 = getelementptr %"class.hls::stream.3", %"class.hls::stream.3"* %1, i32 0, i32 0, i32 2, i32 0
  %.01.2.015 = getelementptr %"class.hls::stream.3", %"class.hls::stream.3"* %0, i32 0, i32 0, i32 2, i32 0
  %29 = bitcast %struct.ap_int_base* %.0.2.014 to i8*
  %30 = call i1 @fpga_fifo_exist_1(i8* %29)
  br i1 %30, label %31, label %32

; <label>:31:                                     ; preds = %28
  call fastcc void @streamcpy_hls.p0struct.ap_int_base(%struct.ap_int_base* %.01.2.015, %struct.ap_int_base* %.0.2.014)
  br label %39

; <label>:32:                                     ; preds = %28
  %.0.2.0.016 = getelementptr %"class.hls::stream.3", %"class.hls::stream.3"* %1, i32 0, i32 0, i32 2, i32 0, i32 0
  %.01.2.0.017 = getelementptr %"class.hls::stream.3", %"class.hls::stream.3"* %0, i32 0, i32 0, i32 2, i32 0, i32 0
  %33 = bitcast %struct.ssdm_int* %.0.2.0.016 to i8*
  %34 = call i1 @fpga_fifo_exist_1(i8* %33)
  br i1 %34, label %35, label %36

; <label>:35:                                     ; preds = %32
  call fastcc void @streamcpy_hls.p0struct.ssdm_int(%struct.ssdm_int* %.01.2.0.017, %struct.ssdm_int* %.0.2.0.016)
  br label %39

; <label>:36:                                     ; preds = %32
  %.01.2.0.0.019.gep55 = getelementptr %"class.hls::stream.3", %"class.hls::stream.3"* %0, i32 0, i32 0, i32 2, i32 0, i32 0, i32 0
  %37 = bitcast i4* %.01.2.0.0.019.gep55 to i8*
  %.0.2.0.0.018.gep56 = getelementptr %"class.hls::stream.3", %"class.hls::stream.3"* %1, i32 0, i32 0, i32 2, i32 0, i32 0, i32 0
  %38 = bitcast i4* %.0.2.0.0.018.gep56 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %37, i8* align 1 %38, i64 1, i1 false)
  br label %39

; <label>:39:                                     ; preds = %36, %35, %31, %27
  %.0.320 = getelementptr %"class.hls::stream.3", %"class.hls::stream.3"* %1, i32 0, i32 0, i32 3
  %.01.321 = getelementptr %"class.hls::stream.3", %"class.hls::stream.3"* %0, i32 0, i32 0, i32 3
  %40 = bitcast %struct.ap_uint.0* %.0.320 to i8*
  %41 = call i1 @fpga_fifo_exist_1(i8* %40)
  br i1 %41, label %42, label %43

; <label>:42:                                     ; preds = %39
  call fastcc void @streamcpy_hls.p0struct.ap_uint.0(%struct.ap_uint.0* %.01.321, %struct.ap_uint.0* %.0.320)
  br label %54

; <label>:43:                                     ; preds = %39
  %.0.3.022 = getelementptr %"class.hls::stream.3", %"class.hls::stream.3"* %1, i32 0, i32 0, i32 3, i32 0
  %.01.3.023 = getelementptr %"class.hls::stream.3", %"class.hls::stream.3"* %0, i32 0, i32 0, i32 3, i32 0
  %44 = bitcast %struct.ap_int_base.1* %.0.3.022 to i8*
  %45 = call i1 @fpga_fifo_exist_1(i8* %44)
  br i1 %45, label %46, label %47

; <label>:46:                                     ; preds = %43
  call fastcc void @streamcpy_hls.p0struct.ap_int_base.1(%struct.ap_int_base.1* %.01.3.023, %struct.ap_int_base.1* %.0.3.022)
  br label %54

; <label>:47:                                     ; preds = %43
  %.0.3.0.024 = getelementptr %"class.hls::stream.3", %"class.hls::stream.3"* %1, i32 0, i32 0, i32 3, i32 0, i32 0
  %.01.3.0.025 = getelementptr %"class.hls::stream.3", %"class.hls::stream.3"* %0, i32 0, i32 0, i32 3, i32 0, i32 0
  %48 = bitcast %struct.ssdm_int.2* %.0.3.0.024 to i8*
  %49 = call i1 @fpga_fifo_exist_1(i8* %48)
  br i1 %49, label %50, label %51

; <label>:50:                                     ; preds = %47
  call fastcc void @streamcpy_hls.p0struct.ssdm_int.2(%struct.ssdm_int.2* %.01.3.0.025, %struct.ssdm_int.2* %.0.3.0.024)
  br label %54

; <label>:51:                                     ; preds = %47
  %.01.3.0.0.027.gep57 = getelementptr %"class.hls::stream.3", %"class.hls::stream.3"* %0, i32 0, i32 0, i32 3, i32 0, i32 0, i32 0
  %52 = bitcast i1* %.01.3.0.0.027.gep57 to i8*
  %.0.3.0.0.026.gep58 = getelementptr %"class.hls::stream.3", %"class.hls::stream.3"* %1, i32 0, i32 0, i32 3, i32 0, i32 0, i32 0
  %53 = bitcast i1* %.0.3.0.0.026.gep58 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %52, i8* align 1 %53, i64 1, i1 false)
  br label %54

; <label>:54:                                     ; preds = %51, %50, %46, %42
  %.0.428 = getelementptr %"class.hls::stream.3", %"class.hls::stream.3"* %1, i32 0, i32 0, i32 4
  %.01.429 = getelementptr %"class.hls::stream.3", %"class.hls::stream.3"* %0, i32 0, i32 0, i32 4
  %55 = bitcast %struct.ap_uint.0* %.0.428 to i8*
  %56 = call i1 @fpga_fifo_exist_1(i8* %55)
  br i1 %56, label %57, label %58

; <label>:57:                                     ; preds = %54
  call fastcc void @streamcpy_hls.p0struct.ap_uint.0(%struct.ap_uint.0* %.01.429, %struct.ap_uint.0* %.0.428)
  br label %69

; <label>:58:                                     ; preds = %54
  %.0.4.030 = getelementptr %"class.hls::stream.3", %"class.hls::stream.3"* %1, i32 0, i32 0, i32 4, i32 0
  %.01.4.031 = getelementptr %"class.hls::stream.3", %"class.hls::stream.3"* %0, i32 0, i32 0, i32 4, i32 0
  %59 = bitcast %struct.ap_int_base.1* %.0.4.030 to i8*
  %60 = call i1 @fpga_fifo_exist_1(i8* %59)
  br i1 %60, label %61, label %62

; <label>:61:                                     ; preds = %58
  call fastcc void @streamcpy_hls.p0struct.ap_int_base.1(%struct.ap_int_base.1* %.01.4.031, %struct.ap_int_base.1* %.0.4.030)
  br label %69

; <label>:62:                                     ; preds = %58
  %.0.4.0.032 = getelementptr %"class.hls::stream.3", %"class.hls::stream.3"* %1, i32 0, i32 0, i32 4, i32 0, i32 0
  %.01.4.0.033 = getelementptr %"class.hls::stream.3", %"class.hls::stream.3"* %0, i32 0, i32 0, i32 4, i32 0, i32 0
  %63 = bitcast %struct.ssdm_int.2* %.0.4.0.032 to i8*
  %64 = call i1 @fpga_fifo_exist_1(i8* %63)
  br i1 %64, label %65, label %66

; <label>:65:                                     ; preds = %62
  call fastcc void @streamcpy_hls.p0struct.ssdm_int.2(%struct.ssdm_int.2* %.01.4.0.033, %struct.ssdm_int.2* %.0.4.0.032)
  br label %69

; <label>:66:                                     ; preds = %62
  %.01.4.0.0.035.gep59 = getelementptr %"class.hls::stream.3", %"class.hls::stream.3"* %0, i32 0, i32 0, i32 4, i32 0, i32 0, i32 0
  %67 = bitcast i1* %.01.4.0.0.035.gep59 to i8*
  %.0.4.0.0.034.gep60 = getelementptr %"class.hls::stream.3", %"class.hls::stream.3"* %1, i32 0, i32 0, i32 4, i32 0, i32 0, i32 0
  %68 = bitcast i1* %.0.4.0.0.034.gep60 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %67, i8* align 1 %68, i64 1, i1 false)
  br label %69

; <label>:69:                                     ; preds = %66, %65, %61, %57
  %.0.536 = getelementptr %"class.hls::stream.3", %"class.hls::stream.3"* %1, i32 0, i32 0, i32 5
  %.01.537 = getelementptr %"class.hls::stream.3", %"class.hls::stream.3"* %0, i32 0, i32 0, i32 5
  %70 = bitcast %struct.ap_uint.0* %.0.536 to i8*
  %71 = call i1 @fpga_fifo_exist_1(i8* %70)
  br i1 %71, label %72, label %73

; <label>:72:                                     ; preds = %69
  call fastcc void @streamcpy_hls.p0struct.ap_uint.0(%struct.ap_uint.0* %.01.537, %struct.ap_uint.0* %.0.536)
  br label %84

; <label>:73:                                     ; preds = %69
  %.0.5.038 = getelementptr %"class.hls::stream.3", %"class.hls::stream.3"* %1, i32 0, i32 0, i32 5, i32 0
  %.01.5.039 = getelementptr %"class.hls::stream.3", %"class.hls::stream.3"* %0, i32 0, i32 0, i32 5, i32 0
  %74 = bitcast %struct.ap_int_base.1* %.0.5.038 to i8*
  %75 = call i1 @fpga_fifo_exist_1(i8* %74)
  br i1 %75, label %76, label %77

; <label>:76:                                     ; preds = %73
  call fastcc void @streamcpy_hls.p0struct.ap_int_base.1(%struct.ap_int_base.1* %.01.5.039, %struct.ap_int_base.1* %.0.5.038)
  br label %84

; <label>:77:                                     ; preds = %73
  %.0.5.0.040 = getelementptr %"class.hls::stream.3", %"class.hls::stream.3"* %1, i32 0, i32 0, i32 5, i32 0, i32 0
  %.01.5.0.041 = getelementptr %"class.hls::stream.3", %"class.hls::stream.3"* %0, i32 0, i32 0, i32 5, i32 0, i32 0
  %78 = bitcast %struct.ssdm_int.2* %.0.5.0.040 to i8*
  %79 = call i1 @fpga_fifo_exist_1(i8* %78)
  br i1 %79, label %80, label %81

; <label>:80:                                     ; preds = %77
  call fastcc void @streamcpy_hls.p0struct.ssdm_int.2(%struct.ssdm_int.2* %.01.5.0.041, %struct.ssdm_int.2* %.0.5.0.040)
  br label %84

; <label>:81:                                     ; preds = %77
  %.01.5.0.0.043.gep61 = getelementptr %"class.hls::stream.3", %"class.hls::stream.3"* %0, i32 0, i32 0, i32 5, i32 0, i32 0, i32 0
  %82 = bitcast i1* %.01.5.0.0.043.gep61 to i8*
  %.0.5.0.0.042.gep62 = getelementptr %"class.hls::stream.3", %"class.hls::stream.3"* %1, i32 0, i32 0, i32 5, i32 0, i32 0, i32 0
  %83 = bitcast i1* %.0.5.0.0.042.gep62 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %82, i8* align 1 %83, i64 1, i1 false)
  br label %84

; <label>:84:                                     ; preds = %81, %80, %76, %72
  %.0.644 = getelementptr %"class.hls::stream.3", %"class.hls::stream.3"* %1, i32 0, i32 0, i32 6
  %.01.645 = getelementptr %"class.hls::stream.3", %"class.hls::stream.3"* %0, i32 0, i32 0, i32 6
  %85 = bitcast %struct.ap_uint.0* %.0.644 to i8*
  %86 = call i1 @fpga_fifo_exist_1(i8* %85)
  br i1 %86, label %87, label %88

; <label>:87:                                     ; preds = %84
  call fastcc void @streamcpy_hls.p0struct.ap_uint.0(%struct.ap_uint.0* %.01.645, %struct.ap_uint.0* %.0.644)
  br label %ret

; <label>:88:                                     ; preds = %84
  %.0.6.046 = getelementptr %"class.hls::stream.3", %"class.hls::stream.3"* %1, i32 0, i32 0, i32 6, i32 0
  %.01.6.047 = getelementptr %"class.hls::stream.3", %"class.hls::stream.3"* %0, i32 0, i32 0, i32 6, i32 0
  %89 = bitcast %struct.ap_int_base.1* %.0.6.046 to i8*
  %90 = call i1 @fpga_fifo_exist_1(i8* %89)
  br i1 %90, label %91, label %92

; <label>:91:                                     ; preds = %88
  call fastcc void @streamcpy_hls.p0struct.ap_int_base.1(%struct.ap_int_base.1* %.01.6.047, %struct.ap_int_base.1* %.0.6.046)
  br label %ret

; <label>:92:                                     ; preds = %88
  %.0.6.0.048 = getelementptr %"class.hls::stream.3", %"class.hls::stream.3"* %1, i32 0, i32 0, i32 6, i32 0, i32 0
  %.01.6.0.049 = getelementptr %"class.hls::stream.3", %"class.hls::stream.3"* %0, i32 0, i32 0, i32 6, i32 0, i32 0
  %93 = bitcast %struct.ssdm_int.2* %.0.6.0.048 to i8*
  %94 = call i1 @fpga_fifo_exist_1(i8* %93)
  br i1 %94, label %95, label %96

; <label>:95:                                     ; preds = %92
  call fastcc void @streamcpy_hls.p0struct.ssdm_int.2(%struct.ssdm_int.2* %.01.6.0.049, %struct.ssdm_int.2* %.0.6.0.048)
  br label %ret

; <label>:96:                                     ; preds = %92
  %.01.6.0.0.051.gep63 = getelementptr %"class.hls::stream.3", %"class.hls::stream.3"* %0, i32 0, i32 0, i32 6, i32 0, i32 0, i32 0
  %97 = bitcast i1* %.01.6.0.0.051.gep63 to i8*
  %.0.6.0.0.050.gep64 = getelementptr %"class.hls::stream.3", %"class.hls::stream.3"* %1, i32 0, i32 0, i32 6, i32 0, i32 0, i32 0
  %98 = bitcast i1* %.0.6.0.0.050.gep64 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %97, i8* align 1 %98, i64 1, i1 false)
  br label %ret

ret:                                              ; preds = %96, %95, %91, %87, %7, %entry
  ret void
}

; Function Attrs: argmemonly noinline
define internal fastcc void @"streamcpy_hls.p0class.hls::stream.3"(%"class.hls::stream.3"* noalias nocapture align 512, %"class.hls::stream.3"* noalias nocapture) unnamed_addr #3 {
entry:
  %2 = alloca %"class.hls::stream.3"
  br label %empty

empty:                                            ; preds = %push, %entry
  %3 = bitcast %"class.hls::stream.3"* %1 to i8*
  %4 = call i1 @fpga_fifo_not_empty_12(i8* %3)
  br i1 %4, label %push, label %ret

push:                                             ; preds = %empty
  %5 = bitcast %"class.hls::stream.3"* %2 to i8*
  %6 = bitcast %"class.hls::stream.3"* %1 to i8*
  call void @fpga_fifo_pop_12(i8* %5, i8* %6)
  %7 = load volatile %"class.hls::stream.3", %"class.hls::stream.3"* %2
  %8 = bitcast %"class.hls::stream.3"* %2 to i8*
  %9 = bitcast %"class.hls::stream.3"* %0 to i8*
  call void @fpga_fifo_push_12(i8* %8, i8* %9)
  br label %empty, !llvm.loop !13

ret:                                              ; preds = %empty
  %10 = bitcast %"class.hls::stream.3"* %1 to i8*
  %11 = bitcast %"class.hls::stream.3"* %0 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %11, i8* align 1 %10, i64 12, i1 false)
  ret void
}

; Function Attrs: noinline
define internal fastcc void @copy_out(%"class.hls::stream"*, %"class.hls::stream"* noalias align 512, %"class.hls::stream"*, %"class.hls::stream"* noalias align 512, [168 x float]*, [168 x float]* noalias readonly align 512, [168 x float]*, [168 x float]* noalias readonly align 512, %"class.hls::stream.3"*, %"class.hls::stream.3"* noalias align 512) unnamed_addr #6 {
entry:
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream"(%"class.hls::stream"* %0, %"class.hls::stream"* align 512 %1)
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream"(%"class.hls::stream"* %2, %"class.hls::stream"* align 512 %3)
  call fastcc void @onebyonecpy_hls.p0a168f32([168 x float]* %4, [168 x float]* align 512 %5)
  call fastcc void @onebyonecpy_hls.p0a168f32([168 x float]* %6, [168 x float]* align 512 %7)
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream.3"(%"class.hls::stream.3"* %8, %"class.hls::stream.3"* align 512 %9)
  ret void
}

declare void @apatb_sss_corr_hw(%"class.hls::stream"*, %"class.hls::stream"*, float*, float*, %"class.hls::stream.3"*)

define void @sss_corr_hw_stub_wrapper(%"class.hls::stream"*, %"class.hls::stream"*, float*, float*, %"class.hls::stream.3"*) #7 {
entry:
  %5 = bitcast float* %2 to [168 x float]*
  %6 = bitcast float* %3 to [168 x float]*
  call void @copy_out(%"class.hls::stream"* null, %"class.hls::stream"* %0, %"class.hls::stream"* null, %"class.hls::stream"* %1, [168 x float]* null, [168 x float]* %5, [168 x float]* null, [168 x float]* %6, %"class.hls::stream.3"* null, %"class.hls::stream.3"* %4)
  %7 = bitcast [168 x float]* %5 to float*
  %8 = bitcast [168 x float]* %6 to float*
  call void @sss_corr_hw_stub(%"class.hls::stream"* %0, %"class.hls::stream"* %1, float* %7, float* %8, %"class.hls::stream.3"* %4)
  call void @copy_in(%"class.hls::stream"* null, %"class.hls::stream"* %0, %"class.hls::stream"* null, %"class.hls::stream"* %1, [168 x float]* null, [168 x float]* %5, [168 x float]* null, [168 x float]* %6, %"class.hls::stream.3"* null, %"class.hls::stream.3"* %4)
  ret void
}

declare void @sss_corr_hw_stub(%"class.hls::stream"*, %"class.hls::stream"*, float*, float*, %"class.hls::stream.3"*)

declare i1 @fpga_fifo_not_empty_12(i8*)

declare i1 @fpga_fifo_not_empty_1(i8*)

declare void @fpga_fifo_pop_12(i8*, i8*)

declare void @fpga_fifo_pop_1(i8*, i8*)

declare void @fpga_fifo_push_12(i8*, i8*)

declare void @fpga_fifo_push_1(i8*, i8*)

attributes #0 = { noinline "fpga.wrapper.func"="wrapper" }
attributes #1 = { noinline "fpga.wrapper.func"="copyin" }
attributes #2 = { noinline "fpga.wrapper.func"="onebyonecpy_hls" }
attributes #3 = { argmemonly noinline "fpga.wrapper.func"="streamcpy_hls" }
attributes #4 = { argmemonly nounwind }
attributes #5 = { argmemonly noinline "fpga.wrapper.func"="onebyonecpy_hls" }
attributes #6 = { noinline "fpga.wrapper.func"="copyout" }
attributes #7 = { "fpga.wrapper.func"="stub" }

!llvm.dbg.cu = !{}
!llvm.ident = !{!0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0}
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
