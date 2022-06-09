############################################################
## This file is generated automatically by Vivado HLS.
## Please DO NOT edit it.
## Copyright (C) 2012 Xilinx Inc. All rights reserved.
############################################################
open_project hls
set_top sss_corr
add_files sss_corr.cpp
add_files sss_corr.h
add_files -tb sss_corr_test.cpp
add_files -tb input.imag.dat
add_files -tb input.real.dat
add_files -tb output.dat
add_files -tb out1.dat
add_files -tb out2.dat
open_solution "solution1"
set_part  {xczu28dr-ffvg1517-2-e}
create_clock -period 16

source "./directives.tcl"
##csynth_design
