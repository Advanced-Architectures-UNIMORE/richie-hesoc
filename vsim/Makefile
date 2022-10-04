# =====================================================================
# Title:        RTL simulation environment
#
# $Date:        18.1.2022
# =====================================================================
#
# Copyright (C) 2021 University of Modena and Reggio Emilia.
#
# Author: Gianluca Bellocchi, University of Modena and Reggio Emilia.
#
# =====================================================================

ROOT 				= $(patsubst %/,%, $(dir $(abspath $(lastword $(MAKEFILE_LIST)))))

VSIM_BUILD_DIR 		= $(ROOT)/runs
VSIM_UTILS			= $(ROOT)/utils

VSIM_SW_TARGET 		:= $(shell basename $(VSIM_SW_PATH))
VSIM_PRJ_TARGET		:= $(VSIM_BUILD_DIR)/$(TARGET_OV)_$(VSIM_SW_TARGET)
VSIM_SLM_FILES		:= $(VSIM_PRJ_TARGET)/slm_files

VSIM_GUI 			?= 0

export

all: check_exist clean create_env build_hw build_sw start_sim save_results

# =====================================================================
# Recipes:		Start simulation
# =====================================================================

save_results:
	@mkdir -p $(VSIM_PRJ_TARGET)/results
	@mv $(VSIM_PRJ_TARGET)/transcript $(VSIM_PRJ_TARGET)/results/$(TARGET_OV)_$(VSIM_SW_TARGET).txt

start_sim: 
	@echo "[sh] >> Start simulation"
	@export VSIM_PRJ_TARGET="$(VSIM_PRJ_TARGET)"
	@cd $(VSIM_PRJ_TARGET) && $(VSIM_UTILS)/$@.sh $(VSIM_PRJ_TARGET) $(VSIM_GUI)

# =====================================================================
# Recipes:		Retrieve software binaries
# =====================================================================

build_sw:
	@echo -e "[sh] >> Partition of SW binaries and generation of SLM files"
	@mkdir -p $(VSIM_SLM_FILES)
	@echo -e "[sh] >> Searching for <$(VSIM_SW_TARGET)> binaries under $(VSIM_SW_PATH)"
	@$(VSIM_UTILS)/$@.sh

# =====================================================================
# Recipes:		Build hardware
# =====================================================================

build_hw:
	@echo "[sh] >> Compiling RTL"
	@mv ${ROOT}/$@.tcl $(VSIM_PRJ_TARGET)
	@cd $(VSIM_PRJ_TARGET) && $(VSIM_UTILS)/$@.sh

# =====================================================================
# Recipes:		Create simulation environment
# =====================================================================

create_env:
	@echo "[sh] >> Create simulation environment for project -> $(TARGET_OV)_$(VSIM_SW_TARGET)"
	@mkdir -p $(VSIM_PRJ_TARGET)

# =====================================================================
# Recipes:		Utils for simulation environment
# ===================================================================== 

check_exist:
	@if [ -d "$(VSIM_PRJ_TARGET)" ]; then (echo "A project for target <$(TARGET_OV)_$(VSIM_SW_TARGET)> already exists."; exit 1) ; fi

clean:
	@rm -rf $(VSIM_PRJ_TARGET)
	@rm -f build_hw.tcl