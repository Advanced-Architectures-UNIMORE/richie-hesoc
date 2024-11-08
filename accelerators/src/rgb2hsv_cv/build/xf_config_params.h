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

#if !defined (__SYNTHESIS__)
#define XF_CV_DEPTH_IN_1 32
#define XF_CV_DEPTH_RGB2HSV 32
#define XF_CV_DEPTH_HELP_1 32
#define XF_CV_DEPTH_HELP_2 32
#define XF_CV_DEPTH_HELP_3 32
#define XF_CV_DEPTH_HELP_4 32
#define XF_CV_DEPTH_OUT_1 32
#else
#define XF_CV_DEPTH_IN_1 0
#define XF_CV_DEPTH_RGB2HSV 0
#define XF_CV_DEPTH_HELP_1 0
#define XF_CV_DEPTH_HELP_2 0
#define XF_CV_DEPTH_HELP_3 0
#define XF_CV_DEPTH_HELP_4 0
#define XF_CV_DEPTH_OUT_1 0
#endif