

add wave -noupdate -group {HWPE traffic_gen} -group {ov_acc_intf} {/pulp_tb/dut/gen_clusters[0]/gen_cluster_sync/i_cluster/i_ooc/i_bound/hwpe_gen/hwpe_wrap_i/clk}
add wave -noupdate -group {HWPE traffic_gen} -group {ov_acc_intf} {/pulp_tb/dut/gen_clusters[0]/gen_cluster_sync/i_cluster/i_ooc/i_bound/hwpe_gen/hwpe_wrap_i/rst_n}
add wave -noupdate -group {HWPE traffic_gen} -group {ov_acc_intf} {/pulp_tb/dut/gen_clusters[0]/gen_cluster_sync/i_cluster/i_ooc/i_bound/hwpe_gen/hwpe_wrap_i/test_mode}

add wave -noupdate -group {HWPE traffic_gen} -group {ov_acc_intf} -group {hwpe_xbar_master[0]} {/pulp_tb/dut/gen_clusters[0]/gen_cluster_sync/i_cluster/i_ooc/i_bound/hwpe_gen/hwpe_wrap_i/hwacc_xbar_master[0]/req}
add wave -noupdate -group {HWPE traffic_gen} -group {ov_acc_intf} -group {hwpe_xbar_master[0]} {/pulp_tb/dut/gen_clusters[0]/gen_cluster_sync/i_cluster/i_ooc/i_bound/hwpe_gen/hwpe_wrap_i/hwacc_xbar_master[0]/add}
add wave -noupdate -group {HWPE traffic_gen} -group {ov_acc_intf} -group {hwpe_xbar_master[0]} {/pulp_tb/dut/gen_clusters[0]/gen_cluster_sync/i_cluster/i_ooc/i_bound/hwpe_gen/hwpe_wrap_i/hwacc_xbar_master[0]/wen}
add wave -noupdate -group {HWPE traffic_gen} -group {ov_acc_intf} -group {hwpe_xbar_master[0]} {/pulp_tb/dut/gen_clusters[0]/gen_cluster_sync/i_cluster/i_ooc/i_bound/hwpe_gen/hwpe_wrap_i/hwacc_xbar_master[0]/wdata}
add wave -noupdate -group {HWPE traffic_gen} -group {ov_acc_intf} -group {hwpe_xbar_master[0]} {/pulp_tb/dut/gen_clusters[0]/gen_cluster_sync/i_cluster/i_ooc/i_bound/hwpe_gen/hwpe_wrap_i/hwacc_xbar_master[0]/be}
add wave -noupdate -group {HWPE traffic_gen} -group {ov_acc_intf} -group {hwpe_xbar_master[0]} {/pulp_tb/dut/gen_clusters[0]/gen_cluster_sync/i_cluster/i_ooc/i_bound/hwpe_gen/hwpe_wrap_i/hwacc_xbar_master[0]/gnt}
add wave -noupdate -group {HWPE traffic_gen} -group {ov_acc_intf} -group {hwpe_xbar_master[0]} {/pulp_tb/dut/gen_clusters[0]/gen_cluster_sync/i_cluster/i_ooc/i_bound/hwpe_gen/hwpe_wrap_i/hwacc_xbar_master[0]/r_opc}
add wave -noupdate -group {HWPE traffic_gen} -group {ov_acc_intf} -group {hwpe_xbar_master[0]} {/pulp_tb/dut/gen_clusters[0]/gen_cluster_sync/i_cluster/i_ooc/i_bound/hwpe_gen/hwpe_wrap_i/hwacc_xbar_master[0]/r_rdata}
add wave -noupdate -group {HWPE traffic_gen} -group {ov_acc_intf} -group {hwpe_xbar_master[0]} {/pulp_tb/dut/gen_clusters[0]/gen_cluster_sync/i_cluster/i_ooc/i_bound/hwpe_gen/hwpe_wrap_i/hwacc_xbar_master[0]/r_valid}

add wave -noupdate -group {HWPE traffic_gen} -group {ov_acc_intf} -group {hwpe_xbar_master[1]} {/pulp_tb/dut/gen_clusters[0]/gen_cluster_sync/i_cluster/i_ooc/i_bound/hwpe_gen/hwpe_wrap_i/hwacc_xbar_master[1]/req}
add wave -noupdate -group {HWPE traffic_gen} -group {ov_acc_intf} -group {hwpe_xbar_master[1]} {/pulp_tb/dut/gen_clusters[0]/gen_cluster_sync/i_cluster/i_ooc/i_bound/hwpe_gen/hwpe_wrap_i/hwacc_xbar_master[1]/add}
add wave -noupdate -group {HWPE traffic_gen} -group {ov_acc_intf} -group {hwpe_xbar_master[1]} {/pulp_tb/dut/gen_clusters[0]/gen_cluster_sync/i_cluster/i_ooc/i_bound/hwpe_gen/hwpe_wrap_i/hwacc_xbar_master[1]/wen}
add wave -noupdate -group {HWPE traffic_gen} -group {ov_acc_intf} -group {hwpe_xbar_master[1]} {/pulp_tb/dut/gen_clusters[0]/gen_cluster_sync/i_cluster/i_ooc/i_bound/hwpe_gen/hwpe_wrap_i/hwacc_xbar_master[1]/wdata}
add wave -noupdate -group {HWPE traffic_gen} -group {ov_acc_intf} -group {hwpe_xbar_master[1]} {/pulp_tb/dut/gen_clusters[0]/gen_cluster_sync/i_cluster/i_ooc/i_bound/hwpe_gen/hwpe_wrap_i/hwacc_xbar_master[1]/be}
add wave -noupdate -group {HWPE traffic_gen} -group {ov_acc_intf} -group {hwpe_xbar_master[1]} {/pulp_tb/dut/gen_clusters[0]/gen_cluster_sync/i_cluster/i_ooc/i_bound/hwpe_gen/hwpe_wrap_i/hwacc_xbar_master[1]/gnt}
add wave -noupdate -group {HWPE traffic_gen} -group {ov_acc_intf} -group {hwpe_xbar_master[1]} {/pulp_tb/dut/gen_clusters[0]/gen_cluster_sync/i_cluster/i_ooc/i_bound/hwpe_gen/hwpe_wrap_i/hwacc_xbar_master[1]/r_opc}
add wave -noupdate -group {HWPE traffic_gen} -group {ov_acc_intf} -group {hwpe_xbar_master[1]} {/pulp_tb/dut/gen_clusters[0]/gen_cluster_sync/i_cluster/i_ooc/i_bound/hwpe_gen/hwpe_wrap_i/hwacc_xbar_master[1]/r_rdata}
add wave -noupdate -group {HWPE traffic_gen} -group {ov_acc_intf} -group {hwpe_xbar_master[1]} {/pulp_tb/dut/gen_clusters[0]/gen_cluster_sync/i_cluster/i_ooc/i_bound/hwpe_gen/hwpe_wrap_i/hwacc_xbar_master[1]/r_valid}

