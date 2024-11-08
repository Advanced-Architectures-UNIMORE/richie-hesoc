# =====================================================================
# Project:      FPGA build
# Title:        fpga_empty.tcl
# Description:  FPGA build of heterogeneous system on Zynq Ultrascale+.
# =====================================================================

# Vivado project location.
set prj_dir [lindex $argv 0]
puts "Vivado project is going to be located in ${prj_dir}\."

# Vivado IPs location.
set vivado_ips [lindex $argv 1]

create_project hero_exilzcu102 ${prj_dir} -part xczu9eg-ffvb1156-2-e
set_property board_part xilinx.com:zcu102:part0:3.3 [current_project]
set_property ip_repo_paths ${vivado_ips} [current_project]
update_ip_catalog

create_bd_design "hero_exilzcu102"
update_compile_order -fileset sources_1

# Zynq UltraScale+ Processor System
create_bd_cell -type ip -vlnv xilinx.com:ip:zynq_ultra_ps_e:3.3 i_zynq_ps
apply_bd_automation -rule xilinx.com:bd_rule:zynq_ultra_ps_e -config {apply_board_preset "1" } \
  [get_bd_cells i_zynq_ps]
set_property -dict [list \
  CONFIG.PSU__USE__M_AXI_GP1 {0} \
  CONFIG.PSU__USE__S_AXI_GP2 {0} \
  CONFIG.PSU__USE__S_AXI_GP3 {1} \
  CONFIG.PSU__USE__IRQ1 {1} \
  CONFIG.PSU__CRL_APB__PL0_REF_CTRL__FREQMHZ {100} \
] [get_bd_cells i_zynq_ps]
connect_bd_net [get_bd_pins i_zynq_ps/pl_clk0] \
  [get_bd_pins i_zynq_ps/saxihp1_fpd_aclk]
connect_bd_net [get_bd_pins i_zynq_ps/pl_clk0] \
  [get_bd_pins i_zynq_ps/maxihpm0_fpd_aclk]

# System Reset
create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset:5.0 i_sys_reset
connect_bd_net [get_bd_pins i_zynq_ps/pl_resetn0] \
  [get_bd_pins i_sys_reset/ext_reset_in]
connect_bd_net [get_bd_pins i_zynq_ps/pl_clk0] \
  [get_bd_pins i_sys_reset/slowest_sync_clk]

## DDR Low
assign_bd_address [get_bd_addr_segs {i_zynq_ps/SAXIGP3/HP1_DDR_LOW }]
## DDR High
assign_bd_address [get_bd_addr_segs {i_zynq_ps/SAXIGP3/HP1_DDR_HIGH }]

# Validate and save Top-Level Block Design
save_bd_design
validate_bd_design
make_wrapper -files [get_files \
  ${prj_dir}/hero_exilzcu102.srcs/sources_1/bd/hero_exilzcu102/hero_exilzcu102.bd \
] -top
add_files -norecurse \
  ${prj_dir}/hero_exilzcu102.srcs/sources_1/bd/hero_exilzcu102/hdl/hero_exilzcu102_wrapper.v

# Create targets and runs for IPs.
generate_target all \
  [get_files ${prj_dir}/hero_exilzcu102.srcs/sources_1/bd/hero_exilzcu102/hero_exilzcu102.bd]
export_ip_user_files -of_objects \
  [get_files ${prj_dir}/hero_exilzcu102.srcs/sources_1/bd/hero_exilzcu102/hero_exilzcu102.bd] \
  -no_script -sync -force -quiet
create_ip_run [get_files -of_objects [get_fileset sources_1] \
  ${prj_dir}/hero_exilzcu102.srcs/sources_1/bd/hero_exilzcu102/hero_exilzcu102.bd \
]

# Synthesize
launch_runs synth_1 -jobs 12
wait_on_run synth_1

# Implement
set_property strategy Congestion_SpreadLogic_low [get_runs impl_1]
launch_runs impl_1 -jobs 12
wait_on_run impl_1

# Check timing constraints.
open_run impl_1
set timingrep [report_timing_summary -no_header -no_detailed_paths -return_string]
if {! [string match -nocase {*timing constraints are met*} $timingrep]} {
  send_msg_id {USER 1-1} ERROR {Timing constraints were not met.}
  return -code error
}

# Generate Bitstream
launch_runs impl_1 -to_step write_bitstream -jobs 12
wait_on_run impl_1

# Export Hardware Definition file.
file mkdir ${prj_dir}/hero_exilzcu102.sdk
write_hwdef -force  -file ${prj_dir}/hero_exilzcu102.sdk/hero_exilzcu102_wrapper.hdf

# Export bitstream file.
file copy -force ${prj_dir}/hero_exilzcu102.runs/impl_1/hero_exilzcu102_wrapper.bit ${prj_dir}/hero_exilzcu102.sdk/hero_exilzcu102_wrapper.bit

# Export Xilinx Support Archive (XSA) file.
write_hw_platform -fixed -force  -include_bit -file ${prj_dir}/hero_exilzcu102_wrapper.xsa