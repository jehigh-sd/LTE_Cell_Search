#include <systemc>
#include <vector>
#include <iostream>
#include "hls_stream.h"
#include "ap_int.h"
#include "ap_fixed.h"
using namespace std;
using namespace sc_dt;
class AESL_RUNTIME_BC {
  public:
    AESL_RUNTIME_BC(const char* name) {
      file_token.open( name);
      if (!file_token.good()) {
        cout << "Failed to open tv file " << name << endl;
        exit (1);
      }
      file_token >> mName;//[[[runtime]]]
    }
    ~AESL_RUNTIME_BC() {
      file_token.close();
    }
    int read_size () {
      int size = 0;
      file_token >> mName;//[[transaction]]
      file_token >> mName;//transaction number
      file_token >> mName;//pop_size
      size = atoi(mName.c_str());
      file_token >> mName;//[[/transaction]]
      return size;
    }
  public:
    fstream file_token;
    string mName;
};
unsigned int ap_apatb_IN_R_V_cap_bc;
static AESL_RUNTIME_BC __xlx_IN_R_V_size_Reader("../tv/stream_size/stream_size_in_IN_R_V.dat");
unsigned int ap_apatb_OUT_R_V_cap_bc;
static AESL_RUNTIME_BC __xlx_OUT_R_V_size_Reader("../tv/stream_size/stream_size_out_OUT_R_V.dat");
unsigned int ap_apatb_OUT_I_V_cap_bc;
static AESL_RUNTIME_BC __xlx_OUT_I_V_size_Reader("../tv/stream_size/stream_size_out_OUT_I_V.dat");
struct __cosim_s10__ { char data[16]; };
struct __cosim_sC__ { char data[12]; };
extern "C" void fft_shift(__cosim_s10__*, __cosim_sC__*, __cosim_sC__*);
extern "C" void apatb_fft_shift_hw(volatile void * __xlx_apatb_param_IN_R, volatile void * __xlx_apatb_param_OUT_R, volatile void * __xlx_apatb_param_OUT_I) {
  // collect __xlx_IN_R_tmp_vec
  unsigned __xlx_IN_R_V_tmp_Count = 0;
  unsigned __xlx_IN_R_V_read_Size = __xlx_IN_R_V_size_Reader.read_size();
  vector<__cosim_s10__> __xlx_IN_R_tmp_vec;
  while (!((hls::stream<__cosim_s10__>*)__xlx_apatb_param_IN_R)->empty() && __xlx_IN_R_V_tmp_Count < __xlx_IN_R_V_read_Size) {
    __xlx_IN_R_tmp_vec.push_back(((hls::stream<__cosim_s10__>*)__xlx_apatb_param_IN_R)->read());
    __xlx_IN_R_V_tmp_Count++;
  }
  ap_apatb_IN_R_V_cap_bc = __xlx_IN_R_tmp_vec.size();
  // store input buffer
  __cosim_s10__* __xlx_IN_R_input_buffer= new __cosim_s10__[__xlx_IN_R_tmp_vec.size()];
  for (int i = 0; i < __xlx_IN_R_tmp_vec.size(); ++i) {
    __xlx_IN_R_input_buffer[i] = __xlx_IN_R_tmp_vec[i];
  }
  //Create input buffer for OUT_R
  ap_apatb_OUT_R_V_cap_bc = __xlx_OUT_R_V_size_Reader.read_size();
  __cosim_sC__* __xlx_OUT_R_input_buffer= new __cosim_sC__[ap_apatb_OUT_R_V_cap_bc];
  //Create input buffer for OUT_I
  ap_apatb_OUT_I_V_cap_bc = __xlx_OUT_I_V_size_Reader.read_size();
  __cosim_sC__* __xlx_OUT_I_input_buffer= new __cosim_sC__[ap_apatb_OUT_I_V_cap_bc];
  // DUT call
  fft_shift(__xlx_IN_R_input_buffer, __xlx_OUT_R_input_buffer, __xlx_OUT_I_input_buffer);
  for (unsigned i = 0; i <ap_apatb_OUT_R_V_cap_bc; ++i)
    ((hls::stream<__cosim_sC__>*)__xlx_apatb_param_OUT_R)->write(__xlx_OUT_R_input_buffer[i]);
  for (unsigned i = 0; i <ap_apatb_OUT_I_V_cap_bc; ++i)
    ((hls::stream<__cosim_sC__>*)__xlx_apatb_param_OUT_I)->write(__xlx_OUT_I_input_buffer[i]);
}
