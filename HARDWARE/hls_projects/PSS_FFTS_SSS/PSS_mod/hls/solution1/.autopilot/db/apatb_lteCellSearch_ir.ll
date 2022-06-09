; ModuleID = '/home/jhigh/Capstone_Project/main/HARDWARE/HLS_Pjts/PSS_FFTS_SSS/PSS_mod/hls/solution1/.autopilot/db/a.g.ld.5.gdce.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-i64:64-i128:128-i256:256-i512:512-i1024:1024-i2048:2048-i4096:4096-n8:16:32:64-S128-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024"
target triple = "fpga64-xilinx-none"

%"class.hls::stream" = type { %"struct.hls::axis" }
%"struct.hls::axis" = type { %struct.ap_ufixed, %struct.ap_uint, %struct.ap_uint, %struct.ap_uint.3, %struct.ap_uint.3, %struct.ap_uint.3, %struct.ap_uint.3 }
%struct.ap_ufixed = type { %struct.ap_fixed_base.0 }
%struct.ap_fixed_base.0 = type { %struct.ssdm_int.1 }
%struct.ssdm_int.1 = type { i16 }
%struct.ap_uint = type { %struct.ap_int_base }
%struct.ap_int_base = type { %struct.ssdm_int.2 }
%struct.ssdm_int.2 = type { i2 }
%struct.ap_uint.3 = type { %struct.ap_int_base.4 }
%struct.ap_int_base.4 = type { %struct.ssdm_int.5 }
%struct.ssdm_int.5 = type { i1 }
%"class.hls::stream.51" = type { %"struct.hls::axis.52" }
%"struct.hls::axis.52" = type { %"struct.std::complex", %struct.ap_uint.53, %struct.ap_uint.53, %struct.ap_uint.3, %struct.ap_uint.3, %struct.ap_uint.3, %struct.ap_uint.3 }
%"struct.std::complex" = type { { float, float } }
%struct.ap_uint.53 = type { %struct.ap_int_base.54 }
%struct.ap_int_base.54 = type { %struct.ssdm_int.55 }
%struct.ssdm_int.55 = type { i8 }
%"class.hls::stream.56" = type { %"struct.hls::axis.57" }
%"struct.hls::axis.57" = type { i32, %struct.ap_uint.58, %struct.ap_uint.58, %struct.ap_uint.3, %struct.ap_uint.3, %struct.ap_uint.3, %struct.ap_uint.3 }
%struct.ap_uint.58 = type { %struct.ap_int_base.59 }
%struct.ap_int_base.59 = type { %struct.ssdm_int.60 }
%struct.ssdm_int.60 = type { i4 }

; Function Attrs: noinline
define void @apatb_lteCellSearch_ir(%"class.hls::stream"* %IN_R, %"class.hls::stream"* %IN_I, %"class.hls::stream.51"* %OUT_FFT, %"class.hls::stream.56"* %pss_id, i32* %OUT_PSS_ID, i32* %OUT_PEAK_INDEX, i32* %OUT_RSLT) local_unnamed_addr #0 {
entry:
  %IN_R_copy = alloca %"class.hls::stream", align 512
  %IN_I_copy = alloca %"class.hls::stream", align 512
  %OUT_FFT_copy = alloca %"class.hls::stream.51", align 512
  %pss_id_copy = alloca %"class.hls::stream.56", align 512
  %OUT_PSS_ID_copy = alloca i32, align 512
  %OUT_PEAK_INDEX_copy = alloca i32, align 512
  %malloccall = tail call i8* @malloc(i64 384000)
  %OUT_RSLT_copy = bitcast i8* %malloccall to [96000 x i32]*
  %0 = bitcast i32* %OUT_RSLT to [96000 x i32]*
  call fastcc void @copy_in(%"class.hls::stream"* %IN_R, %"class.hls::stream"* nonnull align 512 %IN_R_copy, %"class.hls::stream"* %IN_I, %"class.hls::stream"* nonnull align 512 %IN_I_copy, %"class.hls::stream.51"* %OUT_FFT, %"class.hls::stream.51"* nonnull align 512 %OUT_FFT_copy, %"class.hls::stream.56"* %pss_id, %"class.hls::stream.56"* nonnull align 512 %pss_id_copy, i32* %OUT_PSS_ID, i32* nonnull align 512 %OUT_PSS_ID_copy, i32* %OUT_PEAK_INDEX, i32* nonnull align 512 %OUT_PEAK_INDEX_copy, [96000 x i32]* %0, [96000 x i32]* %OUT_RSLT_copy)
  %1 = getelementptr inbounds [96000 x i32], [96000 x i32]* %OUT_RSLT_copy, i32 0, i32 0
  call void @apatb_lteCellSearch_hw(%"class.hls::stream"* %IN_R_copy, %"class.hls::stream"* %IN_I_copy, %"class.hls::stream.51"* %OUT_FFT_copy, %"class.hls::stream.56"* %pss_id_copy, i32* %OUT_PSS_ID_copy, i32* %OUT_PEAK_INDEX_copy, i32* %1)
  call fastcc void @copy_out(%"class.hls::stream"* %IN_R, %"class.hls::stream"* nonnull align 512 %IN_R_copy, %"class.hls::stream"* %IN_I, %"class.hls::stream"* nonnull align 512 %IN_I_copy, %"class.hls::stream.51"* %OUT_FFT, %"class.hls::stream.51"* nonnull align 512 %OUT_FFT_copy, %"class.hls::stream.56"* %pss_id, %"class.hls::stream.56"* nonnull align 512 %pss_id_copy, i32* %OUT_PSS_ID, i32* nonnull align 512 %OUT_PSS_ID_copy, i32* %OUT_PEAK_INDEX, i32* nonnull align 512 %OUT_PEAK_INDEX_copy, [96000 x i32]* %0, [96000 x i32]* %OUT_RSLT_copy)
  tail call void @free(i8* %malloccall)
  ret void
}

declare noalias i8* @malloc(i64) local_unnamed_addr

; Function Attrs: noinline
define internal fastcc void @copy_in(%"class.hls::stream"*, %"class.hls::stream"* noalias align 512, %"class.hls::stream"*, %"class.hls::stream"* noalias align 512, %"class.hls::stream.51"*, %"class.hls::stream.51"* noalias align 512, %"class.hls::stream.56"*, %"class.hls::stream.56"* noalias align 512, i32* readonly, i32* noalias align 512, i32* readonly, i32* noalias align 512, [96000 x i32]* readonly, [96000 x i32]* noalias) unnamed_addr #1 {
entry:
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream"(%"class.hls::stream"* align 512 %1, %"class.hls::stream"* %0)
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream"(%"class.hls::stream"* align 512 %3, %"class.hls::stream"* %2)
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream.51"(%"class.hls::stream.51"* align 512 %5, %"class.hls::stream.51"* %4)
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream.56"(%"class.hls::stream.56"* align 512 %7, %"class.hls::stream.56"* %6)
  call fastcc void @onebyonecpy_hls.p0i32(i32* align 512 %9, i32* %8)
  call fastcc void @onebyonecpy_hls.p0i32(i32* align 512 %11, i32* %10)
  call fastcc void @onebyonecpy_hls.p0a96000i32([96000 x i32]* %13, [96000 x i32]* %12)
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
  %6 = call i1 @fpga_fifo_exist_8(i8* %5)
  br i1 %6, label %7, label %8

; <label>:7:                                      ; preds = %copy
  call fastcc void @"streamcpy_hls.p0class.hls::stream"(%"class.hls::stream"* nonnull align 512 %0, %"class.hls::stream"* nonnull %1)
  br label %ret

; <label>:8:                                      ; preds = %copy
  %.0.02 = getelementptr %"class.hls::stream", %"class.hls::stream"* %1, i32 0, i32 0, i32 0
  %.01.03 = getelementptr %"class.hls::stream", %"class.hls::stream"* %0, i32 0, i32 0, i32 0
  %9 = call i1 @fpga_fifo_exist_2(i8* %5)
  br i1 %9, label %10, label %11

; <label>:10:                                     ; preds = %8
  call fastcc void @streamcpy_hls.p0struct.ap_ufixed(%struct.ap_ufixed* align 512 %.01.03, %struct.ap_ufixed* %.0.02)
  br label %19

; <label>:11:                                     ; preds = %8
  %.0.0.04 = getelementptr %"class.hls::stream", %"class.hls::stream"* %1, i32 0, i32 0, i32 0, i32 0
  %.01.0.05 = getelementptr %"class.hls::stream", %"class.hls::stream"* %0, i32 0, i32 0, i32 0, i32 0
  %12 = call i1 @fpga_fifo_exist_2(i8* %5)
  br i1 %12, label %13, label %14

; <label>:13:                                     ; preds = %11
  call fastcc void @streamcpy_hls.p0struct.ap_fixed_base.0(%struct.ap_fixed_base.0* align 512 %.01.0.05, %struct.ap_fixed_base.0* %.0.0.04)
  br label %19

; <label>:14:                                     ; preds = %11
  %.0.0.0.06 = getelementptr %"class.hls::stream", %"class.hls::stream"* %1, i32 0, i32 0, i32 0, i32 0, i32 0
  %.01.0.0.07 = getelementptr %"class.hls::stream", %"class.hls::stream"* %0, i32 0, i32 0, i32 0, i32 0, i32 0
  %15 = call i1 @fpga_fifo_exist_2(i8* %5)
  br i1 %15, label %16, label %17

; <label>:16:                                     ; preds = %14
  call fastcc void @streamcpy_hls.p0struct.ssdm_int.1(%struct.ssdm_int.1* align 512 %.01.0.0.07, %struct.ssdm_int.1* %.0.0.0.06)
  br label %19

; <label>:17:                                     ; preds = %14
  %18 = bitcast %"class.hls::stream"* %0 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %18, i8* align 1 %5, i64 2, i1 false)
  br label %19

; <label>:19:                                     ; preds = %17, %16, %13, %10
  %.0.110 = getelementptr %"class.hls::stream", %"class.hls::stream"* %1, i32 0, i32 0, i32 1
  %.01.111 = getelementptr %"class.hls::stream", %"class.hls::stream"* %0, i32 0, i32 0, i32 1
  %20 = bitcast %struct.ap_uint* %.0.110 to i8*
  %21 = call i1 @fpga_fifo_exist_1(i8* %20)
  br i1 %21, label %22, label %23

; <label>:22:                                     ; preds = %19
  call fastcc void @streamcpy_hls.p0struct.ap_uint(%struct.ap_uint* %.01.111, %struct.ap_uint* %.0.110)
  br label %34

; <label>:23:                                     ; preds = %19
  %.0.1.012 = getelementptr %"class.hls::stream", %"class.hls::stream"* %1, i32 0, i32 0, i32 1, i32 0
  %.01.1.013 = getelementptr %"class.hls::stream", %"class.hls::stream"* %0, i32 0, i32 0, i32 1, i32 0
  %24 = bitcast %struct.ap_int_base* %.0.1.012 to i8*
  %25 = call i1 @fpga_fifo_exist_1(i8* %24)
  br i1 %25, label %26, label %27

; <label>:26:                                     ; preds = %23
  call fastcc void @streamcpy_hls.p0struct.ap_int_base(%struct.ap_int_base* %.01.1.013, %struct.ap_int_base* %.0.1.012)
  br label %34

; <label>:27:                                     ; preds = %23
  %.0.1.0.014 = getelementptr %"class.hls::stream", %"class.hls::stream"* %1, i32 0, i32 0, i32 1, i32 0, i32 0
  %.01.1.0.015 = getelementptr %"class.hls::stream", %"class.hls::stream"* %0, i32 0, i32 0, i32 1, i32 0, i32 0
  %28 = bitcast %struct.ssdm_int.2* %.0.1.0.014 to i8*
  %29 = call i1 @fpga_fifo_exist_1(i8* %28)
  br i1 %29, label %30, label %31

; <label>:30:                                     ; preds = %27
  call fastcc void @streamcpy_hls.p0struct.ssdm_int.2(%struct.ssdm_int.2* %.01.1.0.015, %struct.ssdm_int.2* %.0.1.0.014)
  br label %34

