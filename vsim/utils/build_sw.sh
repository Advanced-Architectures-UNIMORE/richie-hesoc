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
l1_slm_path=$(ls $VSIM_SW_PATH/*l1.slm)
l1_slm_name=$(basename ${l1_slm_path})

if [ -f $l1_slm_path ]; then
    echo -e "[sh] >> Partitioning L1 binaries at <$l1_slm_name>"
    $slm_conv --swap-endianness -f $l1_slm_path \
    -w 32 -P 16 -S 1 -n 2048 -s 0x10000000 -F l1_%01S_%01P.slm
    # -w 32 -P 16 -S 1 -n 2048 -s 0x10000000 -F l1_%01S_%01P.slm
        # NB:
        # -P --> Equal to n_l1_banks
        # -S --> Kept at 1
        # -n --> Number of rows in each bank (as S is typically constant, then varies with P)
else
    error_exit "Missing L1 binaries at $VSIM_SW_PATH/. Aborting."
fi

# partition L2 binaries for RTL simulation
l2_slm_path=$(ls $VSIM_SW_PATH/*l2.slm)
l2_slm_name=$(basename ${l2_slm_path})

if [ -f $l2_slm_path ]; then
    echo -e "[sh] >> Partitioning L2 binaries at <$l2_slm_name>"
    $slm_conv --swap-endianness -f $l2_slm_path \
    -w 32 -P 4 -S 72 -n 1024 -s 0x1c000000 -F l2_%01S_%01P.slm # 1 cluster bank (S0-7:P0-3) + 4 NoC banks (S0-31:P0-3)
    # -w 32 -P 4 -S 8 -n 1024 -s 0x1c000000 -F l2_%01S_%01P.slm
    # -w 32 -P 4 -S 512 -n 1024 -s 0x1c000000 -F l2_%01S_%01P.slm
        # NB:
        # -S --> Equal to N_SER_CUTS (see l2_mem.sv)
        # -P --> Equal to N_PAR_CUTS (see l2_mem.sv)
        # -n --> Number of rows in each bank (increased when allocating multi-port design, given const PxS for each l2_mem instance)
else
    error_exit "Missing L2 binaries at $VSIM_SW_PATH/. Aborting."
fi

# local copy of disassembly file
exp_dis_path=$(ls $VSIM_SW_PATH/*.dis)
cp "$exp_dis_path" "../experiment.dis"
