############################################################
## This file is generated automatically by Vivado HLS.
## Please DO NOT edit it.
## Copyright (C) 2012 Xilinx Inc. All rights reserved.
############################################################
open_project hls
set_top lteCellSearch
add_files data_types.h
add_files fir.h
add_files fir.cpp
add_files lte_cell_search.h
add_files lte_cell_search.cpp -csimflags -DSIMULATION
add_files -tb lte_cell_search_test.cpp -csimflags -DSIMULATION
add_files -tb input.imag_x8.dat
add_files -tb input.real_x8.dat
add_files -tb output.dat
open_solution "solution1"
set_part  {xczu28dr-ffvg1517-2-e}
create_clock -period 3.3
