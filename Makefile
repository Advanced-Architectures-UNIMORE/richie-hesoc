# Copyright 2021 University of Modena and Reggio Emilia.
# Licensed under the Apache License, Version 2.0, see LICENSE for details.
# SPDX-License-Identifier: Apache-2.0
#
# Author: Gianluca Bellocchi <gianluca.bellocchi@unimore.it>

RICHE_HW_ROOT 			:= $(shell pwd)

DEPS_PATH 				:= $(RICHE_HW_ROOT)/deps
FPGA_PATH 				:= $(RICHE_HW_ROOT)/fpga
SRC_PATH 				:= $(RICHE_HW_ROOT)/ov_cfg
VSIM_PATH 				:= $(RICHE_HW_ROOT)/vsim

BENDER     				?= bender
BENDER_ROOT				?= $(RICHE_HW_ROOT)/.bender
BENDER_PATH				?= $(shell which $(BENDER))
BENDER_PKG				= $(SRC_PATH)/$(TARGET_PLATFORM)/Bender.yml
BENDER_LOCK				= $(SRC_PATH)/$(TARGET_PLATFORM)/Bender.lock
BENDER_COMMON			= $(SRC_PATH)/$(TARGET_PLATFORM)/bender-common.mk
BENDER_FPGA				= $(SRC_PATH)/$(TARGET_PLATFORM)/bender-fpga.mk
BENDER_SIM				= $(SRC_PATH)/$(TARGET_PLATFORM)/bender-sim.mk

TARGET_PLATFORM  		?= floonoc_rt_noc
TARGET_BOARD            ?= zcu102

export TARGET_PLATFORM TARGET_BOARD SRC_PATH

.PHONY: $(BENDER_PKG) $(BENDER_LOCK) vsim fpga

# ================ #
# FPGA design flow #
# ================ #

include $(BENDER_COMMON)
include $(BENDER_FPGA)
include $(FPGA_PATH)/fpga.mk

fpga: fpga_init fpga_build fpga_reports

fpga_dse: fpga_clean fpga_init fpga_build_dse fpga_reports

fpga_reports: fpga_report_area

fpga_build_dse: fpga_check_exist fpga_build_pulp fpga_build_dse_area

fpga_build: fpga_check_exist fpga_build_pulp fpga_build_target

fpga_init: fpga_check_exist fpga_env fpga_scripts

fpga_clean: fpga_clean_build

# =================== #
# RTL simulation flow #
# =================== #

include $(BENDER_SIM)
include $(VSIM_PATH)/vsim.mk

vsim: vsim_init vsim_build vsim_run

vsim_run: vsim_start_sim vsim_save_results

vsim_build: vsim_build_hw.tcl vsim_build_hw vsim_build_sw

vsim_init: vsim_check_exist vsim_env

vsim_clean:
	rm -rf $(VSIM_PRJ_PATH)
	rm -f vsim_build_hw.tcl

vsim_test:
	ls $(PWD)

# ===== #
# Utils #
# ===== #

$(BENDER_PKG):
	cp $@ $(RICHE_HW_ROOT)

$(BENDER_LOCK):
	cp $@ $(RICHE_HW_ROOT)

clean:
	@rm -rf .bender
	@rm -rf Bender.yml
	@rm -rf Bender.lock
