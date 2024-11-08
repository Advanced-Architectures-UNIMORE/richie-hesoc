# Accelerators
This directory comprises the source files, dependencies and EDA scripts to design application-specific accelerators.

## Structure
- `src`: *Accelerator design sources* for the following integration flows, divided by accelerated functionality, optimization and EDA flow;
- `deps`: *Dependencies*, including various design libraries, e.g., Vitis accelerated libraries;
- `env`: *Environment scripts* to set up the development and build environments of various EDA flows;
- `common`: *Common* scripts and components.
    
## Environments

### Vitis HLS
Install the following prerequisites:

1) Install **AMD Vitis 2022.2** on your machine;
2) <span style="font-variant:small-caps;">[optional]</span> If you are design accelerators based on the **Vitis Vision Library**, then It is recommended to do a fresh installation of OpenCV 4.4.0. In this case, please refer to the [repository guidelines](https://github.com/Xilinx/Vitis_Libraries/blob/2022.2/vision/README.md).

Then to prepare your environment for using **AMD Vitis 2022.2** and develop accelerators based on the **Vitis Accelerated Libraries**:

1) Open the environment script `env/vitis_hls.sh`;
2) Fill the information concerning the `vitis_install_path`, which consists of the path to your Vitis build directory, e.g., *some/path/Vitis/2022.2*. This is the same path to the the *settings64.sh* file;
3) <span style="font-variant:small-caps;">[optional]</span> Fill the information concerning the `opencv_install_path`, which consists of the path to your OpenCV directory, e.g., *some/path/opencv*. This is the same path to the the OpenCV sources, libraries and build;
4) Execute the script `env/vitis_hls.sh`.