# =====================================================================
# Project:      HERO
# Title:        fpga_out_files.tcl
# Description:  TCL script to output important design files.
#
# $Date:        15.09.2021
# =====================================================================
#
# Copyright (C) 2021 University of Modena and Reggio Emilia..
#
# Author: Gianluca Bellocchi, University of Modena and Reggio Emilia.
#
# =====================================================================

# Design name.
set design_name [lindex $argv 0]
puts "Design name - $design_name"

# Build directory
set build_dir [lindex $argv 1]

# Project directory
set prj_dir "$build_dir/$design_name/vivado_prj"
puts "Vivado project directory - $prj_dir"

# Open project
open_project ${prj_dir}/hero_exilzcu102.xpr

# Export Hardware Definition file.
file mkdir ${prj_dir}/hero_exilzcu102.sdk
write_hwdef -force  -file ${prj_dir}/hero_exilzcu102.sdk/hero_exilzcu102_wrapper.hdf

# Export bitstream file.
file copy -force ${prj_dir}/hero_exilzcu102.runs/impl_1/hero_exilzcu102_wrapper.bit ${prj_dir}/hero_exilzcu102.sdk/hero_exilzcu102_wrapper.bit

# Export Xilinx Support Archive (XSA) file.
write_hw_platform -fixed -force  -include_bit -file ${prj_dir}/hero_exilzcu102_wrapper.xsa