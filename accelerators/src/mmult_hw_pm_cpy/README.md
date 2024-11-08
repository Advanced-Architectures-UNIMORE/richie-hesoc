# Matrix multiplication (prefetcher + accelerator-level parallelism)

## About this accelerator
Matrix multiplication accelerator with partial array partitioning and loop unrolling to implement spatial parallelism (PM). 
Array partitioning is applied to the local accelerator arrays.

## About this repository
The structure of the repository is as follows:

- `src`: *Accelerator sources*;
- `tcl`: *TCL scripts* automating the HLS build process;
- `sw`: *Software golden model* to generate golden stimuli and components for C simulation and RTL verification;
- <span style="font-variant:small-caps;">[build]</span> `rtl`: *Output RTL directory*, where the <span style="font-variant:small-caps;">Richie SLD toolchain</span> expects to retrieve the hardware accelerator components.

## How to build
Source your `Vivado HLS 2019.2` environment and execute the command `make run_hls`.

## How to retrieve RTL
After a succesfull HLS synthesis, execute `make get_rtl`.
This command places generated RTL components into a top `rtl` location.