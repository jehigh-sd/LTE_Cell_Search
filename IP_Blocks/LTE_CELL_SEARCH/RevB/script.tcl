############################################################
## This file is generated automatically by Vivado HLS.
## Please DO NOT edit it.
## Copyright (C) 2012 Xilinx Inc. All rights reserved.
############################################################
open_project lteCellSearch
set_top lteCellSearch
add_files lteCellSearch.cpp
add_files lteCellSearch.h
add_files -tb lteCellSearch_test.cpp
add_files -tb input.imag.dat
add_files -tb input.real.dat
add_files -tb output.dat
open_solution "solution1"
set_part  {xczu28dr-ffvg1517-2-e}
create_clock -period 3.3
