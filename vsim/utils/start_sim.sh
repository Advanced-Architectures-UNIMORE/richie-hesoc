# =====================================================================
# Title:        start_sim.sh
# Description:  Run simulation.
#
# $Date:        18.1.2022
# =====================================================================
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

# UNIMORE setup
if [ $UNIMORE -eq 1 ]; then
    if [ $VSIM_GUI -eq 1 ]; then
        # Run in GUI mode and silence console output.
        echo -e "[sh] UNIMORE setup - GUI mode"
        sleep 1s
        vsim -do "source $VSIM_UTILS/run.tcl" &>/dev/null
    else
        # Run in console-only mode.
        echo -e "[sh] UNIMORE setup - Console-only mode"
        sleep 1s
        vsim -c -do "source $VSIM_UTILS/run.tcl; quit -code $quitCode"
    fi
elif [ $IIS -eq 1 ]; then
    if [ $VSIM_GUI -eq 1 ]; then
        # Run in GUI mode and silence console output.
        echo -e "[sh] IIS setup - GUI mode"
        sleep 1s
        vsim-10.7b -do "source $VSIM_UTILS/run.tcl" &>/dev/null
    else
        # Run in console-only mode.
        echo -e "[sh] IIS setup - Console-only mode"
        sleep 1s
        vsim-10.7b -c -do "source $VSIM_UTILS/run.tcl; quit -code $quitCode"
    fi
else
    # Run in GUI mode and silence console output.
    echo -e "[sh] Standard setup - GUI mode"
    vsim -do "source $VSIM_UTILS/run.tcl" &>/dev/null
fi