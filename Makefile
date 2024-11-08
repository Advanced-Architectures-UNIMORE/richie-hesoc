# Copyright 2022 University of Modena and Reggio Emilia
# Author: Gianluca Bellocchi <gianluca.bellocchi@unimore.it>

ROOT 							= $(patsubst %/,%, $(dir $(abspath $(lastword $(MAKEFILE_LIST)))))

DEPS_PATH 				= $(realpath $(ROOT)/deps )
FPGA_PATH 				= $(realpath $(ROOT)/fpga )
SRC_PATH 					= $(realpath $(ROOT)/src )
VSIM_PATH 				= $(realpath $(ROOT)/vsim )

BENDER 						= $(ROOT)/bender
BENDER_PKG				= $(SRC_PATH)/$(TARGET_PLATFORM)/Bender.yml
BENDER_LOCK				= $(SRC_PATH)/$(TARGET_PLATFORM)/Bender.lock

VSIM_SW_PATH			:= $(realpath $(HERO_OV_OPENMP_TESTS)/helloworld)

TARGET_PLATFORM       	:= richie_example
TARGET_BOARD    	:= zcu102

export TARGET_PLATFORM TARGET_BOARD VSIM_SW_PATH SRC_PATH

.PHONY: $(BENDER_PKG) $(BENDER_LOCK) vsim fpga genov

# =====================================================================
# Description:  FPGA build flow
# =====================================================================

fpga: build_fpga reports_fpga

fpga-dse-area: build_fpga_dse_area reports_fpga

reports_fpga:
	cd $(FPGA_PATH) && $(MAKE) -s $@

reports_ls:
	ls $(FPGA_PATH)/build/$(TARGET_PLATFORM)/reports

build_fpga_empty: bender $(BENDER_PKG) $(BENDER_LOCK)
	cd $(FPGA_PATH) && $(MAKE) -s $@

build_fpga_dse_area: bender $(BENDER_PKG) $(BENDER_LOCK)
	cd $(FPGA_PATH) && $(MAKE) -s $@

build_fpga: bender $(BENDER_PKG) $(BENDER_LOCK)
	cd $(FPGA_PATH) && $(MAKE) -s $@

test: bender $(BENDER_PKG) $(BENDER_LOCK)

# =====================================================================
# Description:  RTL simulation flow
# =====================================================================

VLOG_ARGS += -suppress vlog-2583 -suppress vlog-13314 -suppress vlog-13233

vsim: build_hw.tcl
	cd $(VSIM_PATH) && $(MAKE) -s all

vsim_sim: build_hw.tcl
	cd $(VSIM_PATH) && $(MAKE) -s build_sw start_sim save_results

vsim_hw: build_hw.tcl
	cd $(VSIM_PATH) && $(MAKE) -s check_exist create_env build_hw

build_hw.tcl: bender $(BENDER_PKG) $(BENDER_LOCK)
	echo 'set ROOT $(ROOT)' > $(VSIM_PATH)/$@
	$(BENDER) script vsim \
		--vlog-arg="$(VLOG_ARGS)" \
		-t rtl -t test \
		| grep -v "set ROOT" >> $(VSIM_PATH)/$@

vsim_clean:
	cd $(VSIM_PATH) && $(MAKE) -s clean

# =====================================================================
# Description:  Setup source management tool
# =====================================================================

$(BENDER_PKG):
	cp $@ $(ROOT)

$(BENDER_LOCK):
	cp $@ $(ROOT)

bender: Makefile
	curl --proto '=https' --tlsv1.2 -sSf https://fabianschuiki.github.io/bender/init | sh -s 0.21.0
	touch $@

# =====================================================================
# Recipes:		Utils
# =====================================================================

clean:
	@rm -rf .bender
	@rm -rf Bender.yml
	@rm -rf Bender.lock