add wave -noupdate -group {HWPE traffic_gen} -group {ov_acc_intf} -group {hwacc_cfg_slave} {/pulp_tb/dut/gen_clusters[0]/gen_cluster_sync/i_cluster/i_ooc/i_bound/hwpe_gen/hwpe_wrap_i/hwacc_cfg_slave/req}
add wave -noupdate -group {HWPE traffic_gen} -group {ov_acc_intf} -group {hwacc_cfg_slave} {/pulp_tb/dut/gen_clusters[0]/gen_cluster_sync/i_cluster/i_ooc/i_bound/hwpe_gen/hwpe_wrap_i/hwacc_cfg_slave/add}
add wave -noupdate -group {HWPE traffic_gen} -group {ov_acc_intf} -group {hwacc_cfg_slave} {/pulp_tb/dut/gen_clusters[0]/gen_cluster_sync/i_cluster/i_ooc/i_bound/hwpe_gen/hwpe_wrap_i/hwacc_cfg_slave/wen}
add wave -noupdate -group {HWPE traffic_gen} -group {ov_acc_intf} -group {hwacc_cfg_slave} {/pulp_tb/dut/gen_clusters[0]/gen_cluster_sync/i_cluster/i_ooc/i_bound/hwpe_gen/hwpe_wrap_i/hwacc_cfg_slave/wdata}
add wave -noupdate -group {HWPE traffic_gen} -group {ov_acc_intf} -group {hwacc_cfg_slave} {/pulp_tb/dut/gen_clusters[0]/gen_cluster_sync/i_cluster/i_ooc/i_bound/hwpe_gen/hwpe_wrap_i/hwacc_cfg_slave/be}
add wave -noupdate -group {HWPE traffic_gen} -group {ov_acc_intf} -group {hwacc_cfg_slave} {/pulp_tb/dut/gen_clusters[0]/gen_cluster_sync/i_cluster/i_ooc/i_bound/hwpe_gen/hwpe_wrap_i/hwacc_cfg_slave/gnt}
add wave -noupdate -group {HWPE traffic_gen} -group {ov_acc_intf} -group {hwacc_cfg_slave} {/pulp_tb/dut/gen_clusters[0]/gen_cluster_sync/i_cluster/i_ooc/i_bound/hwpe_gen/hwpe_wrap_i/hwacc_cfg_slave/id}
add wave -noupdate -group {HWPE traffic_gen} -group {ov_acc_intf} -group {hwacc_cfg_slave} {/pulp_tb/dut/gen_clusters[0]/gen_cluster_sync/i_cluster/i_ooc/i_bound/hwpe_gen/hwpe_wrap_i/hwacc_cfg_slave/r_valid}
add wave -noupdate -group {HWPE traffic_gen} -group {ov_acc_intf} -group {hwacc_cfg_slave} {/pulp_tb/dut/gen_clusters[0]/gen_cluster_sync/i_cluster/i_ooc/i_bound/hwpe_gen/hwpe_wrap_i/hwacc_cfg_slave/r_opc}
add wave -noupdate -group {HWPE traffic_gen} -group {ov_acc_intf} -group {hwacc_cfg_slave} {/pulp_tb/dut/gen_clusters[0]/gen_cluster_sync/i_cluster/i_ooc/i_bound/hwpe_gen/hwpe_wrap_i/hwacc_cfg_slave/r_id}
add wave -noupdate -group {HWPE traffic_gen} -group {ov_acc_intf} -group {hwacc_cfg_slave} {/pulp_tb/dut/gen_clusters[0]/gen_cluster_sync/i_cluster/i_ooc/i_bound/hwpe_gen/hwpe_wrap_i/hwacc_cfg_slave/r_rdata}
add wave -noupdate -group {HWPE traffic_gen} -group {ov_acc_intf} {/pulp_tb/dut/gen_clusters[0]/gen_cluster_sync/i_cluster/i_ooc/i_bound/hwpe_gen/hwpe_wrap_i/evt_o}
add wave -noupdate -group {HWPE traffic_gen} -group {ov_acc_intf} {/pulp_tb/dut/gen_clusters[0]/gen_cluster_sync/i_cluster/i_ooc/i_bound/hwpe_gen/hwpe_wrap_i/busy_o}

