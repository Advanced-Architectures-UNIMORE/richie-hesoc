# Copyright 2022 University of Modena and Reggio Emilia.
# Licensed under the Apache License, Version 2.0, see LICENSE for details.
# SPDX-License-Identifier: Apache-2.0
#
# Author: Gianluca Bellocchi <gianluca.bellocchi@unimore.it>

FPGA_BUILD_PATH 		:= $(FPGA_PATH)/build
FPGA_BUILD_TARGET_PATH	= $(FPGA_BUILD_PATH)/$(TARGET_PLATFORM)

FPGA_UTILS_HERO 		:= $(FPGA_PATH)/utils/hero
FPGA_UTILS_VIVADO 		:= $(FPGA_PATH)/utils/vivado_ips
FPGA_UTILS_POWER 		:= $(FPGA_PATH)/utils/power
FPGA_UTILS_AREA 		:= $(FPGA_PATH)/utils/area

ifeq ($(VIVADO),)
VIVADO 					:= vitis-2019.2 vivado
endif
VIVADO_OPT 				:=-mode batch

# ============ #
# FPGA outputs #
# ============ #

fpga_report_area:
	@$(VIVADO) $(VIVADO_OPT) \
		-source $(FPGA_UTILS_AREA)/$@.tcl \
		-tclargs $(TARGET_PLATFORM) $(TARGET_BOARD) $(FPGA_BUILD_PATH) $(FPGA_UTILS_AREA)

fpga_report_power: fpga_clean_power
	@$(VIVADO) $(VIVADO_OPT) \
		-source $(FPGA_UTILS_POWER)/$@.tcl \
		-tclargs $(TARGET_PLATFORM) $(TARGET_BOARD) $(FPGA_BUILD_PATH) $(FPGA_UTILS_POWER)

fpga_reports_ls:
	ls $(FPGA_PATH)/build/$(TARGET_PLATFORM)/reports

fpga_export_output:
	@$(VIVADO) $(VIVADO_OPT) \
		-source $(FPGA_UTILS_HERO)/$(TARGET_BOARD)/hero_exil$(TARGET_BOARD)_export_hw.tcl \
		-tclargs $(TARGET_PLATFORM) $(FPGA_BUILD_PATH)

fpga_open_design:
	@$(VIVADO) $(FPGA_BUILD_TARGET_PATH)/vivado_prj/hero_exil$(TARGET_BOARD).xpr

# ========== #
# FPGA build #
# ========== #

fpga_build_empty:
	@$(VIVADO) $(VIVADO_OPT) \
		-source $(FPGA_UTILS_HERO)/$(TARGET_BOARD)/fpga_empty.tcl \
		-tclargs $(FPGA_BUILD_TARGET_PATH)/vivado_prj $(FPGA_BUILD_TARGET_PATH)/vivado_ips

fpga_build_dse_area:
	@$(VIVADO) $(VIVADO_OPT) \
		-stack 2000 \
		-source $(FPGA_UTILS_HERO)/$(TARGET_BOARD)/dse_area_zcu102.tcl \
		-tclargs $(FPGA_BUILD_TARGET_PATH)/vivado_prj $(FPGA_BUILD_TARGET_PATH)/vivado_ips

fpga_build_target:
	@$(VIVADO) $(VIVADO_OPT) \
		-source $(FPGA_UTILS_HERO)/$(TARGET_BOARD)/hero_exil$(TARGET_BOARD).tcl \
		-tclargs $(FPGA_BUILD_TARGET_PATH)/vivado_prj $(FPGA_BUILD_TARGET_PATH)/vivado_ips

fpga_build_pulp:
	@cd $(FPGA_BUILD_TARGET_PATH)/vivado_ips \
		&& $(VIVADO) $(VIVADO_OPT) -source pulp_txil*.tcl

# =========== #
# Environment #
# =========== #

fpga_scripts: $(BENDER_PKG) $(BENDER_LOCK)
	@$(BENDER) script vivado \
		$(common_defs) $(common_targs) $(fpga_defs) $(fpga_targs) \
		--only-defines --only-includes > $(FPGA_BUILD_TARGET_PATH)/vivado_ips/define_defines_includes.tcl
	@$(BENDER) script vivado \
		$(common_defs) $(common_targs) $(fpga_defs) $(fpga_targs) \
		--only-defines --only-includes --no-simset > $(FPGA_BUILD_TARGET_PATH)/vivado_ips/define_defines_includes_no_simset.tcl
	@$(BENDER) script vivado \
		$(common_defs) $(common_targs) $(fpga_defs) $(fpga_targs) \
		--only-sources > $(FPGA_BUILD_TARGET_PATH)/vivado_ips/define_sources.tcl

fpga_env: $(FPGA_BUILD_TARGET_PATH)

$(FPGA_BUILD_TARGET_PATH):
	@echo "FPGA build directory: $@"
	mkdir -p $@/vivado_ips
	@cp $(FPGA_UTILS_VIVADO)/$(TARGET_BOARD)/* $@/vivado_ips
	cp $(SRC_PATH)/$(TARGET_PLATFORM)/ip/* $@/vivado_ips

# ===== #
# Utils #
# ===== #

fpga_clean_power:
	cd $(FPGA_BUILD_TARGET_PATH)/vivado_prj && find . -name "*.saif" -type f -delete

fpga_clean_build:
	rm -rf $(FPGA_BUILD_TARGET_PATH)

fpga_clean_pulp:
	rm -rf $(FPGA_BUILD_TARGET_PATH)/vivado_ips/{component.xml,define_*.tcl}
	rm -rf $(FPGA_BUILD_TARGET_PATH)/vivado_ips/{pulp_txil*,xgui}
	rm -f $(FPGA_BUILD_TARGET_PATH)/{,vivado_ips/}vivado*.{jou,log,str}

fpga_check_exist:
	@if [ -d "$(FPGA_BUILD_TARGET_PATH)" ]; then (echo "A project for target <$(TARGET_PLATFORM)> already exists."; exit 1) ; fi
