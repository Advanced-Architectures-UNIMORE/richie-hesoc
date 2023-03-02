# =====================================================================
# Title:        build_hw.sh
# Description:  Compile automatically generated TCL list of RTL designs.
#
# $Date:        18.1.2022
# =====================================================================
#
# Copyright (C) 2021 University of Modena and Reggio Emilia.
#
# Authors: 
#   - Andreas Kurth, ETH Zurich
#   - Gianluca Bellocchi, University of Modena and Reggio Emilia.
#
# =====================================================================

#!/usr/bin/env bash

set -e

if [ -z "$VSIM" ]; then
    VSIM="vsim-10.7b"
fi
readonly VSIM

${VSIM} -c -do 'source build_hw.tcl; quit'

# Copy .dat files locally to project
find "$SRC_PATH/$TARGET_OV/wrappers/" -type f -name "*.dat" -exec cp "{}" $VSIM_PRJ_PATH \;