add wave -noupdate -group {HWPE traffic_gen} -group {hwpe_top} {/pulp_tb/dut/gen_clusters[0]/gen_cluster_sync/i_cluster/i_ooc/i_bound/hwpe_gen/hwpe_wrap_i/i_hwpe_top_wrap/clk_i}
add wave -noupdate -group {HWPE traffic_gen} -group {hwpe_top} {/pulp_tb/dut/gen_clusters[0]/gen_cluster_sync/i_cluster/i_ooc/i_bound/hwpe_gen/hwpe_wrap_i/i_hwpe_top_wrap/rst_ni}
add wave -noupdate -group {HWPE traffic_gen} -group {hwpe_top} {/pulp_tb/dut/gen_clusters[0]/gen_cluster_sync/i_cluster/i_ooc/i_bound/hwpe_gen/hwpe_wrap_i/i_hwpe_top_wrap/test_mode_i}
add wave -noupdate -group {HWPE traffic_gen} -group {hwpe_top} -group {tcdm} {/pulp_tb/dut/gen_clusters[0]/gen_cluster_sync/i_cluster/i_ooc/i_bound/hwpe_gen/hwpe_wrap_i/i_hwpe_top_wrap/tcdm_add}
add wave -noupdate -group {HWPE traffic_gen} -group {hwpe_top} -group {tcdm} {/pulp_tb/dut/gen_clusters[0]/gen_cluster_sync/i_cluster/i_ooc/i_bound/hwpe_gen/hwpe_wrap_i/i_hwpe_top_wrap/tcdm_be}
add wave -noupdate -group {HWPE traffic_gen} -group {hwpe_top} -group {tcdm} {/pulp_tb/dut/gen_clusters[0]/gen_cluster_sync/i_cluster/i_ooc/i_bound/hwpe_gen/hwpe_wrap_i/i_hwpe_top_wrap/tcdm_data}
add wave -noupdate -group {HWPE traffic_gen} -group {hwpe_top} -group {tcdm} {/pulp_tb/dut/gen_clusters[0]/gen_cluster_sync/i_cluster/i_ooc/i_bound/hwpe_gen/hwpe_wrap_i/i_hwpe_top_wrap/tcdm_gnt}
add wave -noupdate -group {HWPE traffic_gen} -group {hwpe_top} -group {tcdm} {/pulp_tb/dut/gen_clusters[0]/gen_cluster_sync/i_cluster/i_ooc/i_bound/hwpe_gen/hwpe_wrap_i/i_hwpe_top_wrap/tcdm_wen}
add wave -noupdate -group {HWPE traffic_gen} -group {hwpe_top} -group {tcdm} {/pulp_tb/dut/gen_clusters[0]/gen_cluster_sync/i_cluster/i_ooc/i_bound/hwpe_gen/hwpe_wrap_i/i_hwpe_top_wrap/tcdm_req}
add wave -noupdate -group {HWPE traffic_gen} -group {hwpe_top} -group {tcdm} {/pulp_tb/dut/gen_clusters[0]/gen_cluster_sync/i_cluster/i_ooc/i_bound/hwpe_gen/hwpe_wrap_i/i_hwpe_top_wrap/tcdm_r_data}
add wave -noupdate -group {HWPE traffic_gen} -group {hwpe_top} -group {tcdm} {/pulp_tb/dut/gen_clusters[0]/gen_cluster_sync/i_cluster/i_ooc/i_bound/hwpe_gen/hwpe_wrap_i/i_hwpe_top_wrap/tcdm_r_valid}
add wave -noupdate -group {HWPE traffic_gen} -group {hwpe_top} -group {periph} {/pulp_tb/dut/gen_clusters[0]/gen_cluster_sync/i_cluster/i_ooc/i_bound/hwpe_gen/hwpe_wrap_i/i_hwpe_top_wrap/periph_add}
add wave -noupdate -group {HWPE traffic_gen} -group {hwpe_top} -group {periph} {/pulp_tb/dut/gen_clusters[0]/gen_cluster_sync/i_cluster/i_ooc/i_bound/hwpe_gen/hwpe_wrap_i/i_hwpe_top_wrap/periph_be}
add wave -noupdate -group {HWPE traffic_gen} -group {hwpe_top} -group {periph} {/pulp_tb/dut/gen_clusters[0]/gen_cluster_sync/i_cluster/i_ooc/i_bound/hwpe_gen/hwpe_wrap_i/i_hwpe_top_wrap/periph_data}
add wave -noupdate -group {HWPE traffic_gen} -group {hwpe_top} -group {periph} {/pulp_tb/dut/gen_clusters[0]/gen_cluster_sync/i_cluster/i_ooc/i_bound/hwpe_gen/hwpe_wrap_i/i_hwpe_top_wrap/periph_gnt}
add wave -noupdate -group {HWPE traffic_gen} -group {hwpe_top} -group {periph} {/pulp_tb/dut/gen_clusters[0]/gen_cluster_sync/i_cluster/i_ooc/i_bound/hwpe_gen/hwpe_wrap_i/i_hwpe_top_wrap/periph_wen}
add wave -noupdate -group {HWPE traffic_gen} -group {hwpe_top} -group {periph} {/pulp_tb/dut/gen_clusters[0]/gen_cluster_sync/i_cluster/i_ooc/i_bound/hwpe_gen/hwpe_wrap_i/i_hwpe_top_wrap/periph_req}
add wave -noupdate -group {HWPE traffic_gen} -group {hwpe_top} -group {periph} {/pulp_tb/dut/gen_clusters[0]/gen_cluster_sync/i_cluster/i_ooc/i_bound/hwpe_gen/hwpe_wrap_i/i_hwpe_top_wrap/periph_id}
add wave -noupdate -group {HWPE traffic_gen} -group {hwpe_top} -group {periph} {/pulp_tb/dut/gen_clusters[0]/gen_cluster_sync/i_cluster/i_ooc/i_bound/hwpe_gen/hwpe_wrap_i/i_hwpe_top_wrap/periph_r_data}
add wave -noupdate -group {HWPE traffic_gen} -group {hwpe_top} -group {periph} {/pulp_tb/dut/gen_clusters[0]/gen_cluster_sync/i_cluster/i_ooc/i_bound/hwpe_gen/hwpe_wrap_i/i_hwpe_top_wrap/periph_r_valid}
add wave -noupdate -group {HWPE traffic_gen} -group {hwpe_top} -group {periph} {/pulp_tb/dut/gen_clusters[0]/gen_cluster_sync/i_cluster/i_ooc/i_bound/hwpe_gen/hwpe_wrap_i/i_hwpe_top_wrap/periph_r_id}
add wave -noupdate -group {HWPE traffic_gen} -group {hwpe_top} {/pulp_tb/dut/gen_clusters[0]/gen_cluster_sync/i_cluster/i_ooc/i_bound/hwpe_gen/hwpe_wrap_i/i_hwpe_top_wrap/evt_o}

add wave -noupdate -group {HWPE traffic_gen} -group {hwpe_traffic_gen_engine} -group {global} -label {clk_i} {/pulp_tb/dut/gen_clusters[0]/gen_cluster_sync/i_cluster/i_ooc/i_bound/hwpe_gen/hwpe_wrap_i/i_hwpe_top_wrap/i_traffic_gen_top/i_engine/clk_i}
add wave -noupdate -group {HWPE traffic_gen} -group {hwpe_traffic_gen_engine} -group {global} -label {rst_ni} {/pulp_tb/dut/gen_clusters[0]/gen_cluster_sync/i_cluster/i_ooc/i_bound/hwpe_gen/hwpe_wrap_i/i_hwpe_top_wrap/i_traffic_gen_top/i_engine/rst_ni}
add wave -noupdate -group {HWPE traffic_gen} -group {hwpe_traffic_gen_engine} -group {global} -label {test_mode_i} {/pulp_tb/dut/gen_clusters[0]/gen_cluster_sync/i_cluster/i_ooc/i_bound/hwpe_gen/hwpe_wrap_i/i_hwpe_top_wrap/i_traffic_gen_top/i_engine/test_mode_i}

add wave -noupdate -group {HWPE traffic_gen} -group {hwpe_traffic_gen_engine} -group {Input data} -group {r_reqs} -label {Valid} {/pulp_tb/dut/gen_clusters[0]/gen_cluster_sync/i_cluster/i_ooc/i_bound/hwpe_gen/hwpe_wrap_i/i_hwpe_top_wrap/i_traffic_gen_top/i_engine/r_reqs_i/valid}
add wave -noupdate -group {HWPE traffic_gen} -group {hwpe_traffic_gen_engine} -group {Input data} -group {r_reqs} -label {Data} {/pulp_tb/dut/gen_clusters[0]/gen_cluster_sync/i_cluster/i_ooc/i_bound/hwpe_gen/hwpe_wrap_i/i_hwpe_top_wrap/i_traffic_gen_top/i_engine/r_reqs_i/data}
add wave -noupdate -group {HWPE traffic_gen} -group {hwpe_traffic_gen_engine} -group {Input data} -group {r_reqs} -label {Ready} {/pulp_tb/dut/gen_clusters[0]/gen_cluster_sync/i_cluster/i_ooc/i_bound/hwpe_gen/hwpe_wrap_i/i_hwpe_top_wrap/i_traffic_gen_top/i_engine/r_reqs_i/ready}