; <label>:31:                                     ; preds = %27
  %.01.1.0.0.017.gep59 = getelementptr %"class.hls::stream", %"class.hls::stream"* %0, i32 0, i32 0, i32 1, i32 0, i32 0, i32 0
  %32 = bitcast i2* %.01.1.0.0.017.gep59 to i8*
  %.0.1.0.0.016.gep60 = getelementptr %"class.hls::stream", %"class.hls::stream"* %1, i32 0, i32 0, i32 1, i32 0, i32 0, i32 0
  %33 = bitcast i2* %.0.1.0.0.016.gep60 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %32, i8* align 1 %33, i64 1, i1 false)
  br label %34

; <label>:34:                                     ; preds = %31, %30, %26, %22
  %.0.218 = getelementptr %"class.hls::stream", %"class.hls::stream"* %1, i32 0, i32 0, i32 2
  %.01.219 = getelementptr %"class.hls::stream", %"class.hls::stream"* %0, i32 0, i32 0, i32 2
  %35 = bitcast %struct.ap_uint* %.0.218 to i8*
  %36 = call i1 @fpga_fifo_exist_1(i8* %35)
  br i1 %36, label %37, label %38

; <label>:37:                                     ; preds = %34
  call fastcc void @streamcpy_hls.p0struct.ap_uint(%struct.ap_uint* %.01.219, %struct.ap_uint* %.0.218)
  br label %49

; <label>:38:                                     ; preds = %34
  %.0.2.020 = getelementptr %"class.hls::stream", %"class.hls::stream"* %1, i32 0, i32 0, i32 2, i32 0
  %.01.2.021 = getelementptr %"class.hls::stream", %"class.hls::stream"* %0, i32 0, i32 0, i32 2, i32 0
  %39 = bitcast %struct.ap_int_base* %.0.2.020 to i8*
  %40 = call i1 @fpga_fifo_exist_1(i8* %39)
  br i1 %40, label %41, label %42

; <label>:41:                                     ; preds = %38
  call fastcc void @streamcpy_hls.p0struct.ap_int_base(%struct.ap_int_base* %.01.2.021, %struct.ap_int_base* %.0.2.020)
  br label %49

; <label>:42:                                     ; preds = %38
  %.0.2.0.022 = getelementptr %"class.hls::stream", %"class.hls::stream"* %1, i32 0, i32 0, i32 2, i32 0, i32 0
  %.01.2.0.023 = getelementptr %"class.hls::stream", %"class.hls::stream"* %0, i32 0, i32 0, i32 2, i32 0, i32 0
  %43 = bitcast %struct.ssdm_int.2* %.0.2.0.022 to i8*
  %44 = call i1 @fpga_fifo_exist_1(i8* %43)
  br i1 %44, label %45, label %46

; <label>:45:                                     ; preds = %42
  call fastcc void @streamcpy_hls.p0struct.ssdm_int.2(%struct.ssdm_int.2* %.01.2.0.023, %struct.ssdm_int.2* %.0.2.0.022)
  br label %49

; <label>:46:                                     ; preds = %42
  %.01.2.0.0.025.gep61 = getelementptr %"class.hls::stream", %"class.hls::stream"* %0, i32 0, i32 0, i32 2, i32 0, i32 0, i32 0
  %47 = bitcast i2* %.01.2.0.0.025.gep61 to i8*
  %.0.2.0.0.024.gep62 = getelementptr %"class.hls::stream", %"class.hls::stream"* %1, i32 0, i32 0, i32 2, i32 0, i32 0, i32 0
  %48 = bitcast i2* %.0.2.0.0.024.gep62 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %47, i8* align 1 %48, i64 1, i1 false)
  br label %49

; <label>:49:                                     ; preds = %46, %45, %41, %37
  %.0.326 = getelementptr %"class.hls::stream", %"class.hls::stream"* %1, i32 0, i32 0, i32 3
  %.01.327 = getelementptr %"class.hls::stream", %"class.hls::stream"* %0, i32 0, i32 0, i32 3
  %50 = bitcast %struct.ap_uint.3* %.0.326 to i8*
  %51 = call i1 @fpga_fifo_exist_1(i8* %50)
  br i1 %51, label %52, label %53

; <label>:52:                                     ; preds = %49
  call fastcc void @streamcpy_hls.p0struct.ap_uint.3(%struct.ap_uint.3* %.01.327, %struct.ap_uint.3* %.0.326)
  br label %64

; <label>:53:                                     ; preds = %49
  %.0.3.028 = getelementptr %"class.hls::stream", %"class.hls::stream"* %1, i32 0, i32 0, i32 3, i32 0
  %.01.3.029 = getelementptr %"class.hls::stream", %"class.hls::stream"* %0, i32 0, i32 0, i32 3, i32 0
  %54 = bitcast %struct.ap_int_base.4* %.0.3.028 to i8*
  %55 = call i1 @fpga_fifo_exist_1(i8* %54)
  br i1 %55, label %56, label %57

; <label>:56:                                     ; preds = %53
  call fastcc void @streamcpy_hls.p0struct.ap_int_base.4(%struct.ap_int_base.4* %.01.3.029, %struct.ap_int_base.4* %.0.3.028)
  br label %64

; <label>:57:                                     ; preds = %53
  %.0.3.0.030 = getelementptr %"class.hls::stream", %"class.hls::stream"* %1, i32 0, i32 0, i32 3, i32 0, i32 0
  %.01.3.0.031 = getelementptr %"class.hls::stream", %"class.hls::stream"* %0, i32 0, i32 0, i32 3, i32 0, i32 0
  %58 = bitcast %struct.ssdm_int.5* %.0.3.0.030 to i8*
  %59 = call i1 @fpga_fifo_exist_1(i8* %58)
  br i1 %59, label %60, label %61

; <label>:60:                                     ; preds = %57
  call fastcc void @streamcpy_hls.p0struct.ssdm_int.5(%struct.ssdm_int.5* %.01.3.0.031, %struct.ssdm_int.5* %.0.3.0.030)
  br label %64

; <label>:61:                                     ; preds = %57
  %.01.3.0.0.033.gep63 = getelementptr %"class.hls::stream", %"class.hls::stream"* %0, i32 0, i32 0, i32 3, i32 0, i32 0, i32 0
  %62 = bitcast i1* %.01.3.0.0.033.gep63 to i8*
  %.0.3.0.0.032.gep64 = getelementptr %"class.hls::stream", %"class.hls::stream"* %1, i32 0, i32 0, i32 3, i32 0, i32 0, i32 0
  %63 = bitcast i1* %.0.3.0.0.032.gep64 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %62, i8* align 1 %63, i64 1, i1 false)
  br label %64

; <label>:64:                                     ; preds = %61, %60, %56, %52
  %.0.434 = getelementptr %"class.hls::stream", %"class.hls::stream"* %1, i32 0, i32 0, i32 4
  %.01.435 = getelementptr %"class.hls::stream", %"class.hls::stream"* %0, i32 0, i32 0, i32 4
  %65 = bitcast %struct.ap_uint.3* %.0.434 to i8*
  %66 = call i1 @fpga_fifo_exist_1(i8* %65)
  br i1 %66, label %67, label %68

; <label>:67:                                     ; preds = %64
  call fastcc void @streamcpy_hls.p0struct.ap_uint.3(%struct.ap_uint.3* %.01.435, %struct.ap_uint.3* %.0.434)
  br label %79

; <label>:68:                                     ; preds = %64
  %.0.4.036 = getelementptr %"class.hls::stream", %"class.hls::stream"* %1, i32 0, i32 0, i32 4, i32 0
  %.01.4.037 = getelementptr %"class.hls::stream", %"class.hls::stream"* %0, i32 0, i32 0, i32 4, i32 0
  %69 = bitcast %struct.ap_int_base.4* %.0.4.036 to i8*
  %70 = call i1 @fpga_fifo_exist_1(i8* %69)
  br i1 %70, label %71, label %72

; <label>:71:                                     ; preds = %68
  call fastcc void @streamcpy_hls.p0struct.ap_int_base.4(%struct.ap_int_base.4* %.01.4.037, %struct.ap_int_base.4* %.0.4.036)
  br label %79

; <label>:72:                                     ; preds = %68
  %.0.4.0.038 = getelementptr %"class.hls::stream", %"class.hls::stream"* %1, i32 0, i32 0, i32 4, i32 0, i32 0
  %.01.4.0.039 = getelementptr %"class.hls::stream", %"class.hls::stream"* %0, i32 0, i32 0, i32 4, i32 0, i32 0
  %73 = bitcast %struct.ssdm_int.5* %.0.4.0.038 to i8*
  %74 = call i1 @fpga_fifo_exist_1(i8* %73)
  br i1 %74, label %75, label %76

; <label>:75:                                     ; preds = %72
  call fastcc void @streamcpy_hls.p0struct.ssdm_int.5(%struct.ssdm_int.5* %.01.4.0.039, %struct.ssdm_int.5* %.0.4.0.038)
  br label %79

; <label>:76:                                     ; preds = %72
  %.01.4.0.0.041.gep65 = getelementptr %"class.hls::stream", %"class.hls::stream"* %0, i32 0, i32 0, i32 4, i32 0, i32 0, i32 0
  %77 = bitcast i1* %.01.4.0.0.041.gep65 to i8*
  %.0.4.0.0.040.gep66 = getelementptr %"class.hls::stream", %"class.hls::stream"* %1, i32 0, i32 0, i32 4, i32 0, i32 0, i32 0
  %78 = bitcast i1* %.0.4.0.0.040.gep66 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %77, i8* align 1 %78, i64 1, i1 false)
  br label %79

; <label>:79:                                     ; preds = %76, %75, %71, %67
  %.0.542 = getelementptr %"class.hls::stream", %"class.hls::stream"* %1, i32 0, i32 0, i32 5
  %.01.543 = getelementptr %"class.hls::stream", %"class.hls::stream"* %0, i32 0, i32 0, i32 5
  %80 = bitcast %struct.ap_uint.3* %.0.542 to i8*
  %81 = call i1 @fpga_fifo_exist_1(i8* %80)
  br i1 %81, label %82, label %83

; <label>:82:                                     ; preds = %79
  call fastcc void @streamcpy_hls.p0struct.ap_uint.3(%struct.ap_uint.3* %.01.543, %struct.ap_uint.3* %.0.542)
  br label %94

; <label>:83:                                     ; preds = %79
  %.0.5.044 = getelementptr %"class.hls::stream", %"class.hls::stream"* %1, i32 0, i32 0, i32 5, i32 0
  %.01.5.045 = getelementptr %"class.hls::stream", %"class.hls::stream"* %0, i32 0, i32 0, i32 5, i32 0
  %84 = bitcast %struct.ap_int_base.4* %.0.5.044 to i8*
  %85 = call i1 @fpga_fifo_exist_1(i8* %84)
  br i1 %85, label %86, label %87

; <label>:86:                                     ; preds = %83
  call fastcc void @streamcpy_hls.p0struct.ap_int_base.4(%struct.ap_int_base.4* %.01.5.045, %struct.ap_int_base.4* %.0.5.044)
  br label %94

; <label>:87:                                     ; preds = %83
  %.0.5.0.046 = getelementptr %"class.hls::stream", %"class.hls::stream"* %1, i32 0, i32 0, i32 5, i32 0, i32 0
  %.01.5.0.047 = getelementptr %"class.hls::stream", %"class.hls::stream"* %0, i32 0, i32 0, i32 5, i32 0, i32 0
  %88 = bitcast %struct.ssdm_int.5* %.0.5.0.046 to i8*
  %89 = call i1 @fpga_fifo_exist_1(i8* %88)
  br i1 %89, label %90, label %91

; <label>:90:                                     ; preds = %87
  call fastcc void @streamcpy_hls.p0struct.ssdm_int.5(%struct.ssdm_int.5* %.01.5.0.047, %struct.ssdm_int.5* %.0.5.0.046)
  br label %94

