#!/bin/bash
# Copyright (C) 2024 University of Modena and Reggio Emilia.
# Author: Gianluca Bellocchi, University of Modena and Reggio Emilia.

# Paths
workspace_vitis_vision=$(realpath $(dirname "$(realpath ${BASH_SOURCE:-$0})")/..)
env_path=$workspace_vitis_vision/env
deps_path=$workspace_vitis_vision/deps
tools_dir=$workspace_vitis_vision/tools
vitis_path=$workspace_vitis_vision/deps/Vitis_Libraries

# Environment check
source $env_path/check_environment.sh
if is_empty_or_undefined $vitis_install_path; then
    echo "Define <vitis_install_path>."
    echo "Check the Richie documentation for more information: https://richie-docs.readthedocs.io/en/latest/."
    must_be_nonempty vitis_install_path ""
fi
if is_empty_or_undefined $opencv_install_path; then
    echo "Define <opencv_install_path>."
    echo "Check the Richie documentation for more information: https://richie-docs.readthedocs.io/en/latest/."
    must_be_nonempty opencv_install_path ""
fi

# Install setup
if [ $UNIMORE -eq 1 ]; then

    export VITIS_HLS="vitis_hls"

elif [ $IIS -eq 1 ]; then

  export VITIS_HLS="vitis-2022.1 vivado_hls"

fi

# AMD-Xilinx setup
export TOOL_VERSION=2022.2
source $vitis_install_path/settings64.sh
export DEVICE=$vitis_install_path/base_platforms/xilinx_zcu102_base_202220_1/xilinx_zcu102_base_202220_1.xpfm
export PLATFORM_REPO_PATHS=$vitis_install_path/base_platforms/xilinx_zcu102_base_202220_1
export XPART=xczu9eg-ffvb1156-2-e

# OpenCV
export OPENCV_INCLUDE=$opencv_install_path/opencv/build/include
export OPENCV_LIB=$opencv_install_path/opencv/build/lib
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$OPENCV_LIB

# Vitis Libraries
export XF_PROJ_ROOT=$vitis_path/vision
export VITIS_LIB_INCLUDE=$vitis_path/vision/L1/include