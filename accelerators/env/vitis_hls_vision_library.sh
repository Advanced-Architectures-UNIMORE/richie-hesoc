# Copyright (C) 2023 University of Modena and Reggio Emilia.
# Author: Gianluca Bellocchi, University of Modena and Reggio Emilia.

# Paths
workspace_vitis_vision=$(realpath $(dirname "$(realpath ${BASH_SOURCE:-$0})")/..)
deps_path=$workspace_vitis_vision/deps
tools_dir=$workspace_vitis_vision/tools
vitis_path=$workspace_vitis_vision/deps/Vitis_Libraries

# Install paths
vitis_install_path= # insert the path to your Vitis build directory, e.g., `some/path/Vitis/2022.2`.
opencv_install_path= # insert the path to your OpenCV directory, e.g., `some/path/opencv`.

# AMD-Xilinx tools
export TOOL_VERSION=2022.2 # Important for Vitis HLS in this case
export VIVADO="vivado"
export VIVADO_HLS="vivado_hls"
export VITIS_HLS="vitis_hls"
export PETALINUX_VER="" 

# AMD-Xilinx setup
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