; <label>:91:                                     ; preds = %87
  %.01.5.0.0.049.gep67 = getelementptr %"class.hls::stream", %"class.hls::stream"* %0, i32 0, i32 0, i32 5, i32 0, i32 0, i32 0
  %92 = bitcast i1* %.01.5.0.0.049.gep67 to i8*
  %.0.5.0.0.048.gep68 = getelementptr %"class.hls::stream", %"class.hls::stream"* %1, i32 0, i32 0, i32 5, i32 0, i32 0, i32 0
  %93 = bitcast i1* %.0.5.0.0.048.gep68 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %92, i8* align 1 %93, i64 1, i1 false)
  br label %94

; <label>:94:                                     ; preds = %91, %90, %86, %82
  %.0.650 = getelementptr %"class.hls::stream", %"class.hls::stream"* %1, i32 0, i32 0, i32 6
  %.01.651 = getelementptr %"class.hls::stream", %"class.hls::stream"* %0, i32 0, i32 0, i32 6
  %95 = bitcast %struct.ap_uint.3* %.0.650 to i8*
  %96 = call i1 @fpga_fifo_exist_1(i8* %95)
  br i1 %96, label %97, label %98

; <label>:97:                                     ; preds = %94
  call fastcc void @streamcpy_hls.p0struct.ap_uint.3(%struct.ap_uint.3* %.01.651, %struct.ap_uint.3* %.0.650)
  br label %ret

; <label>:98:                                     ; preds = %94
  %.0.6.052 = getelementptr %"class.hls::stream", %"class.hls::stream"* %1, i32 0, i32 0, i32 6, i32 0
  %.01.6.053 = getelementptr %"class.hls::stream", %"class.hls::stream"* %0, i32 0, i32 0, i32 6, i32 0
  %99 = bitcast %struct.ap_int_base.4* %.0.6.052 to i8*
  %100 = call i1 @fpga_fifo_exist_1(i8* %99)
  br i1 %100, label %101, label %102

; <label>:101:                                    ; preds = %98
  call fastcc void @streamcpy_hls.p0struct.ap_int_base.4(%struct.ap_int_base.4* %.01.6.053, %struct.ap_int_base.4* %.0.6.052)
  br label %ret

; <label>:102:                                    ; preds = %98
  %.0.6.0.054 = getelementptr %"class.hls::stream", %"class.hls::stream"* %1, i32 0, i32 0, i32 6, i32 0, i32 0
  %.01.6.0.055 = getelementptr %"class.hls::stream", %"class.hls::stream"* %0, i32 0, i32 0, i32 6, i32 0, i32 0
  %103 = bitcast %struct.ssdm_int.5* %.0.6.0.054 to i8*
  %104 = call i1 @fpga_fifo_exist_1(i8* %103)
  br i1 %104, label %105, label %106

; <label>:105:                                    ; preds = %102
  call fastcc void @streamcpy_hls.p0struct.ssdm_int.5(%struct.ssdm_int.5* %.01.6.0.055, %struct.ssdm_int.5* %.0.6.0.054)
  br label %ret

; <label>:106:                                    ; preds = %102
  %.01.6.0.0.057.gep69 = getelementptr %"class.hls::stream", %"class.hls::stream"* %0, i32 0, i32 0, i32 6, i32 0, i32 0, i32 0
  %107 = bitcast i1* %.01.6.0.0.057.gep69 to i8*
  %.0.6.0.0.056.gep70 = getelementptr %"class.hls::stream", %"class.hls::stream"* %1, i32 0, i32 0, i32 6, i32 0, i32 0, i32 0
  %108 = bitcast i1* %.0.6.0.0.056.gep70 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %107, i8* align 1 %108, i64 1, i1 false)
  br label %ret

ret:                                              ; preds = %106, %105, %101, %97, %7, %entry
  ret void
}

declare i1 @fpga_fifo_exist_8(i8*) local_unnamed_addr

; Function Attrs: argmemonly noinline
define internal fastcc void @"streamcpy_hls.p0class.hls::stream"(%"class.hls::stream"* noalias nocapture align 512, %"class.hls::stream"* noalias nocapture) unnamed_addr #3 {
entry:
  %2 = alloca %"class.hls::stream"
  br label %empty

empty:                                            ; preds = %push, %entry
  %3 = bitcast %"class.hls::stream"* %1 to i8*
  %4 = call i1 @fpga_fifo_not_empty_8(i8* %3)
  br i1 %4, label %push, label %ret

push:                                             ; preds = %empty
  %5 = bitcast %"class.hls::stream"* %2 to i8*
  %6 = bitcast %"class.hls::stream"* %1 to i8*
  call void @fpga_fifo_pop_8(i8* %5, i8* %6)
  %7 = load volatile %"class.hls::stream", %"class.hls::stream"* %2
  %8 = bitcast %"class.hls::stream"* %2 to i8*
  %9 = bitcast %"class.hls::stream"* %0 to i8*
  call void @fpga_fifo_push_8(i8* %8, i8* %9)
  br label %empty, !llvm.loop !5

ret:                                              ; preds = %empty
  %10 = bitcast %"class.hls::stream"* %1 to i8*
  %11 = bitcast %"class.hls::stream"* %0 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %11, i8* align 1 %10, i64 8, i1 false)
  ret void
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1) #4

declare i1 @fpga_fifo_exist_2(i8*) local_unnamed_addr

; Function Attrs: argmemonly noinline
define internal fastcc void @streamcpy_hls.p0struct.ap_ufixed(%struct.ap_ufixed* noalias nocapture align 512, %struct.ap_ufixed* noalias nocapture) unnamed_addr #3 {
entry:
  %2 = alloca %struct.ap_ufixed
  br label %empty

empty:                                            ; preds = %push, %entry
  %3 = bitcast %struct.ap_ufixed* %1 to i8*
  %4 = call i1 @fpga_fifo_not_empty_2(i8* %3)
  br i1 %4, label %push, label %ret

push:                                             ; preds = %empty
  %5 = bitcast %struct.ap_ufixed* %2 to i8*
  %6 = bitcast %struct.ap_ufixed* %1 to i8*
  call void @fpga_fifo_pop_2(i8* %5, i8* %6)
  %7 = load volatile %struct.ap_ufixed, %struct.ap_ufixed* %2
  %8 = bitcast %struct.ap_ufixed* %2 to i8*
  %9 = bitcast %struct.ap_ufixed* %0 to i8*
  call void @fpga_fifo_push_2(i8* %8, i8* %9)
  br label %empty, !llvm.loop !7

ret:                                              ; preds = %empty
  %10 = bitcast %struct.ap_ufixed* %1 to i8*
  %11 = bitcast %struct.ap_ufixed* %0 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %11, i8* align 1 %10, i64 2, i1 false)
  ret void
}

; Function Attrs: argmemonly noinline
define internal fastcc void @streamcpy_hls.p0struct.ap_fixed_base.0(%struct.ap_fixed_base.0* noalias nocapture align 512, %struct.ap_fixed_base.0* noalias nocapture) unnamed_addr #3 {
entry:
  %2 = alloca %struct.ap_fixed_base.0
  br label %empty

empty:                                            ; preds = %push, %entry
  %3 = bitcast %struct.ap_fixed_base.0* %1 to i8*
  %4 = call i1 @fpga_fifo_not_empty_2(i8* %3)
  br i1 %4, label %push, label %ret

push:                                             ; preds = %empty
  %5 = bitcast %struct.ap_fixed_base.0* %2 to i8*
  %6 = bitcast %struct.ap_fixed_base.0* %1 to i8*
  call void @fpga_fifo_pop_2(i8* %5, i8* %6)
  %7 = load volatile %struct.ap_fixed_base.0, %struct.ap_fixed_base.0* %2
  %8 = bitcast %struct.ap_fixed_base.0* %2 to i8*
  %9 = bitcast %struct.ap_fixed_base.0* %0 to i8*
  call void @fpga_fifo_push_2(i8* %8, i8* %9)
  br label %empty, !llvm.loop !8

ret:                                              ; preds = %empty
  %10 = bitcast %struct.ap_fixed_base.0* %1 to i8*
  %11 = bitcast %struct.ap_fixed_base.0* %0 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %11, i8* align 1 %10, i64 2, i1 false)
  ret void
}

; Function Attrs: argmemonly noinline
define internal fastcc void @streamcpy_hls.p0struct.ssdm_int.1(%struct.ssdm_int.1* noalias nocapture align 512, %struct.ssdm_int.1* noalias nocapture) unnamed_addr #3 {
entry:
  %2 = alloca %struct.ssdm_int.1
  br label %empty

empty:                                            ; preds = %push, %entry
  %3 = bitcast %struct.ssdm_int.1* %1 to i8*
  %4 = call i1 @fpga_fifo_not_empty_2(i8* %3)
  br i1 %4, label %push, label %ret

push:                                             ; preds = %empty
  %5 = bitcast %struct.ssdm_int.1* %2 to i8*
  %6 = bitcast %struct.ssdm_int.1* %1 to i8*
  call void @fpga_fifo_pop_2(i8* %5, i8* %6)
  %7 = load volatile %struct.ssdm_int.1, %struct.ssdm_int.1* %2
  %8 = bitcast %struct.ssdm_int.1* %2 to i8*
  %9 = bitcast %struct.ssdm_int.1* %0 to i8*
  call void @fpga_fifo_push_2(i8* %8, i8* %9)
  br label %empty, !llvm.loop !9

ret:                                              ; preds = %empty
  %10 = bitcast %struct.ssdm_int.1* %1 to i8*
  %11 = bitcast %struct.ssdm_int.1* %0 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %11, i8* align 1 %10, i64 2, i1 false)
  ret void
}

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
  br label %empty, !llvm.loop !10

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
  br label %empty, !llvm.loop !11

ret:                                              ; preds = %empty
  %10 = bitcast %struct.ap_int_base* %1 to i8*
  %11 = bitcast %struct.ap_int_base* %0 to i8*
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
define internal fastcc void @streamcpy_hls.p0struct.ap_uint.3(%struct.ap_uint.3* noalias nocapture, %struct.ap_uint.3* noalias nocapture) unnamed_addr #3 {
entry:
  %2 = alloca %struct.ap_uint.3
  br label %empty

empty:                                            ; preds = %push, %entry
  %3 = bitcast %struct.ap_uint.3* %1 to i8*
  %4 = call i1 @fpga_fifo_not_empty_1(i8* %3)
  br i1 %4, label %push, label %ret

push:                                             ; preds = %empty
  %5 = bitcast %struct.ap_uint.3* %2 to i8*
  %6 = bitcast %struct.ap_uint.3* %1 to i8*
  call void @fpga_fifo_pop_1(i8* %5, i8* %6)
  %7 = load volatile %struct.ap_uint.3, %struct.ap_uint.3* %2
  %8 = bitcast %struct.ap_uint.3* %2 to i8*
  %9 = bitcast %struct.ap_uint.3* %0 to i8*
  call void @fpga_fifo_push_1(i8* %8, i8* %9)
  br label %empty, !llvm.loop !13

ret:                                              ; preds = %empty
  %10 = bitcast %struct.ap_uint.3* %1 to i8*
  %11 = bitcast %struct.ap_uint.3* %0 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %11, i8* align 1 %10, i64 1, i1 false)
  ret void
}

; Function Attrs: argmemonly noinline
define internal fastcc void @streamcpy_hls.p0struct.ap_int_base.4(%struct.ap_int_base.4* noalias nocapture, %struct.ap_int_base.4* noalias nocapture) unnamed_addr #3 {
entry:
  %2 = alloca %struct.ap_int_base.4
  br label %empty

empty:                                            ; preds = %push, %entry
  %3 = bitcast %struct.ap_int_base.4* %1 to i8*
  %4 = call i1 @fpga_fifo_not_empty_1(i8* %3)
  br i1 %4, label %push, label %ret

push:                                             ; preds = %empty
  %5 = bitcast %struct.ap_int_base.4* %2 to i8*
  %6 = bitcast %struct.ap_int_base.4* %1 to i8*
  call void @fpga_fifo_pop_1(i8* %5, i8* %6)
  %7 = load volatile %struct.ap_int_base.4, %struct.ap_int_base.4* %2
  %8 = bitcast %struct.ap_int_base.4* %2 to i8*
  %9 = bitcast %struct.ap_int_base.4* %0 to i8*
  call void @fpga_fifo_push_1(i8* %8, i8* %9)
  br label %empty, !llvm.loop !14

