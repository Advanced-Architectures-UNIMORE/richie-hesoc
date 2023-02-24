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

VSIM_SW_NAME 		= $(shell basename $(VSIM_SW_PATH))
VSIM_PRJ_NAME		?= $(TARGET_OV)_$(VSIM_SW_NAME)
VSIM_PRJ_PATH		= $(VSIM_BUILD_DIR)/$(VSIM_PRJ_NAME)
VSIM_SLM_FILES		= $(VSIM_PRJ_PATH)/slm_files

VSIM_GUI 			?= 0

export

all: check_exist create_env build_hw build_sw start_sim save_results

# =====================================================================
# Recipes:		Start simulation
# =====================================================================

save_results:
	@mkdir -p $(VSIM_PRJ_PATH)/results
	@mv $(VSIM_PRJ_PATH)/transcript $(VSIM_PRJ_PATH)/results/$(VSIM_SW_NAME).txt

start_sim: 
	@echo "[sh] >> Start simulation"
	@export VSIM_PRJ_PATH="$(VSIM_PRJ_PATH)"
	@cd $(VSIM_PRJ_PATH) && $(VSIM_UTILS)/$@.sh $(VSIM_PRJ_PATH) $(VSIM_GUI)

# =====================================================================
# Recipes:		Retrieve software binaries
# =====================================================================

build_sw:
	@echo -e "[sh] >> Partition of SW binaries and generation of SLM files"
	@mkdir -p $(VSIM_SLM_FILES)
	@echo -e "[sh] >> Searching for <$(VSIM_SW_NAME)> binaries under $(VSIM_SW_PATH)"
	@$(VSIM_UTILS)/$@.sh

# =====================================================================
# Recipes:		Build hardware
# =====================================================================

build_hw:
	@echo "[sh] >> Compiling RTL"
	@mv ${ROOT}/$@.tcl $(VSIM_PRJ_PATH)
	@cd $(VSIM_PRJ_PATH) && $(VSIM_UTILS)/$@.sh

# =====================================================================
# Recipes:		Create simulation environment
# =====================================================================

create_env:
	@echo "[sh] >> Create simulation environment for project -> $(VSIM_PRJ_NAME)"
	@mkdir -p $(VSIM_PRJ_PATH)

# =====================================================================
# Recipes:		Utils for simulation environment
# ===================================================================== 

check_exist:
	@if [ -d "$(VSIM_PRJ_PATH)" ]; then (echo "A project for target <$(VSIM_PRJ_NAME)> already exists."; exit 1) ; fi

clean:
	@rm -rf $(VSIM_PRJ_PATH)
	@rm -f build_hw.tcl