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

void color_detect_cv(
    stream_in_t &img_in, 
    stream_out_t &img_out, 
    int rows,
    int cols
) {

    #pragma HLS INTERFACE axis register_mode=both port=img_in depth=XF_CV_DEPTH_IN_1
    #pragma HLS INTERFACE axis register_mode=both port=img_out depth=XF_CV_DEPTH_OUT_1

    xf::cv::Mat<IN_TYPE, HEIGHT, WIDTH, NPC1, XF_CV_DEPTH_IN_1> imgInput(rows, cols);
    xf::cv::Mat<IN_TYPE, HEIGHT, WIDTH, NPC1, XF_CV_DEPTH_RGB2HSV> rgb2hsv(rows, cols);
    xf::cv::Mat<OUT_TYPE, HEIGHT, WIDTH, NPC1, XF_CV_DEPTH_HELP_1> imgHelper1(rows, cols);
    xf::cv::Mat<OUT_TYPE, HEIGHT, WIDTH, NPC1, XF_CV_DEPTH_HELP_2> imgHelper2(rows, cols);
    xf::cv::Mat<OUT_TYPE, HEIGHT, WIDTH, NPC1, XF_CV_DEPTH_HELP_3> imgHelper3(rows, cols);
    xf::cv::Mat<OUT_TYPE, HEIGHT, WIDTH, NPC1, XF_CV_DEPTH_HELP_4> imgHelper4(rows, cols);
    xf::cv::Mat<OUT_TYPE, HEIGHT, WIDTH, NPC1, XF_CV_DEPTH_OUT_1> imgOutput(rows, cols);

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
// clang-format off
        #pragma HLS PIPELINE
        // clang-format on
        _kernel[i] = process_shape[i];
    }

    #pragma HLS stream variable=imgInput.data depth=XF_CV_DEPTH_IN_1
    #pragma HLS stream variable=rgb2hsv.data depth=XF_CV_DEPTH_RGB2HSV
    #pragma HLS stream variable=imgHelper1.data depth=XF_CV_DEPTH_HELP_1
    #pragma HLS stream variable=imgHelper2.data depth=XF_CV_DEPTH_HELP_2
    #pragma HLS stream variable=imgHelper3.data depth=XF_CV_DEPTH_HELP_3
    #pragma HLS stream variable=imgHelper4.data depth=XF_CV_DEPTH_HELP_4
    #pragma HLS stream variable=imgOutput.data depth=XF_CV_DEPTH_OUT_1

    #pragma HLS DATAFLOW
    
    // Retrieve xf::cv::Mat objects from img_in data:
    xf::cv::AXIvideo2xfMat_patch<INPUT_PTR_WIDTH, IN_TYPE, HEIGHT, WIDTH, NPC1, XF_CV_DEPTH_IN_1>(img_in, imgInput);

    // Convert RGBA to HSV:
    xf::cv::bgr2hsv_patch<IN_TYPE, HEIGHT, WIDTH, NPC1, XF_CV_DEPTH_IN_1, XF_CV_DEPTH_RGB2HSV>(imgInput, rgb2hsv);

    // Do the color thresholding:
    xf::cv::colorthresholding_patch<IN_TYPE, OUT_TYPE, MAXCOLORS, HEIGHT, WIDTH, NPC1, XF_CV_DEPTH_RGB2HSV, XF_CV_DEPTH_HELP_1>(rgb2hsv, imgHelper1, low_thresh, high_thresh);

    // Use erode and dilate to fully mark color areas:
    xf::cv::erode_patch<XF_BORDER_CONSTANT, OUT_TYPE, HEIGHT, WIDTH, XF_KERNEL_SHAPE, FILTER_SIZE, FILTER_SIZE, ITERATIONS, NPC1, XF_CV_DEPTH_HELP_1, XF_CV_DEPTH_HELP_2>(imgHelper1, imgHelper2, _kernel);
    xf::cv::dilate_patch<XF_BORDER_CONSTANT, OUT_TYPE, HEIGHT, WIDTH, XF_KERNEL_SHAPE, FILTER_SIZE, FILTER_SIZE, ITERATIONS, NPC1, XF_CV_DEPTH_HELP_2, XF_CV_DEPTH_HELP_3>(imgHelper2, imgHelper3, _kernel);
    xf::cv::dilate_patch<XF_BORDER_CONSTANT, OUT_TYPE, HEIGHT, WIDTH, XF_KERNEL_SHAPE, FILTER_SIZE, FILTER_SIZE, ITERATIONS, NPC1, XF_CV_DEPTH_HELP_3, XF_CV_DEPTH_HELP_4>(imgHelper3, imgHelper4, _kernel);
    xf::cv::erode_patch<XF_BORDER_CONSTANT, OUT_TYPE, HEIGHT, WIDTH, XF_KERNEL_SHAPE, FILTER_SIZE, FILTER_SIZE, ITERATIONS, NPC1, XF_CV_DEPTH_HELP_4, XF_CV_DEPTH_OUT_1>(imgHelper4, imgOutput, _kernel);

    // Convert _dst xf::cv::Mat object to output array:
    xf::cv::xfMat2AXIvideo_patch<OUTPUT_PTR_WIDTH, OUT_TYPE, HEIGHT, WIDTH, NPC1, XF_CV_DEPTH_OUT_1>(imgOutput, img_out);

    return;

} // End of kernel
