# Accelerators design sources

- **Vitis HLS**: C/C++ High-Level Synthesis (HLS) designs, based on the AMD HLS tools;

    - `color_detect_cv`: Monolithic [color detection accelerator](https://docs.amd.com/r/en-US/Vitis_Libraries/vision/colordetect-bm.html), based on the Vitis vision library;
    - `dilate_cv`: [image dilate accelerator](https://docs.amd.com/r/en-US/Vitis_Libraries/vision/api-reference.html_1_36), based on the Vitis vision library;
    - `erode_cv`: [image erode accelerator](https://docs.amd.com/r/en-US/Vitis_Libraries/vision/api-reference.html_1_39?section=erode), based on the Vitis vision library;
    - `rgb2hsv_cv`: [RGB to HSV accelerator](https://docs.amd.com/r/en-US/Vitis_Libraries/vision/api-reference.html_1_90), based on the Vitis vision library;
    - `threshold_cv`: [thresholding accelerator](https://docs.amd.com/r/en-US/Vitis_Libraries/vision/api-reference.html_1_101), based on the Vitis vision library;
    - `fast_corner_detect`: Monolithic [FAST corner detection](https://docs.amd.com/r/en-US/Vitis_Libraries/vision/fast-bm.html), based on the Vitis vision library;
    - `conv_dataflow`: 2D convolution accelerator, based on the Vivado HLS examples;
    - `fir_128_dataflow`: FIR filter (128 taps), based on the Vivado HLS examples;
    - `fir_dataflow`: FIR filter (4 taps), based on the Vivado HLS examples;
    - `mmult_hw`: Matrix multiplication accelerator (baseline);
    - `mmult_hw_pm_cpy`: Matrix multiplication accelerator (double prefetching);
    - `mmult_hw_pm`: Matrix multiplication accelerator (L1 paralellism).

- **MDC**: based on [Multi-Dataflow Composer (MDC)](https://mdc-suite.github.io/), an open-source research EDA tool for the generation and management of Coarse-Grain Reconfigurable (CGR) hardware accelerators;

    - `multi_dataflow_roberts_mdc`: Roberts edge detector accelerator;
    - `multi_dataflow_sobel_mdc`: Sobel edge detector accelerator.

- **HDL**: handcrafted RTL designs in SystemVerilog, Verilog and VHDL.W

    - `mac_dataflow`: MAC accelerator, based on the [PULP HWPE MAC engine](https://github.com/pulp-platform/hwpe-mac-engine);
    - `mul_dataflow`: MUL accelerator, based on the [PULP HWPE MAC engine](https://github.com/pulp-platform/hwpe-mac-engine);
    - `traffic_gen`: Synthetic traffic generator.