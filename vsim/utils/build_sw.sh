# =====================================================================
# Title:        build_sw.sh
# Description:  Retrieve pre-compiled SW binaries and partition them
#               according to the design of the PULP memory sub-system (L1/L2).
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

error_exit()
{
  echo -e "\n$1\n" 1>&2
  exit 1
}

# get slm_conv binary
if [ -f "$VSIM_UTILS/slm_conv" ]; then
    slm_conv="$VSIM_UTILS/slm_conv"
elif [ -f "$VSIM_UTILS/slm_conv-0.3" ]; then
    slm_conv='slm_conv-0.3'
elif ! which $slm_conv &>/dev/null; then
    slm_conv=~/bin/slm_conv-0.3
else
    error_exit "No SLM file converter has been found in the test directory. Aborting."
fi

# clear slm-files of previous simulations
if [ -d "$VSIM_SLM_FILES" ]; then
    rm -f $VSIM_SLM_FILES/*
else
    error_exit "No SLM file directory has been found. Aborting."
fi

# access directory containing slm-files
cd $VSIM_SLM_FILES

# partition L1 binaries for RTL simulation
echo -e "[sh] >> Partitioning L1 binaries"
if [ -f "$VSIM_SW_PATH/${VSIM_SW_TARGET}_l1.slm" ]; then
    $slm_conv --swap-endianness -f "$VSIM_SW_PATH/${VSIM_SW_TARGET}_l1.slm" \
    -w 32 -P 32 -S 1 -n 2048 -s 0x10000000 -F l1_%01S_%01P.slm
else
    error_exit "Missing L1 binaries at $VSIM_SW_PATH/. Aborting."
fi

# partition L2 binaries for RTL simulation
echo -e "[sh] >> Partitioning L2 binaries"
if [ -f "$VSIM_SW_PATH/${VSIM_SW_TARGET}_l2.slm" ]; then
    $slm_conv --swap-endianness -f "$VSIM_SW_PATH/${VSIM_SW_TARGET}_l2.slm" \
    -w 32 -P 4 -S 8 -n 1024 -s 0x1c000000 -F l2_%01S_%01P.slm
else
    error_exit "Missing L2 binaries at $VSIM_SW_PATH/. Aborting."
fi

# local copy of disassembly file
cp "$VSIM_SW_PATH/$VSIM_SW_TARGET.dis" "${VSIM_SW_TARGET}.dis"