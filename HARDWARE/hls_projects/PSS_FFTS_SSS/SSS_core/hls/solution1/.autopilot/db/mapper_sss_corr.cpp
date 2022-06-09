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
unsigned int ap_apatb_pss_id_V_cap_bc;
static AESL_RUNTIME_BC __xlx_pss_id_V_size_Reader("../tv/stream_size/stream_size_in_pss_id_V.dat");
struct __cosim_sC__ { char data[12]; };
extern "C" void sss_corr(int*, __cosim_sC__*, __cosim_sC__*, int, int, __cosim_sC__*);
extern "C" void apatb_sss_corr_hw(volatile void * __xlx_apatb_param_IN_R, volatile void * __xlx_apatb_param_IN_I, volatile void * __xlx_apatb_param_OUT1, volatile void * __xlx_apatb_param_OUT2, volatile void * __xlx_apatb_param_pss_id) {
  // Collect __xlx_OUT1_OUT2__tmp_vec
  vector<sc_bv<32> >__xlx_OUT1_OUT2__tmp_vec;
  for (int j = 0, e = 168; j != e; ++j) {
    __xlx_OUT1_OUT2__tmp_vec.push_back(((int*)__xlx_apatb_param_OUT1)[j]);
  }
  int __xlx_size_param_OUT1 = 168;
  int __xlx_offset_param_OUT1 = 0;
  int __xlx_offset_byte_param_OUT1 = 0*4;
  for (int j = 0, e = 168; j != e; ++j) {
    __xlx_OUT1_OUT2__tmp_vec.push_back(((int*)__xlx_apatb_param_OUT2)[j]);
  }
  int __xlx_size_param_OUT2 = 168;
  int __xlx_offset_param_OUT2 = 168;
  int __xlx_offset_byte_param_OUT2 = 168*4;
  int* __xlx_OUT1_OUT2__input_buffer= new int[__xlx_OUT1_OUT2__tmp_vec.size()];
  for (int i = 0; i < __xlx_OUT1_OUT2__tmp_vec.size(); ++i) {
    __xlx_OUT1_OUT2__input_buffer[i] = __xlx_OUT1_OUT2__tmp_vec[i].range(31, 0).to_uint64();
  }
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
  // collect __xlx_pss_id_tmp_vec
  unsigned __xlx_pss_id_V_tmp_Count = 0;
  unsigned __xlx_pss_id_V_read_Size = __xlx_pss_id_V_size_Reader.read_size();
  vector<__cosim_sC__> __xlx_pss_id_tmp_vec;
  while (!((hls::stream<__cosim_sC__>*)__xlx_apatb_param_pss_id)->empty() && __xlx_pss_id_V_tmp_Count < __xlx_pss_id_V_read_Size) {
    __xlx_pss_id_tmp_vec.push_back(((hls::stream<__cosim_sC__>*)__xlx_apatb_param_pss_id)->read());
    __xlx_pss_id_V_tmp_Count++;
  }
  ap_apatb_pss_id_V_cap_bc = __xlx_pss_id_tmp_vec.size();
  // store input buffer
  __cosim_sC__* __xlx_pss_id_input_buffer= new __cosim_sC__[__xlx_pss_id_tmp_vec.size()];
  for (int i = 0; i < __xlx_pss_id_tmp_vec.size(); ++i) {
    __xlx_pss_id_input_buffer[i] = __xlx_pss_id_tmp_vec[i];
  }
  // DUT call
  sss_corr(__xlx_OUT1_OUT2__input_buffer, __xlx_IN_R_input_buffer, __xlx_IN_I_input_buffer, __xlx_offset_byte_param_OUT1, __xlx_offset_byte_param_OUT2, __xlx_pss_id_input_buffer);
// print __xlx_apatb_param_OUT1
  sc_bv<32>*__xlx_OUT1_output_buffer = new sc_bv<32>[__xlx_size_param_OUT1];
  for (int i = 0; i < __xlx_size_param_OUT1; ++i) {
    __xlx_OUT1_output_buffer[i] = __xlx_OUT1_OUT2__input_buffer[i+__xlx_offset_param_OUT1];
  }
  for (int i = 0; i < __xlx_size_param_OUT1; ++i) {
    ((int*)__xlx_apatb_param_OUT1)[i] = __xlx_OUT1_output_buffer[i].to_uint64();
  }
// print __xlx_apatb_param_OUT2
  sc_bv<32>*__xlx_OUT2_output_buffer = new sc_bv<32>[__xlx_size_param_OUT2];
  for (int i = 0; i < __xlx_size_param_OUT2; ++i) {
    __xlx_OUT2_output_buffer[i] = __xlx_OUT1_OUT2__input_buffer[i+__xlx_offset_param_OUT2];
  }
  for (int i = 0; i < __xlx_size_param_OUT2; ++i) {
    ((int*)__xlx_apatb_param_OUT2)[i] = __xlx_OUT2_output_buffer[i].to_uint64();
  }
}
