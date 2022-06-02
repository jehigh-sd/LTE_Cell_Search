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
unsigned int ap_apatb_IN_I_V_cap_bc;
static AESL_RUNTIME_BC __xlx_IN_I_V_size_Reader("../tv/stream_size/stream_size_in_IN_I_V.dat");
unsigned int ap_apatb_sss_1_PSS_1_V_cap_bc;
static AESL_RUNTIME_BC __xlx_sss_1_PSS_1_V_size_Reader("../tv/stream_size/stream_size_out_sss_1_PSS_1_V.dat");
unsigned int ap_apatb_sss_1_PSS_2_V_cap_bc;
static AESL_RUNTIME_BC __xlx_sss_1_PSS_2_V_size_Reader("../tv/stream_size/stream_size_out_sss_1_PSS_2_V.dat");
unsigned int ap_apatb_sss_2_PSS_1_V_cap_bc;
static AESL_RUNTIME_BC __xlx_sss_2_PSS_1_V_size_Reader("../tv/stream_size/stream_size_out_sss_2_PSS_1_V.dat");
unsigned int ap_apatb_sss_2_PSS_2_V_cap_bc;
static AESL_RUNTIME_BC __xlx_sss_2_PSS_2_V_size_Reader("../tv/stream_size/stream_size_out_sss_2_PSS_2_V.dat");
struct __cosim_sC__ { char data[12]; };
struct __cosim_s10__ { char data[16]; };
extern "C" void cp_corr_pss_sss(__cosim_sC__*, __cosim_sC__*, __cosim_s10__*, __cosim_s10__*, __cosim_s10__*, __cosim_s10__*);
extern "C" void apatb_cp_corr_pss_sss_hw(volatile void * __xlx_apatb_param_IN_R, volatile void * __xlx_apatb_param_IN_I, volatile void * __xlx_apatb_param_sss_1_PSS_1, volatile void * __xlx_apatb_param_sss_1_PSS_2, volatile void * __xlx_apatb_param_sss_2_PSS_1, volatile void * __xlx_apatb_param_sss_2_PSS_2) {
  // collect __xlx_IN_R_tmp_vec
  unsigned __xlx_IN_R_V_tmp_Count = 0;
  unsigned __xlx_IN_R_V_read_Size = __xlx_IN_R_V_size_Reader.read_size();
  vector<__cosim_sC__> __xlx_IN_R_tmp_vec;
  while (!((hls::stream<__cosim_sC__>*)__xlx_apatb_param_IN_R)->empty() && __xlx_IN_R_V_tmp_Count < __xlx_IN_R_V_read_Size) {
    __xlx_IN_R_tmp_vec.push_back(((hls::stream<__cosim_sC__>*)__xlx_apatb_param_IN_R)->read());
    __xlx_IN_R_V_tmp_Count++;
  }
  ap_apatb_IN_R_V_cap_bc = __xlx_IN_R_tmp_vec.size();
  // store input buffer
  __cosim_sC__* __xlx_IN_R_input_buffer= new __cosim_sC__[__xlx_IN_R_tmp_vec.size()];
  for (int i = 0; i < __xlx_IN_R_tmp_vec.size(); ++i) {
    __xlx_IN_R_input_buffer[i] = __xlx_IN_R_tmp_vec[i];
  }
  // collect __xlx_IN_I_tmp_vec
  unsigned __xlx_IN_I_V_tmp_Count = 0;
  unsigned __xlx_IN_I_V_read_Size = __xlx_IN_I_V_size_Reader.read_size();
  vector<__cosim_sC__> __xlx_IN_I_tmp_vec;
  while (!((hls::stream<__cosim_sC__>*)__xlx_apatb_param_IN_I)->empty() && __xlx_IN_I_V_tmp_Count < __xlx_IN_I_V_read_Size) {
    __xlx_IN_I_tmp_vec.push_back(((hls::stream<__cosim_sC__>*)__xlx_apatb_param_IN_I)->read());
    __xlx_IN_I_V_tmp_Count++;
  }
  ap_apatb_IN_I_V_cap_bc = __xlx_IN_I_tmp_vec.size();
  // store input buffer
  __cosim_sC__* __xlx_IN_I_input_buffer= new __cosim_sC__[__xlx_IN_I_tmp_vec.size()];
  for (int i = 0; i < __xlx_IN_I_tmp_vec.size(); ++i) {
    __xlx_IN_I_input_buffer[i] = __xlx_IN_I_tmp_vec[i];
  }
  //Create input buffer for sss_1_PSS_1
  ap_apatb_sss_1_PSS_1_V_cap_bc = __xlx_sss_1_PSS_1_V_size_Reader.read_size();
  __cosim_s10__* __xlx_sss_1_PSS_1_input_buffer= new __cosim_s10__[ap_apatb_sss_1_PSS_1_V_cap_bc];
  //Create input buffer for sss_1_PSS_2
  ap_apatb_sss_1_PSS_2_V_cap_bc = __xlx_sss_1_PSS_2_V_size_Reader.read_size();
  __cosim_s10__* __xlx_sss_1_PSS_2_input_buffer= new __cosim_s10__[ap_apatb_sss_1_PSS_2_V_cap_bc];
  //Create input buffer for sss_2_PSS_1
  ap_apatb_sss_2_PSS_1_V_cap_bc = __xlx_sss_2_PSS_1_V_size_Reader.read_size();
  __cosim_s10__* __xlx_sss_2_PSS_1_input_buffer= new __cosim_s10__[ap_apatb_sss_2_PSS_1_V_cap_bc];
  //Create input buffer for sss_2_PSS_2
  ap_apatb_sss_2_PSS_2_V_cap_bc = __xlx_sss_2_PSS_2_V_size_Reader.read_size();
  __cosim_s10__* __xlx_sss_2_PSS_2_input_buffer= new __cosim_s10__[ap_apatb_sss_2_PSS_2_V_cap_bc];
  // DUT call
  cp_corr_pss_sss(__xlx_IN_R_input_buffer, __xlx_IN_I_input_buffer, __xlx_sss_1_PSS_1_input_buffer, __xlx_sss_1_PSS_2_input_buffer, __xlx_sss_2_PSS_1_input_buffer, __xlx_sss_2_PSS_2_input_buffer);
  for (unsigned i = 0; i <ap_apatb_sss_1_PSS_1_V_cap_bc; ++i)
    ((hls::stream<__cosim_s10__>*)__xlx_apatb_param_sss_1_PSS_1)->write(__xlx_sss_1_PSS_1_input_buffer[i]);
  for (unsigned i = 0; i <ap_apatb_sss_1_PSS_2_V_cap_bc; ++i)
    ((hls::stream<__cosim_s10__>*)__xlx_apatb_param_sss_1_PSS_2)->write(__xlx_sss_1_PSS_2_input_buffer[i]);
  for (unsigned i = 0; i <ap_apatb_sss_2_PSS_1_V_cap_bc; ++i)
    ((hls::stream<__cosim_s10__>*)__xlx_apatb_param_sss_2_PSS_1)->write(__xlx_sss_2_PSS_1_input_buffer[i]);
  for (unsigned i = 0; i <ap_apatb_sss_2_PSS_2_V_cap_bc; ++i)
    ((hls::stream<__cosim_s10__>*)__xlx_apatb_param_sss_2_PSS_2)->write(__xlx_sss_2_PSS_2_input_buffer[i]);
}
