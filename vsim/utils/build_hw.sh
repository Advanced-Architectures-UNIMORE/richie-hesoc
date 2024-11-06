#!/usr/bin/env bash

# Copyright 2021 ETH Zurich and University of Bologna.
# Author: Andreas Kurth, ETH Zurich
# Author: Gianluca Bellocchi <gianluca.bellocchi@unimore.it>

set -e

if [ -z "$VSIM" ]; then
    VSIM="vsim-10.7b"
fi
readonly VSIM

${VSIM} -c -do 'source build_hw.tcl; quit'

# Copy .dat files locally to project
find "$SRC_PATH/$TARGET_PLATFORM/accelerators/" -type f -name "*.dat" -exec cp "{}" $VSIM_PRJ_PATH \;
