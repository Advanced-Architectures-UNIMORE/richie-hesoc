# =====================================================================
# Project:      FPGA build
# Title:        reports_power.tcl
# Description:  Set of procedures to:
#               - synthesize out-of-context design.
#               - launch post-synthesis functional simulation.
#               - Generate power report.
#               This script is thought to work with a pre-existing Vivado
#               project dealing with PULP systems (e.g. AROV, HERO, etc.).
#
# $Date:        25.07.2022
# =====================================================================
#
# Copyright (C) 2022 University of Modena and Reggio Emilia.
#
# Author: Gianluca Bellocchi, University of Modena and Reggio Emilia.
#
# =====================================================================

# ========= #
# Variables #
# ========= #

# Design name
set ::design_name [lindex $argv 0]

# Board name
set ::board_name [lindex $argv 1]

# Build directory
set ::build_dir [lindex $argv 2]

# Power utils directory
set ::power_util [lindex $argv 3]

# Project directory
set ::prj_dir "$build_dir/$design_name/vivado_prj"

# Reports
set ::report_name "$design_name\_report_power"
set ::report_dir "$build_dir/$design_name/reports"

# Testbench
set ::tb_post_synth "$power_util/post_synth_tb_exilzcu102.sv"

# Simulation
set ::simulation_mode "post-synthesis"
set ::simulation_type "functional"

# =============================== #
# Create power simulation project #
# =============================== #

# Vivado project location.
puts "Opening Vivado project located in $prj_dir\."

# Create new project
open_project $prj_dir/hero_exilzcu102.xpr

# ========= #
# Testbench #
# ========= #

set_property SOURCE_SET sources_1 [get_filesets sim_1]

# Add testbench for post-synthesis
add_files -fileset sim_1 -norecurse $tb_post_synth
update_compile_order -fileset sim_1
set_property is_global_include true [get_files  $prj_dir/hero_exilzcu102.srcs/sources_1/bd/hero_exilzcu102/sim/hero_exilzcu102.v]

# Set imported tb as top
set_property top arov_tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1

# ===================== #
# Functional simulation #
# ===================== #

# Settings simulation to memorize the switching activity
foreach fileset [list sim_1] {

# Simulation duration
  set_property -name {xsim.simulate.runtime} -value {100 ns} -objects [get_filesets $fileset]

# Set scope that you want to investigate
  set_property -name {xsim.simulate.saif_scope} -value {arov_tb/hero_exilzcu102_i} -objects [get_filesets $fileset]

# SAIF file (with switching activity)
# Saved under:
#   <prj_name>/<prj_name>.sim/sim_1/synth/funct/xsim/<file_name>.saif
  set_property -name {xsim.simulate.saif} -value {arov_power_sim_all_signals.saif} -objects [get_filesets $fileset]

# Switching activity on all signals
  set_property -name {xsim.simulate.saif_all_signals} -value {true} -objects [get_filesets $fileset]
}

# Run Post-synthesis Functional Simulation		
# It is faster than the Timing because It does not consider delays. 
# Results do not change because the model only consider commutations.	
launch_simulation -mode $simulation_mode -type $simulation_type

# ============================================ #
# Extract information about Switching Activity #
# ============================================ #

# These operations can be run from the TCL command line
# of Vivado while the simulation is open! There are different
# ways of constructing these files, be aware that Vivado will
# fail the power reporting if the SAIF file becomes too large.

# Open new SAIF file
open_saif "$prj_dir/hero_exilzcu102.sim/sim_1/synth/func/xsim/$report_name\.saif"

# Set different scope (after initial set up)
current_scope /arov_tb/hero_exilzcu102_i
# current_scope /arov_tb/hero_exilzcu102_i/i_pulp

# To extract the switching activity, the SAIF can be logged with 
# specific wires, signals, or regs. The more the monitored components,
# the bigger the SAIF, the more demanding is the burden for Vivado.

# # Get information from all hierarchy levels starting from current scope (recursive)
# log_saif [get_objects -r *]

# Get information from components of current scope
log_saif [ get_objects * ]

# Run simulation for a certain time period (you can specify both time value and unit)
run 1ps

# Close SAIF (and save simulation values)
close_saif

# Genereate power report
# 		✔ Interactive report file --> Here are all info to analyze it later
# 		✔ Export to file --> Not as detailed as previous, but is enough most of the times
read_saif "$prj_dir/hero_exilzcu102.sim/sim_1/synth/func/xsim/$report_name\.saif"
report_power -file "$report_dir/$report_name\.txt" -rpx "$report_dir/$report_name\.rpx" -name "$report_name"