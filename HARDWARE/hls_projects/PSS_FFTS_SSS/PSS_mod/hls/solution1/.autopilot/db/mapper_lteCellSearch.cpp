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
unsigned int ap_apatb_OUT_FFT_V_cap_bc;
static AESL_RUNTIME_BC __xlx_OUT_FFT_V_size_Reader("../tv/stream_size/stream_size_out_OUT_FFT_V.dat");
unsigned int ap_apatb_pss_id_V_cap_bc;
static AESL_RUNTIME_BC __xlx_pss_id_V_size_Reader("../tv/stream_size/stream_size_out_pss_id_V.dat");
struct __cosim_s8__ { char data[8]; };
struct __cosim_s10__ { char data[16]; };
struct __cosim_sC__ { char data[12]; };
extern "C" void lteCellSearch(int*, __cosim_s8__*, __cosim_s8__*, __cosim_s10__*, __cosim_sC__*, volatile void *, volatile void *, int);
extern "C" void apatb_lteCellSearch_hw(volatile void * __xlx_apatb_param_IN_R, volatile void * __xlx_apatb_param_IN_I, volatile void * __xlx_apatb_param_OUT_FFT, volatile void * __xlx_apatb_param_pss_id, volatile void * __xlx_apatb_param_OUT_PSS_ID, volatile void * __xlx_apatb_param_OUT_PEAK_INDEX, volatile void * __xlx_apatb_param_OUT_RSLT) {
  // Collect __xlx_OUT_RSLT__tmp_vec
  vector<sc_bv<32> >__xlx_OUT_RSLT__tmp_vec;
  for (int j = 0, e = 96000; j != e; ++j) {
    __xlx_OUT_RSLT__tmp_vec.push_back(((int*)__xlx_apatb_param_OUT_RSLT)[j]);
  }
  int __xlx_size_param_OUT_RSLT = 96000;
  int __xlx_offset_param_OUT_RSLT = 0;
  int __xlx_offset_byte_param_OUT_RSLT = 0*4;
  int* __xlx_OUT_RSLT__input_buffer= new int[__xlx_OUT_RSLT__tmp_vec.size()];
  for (int i = 0; i < __xlx_OUT_RSLT__tmp_vec.size(); ++i) {
    __xlx_OUT_RSLT__input_buffer[i] = __xlx_OUT_RSLT__tmp_vec[i].range(31, 0).to_uint64();
  }
  // collect __xlx_IN_R_tmp_vec
  unsigned __xlx_IN_R_V_tmp_Count = 0;
  unsigned __xlx_IN_R_V_read_Size = __xlx_IN_R_V_size_Reader.read_size();
  vector<__cosim_s8__> __xlx_IN_R_tmp_vec;
  while (!((hls::stream<__cosim_s8__>*)__xlx_apatb_param_IN_R)->empty() && __xlx_IN_R_V_tmp_Count < __xlx_IN_R_V_read_Size) {
    __xlx_IN_R_tmp_vec.push_back(((hls::stream<__cosim_s8__>*)__xlx_apatb_param_IN_R)->read());
    __xlx_IN_R_V_tmp_Count++;
  }
  ap_apatb_IN_R_V_cap_bc = __xlx_IN_R_tmp_vec.size();
  // store input buffer
  __cosim_s8__* __xlx_IN_R_input_buffer= new __cosim_s8__[__xlx_IN_R_tmp_vec.size()];
  for (int i = 0; i < __xlx_IN_R_tmp_vec.size(); ++i) {
    __xlx_IN_R_input_buffer[i] = __xlx_IN_R_tmp_vec[i];
  }
  // collect __xlx_IN_I_tmp_vec
  unsigned __xlx_IN_I_V_tmp_Count = 0;
  unsigned __xlx_IN_I_V_read_Size = __xlx_IN_I_V_size_Reader.read_size();
  vector<__cosim_s8__> __xlx_IN_I_tmp_vec;
  while (!((hls::stream<__cosim_s8__>*)__xlx_apatb_param_IN_I)->empty() && __xlx_IN_I_V_tmp_Count < __xlx_IN_I_V_read_Size) {
    __xlx_IN_I_tmp_vec.push_back(((hls::stream<__cosim_s8__>*)__xlx_apatb_param_IN_I)->read());
    __xlx_IN_I_V_tmp_Count++;
  }
  ap_apatb_IN_I_V_cap_bc = __xlx_IN_I_tmp_vec.size();
  // store input buffer
  __cosim_s8__* __xlx_IN_I_input_buffer= new __cosim_s8__[__xlx_IN_I_tmp_vec.size()];
  for (int i = 0; i < __xlx_IN_I_tmp_vec.size(); ++i) {
    __xlx_IN_I_input_buffer[i] = __xlx_IN_I_tmp_vec[i];
  }
  //Create input buffer for OUT_FFT
  ap_apatb_OUT_FFT_V_cap_bc = __xlx_OUT_FFT_V_size_Reader.read_size();
  __cosim_s10__* __xlx_OUT_FFT_input_buffer= new __cosim_s10__[ap_apatb_OUT_FFT_V_cap_bc];
  //Create input buffer for pss_id
  ap_apatb_pss_id_V_cap_bc = __xlx_pss_id_V_size_Reader.read_size();
  __cosim_sC__* __xlx_pss_id_input_buffer= new __cosim_sC__[ap_apatb_pss_id_V_cap_bc];
  // DUT call
  lteCellSearch(__xlx_OUT_RSLT__input_buffer, __xlx_IN_R_input_buffer, __xlx_IN_I_input_buffer, __xlx_OUT_FFT_input_buffer, __xlx_pss_id_input_buffer, __xlx_apatb_param_OUT_PSS_ID, __xlx_apatb_param_OUT_PEAK_INDEX, __xlx_offset_byte_param_OUT_RSLT);
// print __xlx_apatb_param_OUT_RSLT
  sc_bv<32>*__xlx_OUT_RSLT_output_buffer = new sc_bv<32>[__xlx_size_param_OUT_RSLT];
  for (int i = 0; i < __xlx_size_param_OUT_RSLT; ++i) {
    __xlx_OUT_RSLT_output_buffer[i] = __xlx_OUT_RSLT__input_buffer[i+__xlx_offset_param_OUT_RSLT];
  }
  for (int i = 0; i < __xlx_size_param_OUT_RSLT; ++i) {
    ((int*)__xlx_apatb_param_OUT_RSLT)[i] = __xlx_OUT_RSLT_output_buffer[i].to_uint64();
  }
  for (unsigned i = 0; i <ap_apatb_OUT_FFT_V_cap_bc; ++i)
    ((hls::stream<__cosim_s10__>*)__xlx_apatb_param_OUT_FFT)->write(__xlx_OUT_FFT_input_buffer[i]);
  for (unsigned i = 0; i <ap_apatb_pss_id_V_cap_bc; ++i)
    ((hls::stream<__cosim_sC__>*)__xlx_apatb_param_pss_id)->write(__xlx_pss_id_input_buffer[i]);
}
