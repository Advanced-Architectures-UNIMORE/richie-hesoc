/*
 * Copyright 2020 Xilinx, Inc.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#include <iostream>
#include <fstream>
#include <iomanip>
#include <cstdlib>

using namespace std;

#if 0
typedef int data_t;
typedef int coeff_t;
typedef int sum_t;
#else
#include "ap_int.h"
typedef ap_int<32> data_t;
typedef ap_int<32> coeff_t;
typedef ap_int<32> sum_t;
#endif

#define N_SAMPLES 512*8
#define TAP 128

void fir_128_dataflow(data_t &x, coeff_t coeff[TAP], sum_t &y);

// firing unit cell class
template <typename T0, typename T1, typename T2>
class systolic
{
private:
  T0 x,  x1;
  T2 y0, y1;

public:
  // Based on systolic fir description in Xilinx UG073
  void exec(T0 &x_in, T1 &h, T2 &y_in, T0 &x_out, T2 &y)
  {
    x_out = x1;
    x1    = x;
    x     = x_in;
    y     = y1;
    y1    = y0 + y_in;
    y0    = x_out * h;
  }
};