ret:                                              ; preds = %empty
  %10 = bitcast %struct.ap_int_base.4* %1 to i8*
  %11 = bitcast %struct.ap_int_base.4* %0 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %11, i8* align 1 %10, i64 1, i1 false)
  ret void
}

; Function Attrs: argmemonly noinline
define internal fastcc void @streamcpy_hls.p0struct.ssdm_int.5(%struct.ssdm_int.5* noalias nocapture, %struct.ssdm_int.5* noalias nocapture) unnamed_addr #3 {
entry:
  %2 = alloca %struct.ssdm_int.5
  br label %empty

empty:                                            ; preds = %push, %entry
  %3 = bitcast %struct.ssdm_int.5* %1 to i8*
  %4 = call i1 @fpga_fifo_not_empty_1(i8* %3)
  br i1 %4, label %push, label %ret

push:                                             ; preds = %empty
  %5 = bitcast %struct.ssdm_int.5* %2 to i8*
  %6 = bitcast %struct.ssdm_int.5* %1 to i8*
  call void @fpga_fifo_pop_1(i8* %5, i8* %6)
  %7 = load volatile %struct.ssdm_int.5, %struct.ssdm_int.5* %2
  %8 = bitcast %struct.ssdm_int.5* %2 to i8*
  %9 = bitcast %struct.ssdm_int.5* %0 to i8*
  call void @fpga_fifo_push_1(i8* %8, i8* %9)
  br label %empty, !llvm.loop !15

ret:                                              ; preds = %empty
  %10 = bitcast %struct.ssdm_int.5* %1 to i8*
  %11 = bitcast %struct.ssdm_int.5* %0 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %11, i8* align 1 %10, i64 1, i1 false)
  ret void
}

; Function Attrs: noinline
define internal fastcc void @"onebyonecpy_hls.p0class.hls::stream.51"(%"class.hls::stream.51"* noalias align 512, %"class.hls::stream.51"* noalias) unnamed_addr #2 {
entry:
  %2 = icmp eq %"class.hls::stream.51"* %0, null
  %3 = icmp eq %"class.hls::stream.51"* %1, null
  %4 = or i1 %2, %3
  br i1 %4, label %ret, label %copy

copy:                                             ; preds = %entry
  %5 = bitcast %"class.hls::stream.51"* %1 to i8*
  %6 = call i1 @fpga_fifo_exist_16(i8* %5)
  br i1 %6, label %7, label %8

; <label>:7:                                      ; preds = %copy
  call fastcc void @"streamcpy_hls.p0class.hls::stream.51"(%"class.hls::stream.51"* nonnull align 512 %0, %"class.hls::stream.51"* nonnull %1)
  br label %ret

; <label>:8:                                      ; preds = %copy
  %.0.02 = getelementptr %"class.hls::stream.51", %"class.hls::stream.51"* %1, i32 0, i32 0, i32 0
  %.01.03 = getelementptr %"class.hls::stream.51", %"class.hls::stream.51"* %0, i32 0, i32 0, i32 0
  %9 = call i1 @fpga_fifo_exist_8(i8* %5)
  br i1 %9, label %10, label %11

; <label>:10:                                     ; preds = %8
  call fastcc void @"streamcpy_hls.p0struct.std::complex"(%"struct.std::complex"* align 512 %.01.03, %"struct.std::complex"* %.0.02)
  br label %15

; <label>:11:                                     ; preds = %8
  %12 = bitcast %"class.hls::stream.51"* %0 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %12, i8* align 1 %5, i64 4, i1 false)
  %.01.0.0.19.gep59 = getelementptr %"class.hls::stream.51", %"class.hls::stream.51"* %0, i32 0, i32 0, i32 0, i32 0, i32 1
  %13 = bitcast float* %.01.0.0.19.gep59 to i8*
  %.0.0.0.18.gep60 = getelementptr %"class.hls::stream.51", %"class.hls::stream.51"* %1, i32 0, i32 0, i32 0, i32 0, i32 1
  %14 = bitcast float* %.0.0.0.18.gep60 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %13, i8* align 1 %14, i64 4, i1 false)
  br label %15

; <label>:15:                                     ; preds = %11, %10
  %.0.110 = getelementptr %"class.hls::stream.51", %"class.hls::stream.51"* %1, i32 0, i32 0, i32 1
  %.01.111 = getelementptr %"class.hls::stream.51", %"class.hls::stream.51"* %0, i32 0, i32 0, i32 1
  %16 = getelementptr %"class.hls::stream.51", %"class.hls::stream.51"* %1, i32 0, i32 0, i32 1, i32 0, i32 0, i32 0
  %17 = call i1 @fpga_fifo_exist_1(i8* %16)
  br i1 %17, label %18, label %19

; <label>:18:                                     ; preds = %15
  call fastcc void @streamcpy_hls.p0struct.ap_uint.53(%struct.ap_uint.53* %.01.111, %struct.ap_uint.53* %.0.110)
  br label %26

; <label>:19:                                     ; preds = %15
  %.0.1.012 = getelementptr %"class.hls::stream.51", %"class.hls::stream.51"* %1, i32 0, i32 0, i32 1, i32 0
  %.01.1.013 = getelementptr %"class.hls::stream.51", %"class.hls::stream.51"* %0, i32 0, i32 0, i32 1, i32 0
  %20 = call i1 @fpga_fifo_exist_1(i8* %16)
  br i1 %20, label %21, label %22

; <label>:21:                                     ; preds = %19
  call fastcc void @streamcpy_hls.p0struct.ap_int_base.54(%struct.ap_int_base.54* %.01.1.013, %struct.ap_int_base.54* %.0.1.012)
  br label %26

; <label>:22:                                     ; preds = %19
  %.0.1.0.014 = getelementptr %"class.hls::stream.51", %"class.hls::stream.51"* %1, i32 0, i32 0, i32 1, i32 0, i32 0
  %.01.1.0.015 = getelementptr %"class.hls::stream.51", %"class.hls::stream.51"* %0, i32 0, i32 0, i32 1, i32 0, i32 0
  %23 = call i1 @fpga_fifo_exist_1(i8* %16)
  br i1 %23, label %24, label %25

; <label>:24:                                     ; preds = %22
  call fastcc void @streamcpy_hls.p0struct.ssdm_int.55(%struct.ssdm_int.55* %.01.1.0.015, %struct.ssdm_int.55* %.0.1.0.014)
  br label %26

; <label>:25:                                     ; preds = %22
  %.01.1.0.0.017 = getelementptr %"class.hls::stream.51", %"class.hls::stream.51"* %0, i32 0, i32 0, i32 1, i32 0, i32 0, i32 0
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %.01.1.0.0.017, i8* align 1 %16, i64 1, i1 false)
  br label %26

; <label>:26:                                     ; preds = %25, %24, %21, %18
  %.0.218 = getelementptr %"class.hls::stream.51", %"class.hls::stream.51"* %1, i32 0, i32 0, i32 2
  %.01.219 = getelementptr %"class.hls::stream.51", %"class.hls::stream.51"* %0, i32 0, i32 0, i32 2
  %27 = getelementptr %"class.hls::stream.51", %"class.hls::stream.51"* %1, i32 0, i32 0, i32 2, i32 0, i32 0, i32 0
  %28 = call i1 @fpga_fifo_exist_1(i8* %27)
  br i1 %28, label %29, label %30

; <label>:29:                                     ; preds = %26
  call fastcc void @streamcpy_hls.p0struct.ap_uint.53(%struct.ap_uint.53* %.01.219, %struct.ap_uint.53* %.0.218)
  br label %37

; <label>:30:                                     ; preds = %26
  %.0.2.020 = getelementptr %"class.hls::stream.51", %"class.hls::stream.51"* %1, i32 0, i32 0, i32 2, i32 0
  %.01.2.021 = getelementptr %"class.hls::stream.51", %"class.hls::stream.51"* %0, i32 0, i32 0, i32 2, i32 0
  %31 = call i1 @fpga_fifo_exist_1(i8* %27)
  br i1 %31, label %32, label %33

; <label>:32:                                     ; preds = %30
  call fastcc void @streamcpy_hls.p0struct.ap_int_base.54(%struct.ap_int_base.54* %.01.2.021, %struct.ap_int_base.54* %.0.2.020)
  br label %37

; <label>:33:                                     ; preds = %30
  %.0.2.0.022 = getelementptr %"class.hls::stream.51", %"class.hls::stream.51"* %1, i32 0, i32 0, i32 2, i32 0, i32 0
  %.01.2.0.023 = getelementptr %"class.hls::stream.51", %"class.hls::stream.51"* %0, i32 0, i32 0, i32 2, i32 0, i32 0
  %34 = call i1 @fpga_fifo_exist_1(i8* %27)
  br i1 %34, label %35, label %36

; <label>:35:                                     ; preds = %33
  call fastcc void @streamcpy_hls.p0struct.ssdm_int.55(%struct.ssdm_int.55* %.01.2.0.023, %struct.ssdm_int.55* %.0.2.0.022)
  br label %37

; <label>:36:                                     ; preds = %33
  %.01.2.0.0.025 = getelementptr %"class.hls::stream.51", %"class.hls::stream.51"* %0, i32 0, i32 0, i32 2, i32 0, i32 0, i32 0
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %.01.2.0.0.025, i8* align 1 %27, i64 1, i1 false)
  br label %37

; <label>:37:                                     ; preds = %36, %35, %32, %29
  %.0.326 = getelementptr %"class.hls::stream.51", %"class.hls::stream.51"* %1, i32 0, i32 0, i32 3
  %.01.327 = getelementptr %"class.hls::stream.51", %"class.hls::stream.51"* %0, i32 0, i32 0, i32 3
  %38 = bitcast %struct.ap_uint.3* %.0.326 to i8*
  %39 = call i1 @fpga_fifo_exist_1(i8* %38)
  br i1 %39, label %40, label %41

; <label>:40:                                     ; preds = %37
  call fastcc void @streamcpy_hls.p0struct.ap_uint.3(%struct.ap_uint.3* %.01.327, %struct.ap_uint.3* %.0.326)
  br label %52

; <label>:41:                                     ; preds = %37
  %.0.3.028 = getelementptr %"class.hls::stream.51", %"class.hls::stream.51"* %1, i32 0, i32 0, i32 3, i32 0
  %.01.3.029 = getelementptr %"class.hls::stream.51", %"class.hls::stream.51"* %0, i32 0, i32 0, i32 3, i32 0
  %42 = bitcast %struct.ap_int_base.4* %.0.3.028 to i8*
  %43 = call i1 @fpga_fifo_exist_1(i8* %42)
  br i1 %43, label %44, label %45

; <label>:44:                                     ; preds = %41
  call fastcc void @streamcpy_hls.p0struct.ap_int_base.4(%struct.ap_int_base.4* %.01.3.029, %struct.ap_int_base.4* %.0.3.028)
  br label %52

; <label>:45:                                     ; preds = %41
  %.0.3.0.030 = getelementptr %"class.hls::stream.51", %"class.hls::stream.51"* %1, i32 0, i32 0, i32 3, i32 0, i32 0
  %.01.3.0.031 = getelementptr %"class.hls::stream.51", %"class.hls::stream.51"* %0, i32 0, i32 0, i32 3, i32 0, i32 0
  %46 = bitcast %struct.ssdm_int.5* %.0.3.0.030 to i8*
  %47 = call i1 @fpga_fifo_exist_1(i8* %46)
  br i1 %47, label %48, label %49

; <label>:48:                                     ; preds = %45
  call fastcc void @streamcpy_hls.p0struct.ssdm_int.5(%struct.ssdm_int.5* %.01.3.0.031, %struct.ssdm_int.5* %.0.3.0.030)
  br label %52

; <label>:49:                                     ; preds = %45
  %.01.3.0.0.033.gep61 = getelementptr %"class.hls::stream.51", %"class.hls::stream.51"* %0, i32 0, i32 0, i32 3, i32 0, i32 0, i32 0
  %50 = bitcast i1* %.01.3.0.0.033.gep61 to i8*
  %.0.3.0.0.032.gep62 = getelementptr %"class.hls::stream.51", %"class.hls::stream.51"* %1, i32 0, i32 0, i32 3, i32 0, i32 0, i32 0
  %51 = bitcast i1* %.0.3.0.0.032.gep62 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %50, i8* align 1 %51, i64 1, i1 false)
  br label %52

