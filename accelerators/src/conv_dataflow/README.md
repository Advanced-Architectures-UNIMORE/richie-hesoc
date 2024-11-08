# 2D Convolution
Example C code for implementing an 2D convolution in HLS

##  How to run
edit x_hls.tcl to specific run steps and then execute `vitis_hls -f run_hls.tcl`.

## Optimizations
This design implementation is efficient thanks to:
- The optimal design is `filter11x11_strm`;
- It uses "streams": implements well in hardware;
- it shows an example of using a line buffer for efficient storage;
- It uses assert statements to state the known limit of loop bounds.

The test case also performs a comparison against the more intuitive coding style in `filter11x11_orig`.