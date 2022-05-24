############################################################
## This file is generated automatically by Vivado HLS.
## Please DO NOT edit it.
## Copyright (C) 2012 Xilinx Inc. All rights reserved.
############################################################
open_project hls
set_top cp_corr_pss_sss
add_files cp_corr_pss_sss.cpp
add_files cp_corr_pss_sss.h
add_files hls_fft.h
add_files matmul_partition.cpp
add_files -tb cp_corr_pss_sss_test.cpp
add_files -tb input.imag.dat
add_files -tb input.real.dat
add_files -tb output.dat
add_files -tb downsampled_r.dat
add_files -tb downsampled_i.dat
add_files -tb out_sss_1_PSS_1_r.dat
add_files -tb out_sss_1_PSS_1_i.dat
add_files -tb out_sss_1_PSS_2_r.dat
add_files -tb out_sss_1_PSS_2_i.dat
add_files -tb out_sss_2_PSS_1_r.dat
add_files -tb out_sss_2_PSS_1_i.dat
add_files -tb out_sss_2_PSS_2_r.dat
add_files -tb out_sss_2_PSS_2_i.dat
add_files -tb pss_rslts_0.dat
add_files -tb pss_rslts_1.dat
add_files -tb pss_rslts_2.dat
open_solution "solution1"
set_part  {xczu28dr-ffvg1517-2-e}
create_clock -period 3.3

source "./directives.tcl"
##csynth_design