; <label>:52:                                     ; preds = %49, %48, %44, %40
  %.0.434 = getelementptr %"class.hls::stream.51", %"class.hls::stream.51"* %1, i32 0, i32 0, i32 4
  %.01.435 = getelementptr %"class.hls::stream.51", %"class.hls::stream.51"* %0, i32 0, i32 0, i32 4
  %53 = bitcast %struct.ap_uint.3* %.0.434 to i8*
  %54 = call i1 @fpga_fifo_exist_1(i8* %53)
  br i1 %54, label %55, label %56

; <label>:55:                                     ; preds = %52
  call fastcc void @streamcpy_hls.p0struct.ap_uint.3(%struct.ap_uint.3* %.01.435, %struct.ap_uint.3* %.0.434)
  br label %67

; <label>:56:                                     ; preds = %52
  %.0.4.036 = getelementptr %"class.hls::stream.51", %"class.hls::stream.51"* %1, i32 0, i32 0, i32 4, i32 0
  %.01.4.037 = getelementptr %"class.hls::stream.51", %"class.hls::stream.51"* %0, i32 0, i32 0, i32 4, i32 0
  %57 = bitcast %struct.ap_int_base.4* %.0.4.036 to i8*
  %58 = call i1 @fpga_fifo_exist_1(i8* %57)
  br i1 %58, label %59, label %60

; <label>:59:                                     ; preds = %56
  call fastcc void @streamcpy_hls.p0struct.ap_int_base.4(%struct.ap_int_base.4* %.01.4.037, %struct.ap_int_base.4* %.0.4.036)
  br label %67

; <label>:60:                                     ; preds = %56
  %.0.4.0.038 = getelementptr %"class.hls::stream.51", %"class.hls::stream.51"* %1, i32 0, i32 0, i32 4, i32 0, i32 0
  %.01.4.0.039 = getelementptr %"class.hls::stream.51", %"class.hls::stream.51"* %0, i32 0, i32 0, i32 4, i32 0, i32 0
  %61 = bitcast %struct.ssdm_int.5* %.0.4.0.038 to i8*
  %62 = call i1 @fpga_fifo_exist_1(i8* %61)
  br i1 %62, label %63, label %64

; <label>:63:                                     ; preds = %60
  call fastcc void @streamcpy_hls.p0struct.ssdm_int.5(%struct.ssdm_int.5* %.01.4.0.039, %struct.ssdm_int.5* %.0.4.0.038)
  br label %67

; <label>:64:                                     ; preds = %60
  %.01.4.0.0.041.gep63 = getelementptr %"class.hls::stream.51", %"class.hls::stream.51"* %0, i32 0, i32 0, i32 4, i32 0, i32 0, i32 0
  %65 = bitcast i1* %.01.4.0.0.041.gep63 to i8*
  %.0.4.0.0.040.gep64 = getelementptr %"class.hls::stream.51", %"class.hls::stream.51"* %1, i32 0, i32 0, i32 4, i32 0, i32 0, i32 0
  %66 = bitcast i1* %.0.4.0.0.040.gep64 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %65, i8* align 1 %66, i64 1, i1 false)
  br label %67

; <label>:67:                                     ; preds = %64, %63, %59, %55
  %.0.542 = getelementptr %"class.hls::stream.51", %"class.hls::stream.51"* %1, i32 0, i32 0, i32 5
  %.01.543 = getelementptr %"class.hls::stream.51", %"class.hls::stream.51"* %0, i32 0, i32 0, i32 5
  %68 = bitcast %struct.ap_uint.3* %.0.542 to i8*
  %69 = call i1 @fpga_fifo_exist_1(i8* %68)
  br i1 %69, label %70, label %71

; <label>:70:                                     ; preds = %67
  call fastcc void @streamcpy_hls.p0struct.ap_uint.3(%struct.ap_uint.3* %.01.543, %struct.ap_uint.3* %.0.542)
  br label %82

; <label>:71:                                     ; preds = %67
  %.0.5.044 = getelementptr %"class.hls::stream.51", %"class.hls::stream.51"* %1, i32 0, i32 0, i32 5, i32 0
  %.01.5.045 = getelementptr %"class.hls::stream.51", %"class.hls::stream.51"* %0, i32 0, i32 0, i32 5, i32 0
  %72 = bitcast %struct.ap_int_base.4* %.0.5.044 to i8*
  %73 = call i1 @fpga_fifo_exist_1(i8* %72)
  br i1 %73, label %74, label %75

; <label>:74:                                     ; preds = %71
  call fastcc void @streamcpy_hls.p0struct.ap_int_base.4(%struct.ap_int_base.4* %.01.5.045, %struct.ap_int_base.4* %.0.5.044)
  br label %82

; <label>:75:                                     ; preds = %71
  %.0.5.0.046 = getelementptr %"class.hls::stream.51", %"class.hls::stream.51"* %1, i32 0, i32 0, i32 5, i32 0, i32 0
  %.01.5.0.047 = getelementptr %"class.hls::stream.51", %"class.hls::stream.51"* %0, i32 0, i32 0, i32 5, i32 0, i32 0
  %76 = bitcast %struct.ssdm_int.5* %.0.5.0.046 to i8*
  %77 = call i1 @fpga_fifo_exist_1(i8* %76)
  br i1 %77, label %78, label %79

; <label>:78:                                     ; preds = %75
  call fastcc void @streamcpy_hls.p0struct.ssdm_int.5(%struct.ssdm_int.5* %.01.5.0.047, %struct.ssdm_int.5* %.0.5.0.046)
  br label %82

; <label>:79:                                     ; preds = %75
  %.01.5.0.0.049.gep65 = getelementptr %"class.hls::stream.51", %"class.hls::stream.51"* %0, i32 0, i32 0, i32 5, i32 0, i32 0, i32 0
  %80 = bitcast i1* %.01.5.0.0.049.gep65 to i8*
  %.0.5.0.0.048.gep66 = getelementptr %"class.hls::stream.51", %"class.hls::stream.51"* %1, i32 0, i32 0, i32 5, i32 0, i32 0, i32 0
  %81 = bitcast i1* %.0.5.0.0.048.gep66 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %80, i8* align 1 %81, i64 1, i1 false)
  br label %82

; <label>:82:                                     ; preds = %79, %78, %74, %70
  %.0.650 = getelementptr %"class.hls::stream.51", %"class.hls::stream.51"* %1, i32 0, i32 0, i32 6
  %.01.651 = getelementptr %"class.hls::stream.51", %"class.hls::stream.51"* %0, i32 0, i32 0, i32 6
  %83 = bitcast %struct.ap_uint.3* %.0.650 to i8*
  %84 = call i1 @fpga_fifo_exist_1(i8* %83)
  br i1 %84, label %85, label %86

; <label>:85:                                     ; preds = %82
  call fastcc void @streamcpy_hls.p0struct.ap_uint.3(%struct.ap_uint.3* %.01.651, %struct.ap_uint.3* %.0.650)
  br label %ret

; <label>:86:                                     ; preds = %82
  %.0.6.052 = getelementptr %"class.hls::stream.51", %"class.hls::stream.51"* %1, i32 0, i32 0, i32 6, i32 0
  %.01.6.053 = getelementptr %"class.hls::stream.51", %"class.hls::stream.51"* %0, i32 0, i32 0, i32 6, i32 0
  %87 = bitcast %struct.ap_int_base.4* %.0.6.052 to i8*
  %88 = call i1 @fpga_fifo_exist_1(i8* %87)
  br i1 %88, label %89, label %90

; <label>:89:                                     ; preds = %86
  call fastcc void @streamcpy_hls.p0struct.ap_int_base.4(%struct.ap_int_base.4* %.01.6.053, %struct.ap_int_base.4* %.0.6.052)
  br label %ret

; <label>:90:                                     ; preds = %86
  %.0.6.0.054 = getelementptr %"class.hls::stream.51", %"class.hls::stream.51"* %1, i32 0, i32 0, i32 6, i32 0, i32 0
  %.01.6.0.055 = getelementptr %"class.hls::stream.51", %"class.hls::stream.51"* %0, i32 0, i32 0, i32 6, i32 0, i32 0
  %91 = bitcast %struct.ssdm_int.5* %.0.6.0.054 to i8*
  %92 = call i1 @fpga_fifo_exist_1(i8* %91)
  br i1 %92, label %93, label %94

; <label>:93:                                     ; preds = %90
  call fastcc void @streamcpy_hls.p0struct.ssdm_int.5(%struct.ssdm_int.5* %.01.6.0.055, %struct.ssdm_int.5* %.0.6.0.054)
  br label %ret

; <label>:94:                                     ; preds = %90
  %.01.6.0.0.057.gep67 = getelementptr %"class.hls::stream.51", %"class.hls::stream.51"* %0, i32 0, i32 0, i32 6, i32 0, i32 0, i32 0
  %95 = bitcast i1* %.01.6.0.0.057.gep67 to i8*
  %.0.6.0.0.056.gep68 = getelementptr %"class.hls::stream.51", %"class.hls::stream.51"* %1, i32 0, i32 0, i32 6, i32 0, i32 0, i32 0
  %96 = bitcast i1* %.0.6.0.0.056.gep68 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %95, i8* align 1 %96, i64 1, i1 false)
  br label %ret

ret:                                              ; preds = %94, %93, %89, %85, %7, %entry
  ret void
}

declare i1 @fpga_fifo_exist_16(i8*) local_unnamed_addr

; Function Attrs: argmemonly noinline
define internal fastcc void @"streamcpy_hls.p0class.hls::stream.51"(%"class.hls::stream.51"* noalias nocapture align 512, %"class.hls::stream.51"* noalias nocapture) unnamed_addr #3 {
entry:
  %2 = alloca %"class.hls::stream.51"
  br label %empty

empty:                                            ; preds = %push, %entry
  %3 = bitcast %"class.hls::stream.51"* %1 to i8*
  %4 = call i1 @fpga_fifo_not_empty_16(i8* %3)
  br i1 %4, label %push, label %ret

push:                                             ; preds = %empty
  %5 = bitcast %"class.hls::stream.51"* %2 to i8*
  %6 = bitcast %"class.hls::stream.51"* %1 to i8*
  call void @fpga_fifo_pop_16(i8* %5, i8* %6)
  %7 = load volatile %"class.hls::stream.51", %"class.hls::stream.51"* %2
  %8 = bitcast %"class.hls::stream.51"* %2 to i8*
  %9 = bitcast %"class.hls::stream.51"* %0 to i8*
  call void @fpga_fifo_push_16(i8* %8, i8* %9)
  br label %empty, !llvm.loop !16

ret:                                              ; preds = %empty
  %10 = bitcast %"class.hls::stream.51"* %1 to i8*
  %11 = bitcast %"class.hls::stream.51"* %0 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %11, i8* align 1 %10, i64 16, i1 false)
  ret void
}

; Function Attrs: argmemonly noinline
define internal fastcc void @"streamcpy_hls.p0struct.std::complex"(%"struct.std::complex"* noalias nocapture align 512, %"struct.std::complex"* noalias nocapture) unnamed_addr #3 {
entry:
  %2 = alloca %"struct.std::complex"
  br label %empty

empty:                                            ; preds = %push, %entry
  %3 = bitcast %"struct.std::complex"* %1 to i8*
  %4 = call i1 @fpga_fifo_not_empty_8(i8* %3)
  br i1 %4, label %push, label %ret

push:                                             ; preds = %empty
  %5 = bitcast %"struct.std::complex"* %2 to i8*
  %6 = bitcast %"struct.std::complex"* %1 to i8*
  call void @fpga_fifo_pop_8(i8* %5, i8* %6)
  %7 = load volatile %"struct.std::complex", %"struct.std::complex"* %2
  %8 = bitcast %"struct.std::complex"* %2 to i8*
  %9 = bitcast %"struct.std::complex"* %0 to i8*
  call void @fpga_fifo_push_8(i8* %8, i8* %9)
  br label %empty, !llvm.loop !17

