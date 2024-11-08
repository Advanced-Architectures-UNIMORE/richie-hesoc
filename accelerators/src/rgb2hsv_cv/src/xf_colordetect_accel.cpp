/*
 * Copyright 2019 Xilinx, Inc.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#include "xf_colordetect_config.h"

static constexpr int __XF_DEPTH = (HEIGHT * WIDTH * (XF_PIXELWIDTH(IN_TYPE, NPC1)) / 8) / (INPUT_PTR_WIDTH / 8);
static constexpr int __XF_DEPTH_OUT = (HEIGHT * WIDTH * (XF_PIXELWIDTH(OUT_TYPE, NPC1)) / 8) / (OUTPUT_PTR_WIDTH / 8);
static constexpr int __XF_DEPTH_FILTER = (FILTER_SIZE * FILTER_SIZE);

void rgb2hsv_cv(
    stream_in_t &img_in, 
    stream_in_t &img_out, 
    int rows,
    int cols
) {

    #pragma HLS INTERFACE axis register register_mode=both port=img_in depth=XF_CV_DEPTH_IN_1
    #pragma HLS INTERFACE axis register register_mode=both port=img_out depth=XF_CV_DEPTH_RGB2HSV

    xf::cv::Mat<IN_TYPE, HEIGHT, WIDTH, NPC1, XF_CV_DEPTH_IN_1> rgb2hsv_in(rows, cols);
    xf::cv::Mat<IN_TYPE, HEIGHT, WIDTH, NPC1, XF_CV_DEPTH_RGB2HSV> rgb2hsv_out(rows, cols);

    // local parameters
    unsigned char low_thresh[FILTER_SIZE*FILTER_SIZE];
    unsigned char high_thresh[FILTER_SIZE*FILTER_SIZE];
    unsigned char process_shape[FILTER_SIZE*FILTER_SIZE];

    // set hardwired thresholds
    low_thresh[0] = 22; // Lower boundary for Yellow
    low_thresh[1] = 150;
    low_thresh[2] = 60;
    low_thresh[3] = 38; // Lower boundary for Green
    low_thresh[4] = 150;
    low_thresh[5] = 60;
    low_thresh[6] = 160; // Lower boundary for Red
    low_thresh[7] = 150;
    low_thresh[8] = 60;

    high_thresh[0] = 38; // Upper boundary for Yellow
    high_thresh[1] = 255;
    high_thresh[2] = 255;
    high_thresh[3] = 75; // Upper boundary for Green
    high_thresh[4] = 255;
    high_thresh[5] = 255;
    high_thresh[6] = 179; // Upper boundary for Red
    high_thresh[7] = 255;
    high_thresh[8] = 255;

    for (int i = 0; i < (FILTER_SIZE * FILTER_SIZE); i++) {
        process_shape[i] = 1;
    }

    // Copy the shape data:
    unsigned char _kernel[FILTER_SIZE * FILTER_SIZE];
    for (unsigned int i = 0; i < FILTER_SIZE * FILTER_SIZE; ++i) {
        #pragma HLS PIPELINE
        _kernel[i] = process_shape[i];
    }

    #pragma HLS stream variable=rgb2hsv_in.data depth=XF_CV_DEPTH_IN_1
    #pragma HLS stream variable=rgb2hsv_out.data depth=XF_CV_DEPTH_RGB2HSV

    #pragma HLS DATAFLOW
    
    // Retrieve xf::cv::Mat objects from input stream
    xf::cv::AXIvideo2xfMat_patch<INPUT_PTR_WIDTH, IN_TYPE, HEIGHT, WIDTH, NPC1, XF_CV_DEPTH_IN_1>(img_in, rgb2hsv_in);

    // Convert RGBA to HSV
    xf::cv::bgr2hsv_patch<IN_TYPE, HEIGHT, WIDTH, NPC1, XF_CV_DEPTH_IN_1, XF_CV_DEPTH_RGB2HSV>(rgb2hsv_in, rgb2hsv_out);

    // Convert _dst xf::cv::Mat object to output stream
    xf::cv::xfMat2AXIvideo_patch<INPUT_PTR_WIDTH, IN_TYPE, HEIGHT, WIDTH, NPC1, XF_CV_DEPTH_RGB2HSV>(rgb2hsv_out, img_out);

    return;

} // End of kernel