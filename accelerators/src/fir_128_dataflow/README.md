# FIR filter (128 taps)

## About this accelerator
FIR filter with 128 taps, designed in HLS. 

## About this repository
The structure of the repository is as follows:

- `src`: *Accelerator sources*, including three different versions (`v1_constK`, `v2_constK_loopIO` and `v3_stream_coeffs`);
- `tcl`: *TCL scripts* automating the HLS build process;
- `sw`: *Software golden model* to generate golden stimuli and components for C simulation and RTL verification;
- <span style="font-variant:small-caps;">[build]</span> `rtl`: *Output RTL directory*, where the <span style="font-variant:small-caps;">Richie SLD toolchain</span> expects to retrieve the hardware accelerator components.

## How to build
Source your `Vivado HLS 2019.2` environment and execute the command `make run_hls`.
To target different accelerator sources, add the optional argument `make run_hls SRC_DIR=/path/to/hls/sources` with the path to the HLS source files.
Additionally, you should customize the `tcl/run_hls.tcl` with the proper source paths.

## How to retrieve RTL
After a succesfull HLS synthesis, execute `make get_rtl`.
This command places generated RTL components into a top `rtl` location.