ret:                                              ; preds = %empty
  %10 = bitcast %"struct.std::complex"* %1 to i8*
  %11 = bitcast %"struct.std::complex"* %0 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %11, i8* align 1 %10, i64 8, i1 false)
  ret void
}

; Function Attrs: argmemonly noinline
define internal fastcc void @streamcpy_hls.p0struct.ap_uint.53(%struct.ap_uint.53* noalias nocapture, %struct.ap_uint.53* noalias nocapture) unnamed_addr #3 {
entry:
  %2 = alloca %struct.ap_uint.53
  br label %empty

empty:                                            ; preds = %push, %entry
  %3 = bitcast %struct.ap_uint.53* %1 to i8*
  %4 = call i1 @fpga_fifo_not_empty_1(i8* %3)
  br i1 %4, label %push, label %ret

push:                                             ; preds = %empty
  %5 = bitcast %struct.ap_uint.53* %2 to i8*
  %6 = bitcast %struct.ap_uint.53* %1 to i8*
  call void @fpga_fifo_pop_1(i8* %5, i8* %6)
  %7 = load volatile %struct.ap_uint.53, %struct.ap_uint.53* %2
  %8 = bitcast %struct.ap_uint.53* %2 to i8*
  %9 = bitcast %struct.ap_uint.53* %0 to i8*
  call void @fpga_fifo_push_1(i8* %8, i8* %9)
  br label %empty, !llvm.loop !18

ret:                                              ; preds = %empty
  %10 = getelementptr inbounds %struct.ap_uint.53, %struct.ap_uint.53* %1, i32 0, i32 0, i32 0, i32 0
  %11 = getelementptr inbounds %struct.ap_uint.53, %struct.ap_uint.53* %0, i32 0, i32 0, i32 0, i32 0
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %11, i8* align 1 %10, i64 1, i1 false)
  ret void
}

; Function Attrs: argmemonly noinline
define internal fastcc void @streamcpy_hls.p0struct.ap_int_base.54(%struct.ap_int_base.54* noalias nocapture, %struct.ap_int_base.54* noalias nocapture) unnamed_addr #3 {
entry:
  %2 = alloca %struct.ap_int_base.54
  br label %empty

empty:                                            ; preds = %push, %entry
  %3 = bitcast %struct.ap_int_base.54* %1 to i8*
  %4 = call i1 @fpga_fifo_not_empty_1(i8* %3)
  br i1 %4, label %push, label %ret

push:                                             ; preds = %empty
  %5 = bitcast %struct.ap_int_base.54* %2 to i8*
  %6 = bitcast %struct.ap_int_base.54* %1 to i8*
  call void @fpga_fifo_pop_1(i8* %5, i8* %6)
  %7 = load volatile %struct.ap_int_base.54, %struct.ap_int_base.54* %2
  %8 = bitcast %struct.ap_int_base.54* %2 to i8*
  %9 = bitcast %struct.ap_int_base.54* %0 to i8*
  call void @fpga_fifo_push_1(i8* %8, i8* %9)
  br label %empty, !llvm.loop !19

ret:                                              ; preds = %empty
  %10 = getelementptr inbounds %struct.ap_int_base.54, %struct.ap_int_base.54* %1, i32 0, i32 0, i32 0
  %11 = getelementptr inbounds %struct.ap_int_base.54, %struct.ap_int_base.54* %0, i32 0, i32 0, i32 0
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %11, i8* align 1 %10, i64 1, i1 false)
  ret void
}

; Function Attrs: argmemonly noinline
define internal fastcc void @streamcpy_hls.p0struct.ssdm_int.55(%struct.ssdm_int.55* noalias nocapture, %struct.ssdm_int.55* noalias nocapture) unnamed_addr #3 {
entry:
  %2 = alloca %struct.ssdm_int.55
  br label %empty

empty:                                            ; preds = %push, %entry
  %3 = bitcast %struct.ssdm_int.55* %1 to i8*
  %4 = call i1 @fpga_fifo_not_empty_1(i8* %3)
  br i1 %4, label %push, label %ret

push:                                             ; preds = %empty
  %5 = bitcast %struct.ssdm_int.55* %2 to i8*
  %6 = bitcast %struct.ssdm_int.55* %1 to i8*
  call void @fpga_fifo_pop_1(i8* %5, i8* %6)
  %7 = load volatile %struct.ssdm_int.55, %struct.ssdm_int.55* %2
  %8 = bitcast %struct.ssdm_int.55* %2 to i8*
  %9 = bitcast %struct.ssdm_int.55* %0 to i8*
  call void @fpga_fifo_push_1(i8* %8, i8* %9)
  br label %empty, !llvm.loop !20

ret:                                              ; preds = %empty
  %10 = getelementptr inbounds %struct.ssdm_int.55, %struct.ssdm_int.55* %1, i32 0, i32 0
  %11 = getelementptr inbounds %struct.ssdm_int.55, %struct.ssdm_int.55* %0, i32 0, i32 0
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %11, i8* align 1 %10, i64 1, i1 false)
  ret void
}

; Function Attrs: noinline
define internal fastcc void @"onebyonecpy_hls.p0class.hls::stream.56"(%"class.hls::stream.56"* noalias align 512, %"class.hls::stream.56"* noalias) unnamed_addr #2 {
entry:
  %2 = icmp eq %"class.hls::stream.56"* %0, null
  %3 = icmp eq %"class.hls::stream.56"* %1, null
  %4 = or i1 %2, %3
  br i1 %4, label %ret, label %copy

copy:                                             ; preds = %entry
  %5 = bitcast %"class.hls::stream.56"* %1 to i8*
  %6 = call i1 @fpga_fifo_exist_12(i8* %5)
  br i1 %6, label %7, label %8

; <label>:7:                                      ; preds = %copy
  call fastcc void @"streamcpy_hls.p0class.hls::stream.56"(%"class.hls::stream.56"* nonnull align 512 %0, %"class.hls::stream.56"* nonnull %1)
  br label %ret

; <label>:8:                                      ; preds = %copy
  %9 = bitcast %"class.hls::stream.56"* %0 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %9, i8* align 1 %5, i64 4, i1 false)
  %.0.14 = getelementptr %"class.hls::stream.56", %"class.hls::stream.56"* %1, i32 0, i32 0, i32 1
  %.01.15 = getelementptr %"class.hls::stream.56", %"class.hls::stream.56"* %0, i32 0, i32 0, i32 1
  %10 = bitcast %struct.ap_uint.58* %.0.14 to i8*
  %11 = call i1 @fpga_fifo_exist_1(i8* %10)
  br i1 %11, label %12, label %13

; <label>:12:                                     ; preds = %8
  call fastcc void @streamcpy_hls.p0struct.ap_uint.58(%struct.ap_uint.58* %.01.15, %struct.ap_uint.58* %.0.14)
  br label %24

; <label>:13:                                     ; preds = %8
  %.0.1.06 = getelementptr %"class.hls::stream.56", %"class.hls::stream.56"* %1, i32 0, i32 0, i32 1, i32 0
  %.01.1.07 = getelementptr %"class.hls::stream.56", %"class.hls::stream.56"* %0, i32 0, i32 0, i32 1, i32 0
  %14 = bitcast %struct.ap_int_base.59* %.0.1.06 to i8*
  %15 = call i1 @fpga_fifo_exist_1(i8* %14)
  br i1 %15, label %16, label %17

; <label>:16:                                     ; preds = %13
  call fastcc void @streamcpy_hls.p0struct.ap_int_base.59(%struct.ap_int_base.59* %.01.1.07, %struct.ap_int_base.59* %.0.1.06)
  br label %24

; <label>:17:                                     ; preds = %13
  %.0.1.0.08 = getelementptr %"class.hls::stream.56", %"class.hls::stream.56"* %1, i32 0, i32 0, i32 1, i32 0, i32 0
  %.01.1.0.09 = getelementptr %"class.hls::stream.56", %"class.hls::stream.56"* %0, i32 0, i32 0, i32 1, i32 0, i32 0
  %18 = bitcast %struct.ssdm_int.60* %.0.1.0.08 to i8*
  %19 = call i1 @fpga_fifo_exist_1(i8* %18)
  br i1 %19, label %20, label %21

; <label>:20:                                     ; preds = %17
  call fastcc void @streamcpy_hls.p0struct.ssdm_int.60(%struct.ssdm_int.60* %.01.1.0.09, %struct.ssdm_int.60* %.0.1.0.08)
  br label %24

; <label>:21:                                     ; preds = %17
  %.01.1.0.0.011.gep53 = getelementptr %"class.hls::stream.56", %"class.hls::stream.56"* %0, i32 0, i32 0, i32 1, i32 0, i32 0, i32 0
  %22 = bitcast i4* %.01.1.0.0.011.gep53 to i8*
  %.0.1.0.0.010.gep54 = getelementptr %"class.hls::stream.56", %"class.hls::stream.56"* %1, i32 0, i32 0, i32 1, i32 0, i32 0, i32 0
  %23 = bitcast i4* %.0.1.0.0.010.gep54 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %22, i8* align 1 %23, i64 1, i1 false)
  br label %24

; <label>:24:                                     ; preds = %21, %20, %16, %12
  %.0.212 = getelementptr %"class.hls::stream.56", %"class.hls::stream.56"* %1, i32 0, i32 0, i32 2
  %.01.213 = getelementptr %"class.hls::stream.56", %"class.hls::stream.56"* %0, i32 0, i32 0, i32 2
  %25 = bitcast %struct.ap_uint.58* %.0.212 to i8*
  %26 = call i1 @fpga_fifo_exist_1(i8* %25)
  br i1 %26, label %27, label %28

; <label>:27:                                     ; preds = %24
  call fastcc void @streamcpy_hls.p0struct.ap_uint.58(%struct.ap_uint.58* %.01.213, %struct.ap_uint.58* %.0.212)
  br label %39

; <label>:28:                                     ; preds = %24
  %.0.2.014 = getelementptr %"class.hls::stream.56", %"class.hls::stream.56"* %1, i32 0, i32 0, i32 2, i32 0
  %.01.2.015 = getelementptr %"class.hls::stream.56", %"class.hls::stream.56"* %0, i32 0, i32 0, i32 2, i32 0
  %29 = bitcast %struct.ap_int_base.59* %.0.2.014 to i8*
  %30 = call i1 @fpga_fifo_exist_1(i8* %29)
  br i1 %30, label %31, label %32

; <label>:31:                                     ; preds = %28
  call fastcc void @streamcpy_hls.p0struct.ap_int_base.59(%struct.ap_int_base.59* %.01.2.015, %struct.ap_int_base.59* %.0.2.014)
  br label %39

; <label>:32:                                     ; preds = %28
  %.0.2.0.016 = getelementptr %"class.hls::stream.56", %"class.hls::stream.56"* %1, i32 0, i32 0, i32 2, i32 0, i32 0
  %.01.2.0.017 = getelementptr %"class.hls::stream.56", %"class.hls::stream.56"* %0, i32 0, i32 0, i32 2, i32 0, i32 0
  %33 = bitcast %struct.ssdm_int.60* %.0.2.0.016 to i8*
  %34 = call i1 @fpga_fifo_exist_1(i8* %33)
  br i1 %34, label %35, label %36

; <label>:35:                                     ; preds = %32
  call fastcc void @streamcpy_hls.p0struct.ssdm_int.60(%struct.ssdm_int.60* %.01.2.0.017, %struct.ssdm_int.60* %.0.2.0.016)
  br label %39

; <label>:36:                                     ; preds = %32
  %.01.2.0.0.019.gep55 = getelementptr %"class.hls::stream.56", %"class.hls::stream.56"* %0, i32 0, i32 0, i32 2, i32 0, i32 0, i32 0
  %37 = bitcast i4* %.01.2.0.0.019.gep55 to i8*
  %.0.2.0.0.018.gep56 = getelementptr %"class.hls::stream.56", %"class.hls::stream.56"* %1, i32 0, i32 0, i32 2, i32 0, i32 0, i32 0
  %38 = bitcast i4* %.0.2.0.0.018.gep56 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %37, i8* align 1 %38, i64 1, i1 false)
  br label %39

