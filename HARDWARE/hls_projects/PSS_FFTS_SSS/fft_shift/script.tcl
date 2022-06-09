############################################################
## This file is generated automatically by Vivado HLS.
## Please DO NOT edit it.
## Copyright (C) 2012 Xilinx Inc. All rights reserved.
############################################################
open_project hls
set_top fft_shift
add_files fft_shift.cpp
add_files fft_shift.h
add_files -tb input.imag.dat
add_files -tb input.real.dat
add_files -tb output.real.dat
add_files -tb output.imag.dat
open_solution "solution1"
set_part  {xczu28dr-ffvg1517-2-e}
create_clock -period 16

source "./directives.tcl"
##csynth_design
