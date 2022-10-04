# =====================================================================
# Title:        Makefile
#
# $Date:        28.12.2021
# =====================================================================
#
# Copyright (C) 2021 University of Modena and Reggio Emilia.
#
# Author: Gianluca Bellocchi, University of Modena and Reggio Emilia.
#
# =====================================================================

ROOT 					:= $(patsubst %/,%, $(dir $(abspath $(lastword $(MAKEFILE_LIST)))))

ARCHEX_PATH 			:= $(realpath $(ROOT)/archex )
DEPS_PATH 				:= $(realpath $(ROOT)/deps )
FPGA_PATH 				:= $(realpath $(ROOT)/fpga )
GENOV_PATH 				:= $(realpath $(ROOT)/genov )
SRC_PATH 				:= $(realpath $(ROOT)/ov_cfg )
VSIM_PATH 				:= $(realpath $(ROOT)/vsim )

BENDER 					= $(ROOT)/bender
BENDER_PKG				= $(SRC_PATH)/$(TARGET_OV)/Bender.yml
BENDER_LOCK				= $(SRC_PATH)/$(TARGET_OV)/Bender.lock

TARGET_OV               := agile_1cl_16tg
TARGET_BOARD            := zcu102

VSIM_SW_PATH			:= $(realpath $(HERO_OV_OPENMP_TESTS)/helloworld)

# Export variables to the environment. This is enables access by different 
# components (other Mk, scripts, TBs, etc.) that are invoked by this flow.
export TARGET_OV TARGET_BOARD VSIM_SW_PATH SRC_PATH

.PHONY: $(BENDER_PKG) $(BENDER_LOCK) vsim fpga

# =====================================================================
# Description:  Export reports for DSE
# =====================================================================

reports_export:
	cd $(ARCHEX_PATH) && $(MAKE) -s get_reports REPORT_PATH=$(FPGA_PATH)/build/$(TARGET_OV)/reports REPORT_TARGET=$(TARGET_OV)

# =====================================================================
# Description:  FPGA build flow.
# =====================================================================
fpga: build_fpga reports_fpga

fpga-date-22: build_fpga_date_22 reports_fpga

reports_fpga:
	cd $(FPGA_PATH) && $(MAKE) -s $@ BUILD_TARGET=$(TARGET_OV) BOARD_TARGET=$(TARGET_BOARD)

reports_ls:
	ls $(FPGA_PATH)/build/$(TARGET_OV)/reports

build_fpga_date_22: bender $(BENDER_PKG) $(BENDER_LOCK)
	cd $(FPGA_PATH) && $(MAKE) -s $@ BUILD_TARGET=$(TARGET_OV) BOARD_TARGET=$(TARGET_BOARD)

build_fpga: bender $(BENDER_PKG) $(BENDER_LOCK)
	cd $(FPGA_PATH) && $(MAKE) -s $@ BUILD_TARGET=$(TARGET_OV) BOARD_TARGET=$(TARGET_BOARD)

test: bender $(BENDER_PKG) $(BENDER_LOCK)
# =====================================================================
# Description:  RTL simulation flow
# =====================================================================

VLOG_ARGS += -suppress vlog-2583 -suppress vlog-13314 -suppress vlog-13233

vsim: build_hw.tcl
	cd $(VSIM_PATH) && $(MAKE) -s all

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

# morty: Makefile
# 	wget https://github.com/zarubaf/morty/releases/download/v0.6.0/morty-centos.7-x86_64.tar.gz
# 	tar -xf morty-centos.7-x86_64.tar.gz $@
# 	rm -rf morty-centos.7-x86_64.tar.gz

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