; <label>:39:                                     ; preds = %36, %35, %31, %27
  %.0.320 = getelementptr %"class.hls::stream.56", %"class.hls::stream.56"* %1, i32 0, i32 0, i32 3
  %.01.321 = getelementptr %"class.hls::stream.56", %"class.hls::stream.56"* %0, i32 0, i32 0, i32 3
  %40 = bitcast %struct.ap_uint.3* %.0.320 to i8*
  %41 = call i1 @fpga_fifo_exist_1(i8* %40)
  br i1 %41, label %42, label %43

; <label>:42:                                     ; preds = %39
  call fastcc void @streamcpy_hls.p0struct.ap_uint.3(%struct.ap_uint.3* %.01.321, %struct.ap_uint.3* %.0.320)
  br label %54

; <label>:43:                                     ; preds = %39
  %.0.3.022 = getelementptr %"class.hls::stream.56", %"class.hls::stream.56"* %1, i32 0, i32 0, i32 3, i32 0
  %.01.3.023 = getelementptr %"class.hls::stream.56", %"class.hls::stream.56"* %0, i32 0, i32 0, i32 3, i32 0
  %44 = bitcast %struct.ap_int_base.4* %.0.3.022 to i8*
  %45 = call i1 @fpga_fifo_exist_1(i8* %44)
  br i1 %45, label %46, label %47

; <label>:46:                                     ; preds = %43
  call fastcc void @streamcpy_hls.p0struct.ap_int_base.4(%struct.ap_int_base.4* %.01.3.023, %struct.ap_int_base.4* %.0.3.022)
  br label %54

; <label>:47:                                     ; preds = %43
  %.0.3.0.024 = getelementptr %"class.hls::stream.56", %"class.hls::stream.56"* %1, i32 0, i32 0, i32 3, i32 0, i32 0
  %.01.3.0.025 = getelementptr %"class.hls::stream.56", %"class.hls::stream.56"* %0, i32 0, i32 0, i32 3, i32 0, i32 0
  %48 = bitcast %struct.ssdm_int.5* %.0.3.0.024 to i8*
  %49 = call i1 @fpga_fifo_exist_1(i8* %48)
  br i1 %49, label %50, label %51

; <label>:50:                                     ; preds = %47
  call fastcc void @streamcpy_hls.p0struct.ssdm_int.5(%struct.ssdm_int.5* %.01.3.0.025, %struct.ssdm_int.5* %.0.3.0.024)
  br label %54

; <label>:51:                                     ; preds = %47
  %.01.3.0.0.027.gep57 = getelementptr %"class.hls::stream.56", %"class.hls::stream.56"* %0, i32 0, i32 0, i32 3, i32 0, i32 0, i32 0
  %52 = bitcast i1* %.01.3.0.0.027.gep57 to i8*
  %.0.3.0.0.026.gep58 = getelementptr %"class.hls::stream.56", %"class.hls::stream.56"* %1, i32 0, i32 0, i32 3, i32 0, i32 0, i32 0
  %53 = bitcast i1* %.0.3.0.0.026.gep58 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %52, i8* align 1 %53, i64 1, i1 false)
  br label %54

; <label>:54:                                     ; preds = %51, %50, %46, %42
  %.0.428 = getelementptr %"class.hls::stream.56", %"class.hls::stream.56"* %1, i32 0, i32 0, i32 4
  %.01.429 = getelementptr %"class.hls::stream.56", %"class.hls::stream.56"* %0, i32 0, i32 0, i32 4
  %55 = bitcast %struct.ap_uint.3* %.0.428 to i8*
  %56 = call i1 @fpga_fifo_exist_1(i8* %55)
  br i1 %56, label %57, label %58

; <label>:57:                                     ; preds = %54
  call fastcc void @streamcpy_hls.p0struct.ap_uint.3(%struct.ap_uint.3* %.01.429, %struct.ap_uint.3* %.0.428)
  br label %69

; <label>:58:                                     ; preds = %54
  %.0.4.030 = getelementptr %"class.hls::stream.56", %"class.hls::stream.56"* %1, i32 0, i32 0, i32 4, i32 0
  %.01.4.031 = getelementptr %"class.hls::stream.56", %"class.hls::stream.56"* %0, i32 0, i32 0, i32 4, i32 0
  %59 = bitcast %struct.ap_int_base.4* %.0.4.030 to i8*
  %60 = call i1 @fpga_fifo_exist_1(i8* %59)
  br i1 %60, label %61, label %62

; <label>:61:                                     ; preds = %58
  call fastcc void @streamcpy_hls.p0struct.ap_int_base.4(%struct.ap_int_base.4* %.01.4.031, %struct.ap_int_base.4* %.0.4.030)
  br label %69

; <label>:62:                                     ; preds = %58
  %.0.4.0.032 = getelementptr %"class.hls::stream.56", %"class.hls::stream.56"* %1, i32 0, i32 0, i32 4, i32 0, i32 0
  %.01.4.0.033 = getelementptr %"class.hls::stream.56", %"class.hls::stream.56"* %0, i32 0, i32 0, i32 4, i32 0, i32 0
  %63 = bitcast %struct.ssdm_int.5* %.0.4.0.032 to i8*
  %64 = call i1 @fpga_fifo_exist_1(i8* %63)
  br i1 %64, label %65, label %66

; <label>:65:                                     ; preds = %62
  call fastcc void @streamcpy_hls.p0struct.ssdm_int.5(%struct.ssdm_int.5* %.01.4.0.033, %struct.ssdm_int.5* %.0.4.0.032)
  br label %69

; <label>:66:                                     ; preds = %62
  %.01.4.0.0.035.gep59 = getelementptr %"class.hls::stream.56", %"class.hls::stream.56"* %0, i32 0, i32 0, i32 4, i32 0, i32 0, i32 0
  %67 = bitcast i1* %.01.4.0.0.035.gep59 to i8*
  %.0.4.0.0.034.gep60 = getelementptr %"class.hls::stream.56", %"class.hls::stream.56"* %1, i32 0, i32 0, i32 4, i32 0, i32 0, i32 0
  %68 = bitcast i1* %.0.4.0.0.034.gep60 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %67, i8* align 1 %68, i64 1, i1 false)
  br label %69

; <label>:69:                                     ; preds = %66, %65, %61, %57
  %.0.536 = getelementptr %"class.hls::stream.56", %"class.hls::stream.56"* %1, i32 0, i32 0, i32 5
  %.01.537 = getelementptr %"class.hls::stream.56", %"class.hls::stream.56"* %0, i32 0, i32 0, i32 5
  %70 = bitcast %struct.ap_uint.3* %.0.536 to i8*
  %71 = call i1 @fpga_fifo_exist_1(i8* %70)
  br i1 %71, label %72, label %73

; <label>:72:                                     ; preds = %69
  call fastcc void @streamcpy_hls.p0struct.ap_uint.3(%struct.ap_uint.3* %.01.537, %struct.ap_uint.3* %.0.536)
  br label %84

; <label>:73:                                     ; preds = %69
  %.0.5.038 = getelementptr %"class.hls::stream.56", %"class.hls::stream.56"* %1, i32 0, i32 0, i32 5, i32 0
  %.01.5.039 = getelementptr %"class.hls::stream.56", %"class.hls::stream.56"* %0, i32 0, i32 0, i32 5, i32 0
  %74 = bitcast %struct.ap_int_base.4* %.0.5.038 to i8*
  %75 = call i1 @fpga_fifo_exist_1(i8* %74)
  br i1 %75, label %76, label %77

; <label>:76:                                     ; preds = %73
  call fastcc void @streamcpy_hls.p0struct.ap_int_base.4(%struct.ap_int_base.4* %.01.5.039, %struct.ap_int_base.4* %.0.5.038)
  br label %84

; <label>:77:                                     ; preds = %73
  %.0.5.0.040 = getelementptr %"class.hls::stream.56", %"class.hls::stream.56"* %1, i32 0, i32 0, i32 5, i32 0, i32 0
  %.01.5.0.041 = getelementptr %"class.hls::stream.56", %"class.hls::stream.56"* %0, i32 0, i32 0, i32 5, i32 0, i32 0
  %78 = bitcast %struct.ssdm_int.5* %.0.5.0.040 to i8*
  %79 = call i1 @fpga_fifo_exist_1(i8* %78)
  br i1 %79, label %80, label %81

; <label>:80:                                     ; preds = %77
  call fastcc void @streamcpy_hls.p0struct.ssdm_int.5(%struct.ssdm_int.5* %.01.5.0.041, %struct.ssdm_int.5* %.0.5.0.040)
  br label %84

; <label>:81:                                     ; preds = %77
  %.01.5.0.0.043.gep61 = getelementptr %"class.hls::stream.56", %"class.hls::stream.56"* %0, i32 0, i32 0, i32 5, i32 0, i32 0, i32 0
  %82 = bitcast i1* %.01.5.0.0.043.gep61 to i8*
  %.0.5.0.0.042.gep62 = getelementptr %"class.hls::stream.56", %"class.hls::stream.56"* %1, i32 0, i32 0, i32 5, i32 0, i32 0, i32 0
  %83 = bitcast i1* %.0.5.0.0.042.gep62 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %82, i8* align 1 %83, i64 1, i1 false)
  br label %84

; <label>:84:                                     ; preds = %81, %80, %76, %72
  %.0.644 = getelementptr %"class.hls::stream.56", %"class.hls::stream.56"* %1, i32 0, i32 0, i32 6
  %.01.645 = getelementptr %"class.hls::stream.56", %"class.hls::stream.56"* %0, i32 0, i32 0, i32 6
  %85 = bitcast %struct.ap_uint.3* %.0.644 to i8*
  %86 = call i1 @fpga_fifo_exist_1(i8* %85)
  br i1 %86, label %87, label %88

; <label>:87:                                     ; preds = %84
  call fastcc void @streamcpy_hls.p0struct.ap_uint.3(%struct.ap_uint.3* %.01.645, %struct.ap_uint.3* %.0.644)
  br label %ret

; <label>:88:                                     ; preds = %84
  %.0.6.046 = getelementptr %"class.hls::stream.56", %"class.hls::stream.56"* %1, i32 0, i32 0, i32 6, i32 0
  %.01.6.047 = getelementptr %"class.hls::stream.56", %"class.hls::stream.56"* %0, i32 0, i32 0, i32 6, i32 0
  %89 = bitcast %struct.ap_int_base.4* %.0.6.046 to i8*
  %90 = call i1 @fpga_fifo_exist_1(i8* %89)
  br i1 %90, label %91, label %92

; <label>:91:                                     ; preds = %88
  call fastcc void @streamcpy_hls.p0struct.ap_int_base.4(%struct.ap_int_base.4* %.01.6.047, %struct.ap_int_base.4* %.0.6.046)
  br label %ret

; <label>:92:                                     ; preds = %88
  %.0.6.0.048 = getelementptr %"class.hls::stream.56", %"class.hls::stream.56"* %1, i32 0, i32 0, i32 6, i32 0, i32 0
  %.01.6.0.049 = getelementptr %"class.hls::stream.56", %"class.hls::stream.56"* %0, i32 0, i32 0, i32 6, i32 0, i32 0
  %93 = bitcast %struct.ssdm_int.5* %.0.6.0.048 to i8*
  %94 = call i1 @fpga_fifo_exist_1(i8* %93)
  br i1 %94, label %95, label %96

; <label>:95:                                     ; preds = %92
  call fastcc void @streamcpy_hls.p0struct.ssdm_int.5(%struct.ssdm_int.5* %.01.6.0.049, %struct.ssdm_int.5* %.0.6.0.048)
  br label %ret

; <label>:96:                                     ; preds = %92
  %.01.6.0.0.051.gep63 = getelementptr %"class.hls::stream.56", %"class.hls::stream.56"* %0, i32 0, i32 0, i32 6, i32 0, i32 0, i32 0
  %97 = bitcast i1* %.01.6.0.0.051.gep63 to i8*
  %.0.6.0.0.050.gep64 = getelementptr %"class.hls::stream.56", %"class.hls::stream.56"* %1, i32 0, i32 0, i32 6, i32 0, i32 0, i32 0
  %98 = bitcast i1* %.0.6.0.0.050.gep64 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %97, i8* align 1 %98, i64 1, i1 false)
  br label %ret