add wave -noupdate -group {HWPE traffic_gen} -group {hwpe_traffic_gen_engine} -group {Output data} -group {w_reqs} -label {Valid} {/pulp_tb/dut/gen_clusters[0]/gen_cluster_sync/i_cluster/i_ooc/i_bound/hwpe_gen/hwpe_wrap_i/i_hwpe_top_wrap/i_traffic_gen_top/i_engine/w_reqs_o/valid}
add wave -noupdate -group {HWPE traffic_gen} -group {hwpe_traffic_gen_engine} -group {Output data} -group {w_reqs} -label {Data} {/pulp_tb/dut/gen_clusters[0]/gen_cluster_sync/i_cluster/i_ooc/i_bound/hwpe_gen/hwpe_wrap_i/i_hwpe_top_wrap/i_traffic_gen_top/i_engine/w_reqs_o/data}
add wave -noupdate -group {HWPE traffic_gen} -group {hwpe_traffic_gen_engine} -group {Output data} -group {w_reqs} -label {Ready} {/pulp_tb/dut/gen_clusters[0]/gen_cluster_sync/i_cluster/i_ooc/i_bound/hwpe_gen/hwpe_wrap_i/i_hwpe_top_wrap/i_traffic_gen_top/i_engine/w_reqs_o/ready}

add wave -noupdate -group {HWPE traffic_gen} -group {hwpe_traffic_gen_engine} -group {FSM - control} -label {ctrl_i} {/pulp_tb/dut/gen_clusters[0]/gen_cluster_sync/i_cluster/i_ooc/i_bound/hwpe_gen/hwpe_wrap_i/i_hwpe_top_wrap/i_traffic_gen_top/i_engine/ctrl_i}
add wave -noupdate -group {HWPE traffic_gen} -group {hwpe_traffic_gen_engine} -group {FSM - flags} -label {flags_o} {/pulp_tb/dut/gen_clusters[0]/gen_cluster_sync/i_cluster/i_ooc/i_bound/hwpe_gen/hwpe_wrap_i/i_hwpe_top_wrap/i_traffic_gen_top/i_engine/flags_o}

