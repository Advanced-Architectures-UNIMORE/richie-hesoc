# =====================================================================
# Project:      FPGA design build
# Title:        Makefile
# Description:  List of recipes to build and get resource/timing
#				characterization of the design.
#
# $Date:        22.09.2021
#
# =====================================================================
#
# Copyright (C) 2021 University of Modena and Reggio Emilia..
#
# Author: Gianluca Bellocchi, University of Modena and Reggio Emilia.
#
# =====================================================================

# =====================================================================
# Variables
# =====================================================================

ROOT 					= $(patsubst %/,%, $(dir $(abspath $(lastword $(MAKEFILE_LIST)))))

FPGA_BUILD_DIR 			:= $(ROOT)/build

FPGA_UTILS_HERO 		:= $(ROOT)/utils/hero
FPGA_UTILS_VIVADO 		:= $(ROOT)/utils/vivado_ips
FPGA_UTILS_POWER 		:= $(ROOT)/utils/power
FPGA_UTILS_AREA 		:= $(ROOT)/utils/area

BENDER 					= $(ROOT)/../bender script vivado
BENDER_FILES 			= $(ROOT)/../bender $(ROOT)/../Bender.yml $(ROOT)/../Bender.lock

ifeq ($(VIVADO),)
VIVADO 			:= vitis-2019.2 vivado
endif
VIVADO_OPT 		:=-mode batch

# =====================================================================

.PHONY: all
all: build_target fpga_output reports

# =====================================================================
# Recipes:		Design reports
# =====================================================================

reports_fpga: report_area

report_area:
	@$(VIVADO) $(VIVADO_OPT) \
		-source $(FPGA_UTILS_AREA)/$@.tcl \
		-tclargs $(TARGET_OV) $(TARGET_BOARD) $(FPGA_BUILD_DIR) $(FPGA_UTILS_AREA)

report_power: clean_power
	@$(VIVADO) $(VIVADO_OPT) \
		-source $(FPGA_UTILS_POWER)/$@.tcl \
		-tclargs $(TARGET_OV) $(TARGET_BOARD) $(FPGA_BUILD_DIR) $(FPGA_UTILS_POWER)

# =====================================================================
# Recipes:		FPGA project
# =====================================================================

open_design:
	@$(VIVADO) $(FPGA_BUILD_DIR)/$(TARGET_OV)/vivado_prj/hero_exil$(TARGET_BOARD).xpr

build_fpga: build_target

build_fpga_date_22: check_exist clean_fpga build_pulp
	@$(VIVADO) $(VIVADO_OPT) \
		-source $(FPGA_UTILS_HERO)/$(TARGET_BOARD)/date_22_zcu102.tcl \
		-tclargs $(FPGA_BUILD_DIR)/$(TARGET_OV)/vivado_prj $(FPGA_BUILD_DIR)/$(TARGET_OV)/vivado_ips

fpga_output:
	@$(VIVADO) $(VIVADO_OPT) \
		-source $(FPGA_UTILS_HERO)/$(TARGET_BOARD)/hero_exil$(TARGET_BOARD)_export_hw.tcl \
		-tclargs $(TARGET_OV) $(FPGA_BUILD_DIR)

build_target: check_exist clean_fpga build_pulp
	@$(VIVADO) $(VIVADO_OPT) \
		-source $(FPGA_UTILS_HERO)/$(TARGET_BOARD)/hero_exil$(TARGET_BOARD).tcl \
		-tclargs $(FPGA_BUILD_DIR)/$(TARGET_OV)/vivado_prj $(FPGA_BUILD_DIR)/$(TARGET_OV)/vivado_ips

build_pulp: clean_pulp_fpga build_env
	@cd $(FPGA_BUILD_DIR)/$(TARGET_OV)/vivado_ips \
		&& $(VIVADO) $(VIVADO_OPT) -source pulp_txil*.tcl

# =====================================================================
# Recipes:		Build environment
# =====================================================================

build_env: $(FPGA_BUILD_DIR)/$(TARGET_OV) fpga_scripts

fpga_scripts: $(BENDER_FILES) $(BUILD_ENV)
	@$(BENDER) --only-defines --only-includes > $(FPGA_BUILD_DIR)/$(TARGET_OV)/vivado_ips/define_defines_includes.tcl
	@$(BENDER) --only-defines --only-includes --no-simset > $(FPGA_BUILD_DIR)/$(TARGET_OV)/vivado_ips/define_defines_includes_no_simset.tcl
	@$(BENDER) --only-sources > $(FPGA_BUILD_DIR)/$(TARGET_OV)/vivado_ips/define_sources.tcl

$(FPGA_BUILD_DIR)/$(TARGET_OV):
	@echo "FPGA build directory -> $@"
	@mkdir -p $@/vivado_ips
	@cp $(FPGA_UTILS_VIVADO)/$(TARGET_BOARD)/* $@/vivado_ips
	@cp ../ov_cfg/$(TARGET_OV)/ip/* $@/vivado_ips

../bender: ../Makefile
	@$(MAKE) -C .. bender

# =====================================================================
# Recipes:		Utils
# ===================================================================== 

check_exist:
	@if [ -d "$(FPGA_BUILD_DIR)/$(TARGET_OV)" ]; then (echo "A project for target <$(TARGET_OV)> already exists."; exit 1) ; fi

clean_power:
	@cd $(FPGA_BUILD_DIR)/$(TARGET_OV)/vivado_prj && find . -name "*.saif" -type f -delete

clean_fpga:
	@rm -rf $(FPGA_BUILD_DIR)/$(TARGET_OV)

clean_pulp_fpga: check_exist
	@rm -rf $(FPGA_BUILD_DIR)/$(TARGET_OV)/vivado_ips/{component.xml,define_*.tcl}
	@rm -rf $(FPGA_BUILD_DIR)/$(TARGET_OV)/vivado_ips/{pulp_txil*,xgui}
	@rm -f $(FPGA_BUILD_DIR)/$(TARGET_OV)/{,vivado_ips/}vivado*.{jou,log,str}