ret:                                              ; preds = %96, %95, %91, %87, %7, %entry
  ret void
}

declare i1 @fpga_fifo_exist_12(i8*) local_unnamed_addr

; Function Attrs: argmemonly noinline
define internal fastcc void @"streamcpy_hls.p0class.hls::stream.56"(%"class.hls::stream.56"* noalias nocapture align 512, %"class.hls::stream.56"* noalias nocapture) unnamed_addr #3 {
entry:
  %2 = alloca %"class.hls::stream.56"
  br label %empty

empty:                                            ; preds = %push, %entry
  %3 = bitcast %"class.hls::stream.56"* %1 to i8*
  %4 = call i1 @fpga_fifo_not_empty_12(i8* %3)
  br i1 %4, label %push, label %ret

push:                                             ; preds = %empty
  %5 = bitcast %"class.hls::stream.56"* %2 to i8*
  %6 = bitcast %"class.hls::stream.56"* %1 to i8*
  call void @fpga_fifo_pop_12(i8* %5, i8* %6)
  %7 = load volatile %"class.hls::stream.56", %"class.hls::stream.56"* %2
  %8 = bitcast %"class.hls::stream.56"* %2 to i8*
  %9 = bitcast %"class.hls::stream.56"* %0 to i8*
  call void @fpga_fifo_push_12(i8* %8, i8* %9)
  br label %empty, !llvm.loop !21

ret:                                              ; preds = %empty
  %10 = bitcast %"class.hls::stream.56"* %1 to i8*
  %11 = bitcast %"class.hls::stream.56"* %0 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %11, i8* align 1 %10, i64 12, i1 false)
  ret void
}

; Function Attrs: argmemonly noinline
define internal fastcc void @streamcpy_hls.p0struct.ap_uint.58(%struct.ap_uint.58* noalias nocapture, %struct.ap_uint.58* noalias nocapture) unnamed_addr #3 {
entry:
  %2 = alloca %struct.ap_uint.58
  br label %empty

empty:                                            ; preds = %push, %entry
  %3 = bitcast %struct.ap_uint.58* %1 to i8*
  %4 = call i1 @fpga_fifo_not_empty_1(i8* %3)
  br i1 %4, label %push, label %ret

push:                                             ; preds = %empty
  %5 = bitcast %struct.ap_uint.58* %2 to i8*
  %6 = bitcast %struct.ap_uint.58* %1 to i8*
  call void @fpga_fifo_pop_1(i8* %5, i8* %6)
  %7 = load volatile %struct.ap_uint.58, %struct.ap_uint.58* %2
  %8 = bitcast %struct.ap_uint.58* %2 to i8*
  %9 = bitcast %struct.ap_uint.58* %0 to i8*
  call void @fpga_fifo_push_1(i8* %8, i8* %9)
  br label %empty, !llvm.loop !22

ret:                                              ; preds = %empty
  %10 = bitcast %struct.ap_uint.58* %1 to i8*
  %11 = bitcast %struct.ap_uint.58* %0 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %11, i8* align 1 %10, i64 1, i1 false)
  ret void
}

; Function Attrs: argmemonly noinline
define internal fastcc void @streamcpy_hls.p0struct.ap_int_base.59(%struct.ap_int_base.59* noalias nocapture, %struct.ap_int_base.59* noalias nocapture) unnamed_addr #3 {
entry:
  %2 = alloca %struct.ap_int_base.59
  br label %empty

empty:                                            ; preds = %push, %entry
  %3 = bitcast %struct.ap_int_base.59* %1 to i8*
  %4 = call i1 @fpga_fifo_not_empty_1(i8* %3)
  br i1 %4, label %push, label %ret

push:                                             ; preds = %empty
  %5 = bitcast %struct.ap_int_base.59* %2 to i8*
  %6 = bitcast %struct.ap_int_base.59* %1 to i8*
  call void @fpga_fifo_pop_1(i8* %5, i8* %6)
  %7 = load volatile %struct.ap_int_base.59, %struct.ap_int_base.59* %2
  %8 = bitcast %struct.ap_int_base.59* %2 to i8*
  %9 = bitcast %struct.ap_int_base.59* %0 to i8*
  call void @fpga_fifo_push_1(i8* %8, i8* %9)
  br label %empty, !llvm.loop !23

ret:                                              ; preds = %empty
  %10 = bitcast %struct.ap_int_base.59* %1 to i8*
  %11 = bitcast %struct.ap_int_base.59* %0 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %11, i8* align 1 %10, i64 1, i1 false)
  ret void
}

; Function Attrs: argmemonly noinline
define internal fastcc void @streamcpy_hls.p0struct.ssdm_int.60(%struct.ssdm_int.60* noalias nocapture, %struct.ssdm_int.60* noalias nocapture) unnamed_addr #3 {
entry:
  %2 = alloca %struct.ssdm_int.60
  br label %empty

empty:                                            ; preds = %push, %entry
  %3 = bitcast %struct.ssdm_int.60* %1 to i8*
  %4 = call i1 @fpga_fifo_not_empty_1(i8* %3)
  br i1 %4, label %push, label %ret

push:                                             ; preds = %empty
  %5 = bitcast %struct.ssdm_int.60* %2 to i8*
  %6 = bitcast %struct.ssdm_int.60* %1 to i8*
  call void @fpga_fifo_pop_1(i8* %5, i8* %6)
  %7 = load volatile %struct.ssdm_int.60, %struct.ssdm_int.60* %2
  %8 = bitcast %struct.ssdm_int.60* %2 to i8*
  %9 = bitcast %struct.ssdm_int.60* %0 to i8*
  call void @fpga_fifo_push_1(i8* %8, i8* %9)
  br label %empty, !llvm.loop !24

ret:                                              ; preds = %empty
  %10 = bitcast %struct.ssdm_int.60* %1 to i8*
  %11 = bitcast %struct.ssdm_int.60* %0 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %11, i8* align 1 %10, i64 1, i1 false)
  ret void
}

; Function Attrs: argmemonly noinline
define internal fastcc void @onebyonecpy_hls.p0i32(i32* noalias align 512, i32* noalias readonly) unnamed_addr #5 {
entry:
  %2 = icmp eq i32* %0, null
  %3 = icmp eq i32* %1, null
  %4 = or i1 %2, %3
  br i1 %4, label %ret, label %copy

copy:                                             ; preds = %entry
  %5 = bitcast i32* %0 to i8*
  %6 = bitcast i32* %1 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %5, i8* align 1 %6, i64 4, i1 false)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline
define internal fastcc void @onebyonecpy_hls.p0a96000i32([96000 x i32]* noalias, [96000 x i32]* noalias readonly) unnamed_addr #5 {
entry:
  %2 = icmp eq [96000 x i32]* %0, null
  %3 = icmp eq [96000 x i32]* %1, null
  %4 = or i1 %2, %3
  br i1 %4, label %ret, label %copy

copy:                                             ; preds = %entry
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %copy
  %for.loop.idx3 = phi i64 [ 0, %copy ], [ %for.loop.idx.next, %for.loop ]
  %dst.addr.gep1 = getelementptr [96000 x i32], [96000 x i32]* %0, i64 0, i64 %for.loop.idx3
  %5 = bitcast i32* %dst.addr.gep1 to i8*
  %src.addr.gep2 = getelementptr [96000 x i32], [96000 x i32]* %1, i64 0, i64 %for.loop.idx3
  %6 = bitcast i32* %src.addr.gep2 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %5, i8* align 1 %6, i64 4, i1 false)
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx3, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, 96000
  br i1 %exitcond, label %for.loop, label %ret

ret:                                              ; preds = %for.loop, %entry
  ret void
}

; Function Attrs: noinline
define internal fastcc void @copy_out(%"class.hls::stream"*, %"class.hls::stream"* noalias align 512, %"class.hls::stream"*, %"class.hls::stream"* noalias align 512, %"class.hls::stream.51"*, %"class.hls::stream.51"* noalias align 512, %"class.hls::stream.56"*, %"class.hls::stream.56"* noalias align 512, i32*, i32* noalias readonly align 512, i32*, i32* noalias readonly align 512, [96000 x i32]*, [96000 x i32]* noalias readonly) unnamed_addr #6 {
entry:
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream"(%"class.hls::stream"* %0, %"class.hls::stream"* align 512 %1)
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream"(%"class.hls::stream"* %2, %"class.hls::stream"* align 512 %3)
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream.51"(%"class.hls::stream.51"* %4, %"class.hls::stream.51"* align 512 %5)
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream.56"(%"class.hls::stream.56"* %6, %"class.hls::stream.56"* align 512 %7)
  call fastcc void @onebyonecpy_hls.p0i32(i32* %8, i32* align 512 %9)
  call fastcc void @onebyonecpy_hls.p0i32(i32* %10, i32* align 512 %11)
  call fastcc void @onebyonecpy_hls.p0a96000i32([96000 x i32]* %12, [96000 x i32]* %13)
  ret void
}

declare void @free(i8*) local_unnamed_addr

declare void @apatb_lteCellSearch_hw(%"class.hls::stream"*, %"class.hls::stream"*, %"class.hls::stream.51"*, %"class.hls::stream.56"*, i32*, i32*, i32*)

define void @lteCellSearch_hw_stub_wrapper(%"class.hls::stream"*, %"class.hls::stream"*, %"class.hls::stream.51"*, %"class.hls::stream.56"*, i32*, i32*, i32*) #7 {
entry:
  %7 = bitcast i32* %6 to [96000 x i32]*
  call void @copy_out(%"class.hls::stream"* null, %"class.hls::stream"* %0, %"class.hls::stream"* null, %"class.hls::stream"* %1, %"class.hls::stream.51"* null, %"class.hls::stream.51"* %2, %"class.hls::stream.56"* null, %"class.hls::stream.56"* %3, i32* null, i32* %4, i32* null, i32* %5, [96000 x i32]* null, [96000 x i32]* %7)
  %8 = bitcast [96000 x i32]* %7 to i32*
  call void @lteCellSearch_hw_stub(%"class.hls::stream"* %0, %"class.hls::stream"* %1, %"class.hls::stream.51"* %2, %"class.hls::stream.56"* %3, i32* %4, i32* %5, i32* %8)
  call void @copy_in(%"class.hls::stream"* null, %"class.hls::stream"* %0, %"class.hls::stream"* null, %"class.hls::stream"* %1, %"class.hls::stream.51"* null, %"class.hls::stream.51"* %2, %"class.hls::stream.56"* null, %"class.hls::stream.56"* %3, i32* null, i32* %4, i32* null, i32* %5, [96000 x i32]* null, [96000 x i32]* %7)
  ret void
}

declare void @lteCellSearch_hw_stub(%"class.hls::stream"*, %"class.hls::stream"*, %"class.hls::stream.51"*, %"class.hls::stream.56"*, i32*, i32*, i32*)

declare i1 @fpga_fifo_not_empty_8(i8*)

declare i1 @fpga_fifo_not_empty_2(i8*)

declare i1 @fpga_fifo_not_empty_1(i8*)

declare i1 @fpga_fifo_not_empty_16(i8*)

declare i1 @fpga_fifo_not_empty_12(i8*)

declare void @fpga_fifo_pop_8(i8*, i8*)

declare void @fpga_fifo_pop_2(i8*, i8*)

declare void @fpga_fifo_pop_1(i8*, i8*)

declare void @fpga_fifo_pop_16(i8*, i8*)

declare void @fpga_fifo_pop_12(i8*, i8*)

declare void @fpga_fifo_push_8(i8*, i8*)

declare void @fpga_fifo_push_2(i8*, i8*)

declare void @fpga_fifo_push_1(i8*, i8*)

declare void @fpga_fifo_push_16(i8*, i8*)

declare void @fpga_fifo_push_12(i8*, i8*)

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
!14 = distinct !{!14, !6}
!15 = distinct !{!15, !6}
!16 = distinct !{!16, !6}
!17 = distinct !{!17, !6}
!18 = distinct !{!18, !6}
!19 = distinct !{!19, !6}
!20 = distinct !{!20, !6}
!21 = distinct !{!21, !6}
!22 = distinct !{!22, !6}
!23 = distinct !{!23, !6}
!24 = distinct !{!24, !6}