add wave -noupdate -group {HWPE traffic_gen} -group {hwpe_traffic_gen_engine} -group {Local} {/pulp_tb/dut/gen_clusters[0]/gen_cluster_sync/i_cluster/i_ooc/i_bound/hwpe_gen/hwpe_wrap_i/i_hwpe_top_wrap/i_traffic_gen_top/i_engine/*}

add wave -noupdate -group {HWPE traffic_gen} -group {hwpe_traffic_gen_kernel_adapter} -group {xil_ap_ctrl_hs} -group {global} -label {clk_i} {/pulp_tb/dut/gen_clusters[0]/gen_cluster_sync/i_cluster/i_ooc/i_bound/hwpe_gen/hwpe_wrap_i/i_hwpe_top_wrap/i_traffic_gen_top/i_engine/i_traffic_gen_adapter/clk_i}
add wave -noupdate -group {HWPE traffic_gen} -group {hwpe_traffic_gen_kernel_adapter} -group {xil_ap_ctrl_hs} -group {global} -label {rst_ni} {/pulp_tb/dut/gen_clusters[0]/gen_cluster_sync/i_cluster/i_ooc/i_bound/hwpe_gen/hwpe_wrap_i/i_hwpe_top_wrap/i_traffic_gen_top/i_engine/i_traffic_gen_adapter/rst_ni}
add wave -noupdate -group {HWPE traffic_gen} -group {hwpe_traffic_gen_kernel_adapter} -group {xil_ap_ctrl_hs} -group {global} -label {test_mode_i} {/pulp_tb/dut/gen_clusters[0]/gen_cluster_sync/i_cluster/i_ooc/i_bound/hwpe_gen/hwpe_wrap_i/i_hwpe_top_wrap/i_traffic_gen_top/i_engine/i_traffic_gen_adapter/test_mode_i}

add wave -noupdate -group {HWPE traffic_gen} -group {hwpe_traffic_gen_kernel_adapter} -group {xil_ap_ctrl_hs} -group {Input data} -group {r_reqs} -label {Valid} {/pulp_tb/dut/gen_clusters[0]/gen_cluster_sync/i_cluster/i_ooc/i_bound/hwpe_gen/hwpe_wrap_i/i_hwpe_top_wrap/i_traffic_gen_top/i_engine/i_traffic_gen_adapter/r_reqs_i/valid}
add wave -noupdate -group {HWPE traffic_gen} -group {hwpe_traffic_gen_kernel_adapter} -group {xil_ap_ctrl_hs} -group {Input data} -group {r_reqs} -label {Data} {/pulp_tb/dut/gen_clusters[0]/gen_cluster_sync/i_cluster/i_ooc/i_bound/hwpe_gen/hwpe_wrap_i/i_hwpe_top_wrap/i_traffic_gen_top/i_engine/i_traffic_gen_adapter/r_reqs_i/data}
add wave -noupdate -group {HWPE traffic_gen} -group {hwpe_traffic_gen_kernel_adapter} -group {xil_ap_ctrl_hs} -group {Input data} -group {r_reqs} -label {Ready} {/pulp_tb/dut/gen_clusters[0]/gen_cluster_sync/i_cluster/i_ooc/i_bound/hwpe_gen/hwpe_wrap_i/i_hwpe_top_wrap/i_traffic_gen_top/i_engine/i_traffic_gen_adapter/r_reqs_i/ready}

add wave -noupdate -group {HWPE traffic_gen} -group {hwpe_traffic_gen_kernel_adapter} -group {xil_ap_ctrl_hs} -group {Output data} -group {w_reqs} -label {Valid} {/pulp_tb/dut/gen_clusters[0]/gen_cluster_sync/i_cluster/i_ooc/i_bound/hwpe_gen/hwpe_wrap_i/i_hwpe_top_wrap/i_traffic_gen_top/i_engine/i_traffic_gen_adapter/w_reqs_o/valid}
add wave -noupdate -group {HWPE traffic_gen} -group {hwpe_traffic_gen_kernel_adapter} -group {xil_ap_ctrl_hs} -group {Output data} -group {w_reqs} -label {Data} {/pulp_tb/dut/gen_clusters[0]/gen_cluster_sync/i_cluster/i_ooc/i_bound/hwpe_gen/hwpe_wrap_i/i_hwpe_top_wrap/i_traffic_gen_top/i_engine/i_traffic_gen_adapter/w_reqs_o/data}
add wave -noupdate -group {HWPE traffic_gen} -group {hwpe_traffic_gen_kernel_adapter} -group {xil_ap_ctrl_hs} -group {Output data} -group {w_reqs} -label {Ready} {/pulp_tb/dut/gen_clusters[0]/gen_cluster_sync/i_cluster/i_ooc/i_bound/hwpe_gen/hwpe_wrap_i/i_hwpe_top_wrap/i_traffic_gen_top/i_engine/i_traffic_gen_adapter/w_reqs_o/ready}

add wave -noupdate -group {HWPE traffic_gen} -group {hwpe_traffic_gen_kernel_adapter} -group {xil_ap_ctrl_hs} -group {Custom registers} -label {n_reqs} {/pulp_tb/dut/gen_clusters[0]/gen_cluster_sync/i_cluster/i_ooc/i_bound/hwpe_gen/hwpe_wrap_i/i_hwpe_top_wrap/i_traffic_gen_top/i_engine/i_traffic_gen_adapter/n_reqs}
add wave -noupdate -group {HWPE traffic_gen} -group {hwpe_traffic_gen_kernel_adapter} -group {xil_ap_ctrl_hs} -group {Custom registers} -label {pwm_period} {/pulp_tb/dut/gen_clusters[0]/gen_cluster_sync/i_cluster/i_ooc/i_bound/hwpe_gen/hwpe_wrap_i/i_hwpe_top_wrap/i_traffic_gen_top/i_engine/i_traffic_gen_adapter/pwm_period}
add wave -noupdate -group {HWPE traffic_gen} -group {hwpe_traffic_gen_kernel_adapter} -group {xil_ap_ctrl_hs} -group {Custom registers} -label {pwm_duty_cycle} {/pulp_tb/dut/gen_clusters[0]/gen_cluster_sync/i_cluster/i_ooc/i_bound/hwpe_gen/hwpe_wrap_i/i_hwpe_top_wrap/i_traffic_gen_top/i_engine/i_traffic_gen_adapter/pwm_duty_cycle}

add wave -noupdate -group {HWPE traffic_gen} -group {hwpe_traffic_gen_kernel_adapter} -group {xil_ap_ctrl_hs} -label {ctrl_i} {/pulp_tb/dut/gen_clusters[0]/gen_cluster_sync/i_cluster/i_ooc/i_bound/hwpe_gen/hwpe_wrap_i/i_hwpe_top_wrap/i_traffic_gen_top/i_engine/i_traffic_gen_adapter/ctrl_i}

add wave -noupdate -group {HWPE traffic_gen} -group {hwpe_traffic_gen_kernel_adapter} -group {xil_ap_ctrl_hs} -label {flags_o} {/pulp_tb/dut/gen_clusters[0]/gen_cluster_sync/i_cluster/i_ooc/i_bound/hwpe_gen/hwpe_wrap_i/i_hwpe_top_wrap/i_traffic_gen_top/i_engine/i_traffic_gen_adapter/flags_o}

add wave -noupdate -group {HWPE traffic_gen} -group {hwpe_traffic_gen_kernel_HLS} {/pulp_tb/dut/gen_clusters[0]/gen_cluster_sync/i_cluster/i_ooc/i_bound/hwpe_gen/hwpe_wrap_i/i_hwpe_top_wrap/i_traffic_gen_top/i_engine/i_traffic_gen_adapter/i_traffic_gen/*}

add wave -noupdate -group {HWPE traffic_gen} -group {hwpe_streamer} -group {global} -label {clk_i} {/pulp_tb/dut/gen_clusters[0]/gen_cluster_sync/i_cluster/i_ooc/i_bound/hwpe_gen/hwpe_wrap_i/i_hwpe_top_wrap/i_traffic_gen_top/i_streamer/clk_i}
add wave -noupdate -group {HWPE traffic_gen} -group {hwpe_streamer} -group {global} -label {rst_ni} {/pulp_tb/dut/gen_clusters[0]/gen_cluster_sync/i_cluster/i_ooc/i_bound/hwpe_gen/hwpe_wrap_i/i_hwpe_top_wrap/i_traffic_gen_top/i_streamer/rst_ni}
add wave -noupdate -group {HWPE traffic_gen} -group {hwpe_streamer} -group {global} -label {test_mode_i} {/pulp_tb/dut/gen_clusters[0]/gen_cluster_sync/i_cluster/i_ooc/i_bound/hwpe_gen/hwpe_wrap_i/i_hwpe_top_wrap/i_traffic_gen_top/i_streamer/test_mode_i}
add wave -noupdate -group {HWPE traffic_gen} -group {hwpe_streamer} -group {global} -label {enable_i} {/pulp_tb/dut/gen_clusters[0]/gen_cluster_sync/i_cluster/i_ooc/i_bound/hwpe_gen/hwpe_wrap_i/i_hwpe_top_wrap/i_traffic_gen_top/i_streamer/enable_i}
add wave -noupdate -group {HWPE traffic_gen} -group {hwpe_streamer} -group {global} -label {clear_i} {/pulp_tb/dut/gen_clusters[0]/gen_cluster_sync/i_cluster/i_ooc/i_bound/hwpe_gen/hwpe_wrap_i/i_hwpe_top_wrap/i_traffic_gen_top/i_streamer/clear_i}

add wave -noupdate -group {HWPE traffic_gen} -group {hwpe_streamer} -group {top} {/pulp_tb/dut/gen_clusters[0]/gen_cluster_sync/i_cluster/i_ooc/i_bound/hwpe_gen/hwpe_wrap_i/i_hwpe_top_wrap/i_traffic_gen_top/i_streamer/*}

add wave -noupdate -group {HWPE traffic_gen} -group {hwpe_streamer} -group {r_reqs_source} -group {source} {/pulp_tb/dut/gen_clusters[0]/gen_cluster_sync/i_cluster/i_ooc/i_bound/hwpe_gen/hwpe_wrap_i/i_hwpe_top_wrap/i_traffic_gen_top/i_streamer/i_r_reqs_source/*}

add wave -noupdate -group {HWPE traffic_gen} -group {hwpe_streamer} -group {w_reqs_sink} -group {sink} {/pulp_tb/dut/gen_clusters[0]/gen_cluster_sync/i_cluster/i_ooc/i_bound/hwpe_gen/hwpe_wrap_i/i_hwpe_top_wrap/i_traffic_gen_top/i_streamer/i_w_reqs_sink/*}

add wave -noupdate -group {HWPE traffic_gen} -group {hwpe_streamer} -group {r_reqs_source} -group {addressgen} {/pulp_tb/dut/gen_clusters[0]/gen_cluster_sync/i_cluster/i_ooc/i_bound/hwpe_gen/hwpe_wrap_i/i_hwpe_top_wrap/i_traffic_gen_top/i_streamer/i_r_reqs_source/i_addressgen/*}

add wave -noupdate -group {HWPE traffic_gen} -group {hwpe_streamer} -group {w_reqs_sink} -group {addressgen} {/pulp_tb/dut/gen_clusters[0]/gen_cluster_sync/i_cluster/i_ooc/i_bound/hwpe_gen/hwpe_wrap_i/i_hwpe_top_wrap/i_traffic_gen_top/i_streamer/i_w_reqs_sink/i_addressgen/*}

add wave -noupdate -group {HWPE traffic_gen} -group {hwpe_ctrl} -group {top} {/pulp_tb/dut/gen_clusters[0]/gen_cluster_sync/i_cluster/i_ooc/i_bound/hwpe_gen/hwpe_wrap_i/i_hwpe_top_wrap/i_traffic_gen_top/i_ctrl/*}

add wave -noupdate -group {HWPE traffic_gen} -group {hwpe_ctrl} -group {slave_periph_port} -label {add} {/pulp_tb/dut/gen_clusters[0]/gen_cluster_sync/i_cluster/i_ooc/i_bound/hwpe_gen/hwpe_wrap_i/i_hwpe_top_wrap/i_traffic_gen_top/i_ctrl/i_slave/cfg/add}
add wave -noupdate -group {HWPE traffic_gen} -group {hwpe_ctrl} -group {slave_periph_port} -label {wen} {/pulp_tb/dut/gen_clusters[0]/gen_cluster_sync/i_cluster/i_ooc/i_bound/hwpe_gen/hwpe_wrap_i/i_hwpe_top_wrap/i_traffic_gen_top/i_ctrl/i_slave/cfg/wen}
add wave -noupdate -group {HWPE traffic_gen} -group {hwpe_ctrl} -group {slave_periph_port} -label {be} {/pulp_tb/dut/gen_clusters[0]/gen_cluster_sync/i_cluster/i_ooc/i_bound/hwpe_gen/hwpe_wrap_i/i_hwpe_top_wrap/i_traffic_gen_top/i_ctrl/i_slave/cfg/be}
add wave -noupdate -group {HWPE traffic_gen} -group {hwpe_ctrl} -group {slave_periph_port} -label {data} {/pulp_tb/dut/gen_clusters[0]/gen_cluster_sync/i_cluster/i_ooc/i_bound/hwpe_gen/hwpe_wrap_i/i_hwpe_top_wrap/i_traffic_gen_top/i_ctrl/i_slave/cfg/data}
add wave -noupdate -group {HWPE traffic_gen} -group {hwpe_ctrl} -group {slave_periph_port} -label {id} {/pulp_tb/dut/gen_clusters[0]/gen_cluster_sync/i_cluster/i_ooc/i_bound/hwpe_gen/hwpe_wrap_i/i_hwpe_top_wrap/i_traffic_gen_top/i_ctrl/i_slave/cfg/id}
add wave -noupdate -group {HWPE traffic_gen} -group {hwpe_ctrl} -group {slave_periph_port} -label {r_data} {/pulp_tb/dut/gen_clusters[0]/gen_cluster_sync/i_cluster/i_ooc/i_bound/hwpe_gen/hwpe_wrap_i/i_hwpe_top_wrap/i_traffic_gen_top/i_ctrl/i_slave/cfg/r_data}
add wave -noupdate -group {HWPE traffic_gen} -group {hwpe_ctrl} -group {slave_periph_port} -label {r_valid} {/pulp_tb/dut/gen_clusters[0]/gen_cluster_sync/i_cluster/i_ooc/i_bound/hwpe_gen/hwpe_wrap_i/i_hwpe_top_wrap/i_traffic_gen_top/i_ctrl/i_slave/cfg/r_valid}
add wave -noupdate -group {HWPE traffic_gen} -group {hwpe_ctrl} -group {slave_periph_port} -label {r_id} {/pulp_tb/dut/gen_clusters[0]/gen_cluster_sync/i_cluster/i_ooc/i_bound/hwpe_gen/hwpe_wrap_i/i_hwpe_top_wrap/i_traffic_gen_top/i_ctrl/i_slave/cfg/r_id}

add wave -noupdate -group {HWPE traffic_gen} -group {hwpe_ctrl} -group {regfile} -label {clear_i} {/pulp_tb/dut/gen_clusters[0]/gen_cluster_sync/i_cluster/i_ooc/i_bound/hwpe_gen/hwpe_wrap_i/i_hwpe_top_wrap/i_traffic_gen_top/i_ctrl/i_slave/i_regfile/clear_i}
add wave -noupdate -group {HWPE traffic_gen} -group {hwpe_ctrl} -group {regfile} -label {in} {/pulp_tb/dut/gen_clusters[0]/gen_cluster_sync/i_cluster/i_ooc/i_bound/hwpe_gen/hwpe_wrap_i/i_hwpe_top_wrap/i_traffic_gen_top/i_ctrl/i_slave/i_regfile/regfile_in_i}
add wave -noupdate -group {HWPE traffic_gen} -group {hwpe_ctrl} -group {regfile} -label {out} {/pulp_tb/dut/gen_clusters[0]/gen_cluster_sync/i_cluster/i_ooc/i_bound/hwpe_gen/hwpe_wrap_i/i_hwpe_top_wrap/i_traffic_gen_top/i_ctrl/i_slave/i_regfile/regfile_out_o}
add wave -noupdate -group {HWPE traffic_gen} -group {hwpe_ctrl} -group {regfile} -label {flags} {/pulp_tb/dut/gen_clusters[0]/gen_cluster_sync/i_cluster/i_ooc/i_bound/hwpe_gen/hwpe_wrap_i/i_hwpe_top_wrap/i_traffic_gen_top/i_ctrl/i_slave/i_regfile/flags_i}

add wave -noupdate -group {HWPE traffic_gen} -group {hwpe_ctrl} -group {regfile} -label {reg_file} {/pulp_tb/dut/gen_clusters[0]/gen_cluster_sync/i_cluster/i_ooc/i_bound/hwpe_gen/hwpe_wrap_i/i_hwpe_top_wrap/i_traffic_gen_top/i_ctrl/i_slave/i_regfile/reg_file}
add wave -noupdate -group {HWPE traffic_gen} -group {hwpe_ctrl} -group {regfile} -label {regfile_mem} {/pulp_tb/dut/gen_clusters[0]/gen_cluster_sync/i_cluster/i_ooc/i_bound/hwpe_gen/hwpe_wrap_i/i_hwpe_top_wrap/i_traffic_gen_top/i_ctrl/i_slave/i_regfile/regfile_mem}
add wave -noupdate -group {HWPE traffic_gen} -group {hwpe_ctrl} -group {regfile} -label {regfile_mem_mandatory} {/pulp_tb/dut/gen_clusters[0]/gen_cluster_sync/i_cluster/i_ooc/i_bound/hwpe_gen/hwpe_wrap_i/i_hwpe_top_wrap/i_traffic_gen_top/i_ctrl/i_slave/i_regfile/regfile_mem_mandatory}
add wave -noupdate -group {HWPE traffic_gen} -group {hwpe_ctrl} -group {regfile} -label {regfile_mem_generic} {/pulp_tb/dut/gen_clusters[0]/gen_cluster_sync/i_cluster/i_ooc/i_bound/hwpe_gen/hwpe_wrap_i/i_hwpe_top_wrap/i_traffic_gen_top/i_ctrl/i_slave/i_regfile/regfile_mem_generic}
add wave -noupdate -group {HWPE traffic_gen} -group {hwpe_ctrl} -group {regfile} -label {regfile_mem_dout} {/pulp_tb/dut/gen_clusters[0]/gen_cluster_sync/i_cluster/i_ooc/i_bound/hwpe_gen/hwpe_wrap_i/i_hwpe_top_wrap/i_traffic_gen_top/i_ctrl/i_slave/i_regfile/regfile_mem_dout}

add wave -noupdate -group {HWPE traffic_gen} -group {hwpe_ctrl} -group {regfile} -label {clear_i} {/pulp_tb/dut/gen_clusters[0]/gen_cluster_sync/i_cluster/i_ooc/i_bound/hwpe_gen/hwpe_wrap_i/i_hwpe_top_wrap/i_traffic_gen_top/i_ctrl/i_slave/i_regfile/regfile_latch_mem}

add wave -noupdate -group {HWPE traffic_gen} -group {hwpe_ctrl} -group {regfile} -group {traffic_gen_static_regs} -label {n_reqs} {/pulp_tb/dut/gen_clusters[0]/gen_cluster_sync/i_cluster/i_ooc/i_bound/hwpe_gen/hwpe_wrap_i/i_hwpe_top_wrap/i_traffic_gen_top/i_ctrl/static_reg_n_reqs}
add wave -noupdate -group {HWPE traffic_gen} -group {hwpe_ctrl} -group {regfile} -group {traffic_gen_static_regs} -label {pwm_period} {/pulp_tb/dut/gen_clusters[0]/gen_cluster_sync/i_cluster/i_ooc/i_bound/hwpe_gen/hwpe_wrap_i/i_hwpe_top_wrap/i_traffic_gen_top/i_ctrl/static_reg_pwm_period}
add wave -noupdate -group {HWPE traffic_gen} -group {hwpe_ctrl} -group {regfile} -group {traffic_gen_static_regs} -label {pwm_duty_cycle} {/pulp_tb/dut/gen_clusters[0]/gen_cluster_sync/i_cluster/i_ooc/i_bound/hwpe_gen/hwpe_wrap_i/i_hwpe_top_wrap/i_traffic_gen_top/i_ctrl/static_reg_pwm_duty_cycle}

add wave -noupdate -group {HWPE traffic_gen} -group {hwpe_ctrl} -group {FSM} -group {global} -label {clk_i} {/pulp_tb/dut/gen_clusters[0]/gen_cluster_sync/i_cluster/i_ooc/i_bound/hwpe_gen/hwpe_wrap_i/i_hwpe_top_wrap/i_traffic_gen_top/i_ctrl/i_fsm/clk_i}
add wave -noupdate -group {HWPE traffic_gen} -group {hwpe_ctrl} -group {FSM} -group {global} -label {rst_ni} {/pulp_tb/dut/gen_clusters[0]/gen_cluster_sync/i_cluster/i_ooc/i_bound/hwpe_gen/hwpe_wrap_i/i_hwpe_top_wrap/i_traffic_gen_top/i_ctrl/i_fsm/rst_ni}
add wave -noupdate -group {HWPE traffic_gen} -group {hwpe_ctrl} -group {FSM} -group {global} -label {test_mode_i} {/pulp_tb/dut/gen_clusters[0]/gen_cluster_sync/i_cluster/i_ooc/i_bound/hwpe_gen/hwpe_wrap_i/i_hwpe_top_wrap/i_traffic_gen_top/i_ctrl/i_fsm/test_mode_i}
add wave -noupdate -group {HWPE traffic_gen} -group {hwpe_ctrl} -group {FSM} -group {global} -label {clear_i} {/pulp_tb/dut/gen_clusters[0]/gen_cluster_sync/i_cluster/i_ooc/i_bound/hwpe_gen/hwpe_wrap_i/i_hwpe_top_wrap/i_traffic_gen_top/i_ctrl/i_fsm/clear_i}

add wave -noupdate -group {HWPE traffic_gen} -group {hwpe_ctrl} -group {FSM} -label {current_state} {/pulp_tb/dut/gen_clusters[0]/gen_cluster_sync/i_cluster/i_ooc/i_bound/hwpe_gen/hwpe_wrap_i/i_hwpe_top_wrap/i_traffic_gen_top/i_ctrl/i_fsm/curr_state}
add wave -noupdate -group {HWPE traffic_gen} -group {hwpe_ctrl} -group {FSM} -label {next_state} {/pulp_tb/dut/gen_clusters[0]/gen_cluster_sync/i_cluster/i_ooc/i_bound/hwpe_gen/hwpe_wrap_i/i_hwpe_top_wrap/i_traffic_gen_top/i_ctrl/i_fsm/next_state}
add wave -noupdate -group {HWPE traffic_gen} -group {hwpe_ctrl} -group {FSM} -label {ctrl_fsm_i} {/pulp_tb/dut/gen_clusters[0]/gen_cluster_sync/i_cluster/i_ooc/i_bound/hwpe_gen/hwpe_wrap_i/i_hwpe_top_wrap/i_traffic_gen_top/i_ctrl/i_fsm/ctrl_i}

add wave -noupdate -group {HWPE traffic_gen} -group {hwpe_ctrl} -group {FSM} -group {in_flags} -label {flags_streamer_i} {/pulp_tb/dut/gen_clusters[0]/gen_cluster_sync/i_cluster/i_ooc/i_bound/hwpe_gen/hwpe_wrap_i/i_hwpe_top_wrap/i_traffic_gen_top/i_ctrl/i_fsm/flags_streamer_i}
add wave -noupdate -group {HWPE traffic_gen} -group {hwpe_ctrl} -group {FSM} -group {in_flags} -label {flags_engine_i} {/pulp_tb/dut/gen_clusters[0]/gen_cluster_sync/i_cluster/i_ooc/i_bound/hwpe_gen/hwpe_wrap_i/i_hwpe_top_wrap/i_traffic_gen_top/i_ctrl/i_fsm/flags_engine_i}
add wave -noupdate -group {HWPE traffic_gen} -group {hwpe_ctrl} -group {FSM} -group {in_flags} -label {flags_ucode_i} {/pulp_tb/dut/gen_clusters[0]/gen_cluster_sync/i_cluster/i_ooc/i_bound/hwpe_gen/hwpe_wrap_i/i_hwpe_top_wrap/i_traffic_gen_top/i_ctrl/i_fsm/flags_ucode_i}
add wave -noupdate -group {HWPE traffic_gen} -group {hwpe_ctrl} -group {FSM} -group {in_flags} -label {flags_slave_i} {/pulp_tb/dut/gen_clusters[0]/gen_cluster_sync/i_cluster/i_ooc/i_bound/hwpe_gen/hwpe_wrap_i/i_hwpe_top_wrap/i_traffic_gen_top/i_ctrl/i_fsm/flags_slave_i}

add wave -noupdate -group {HWPE traffic_gen} -group {hwpe_ctrl} -group {FSM} -group {out_ctrl} -label {ctrl_streamer_o} {/pulp_tb/dut/gen_clusters[0]/gen_cluster_sync/i_cluster/i_ooc/i_bound/hwpe_gen/hwpe_wrap_i/i_hwpe_top_wrap/i_traffic_gen_top/i_ctrl/i_fsm/ctrl_streamer_o}
add wave -noupdate -group {HWPE traffic_gen} -group {hwpe_ctrl} -group {FSM} -group {out_ctrl} -label {ctrl_engine_o} {/pulp_tb/dut/gen_clusters[0]/gen_cluster_sync/i_cluster/i_ooc/i_bound/hwpe_gen/hwpe_wrap_i/i_hwpe_top_wrap/i_traffic_gen_top/i_ctrl/i_fsm/ctrl_engine_o}
add wave -noupdate -group {HWPE traffic_gen} -group {hwpe_ctrl} -group {FSM} -group {out_ctrl} -label {ctrl_ucode_o} {/pulp_tb/dut/gen_clusters[0]/gen_cluster_sync/i_cluster/i_ooc/i_bound/hwpe_gen/hwpe_wrap_i/i_hwpe_top_wrap/i_traffic_gen_top/i_ctrl/i_fsm/ctrl_ucode_o}
add wave -noupdate -group {HWPE traffic_gen} -group {hwpe_ctrl} -group {FSM} -group {out_ctrl} -label {ctrl_slave_o} {/pulp_tb/dut/gen_clusters[0]/gen_cluster_sync/i_cluster/i_ooc/i_bound/hwpe_gen/hwpe_wrap_i/i_hwpe_top_wrap/i_traffic_gen_top/i_ctrl/i_fsm/ctrl_slave_o}

add wave -noupdate -group {HWPE traffic_gen} -group {hwpe_ctrl} -group {uloop} -group {global} -label {clk_i} {/pulp_tb/dut/gen_clusters[0]/gen_cluster_sync/i_cluster/i_ooc/i_bound/hwpe_gen/hwpe_wrap_i/i_hwpe_top_wrap/i_traffic_gen_top/i_ctrl/i_uloop/clk_i}
add wave -noupdate -group {HWPE traffic_gen} -group {hwpe_ctrl} -group {uloop} -group {global} -label {rst_ni} {/pulp_tb/dut/gen_clusters[0]/gen_cluster_sync/i_cluster/i_ooc/i_bound/hwpe_gen/hwpe_wrap_i/i_hwpe_top_wrap/i_traffic_gen_top/i_ctrl/i_uloop/rst_ni}
add wave -noupdate -group {HWPE traffic_gen} -group {hwpe_ctrl} -group {uloop} -group {global} -label {test_mode_i} {/pulp_tb/dut/gen_clusters[0]/gen_cluster_sync/i_cluster/i_ooc/i_bound/hwpe_gen/hwpe_wrap_i/i_hwpe_top_wrap/i_traffic_gen_top/i_ctrl/i_uloop/test_mode_i}
add wave -noupdate -group {HWPE traffic_gen} -group {hwpe_ctrl} -group {uloop} -group {global} -label {clear_i} {/pulp_tb/dut/gen_clusters[0]/gen_cluster_sync/i_cluster/i_ooc/i_bound/hwpe_gen/hwpe_wrap_i/i_hwpe_top_wrap/i_traffic_gen_top/i_ctrl/i_uloop/clear_i}

add wave -noupdate -group {HWPE traffic_gen} -group {hwpe_ctrl} -group {uloop} -group {i/o} -label {ctrl_i} {/pulp_tb/dut/gen_clusters[0]/gen_cluster_sync/i_cluster/i_ooc/i_bound/hwpe_gen/hwpe_wrap_i/i_hwpe_top_wrap/i_traffic_gen_top/i_ctrl/i_uloop/ctrl_i}
add wave -noupdate -group {HWPE traffic_gen} -group {hwpe_ctrl} -group {uloop} -group {i/o} -label {flags_o} {/pulp_tb/dut/gen_clusters[0]/gen_cluster_sync/i_cluster/i_ooc/i_bound/hwpe_gen/hwpe_wrap_i/i_hwpe_top_wrap/i_traffic_gen_top/i_ctrl/i_uloop/flags_o}
add wave -noupdate -group {HWPE traffic_gen} -group {hwpe_ctrl} -group {uloop} -group {i/o} -label {uloop_code_i} {/pulp_tb/dut/gen_clusters[0]/gen_cluster_sync/i_cluster/i_ooc/i_bound/hwpe_gen/hwpe_wrap_i/i_hwpe_top_wrap/i_traffic_gen_top/i_ctrl/i_uloop/uloop_code_i}
add wave -noupdate -group {HWPE traffic_gen} -group {hwpe_ctrl} -group {uloop} -group {i/o} -label {registers_read_i} {/pulp_tb/dut/gen_clusters[0]/gen_cluster_sync/i_cluster/i_ooc/i_bound/hwpe_gen/hwpe_wrap_i/i_hwpe_top_wrap/i_traffic_gen_top/i_ctrl/i_uloop/registers_read_i}

