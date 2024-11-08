# Color detect (monolithic)

## About this accelerator
Monolithic color detection accelerator, from the Vitis HLS Vision Library. 

## About this repository
The structure of the repository is as follows:

- `src`: *Accelerator sources*;
- `build`: *Configuration parameters*;
- <span style="font-variant:small-caps;">[build]</span> `rtl`: *Output RTL directory*, where the <span style="font-variant:small-caps;">Richie SLD toolchain</span> expects to retrieve the hardware accelerator components.

## How to build
Source the required environment (under `env/vitis_hls_vision_library.sh`) and execute the command `make runhls`.

## How to retrieve RTL
After a succesfull HLS synthesis, execute `make get_rtl`.
This command places generated RTL components into a top `rtl` location.