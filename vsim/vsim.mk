# Copyright 2022 University of Modena and Reggio Emilia.
# Licensed under the Apache License, Version 2.0, see LICENSE for details.
# SPDX-License-Identifier: Apache-2.0
#
# Author: Gianluca Bellocchi <gianluca.bellocchi@unimore.it>

VSIM_BUILD_PATH 		:= $(VSIM_PATH)/runs
VSIM_UTILS_PATH			:= $(VSIM_PATH)/utils

VSIM_SW_PATH			?= $(HERO_OV_OPENMP_TESTS)/floonoc_rt_test/src/2cl-xbar
VSIM_SW_NAME 			= $(shell basename $(VSIM_SW_PATH))

VSIM_PRJ_NAME			?= $(TARGET_PLATFORM)_$(VSIM_SW_NAME)
VSIM_PRJ_PATH			= $(VSIM_BUILD_PATH)/$(VSIM_PRJ_NAME)
VSIM_SLM_FILES			= $(VSIM_PRJ_PATH)/slm_files

VSIM					?= vsim
VSIM_GUI 				?= 0

VLOG_ARGS += -suppress vlog-2583 -suppress vlog-13314 -suppress vlog-13233

export

# ========== #
# Simulation #
# ========== #

vsim_save_results:
	mkdir -p $(VSIM_PRJ_PATH)/results
	mv $(VSIM_PRJ_PATH)/transcript $(VSIM_PRJ_PATH)/results/$(VSIM_SW_NAME).txt

vsim_start_sim:
	@echo "Start simulation"
	cd $(VSIM_PRJ_PATH) && $(VSIM_UTILS_PATH)/$@.sh $(VSIM_PRJ_PATH) $(VSIM_GUI)

# =========== #
# HW-SW build #
# =========== #

vsim_build_sw:
	@echo -e "Partition of SW binaries and generation of SLM files"
	mkdir -p $(VSIM_SLM_FILES)
	@echo -e "Searching for <$(VSIM_SW_NAME)> binaries under $(VSIM_SW_PATH)"
	$(VSIM_UTILS_PATH)/$@.sh

vsim_build_hw:
	@echo "Building HW..."
	mv ${VSIM_PATH}/$@.tcl $(VSIM_PRJ_PATH)
	cd $(VSIM_PRJ_PATH) && $(VSIM_UTILS_PATH)/$@.sh

vsim_build_hw.tcl: $(BENDER_PKG) $(BENDER_LOCK)
	echo 'set ROOT $(RICHE_HW_ROOT)' > $(VSIM_PATH)/$@
	$(BENDER) script vsim \
		--vlog-arg="$(VLOG_ARGS)" \
		$(common_defs) $(common_targs) \
		$(sim_defs) $(sim_targs) \
		| grep -v "set ROOT" >> $(VSIM_PATH)/$@

# =========== #
# Environment #
# =========== #

vsim_env:
	@echo "Create simulation environment for project: $(VSIM_PRJ_NAME)"
	mkdir -p $(VSIM_PRJ_PATH)

# ===== #
# Utils #
# ===== #

vsim_check_exist:
	@if [ -d "$(VSIM_PRJ_PATH)" ]; then (echo "A project for target <$(VSIM_PRJ_NAME)> already exists."; exit 1) ; fi
