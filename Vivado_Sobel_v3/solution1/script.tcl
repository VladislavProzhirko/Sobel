############################################################
## This file is generated automatically by Vivado HLS.
## Please DO NOT edit it.
## Copyright (C) 1986-2019 Xilinx, Inc. All Rights Reserved.
############################################################
open_project Vivado_Sobel_v3
set_top Sobel
add_files Vivado_Sobel_v3/core.cpp
add_files Vivado_Sobel_v3/core.h
add_files -tb Vivado_Sobel_v3/test.cpp -cflags "-Wno-unknown-pragmas" -csimflags "-Wno-unknown-pragmas"
open_solution "solution1"
set_part {xc7a100t-csg324-3}
create_clock -period 10 -name default
config_sdx -target none
config_export -vivado_optimization_level 2 -vivado_phys_opt place -vivado_report_level 0
set_clock_uncertainty 12.5%
#source "./Vivado_Sobel_v3/solution1/directives.tcl"
csim_design -clean
csynth_design
cosim_design -setup
export_design -rtl verilog -format ip_catalog
