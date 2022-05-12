#include "fir.h"


void fir_complex(coef_t c[], data_t x_r, data_t x_i, data_t &y_r, data_t &y_i)
{
  acc_t acc_r = 0, acc_i = 0;
  static data_t shift_reg_r[N], shift_reg_i[N];
#pragma HLS ARRAY_PARTITION variable=shift_reg_r factor=2 block
#pragma HLS ARRAY_PARTITION variable=shift_reg_i factor=2 block

  for (ap_uint<16> i = N - 1; i > 0; i--)
  {
    shift_reg_r[i] = shift_reg_r[i - 1];
    shift_reg_i[i] = shift_reg_i[i - 1];

    acc_r += shift_reg_r[i] * c[i];
    acc_i += shift_reg_i[i] * c[i];
  }

  shift_reg_r[0] = x_r;
  shift_reg_i[0] = x_i;

  acc_r += shift_reg_r[0] * c[0];
  acc_i += shift_reg_i[0] * c[0];

  y_r = acc_i + acc_r;
  y_i = acc_i - acc_r;
}
