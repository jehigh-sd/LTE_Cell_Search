#include <systemc>
#include <iostream>
#include <cstdlib>
#include <cstddef>
#include <stdint.h>
#include "SysCFileHandler.h"
#include "ap_int.h"
#include "ap_fixed.h"
#include <complex>
#include <stdbool.h>
#include "autopilot_cbe.h"
#include "hls_stream.h"
#include "hls_half.h"
#include "hls_signal_handler.h"

using namespace std;
using namespace sc_core;
using namespace sc_dt;

// wrapc file define:
#define AUTOTB_TVIN_gmem "../tv/cdatafile/c.lteCellSearch.autotvin_gmem.dat"
#define AUTOTB_TVOUT_gmem "../tv/cdatafile/c.lteCellSearch.autotvout_gmem.dat"
// wrapc file define:
#define AUTOTB_TVIN_IN_R_V_data_V "../tv/cdatafile/c.lteCellSearch.autotvin_IN_R_V_data_V.dat"
#define AUTOTB_TVOUT_IN_R_V_data_V "../tv/cdatafile/c.lteCellSearch.autotvout_IN_R_V_data_V.dat"
#define AUTOTB_TVIN_IN_R_V_keep_V "../tv/cdatafile/c.lteCellSearch.autotvin_IN_R_V_keep_V.dat"
#define AUTOTB_TVOUT_IN_R_V_keep_V "../tv/cdatafile/c.lteCellSearch.autotvout_IN_R_V_keep_V.dat"
#define AUTOTB_TVIN_IN_R_V_strb_V "../tv/cdatafile/c.lteCellSearch.autotvin_IN_R_V_strb_V.dat"
#define AUTOTB_TVOUT_IN_R_V_strb_V "../tv/cdatafile/c.lteCellSearch.autotvout_IN_R_V_strb_V.dat"
#define AUTOTB_TVIN_IN_R_V_last_V "../tv/cdatafile/c.lteCellSearch.autotvin_IN_R_V_last_V.dat"
#define AUTOTB_TVOUT_IN_R_V_last_V "../tv/cdatafile/c.lteCellSearch.autotvout_IN_R_V_last_V.dat"
#define WRAPC_STREAM_SIZE_IN_IN_R_V_data_V "../tv/stream_size/stream_size_in_IN_R_V_data_V.dat"
#define WRAPC_STREAM_INGRESS_STATUS_IN_R_V_data_V "../tv/stream_size/stream_ingress_status_IN_R_V_data_V.dat"
#define WRAPC_STREAM_SIZE_IN_IN_R_V_keep_V "../tv/stream_size/stream_size_in_IN_R_V_keep_V.dat"
#define WRAPC_STREAM_INGRESS_STATUS_IN_R_V_keep_V "../tv/stream_size/stream_ingress_status_IN_R_V_keep_V.dat"
#define WRAPC_STREAM_SIZE_IN_IN_R_V_strb_V "../tv/stream_size/stream_size_in_IN_R_V_strb_V.dat"
#define WRAPC_STREAM_INGRESS_STATUS_IN_R_V_strb_V "../tv/stream_size/stream_ingress_status_IN_R_V_strb_V.dat"
#define WRAPC_STREAM_SIZE_IN_IN_R_V_last_V "../tv/stream_size/stream_size_in_IN_R_V_last_V.dat"
#define WRAPC_STREAM_INGRESS_STATUS_IN_R_V_last_V "../tv/stream_size/stream_ingress_status_IN_R_V_last_V.dat"
// wrapc file define:
#define AUTOTB_TVIN_IN_I_V_data_V "../tv/cdatafile/c.lteCellSearch.autotvin_IN_I_V_data_V.dat"
#define AUTOTB_TVOUT_IN_I_V_data_V "../tv/cdatafile/c.lteCellSearch.autotvout_IN_I_V_data_V.dat"
#define AUTOTB_TVIN_IN_I_V_keep_V "../tv/cdatafile/c.lteCellSearch.autotvin_IN_I_V_keep_V.dat"
#define AUTOTB_TVOUT_IN_I_V_keep_V "../tv/cdatafile/c.lteCellSearch.autotvout_IN_I_V_keep_V.dat"
#define AUTOTB_TVIN_IN_I_V_strb_V "../tv/cdatafile/c.lteCellSearch.autotvin_IN_I_V_strb_V.dat"
#define AUTOTB_TVOUT_IN_I_V_strb_V "../tv/cdatafile/c.lteCellSearch.autotvout_IN_I_V_strb_V.dat"
#define AUTOTB_TVIN_IN_I_V_last_V "../tv/cdatafile/c.lteCellSearch.autotvin_IN_I_V_last_V.dat"
#define AUTOTB_TVOUT_IN_I_V_last_V "../tv/cdatafile/c.lteCellSearch.autotvout_IN_I_V_last_V.dat"
#define WRAPC_STREAM_SIZE_IN_IN_I_V_data_V "../tv/stream_size/stream_size_in_IN_I_V_data_V.dat"
#define WRAPC_STREAM_INGRESS_STATUS_IN_I_V_data_V "../tv/stream_size/stream_ingress_status_IN_I_V_data_V.dat"
#define WRAPC_STREAM_SIZE_IN_IN_I_V_keep_V "../tv/stream_size/stream_size_in_IN_I_V_keep_V.dat"
#define WRAPC_STREAM_INGRESS_STATUS_IN_I_V_keep_V "../tv/stream_size/stream_ingress_status_IN_I_V_keep_V.dat"
#define WRAPC_STREAM_SIZE_IN_IN_I_V_strb_V "../tv/stream_size/stream_size_in_IN_I_V_strb_V.dat"
#define WRAPC_STREAM_INGRESS_STATUS_IN_I_V_strb_V "../tv/stream_size/stream_ingress_status_IN_I_V_strb_V.dat"
#define WRAPC_STREAM_SIZE_IN_IN_I_V_last_V "../tv/stream_size/stream_size_in_IN_I_V_last_V.dat"
#define WRAPC_STREAM_INGRESS_STATUS_IN_I_V_last_V "../tv/stream_size/stream_ingress_status_IN_I_V_last_V.dat"
// wrapc file define:
#define AUTOTB_TVIN_OUT_FFT_V_data_V "../tv/cdatafile/c.lteCellSearch.autotvin_OUT_FFT_V_data_V.dat"
#define AUTOTB_TVOUT_OUT_FFT_V_data_V "../tv/cdatafile/c.lteCellSearch.autotvout_OUT_FFT_V_data_V.dat"
#define AUTOTB_TVIN_OUT_FFT_V_keep_V "../tv/cdatafile/c.lteCellSearch.autotvin_OUT_FFT_V_keep_V.dat"
#define AUTOTB_TVOUT_OUT_FFT_V_keep_V "../tv/cdatafile/c.lteCellSearch.autotvout_OUT_FFT_V_keep_V.dat"
#define AUTOTB_TVIN_OUT_FFT_V_strb_V "../tv/cdatafile/c.lteCellSearch.autotvin_OUT_FFT_V_strb_V.dat"
#define AUTOTB_TVOUT_OUT_FFT_V_strb_V "../tv/cdatafile/c.lteCellSearch.autotvout_OUT_FFT_V_strb_V.dat"
#define AUTOTB_TVIN_OUT_FFT_V_last_V "../tv/cdatafile/c.lteCellSearch.autotvin_OUT_FFT_V_last_V.dat"
#define AUTOTB_TVOUT_OUT_FFT_V_last_V "../tv/cdatafile/c.lteCellSearch.autotvout_OUT_FFT_V_last_V.dat"
#define WRAPC_STREAM_SIZE_OUT_OUT_FFT_V_data_V "../tv/stream_size/stream_size_out_OUT_FFT_V_data_V.dat"
#define WRAPC_STREAM_EGRESS_STATUS_OUT_FFT_V_data_V "../tv/stream_size/stream_egress_status_OUT_FFT_V_data_V.dat"
#define WRAPC_STREAM_SIZE_OUT_OUT_FFT_V_keep_V "../tv/stream_size/stream_size_out_OUT_FFT_V_keep_V.dat"
#define WRAPC_STREAM_EGRESS_STATUS_OUT_FFT_V_keep_V "../tv/stream_size/stream_egress_status_OUT_FFT_V_keep_V.dat"
#define WRAPC_STREAM_SIZE_OUT_OUT_FFT_V_strb_V "../tv/stream_size/stream_size_out_OUT_FFT_V_strb_V.dat"
#define WRAPC_STREAM_EGRESS_STATUS_OUT_FFT_V_strb_V "../tv/stream_size/stream_egress_status_OUT_FFT_V_strb_V.dat"
#define WRAPC_STREAM_SIZE_OUT_OUT_FFT_V_last_V "../tv/stream_size/stream_size_out_OUT_FFT_V_last_V.dat"
#define WRAPC_STREAM_EGRESS_STATUS_OUT_FFT_V_last_V "../tv/stream_size/stream_egress_status_OUT_FFT_V_last_V.dat"
// wrapc file define:
#define AUTOTB_TVIN_pss_id_V_data_V "../tv/cdatafile/c.lteCellSearch.autotvin_pss_id_V_data_V.dat"
#define AUTOTB_TVOUT_pss_id_V_data_V "../tv/cdatafile/c.lteCellSearch.autotvout_pss_id_V_data_V.dat"
#define AUTOTB_TVIN_pss_id_V_keep_V "../tv/cdatafile/c.lteCellSearch.autotvin_pss_id_V_keep_V.dat"
#define AUTOTB_TVOUT_pss_id_V_keep_V "../tv/cdatafile/c.lteCellSearch.autotvout_pss_id_V_keep_V.dat"
#define AUTOTB_TVIN_pss_id_V_strb_V "../tv/cdatafile/c.lteCellSearch.autotvin_pss_id_V_strb_V.dat"
#define AUTOTB_TVOUT_pss_id_V_strb_V "../tv/cdatafile/c.lteCellSearch.autotvout_pss_id_V_strb_V.dat"
#define AUTOTB_TVIN_pss_id_V_last_V "../tv/cdatafile/c.lteCellSearch.autotvin_pss_id_V_last_V.dat"
#define AUTOTB_TVOUT_pss_id_V_last_V "../tv/cdatafile/c.lteCellSearch.autotvout_pss_id_V_last_V.dat"
#define WRAPC_STREAM_SIZE_OUT_pss_id_V_data_V "../tv/stream_size/stream_size_out_pss_id_V_data_V.dat"
#define WRAPC_STREAM_EGRESS_STATUS_pss_id_V_data_V "../tv/stream_size/stream_egress_status_pss_id_V_data_V.dat"
#define WRAPC_STREAM_SIZE_OUT_pss_id_V_keep_V "../tv/stream_size/stream_size_out_pss_id_V_keep_V.dat"
#define WRAPC_STREAM_EGRESS_STATUS_pss_id_V_keep_V "../tv/stream_size/stream_egress_status_pss_id_V_keep_V.dat"
#define WRAPC_STREAM_SIZE_OUT_pss_id_V_strb_V "../tv/stream_size/stream_size_out_pss_id_V_strb_V.dat"
#define WRAPC_STREAM_EGRESS_STATUS_pss_id_V_strb_V "../tv/stream_size/stream_egress_status_pss_id_V_strb_V.dat"
#define WRAPC_STREAM_SIZE_OUT_pss_id_V_last_V "../tv/stream_size/stream_size_out_pss_id_V_last_V.dat"
#define WRAPC_STREAM_EGRESS_STATUS_pss_id_V_last_V "../tv/stream_size/stream_egress_status_pss_id_V_last_V.dat"
// wrapc file define:
#define AUTOTB_TVIN_OUT_PSS_ID "../tv/cdatafile/c.lteCellSearch.autotvin_OUT_PSS_ID.dat"
#define AUTOTB_TVOUT_OUT_PSS_ID "../tv/cdatafile/c.lteCellSearch.autotvout_OUT_PSS_ID.dat"
// wrapc file define:
#define AUTOTB_TVIN_OUT_PEAK_INDEX "../tv/cdatafile/c.lteCellSearch.autotvin_OUT_PEAK_INDEX.dat"
#define AUTOTB_TVOUT_OUT_PEAK_INDEX "../tv/cdatafile/c.lteCellSearch.autotvout_OUT_PEAK_INDEX.dat"
// wrapc file define:
#define AUTOTB_TVIN_OUT_RSLT "../tv/cdatafile/c.lteCellSearch.autotvin_OUT_RSLT.dat"
#define AUTOTB_TVOUT_OUT_RSLT "../tv/cdatafile/c.lteCellSearch.autotvout_OUT_RSLT.dat"

#define INTER_TCL "../tv/cdatafile/ref.tcl"

// tvout file define:
#define AUTOTB_TVOUT_PC_gmem "../tv/rtldatafile/rtl.lteCellSearch.autotvout_gmem.dat"
// tvout file define:
#define AUTOTB_TVOUT_PC_IN_R_V_data_V "../tv/rtldatafile/rtl.lteCellSearch.autotvout_IN_R_V_data_V.dat"
#define AUTOTB_TVOUT_PC_IN_R_V_keep_V "../tv/rtldatafile/rtl.lteCellSearch.autotvout_IN_R_V_keep_V.dat"
#define AUTOTB_TVOUT_PC_IN_R_V_strb_V "../tv/rtldatafile/rtl.lteCellSearch.autotvout_IN_R_V_strb_V.dat"
#define AUTOTB_TVOUT_PC_IN_R_V_last_V "../tv/rtldatafile/rtl.lteCellSearch.autotvout_IN_R_V_last_V.dat"
// tvout file define:
#define AUTOTB_TVOUT_PC_IN_I_V_data_V "../tv/rtldatafile/rtl.lteCellSearch.autotvout_IN_I_V_data_V.dat"
#define AUTOTB_TVOUT_PC_IN_I_V_keep_V "../tv/rtldatafile/rtl.lteCellSearch.autotvout_IN_I_V_keep_V.dat"
#define AUTOTB_TVOUT_PC_IN_I_V_strb_V "../tv/rtldatafile/rtl.lteCellSearch.autotvout_IN_I_V_strb_V.dat"
#define AUTOTB_TVOUT_PC_IN_I_V_last_V "../tv/rtldatafile/rtl.lteCellSearch.autotvout_IN_I_V_last_V.dat"
// tvout file define:
#define AUTOTB_TVOUT_PC_OUT_FFT_V_data_V "../tv/rtldatafile/rtl.lteCellSearch.autotvout_OUT_FFT_V_data_V.dat"
#define AUTOTB_TVOUT_PC_OUT_FFT_V_keep_V "../tv/rtldatafile/rtl.lteCellSearch.autotvout_OUT_FFT_V_keep_V.dat"
#define AUTOTB_TVOUT_PC_OUT_FFT_V_strb_V "../tv/rtldatafile/rtl.lteCellSearch.autotvout_OUT_FFT_V_strb_V.dat"
#define AUTOTB_TVOUT_PC_OUT_FFT_V_last_V "../tv/rtldatafile/rtl.lteCellSearch.autotvout_OUT_FFT_V_last_V.dat"
// tvout file define:
#define AUTOTB_TVOUT_PC_pss_id_V_data_V "../tv/rtldatafile/rtl.lteCellSearch.autotvout_pss_id_V_data_V.dat"
#define AUTOTB_TVOUT_PC_pss_id_V_keep_V "../tv/rtldatafile/rtl.lteCellSearch.autotvout_pss_id_V_keep_V.dat"
#define AUTOTB_TVOUT_PC_pss_id_V_strb_V "../tv/rtldatafile/rtl.lteCellSearch.autotvout_pss_id_V_strb_V.dat"
#define AUTOTB_TVOUT_PC_pss_id_V_last_V "../tv/rtldatafile/rtl.lteCellSearch.autotvout_pss_id_V_last_V.dat"
// tvout file define:
#define AUTOTB_TVOUT_PC_OUT_PSS_ID "../tv/rtldatafile/rtl.lteCellSearch.autotvout_OUT_PSS_ID.dat"
// tvout file define:
#define AUTOTB_TVOUT_PC_OUT_PEAK_INDEX "../tv/rtldatafile/rtl.lteCellSearch.autotvout_OUT_PEAK_INDEX.dat"
// tvout file define:
#define AUTOTB_TVOUT_PC_OUT_RSLT "../tv/rtldatafile/rtl.lteCellSearch.autotvout_OUT_RSLT.dat"

class INTER_TCL_FILE {
  public:
INTER_TCL_FILE(const char* name) {
  mName = name; 
  gmem_depth = 0;
  IN_R_V_data_V_depth = 0;
  IN_R_V_keep_V_depth = 0;
  IN_R_V_strb_V_depth = 0;
  IN_R_V_last_V_depth = 0;
  IN_I_V_data_V_depth = 0;
  IN_I_V_keep_V_depth = 0;
  IN_I_V_strb_V_depth = 0;
  IN_I_V_last_V_depth = 0;
  OUT_FFT_V_data_V_depth = 0;
  OUT_FFT_V_keep_V_depth = 0;
  OUT_FFT_V_strb_V_depth = 0;
  OUT_FFT_V_last_V_depth = 0;
  pss_id_V_data_V_depth = 0;
  pss_id_V_keep_V_depth = 0;
  pss_id_V_strb_V_depth = 0;
  pss_id_V_last_V_depth = 0;
  OUT_PSS_ID_depth = 0;
  OUT_PEAK_INDEX_depth = 0;
  OUT_RSLT_depth = 0;
  trans_num =0;
}
~INTER_TCL_FILE() {
  mFile.open(mName);
  if (!mFile.good()) {
    cout << "Failed to open file ref.tcl" << endl;
    exit (1); 
  }
  string total_list = get_depth_list();
  mFile << "set depth_list {\n";
  mFile << total_list;
  mFile << "}\n";
  mFile << "set trans_num "<<trans_num<<endl;
  mFile.close();
}
string get_depth_list () {
  stringstream total_list;
  total_list << "{gmem " << gmem_depth << "}\n";
  total_list << "{IN_R_V_data_V " << IN_R_V_data_V_depth << "}\n";
  total_list << "{IN_R_V_keep_V " << IN_R_V_keep_V_depth << "}\n";
  total_list << "{IN_R_V_strb_V " << IN_R_V_strb_V_depth << "}\n";
  total_list << "{IN_R_V_last_V " << IN_R_V_last_V_depth << "}\n";
  total_list << "{IN_I_V_data_V " << IN_I_V_data_V_depth << "}\n";
  total_list << "{IN_I_V_keep_V " << IN_I_V_keep_V_depth << "}\n";
  total_list << "{IN_I_V_strb_V " << IN_I_V_strb_V_depth << "}\n";
  total_list << "{IN_I_V_last_V " << IN_I_V_last_V_depth << "}\n";
  total_list << "{OUT_FFT_V_data_V " << OUT_FFT_V_data_V_depth << "}\n";
  total_list << "{OUT_FFT_V_keep_V " << OUT_FFT_V_keep_V_depth << "}\n";
  total_list << "{OUT_FFT_V_strb_V " << OUT_FFT_V_strb_V_depth << "}\n";
  total_list << "{OUT_FFT_V_last_V " << OUT_FFT_V_last_V_depth << "}\n";
  total_list << "{pss_id_V_data_V " << pss_id_V_data_V_depth << "}\n";
  total_list << "{pss_id_V_keep_V " << pss_id_V_keep_V_depth << "}\n";
  total_list << "{pss_id_V_strb_V " << pss_id_V_strb_V_depth << "}\n";
  total_list << "{pss_id_V_last_V " << pss_id_V_last_V_depth << "}\n";
  total_list << "{OUT_PSS_ID " << OUT_PSS_ID_depth << "}\n";
  total_list << "{OUT_PEAK_INDEX " << OUT_PEAK_INDEX_depth << "}\n";
  total_list << "{OUT_RSLT " << OUT_RSLT_depth << "}\n";
  return total_list.str();
}
void set_num (int num , int* class_num) {
  (*class_num) = (*class_num) > num ? (*class_num) : num;
}
void set_string(std::string list, std::string* class_list) {
  (*class_list) = list;
}
  public:
    int gmem_depth;
    int IN_R_V_data_V_depth;
    int IN_R_V_keep_V_depth;
    int IN_R_V_strb_V_depth;
    int IN_R_V_last_V_depth;
    int IN_I_V_data_V_depth;
    int IN_I_V_keep_V_depth;
    int IN_I_V_strb_V_depth;
    int IN_I_V_last_V_depth;
    int OUT_FFT_V_data_V_depth;
    int OUT_FFT_V_keep_V_depth;
    int OUT_FFT_V_strb_V_depth;
    int OUT_FFT_V_last_V_depth;
    int pss_id_V_data_V_depth;
    int pss_id_V_keep_V_depth;
    int pss_id_V_strb_V_depth;
    int pss_id_V_last_V_depth;
    int OUT_PSS_ID_depth;
    int OUT_PEAK_INDEX_depth;
    int OUT_RSLT_depth;
    int trans_num;
  private:
    ofstream mFile;
    const char* mName;
};

static void RTLOutputCheckAndReplacement(std::string &AESL_token, std::string PortName) {
  bool no_x = false;
  bool err = false;

  no_x = false;
  // search and replace 'X' with '0' from the 3rd char of token
  while (!no_x) {
    size_t x_found = AESL_token.find('X', 0);
    if (x_found != string::npos) {
      if (!err) { 
        cerr << "WARNING: [SIM 212-201] RTL produces unknown value 'X' on port" 
             << PortName << ", possible cause: There are uninitialized variables in the C design."
             << endl; 
        err = true;
      }
      AESL_token.replace(x_found, 1, "0");
    } else
      no_x = true;
  }
  no_x = false;
  // search and replace 'x' with '0' from the 3rd char of token
  while (!no_x) {
    size_t x_found = AESL_token.find('x', 2);
    if (x_found != string::npos) {
      if (!err) { 
        cerr << "WARNING: [SIM 212-201] RTL produces unknown value 'x' on port" 
             << PortName << ", possible cause: There are uninitialized variables in the C design."
             << endl; 
        err = true;
      }
      AESL_token.replace(x_found, 1, "0");
    } else
      no_x = true;
  }
}
struct __cosim_s8__ { char data[8]; };
struct __cosim_s10__ { char data[16]; };
struct __cosim_sC__ { char data[12]; };
extern "C" void lteCellSearch_hw_stub_wrapper(volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *);

extern "C" void apatb_lteCellSearch_hw(volatile void * __xlx_apatb_param_IN_R, volatile void * __xlx_apatb_param_IN_I, volatile void * __xlx_apatb_param_OUT_FFT, volatile void * __xlx_apatb_param_pss_id, volatile void * __xlx_apatb_param_OUT_PSS_ID, volatile void * __xlx_apatb_param_OUT_PEAK_INDEX, volatile void * __xlx_apatb_param_OUT_RSLT) {
  refine_signal_handler();
  fstream wrapc_switch_file_token;
  wrapc_switch_file_token.open(".hls_cosim_wrapc_switch.log");
  int AESL_i;
  if (wrapc_switch_file_token.good())
  {

    CodeState = ENTER_WRAPC_PC;
    static unsigned AESL_transaction_pc = 0;
    string AESL_token;
    string AESL_num;{
      static ifstream rtl_tv_out_file;
      if (!rtl_tv_out_file.is_open()) {
        rtl_tv_out_file.open(AUTOTB_TVOUT_PC_gmem);
        if (rtl_tv_out_file.good()) {
          rtl_tv_out_file >> AESL_token;
          if (AESL_token != "[[[runtime]]]")
            exit(1);
        }
      }
  
      if (rtl_tv_out_file.good()) {
        rtl_tv_out_file >> AESL_token; 
        rtl_tv_out_file >> AESL_num;  // transaction number
        if (AESL_token != "[[transaction]]") {
          cerr << "Unexpected token: " << AESL_token << endl;
          exit(1);
        }
        if (atoi(AESL_num.c_str()) == AESL_transaction_pc) {
          std::vector<sc_bv<32> > gmem_pc_buffer(96000);
          int i = 0;

          rtl_tv_out_file >> AESL_token; //data
          while (AESL_token != "[[/transaction]]"){

            RTLOutputCheckAndReplacement(AESL_token, "gmem");
  
            // push token into output port buffer
            if (AESL_token != "") {
              gmem_pc_buffer[i] = AESL_token.c_str();;
              i++;
            }
  
            rtl_tv_out_file >> AESL_token; //data or [[/transaction]]
            if (AESL_token == "[[[/runtime]]]" || rtl_tv_out_file.eof())
              exit(1);
          }
          if (i > 0) {{
            int i = 0;
            for (int j = 0, e = 96000; j < e; j += 1, ++i) {
            ((int*)__xlx_apatb_param_OUT_RSLT)[j] = gmem_pc_buffer[i].to_int64();
          }}}
        } // end transaction
      } // end file is good
    } // end post check logic bolck
  long __xlx_apatb_param_IN_R_stream_buf_final_size;
{
      static ifstream rtl_tv_out_file;
      if (!rtl_tv_out_file.is_open()) {
        rtl_tv_out_file.open(WRAPC_STREAM_SIZE_IN_IN_R_V_data_V);
        if (rtl_tv_out_file.good()) {
          rtl_tv_out_file >> AESL_token;
          if (AESL_token != "[[[runtime]]]")
            exit(1);
        }
      }
  
      if (rtl_tv_out_file.good()) {
        rtl_tv_out_file >> AESL_token; 
        rtl_tv_out_file >> AESL_num;  // transaction number
        if (AESL_token != "[[transaction]]") {
          cerr << "Unexpected token: " << AESL_token << endl;
          exit(1);
        }
        if (atoi(AESL_num.c_str()) == AESL_transaction_pc) {
          rtl_tv_out_file >> AESL_token; //data
          while (AESL_token != "[[/transaction]]"){__xlx_apatb_param_IN_R_stream_buf_final_size = atoi(AESL_token.c_str());

            rtl_tv_out_file >> AESL_token; //data or [[/transaction]]
            if (AESL_token == "[[[/runtime]]]" || rtl_tv_out_file.eof())
              exit(1);
          }
        } // end transaction
      } // end file is good
    } // end post check logic bolck
  for (long i = 0; i < __xlx_apatb_param_IN_R_stream_buf_final_size; ++i)((hls::stream<__cosim_s8__>*)__xlx_apatb_param_IN_R)->read();
long __xlx_apatb_param_IN_I_stream_buf_final_size;
{
      static ifstream rtl_tv_out_file;
      if (!rtl_tv_out_file.is_open()) {
        rtl_tv_out_file.open(WRAPC_STREAM_SIZE_IN_IN_I_V_data_V);
        if (rtl_tv_out_file.good()) {
          rtl_tv_out_file >> AESL_token;
          if (AESL_token != "[[[runtime]]]")
            exit(1);
        }
      }
  
      if (rtl_tv_out_file.good()) {
        rtl_tv_out_file >> AESL_token; 
        rtl_tv_out_file >> AESL_num;  // transaction number
        if (AESL_token != "[[transaction]]") {
          cerr << "Unexpected token: " << AESL_token << endl;
          exit(1);
        }
        if (atoi(AESL_num.c_str()) == AESL_transaction_pc) {
          rtl_tv_out_file >> AESL_token; //data
          while (AESL_token != "[[/transaction]]"){__xlx_apatb_param_IN_I_stream_buf_final_size = atoi(AESL_token.c_str());

            rtl_tv_out_file >> AESL_token; //data or [[/transaction]]
            if (AESL_token == "[[[/runtime]]]" || rtl_tv_out_file.eof())
              exit(1);
          }
        } // end transaction
      } // end file is good
    } // end post check logic bolck
  for (long i = 0; i < __xlx_apatb_param_IN_I_stream_buf_final_size; ++i)((hls::stream<__cosim_s8__>*)__xlx_apatb_param_IN_I)->read();
{sc_bv<128> xlx_stream_OUT_FFT_pc_buffer;
unsigned xlx_stream_OUT_FFT_size = 0;

          std::vector<sc_bv<64> > OUT_FFT_V_data_V_pc_buffer_Copy;
{
      static ifstream rtl_tv_out_file;
      if (!rtl_tv_out_file.is_open()) {
        rtl_tv_out_file.open(AUTOTB_TVOUT_PC_OUT_FFT_V_data_V);
        if (rtl_tv_out_file.good()) {
          rtl_tv_out_file >> AESL_token;
          if (AESL_token != "[[[runtime]]]")
            exit(1);
        }
      }
  
      if (rtl_tv_out_file.good()) {
        rtl_tv_out_file >> AESL_token; 
        rtl_tv_out_file >> AESL_num;  // transaction number
        if (AESL_token != "[[transaction]]") {
          cerr << "Unexpected token: " << AESL_token << endl;
          exit(1);
        }
        if (atoi(AESL_num.c_str()) == AESL_transaction_pc) {
          std::vector<sc_bv<64> > OUT_FFT_V_data_V_pc_buffer;
          int i = 0;

          rtl_tv_out_file >> AESL_token; //data
          while (AESL_token != "[[/transaction]]"){

            RTLOutputCheckAndReplacement(AESL_token, "OUT_FFT");
  
            // push token into output port buffer
            if (AESL_token != "") {
              OUT_FFT_V_data_V_pc_buffer.push_back(AESL_token.c_str());
              i++;
            }
  
            rtl_tv_out_file >> AESL_token; //data or [[/transaction]]
            if (AESL_token == "[[[/runtime]]]" || rtl_tv_out_file.eof())
              exit(1);
          }
          if (i > 0) {xlx_stream_OUT_FFT_size=OUT_FFT_V_data_V_pc_buffer.size();
OUT_FFT_V_data_V_pc_buffer_Copy=OUT_FFT_V_data_V_pc_buffer;
}
        } // end transaction
      } // end file is good
    } // end post check logic bolck
  
          std::vector<sc_bv<64> > OUT_FFT_V_keep_V_pc_buffer_Copy;
{
      static ifstream rtl_tv_out_file;
      if (!rtl_tv_out_file.is_open()) {
        rtl_tv_out_file.open(AUTOTB_TVOUT_PC_OUT_FFT_V_keep_V);
        if (rtl_tv_out_file.good()) {
          rtl_tv_out_file >> AESL_token;
          if (AESL_token != "[[[runtime]]]")
            exit(1);
        }
      }
  
      if (rtl_tv_out_file.good()) {
        rtl_tv_out_file >> AESL_token; 
        rtl_tv_out_file >> AESL_num;  // transaction number
        if (AESL_token != "[[transaction]]") {
          cerr << "Unexpected token: " << AESL_token << endl;
          exit(1);
        }
        if (atoi(AESL_num.c_str()) == AESL_transaction_pc) {
          std::vector<sc_bv<64> > OUT_FFT_V_keep_V_pc_buffer;
          int i = 0;

          rtl_tv_out_file >> AESL_token; //data
          while (AESL_token != "[[/transaction]]"){

            RTLOutputCheckAndReplacement(AESL_token, "OUT_FFT");
  
            // push token into output port buffer
            if (AESL_token != "") {
              OUT_FFT_V_keep_V_pc_buffer.push_back(AESL_token.c_str());
              i++;
            }
  
            rtl_tv_out_file >> AESL_token; //data or [[/transaction]]
            if (AESL_token == "[[[/runtime]]]" || rtl_tv_out_file.eof())
              exit(1);
          }
          if (i > 0) {xlx_stream_OUT_FFT_size=OUT_FFT_V_keep_V_pc_buffer.size();
OUT_FFT_V_keep_V_pc_buffer_Copy=OUT_FFT_V_keep_V_pc_buffer;
}
        } // end transaction
      } // end file is good
    } // end post check logic bolck
  
          std::vector<sc_bv<64> > OUT_FFT_V_strb_V_pc_buffer_Copy;
{
      static ifstream rtl_tv_out_file;
      if (!rtl_tv_out_file.is_open()) {
        rtl_tv_out_file.open(AUTOTB_TVOUT_PC_OUT_FFT_V_strb_V);
        if (rtl_tv_out_file.good()) {
          rtl_tv_out_file >> AESL_token;
          if (AESL_token != "[[[runtime]]]")
            exit(1);
        }
      }
  
      if (rtl_tv_out_file.good()) {
        rtl_tv_out_file >> AESL_token; 
        rtl_tv_out_file >> AESL_num;  // transaction number
        if (AESL_token != "[[transaction]]") {
          cerr << "Unexpected token: " << AESL_token << endl;
          exit(1);
        }
        if (atoi(AESL_num.c_str()) == AESL_transaction_pc) {
          std::vector<sc_bv<64> > OUT_FFT_V_strb_V_pc_buffer;
          int i = 0;

          rtl_tv_out_file >> AESL_token; //data
          while (AESL_token != "[[/transaction]]"){

            RTLOutputCheckAndReplacement(AESL_token, "OUT_FFT");
  
            // push token into output port buffer
            if (AESL_token != "") {
              OUT_FFT_V_strb_V_pc_buffer.push_back(AESL_token.c_str());
              i++;
            }
  
            rtl_tv_out_file >> AESL_token; //data or [[/transaction]]
            if (AESL_token == "[[[/runtime]]]" || rtl_tv_out_file.eof())
              exit(1);
          }
          if (i > 0) {xlx_stream_OUT_FFT_size=OUT_FFT_V_strb_V_pc_buffer.size();
OUT_FFT_V_strb_V_pc_buffer_Copy=OUT_FFT_V_strb_V_pc_buffer;
}
        } // end transaction
      } // end file is good
    } // end post check logic bolck
  
          std::vector<sc_bv<64> > OUT_FFT_V_last_V_pc_buffer_Copy;
{
      static ifstream rtl_tv_out_file;
      if (!rtl_tv_out_file.is_open()) {
        rtl_tv_out_file.open(AUTOTB_TVOUT_PC_OUT_FFT_V_last_V);
        if (rtl_tv_out_file.good()) {
          rtl_tv_out_file >> AESL_token;
          if (AESL_token != "[[[runtime]]]")
            exit(1);
        }
      }
  
      if (rtl_tv_out_file.good()) {
        rtl_tv_out_file >> AESL_token; 
        rtl_tv_out_file >> AESL_num;  // transaction number
        if (AESL_token != "[[transaction]]") {
          cerr << "Unexpected token: " << AESL_token << endl;
          exit(1);
        }
        if (atoi(AESL_num.c_str()) == AESL_transaction_pc) {
          std::vector<sc_bv<64> > OUT_FFT_V_last_V_pc_buffer;
          int i = 0;

          rtl_tv_out_file >> AESL_token; //data
          while (AESL_token != "[[/transaction]]"){

            RTLOutputCheckAndReplacement(AESL_token, "OUT_FFT");
  
            // push token into output port buffer
            if (AESL_token != "") {
              OUT_FFT_V_last_V_pc_buffer.push_back(AESL_token.c_str());
              i++;
            }
  
            rtl_tv_out_file >> AESL_token; //data or [[/transaction]]
            if (AESL_token == "[[[/runtime]]]" || rtl_tv_out_file.eof())
              exit(1);
          }
          if (i > 0) {xlx_stream_OUT_FFT_size=OUT_FFT_V_last_V_pc_buffer.size();
OUT_FFT_V_last_V_pc_buffer_Copy=OUT_FFT_V_last_V_pc_buffer;
}
        } // end transaction
      } // end file is good
    } // end post check logic bolck
  for (int j = 0, e = xlx_stream_OUT_FFT_size; j != e; ++j) {
xlx_stream_OUT_FFT_pc_buffer.range(63, 0) = OUT_FFT_V_data_V_pc_buffer_Copy[j];
xlx_stream_OUT_FFT_pc_buffer.range(71, 64) = OUT_FFT_V_keep_V_pc_buffer_Copy[j];
xlx_stream_OUT_FFT_pc_buffer.range(79, 72) = OUT_FFT_V_strb_V_pc_buffer_Copy[j];
xlx_stream_OUT_FFT_pc_buffer.range(95, 88) = OUT_FFT_V_last_V_pc_buffer_Copy[j];
__cosim_s10__ xlx_stream_elt;
((long long*)&xlx_stream_elt)[0*2+0] = xlx_stream_OUT_FFT_pc_buffer.range(63,0).to_int64();
((long long*)&xlx_stream_elt)[0*2+1] = xlx_stream_OUT_FFT_pc_buffer.range(127,64).to_int64();
((hls::stream<__cosim_s10__>*)__xlx_apatb_param_OUT_FFT)->write(xlx_stream_elt);
}}{sc_bv<96> xlx_stream_pss_id_pc_buffer;
unsigned xlx_stream_pss_id_size = 0;

          std::vector<sc_bv<32> > pss_id_V_data_V_pc_buffer_Copy;
{
      static ifstream rtl_tv_out_file;
      if (!rtl_tv_out_file.is_open()) {
        rtl_tv_out_file.open(AUTOTB_TVOUT_PC_pss_id_V_data_V);
        if (rtl_tv_out_file.good()) {
          rtl_tv_out_file >> AESL_token;
          if (AESL_token != "[[[runtime]]]")
            exit(1);
        }
      }
  
      if (rtl_tv_out_file.good()) {
        rtl_tv_out_file >> AESL_token; 
        rtl_tv_out_file >> AESL_num;  // transaction number
        if (AESL_token != "[[transaction]]") {
          cerr << "Unexpected token: " << AESL_token << endl;
          exit(1);
        }
        if (atoi(AESL_num.c_str()) == AESL_transaction_pc) {
          std::vector<sc_bv<32> > pss_id_V_data_V_pc_buffer;
          int i = 0;

          rtl_tv_out_file >> AESL_token; //data
          while (AESL_token != "[[/transaction]]"){

            RTLOutputCheckAndReplacement(AESL_token, "pss_id");
  
            // push token into output port buffer
            if (AESL_token != "") {
              pss_id_V_data_V_pc_buffer.push_back(AESL_token.c_str());
              i++;
            }
  
            rtl_tv_out_file >> AESL_token; //data or [[/transaction]]
            if (AESL_token == "[[[/runtime]]]" || rtl_tv_out_file.eof())
              exit(1);
          }
          if (i > 0) {xlx_stream_pss_id_size=pss_id_V_data_V_pc_buffer.size();
pss_id_V_data_V_pc_buffer_Copy=pss_id_V_data_V_pc_buffer;
}
        } // end transaction
      } // end file is good
    } // end post check logic bolck
  
          std::vector<sc_bv<32> > pss_id_V_keep_V_pc_buffer_Copy;
{
      static ifstream rtl_tv_out_file;
      if (!rtl_tv_out_file.is_open()) {
        rtl_tv_out_file.open(AUTOTB_TVOUT_PC_pss_id_V_keep_V);
        if (rtl_tv_out_file.good()) {
          rtl_tv_out_file >> AESL_token;
          if (AESL_token != "[[[runtime]]]")
            exit(1);
        }
      }
  
      if (rtl_tv_out_file.good()) {
        rtl_tv_out_file >> AESL_token; 
        rtl_tv_out_file >> AESL_num;  // transaction number
        if (AESL_token != "[[transaction]]") {
          cerr << "Unexpected token: " << AESL_token << endl;
          exit(1);
        }
        if (atoi(AESL_num.c_str()) == AESL_transaction_pc) {
          std::vector<sc_bv<32> > pss_id_V_keep_V_pc_buffer;
          int i = 0;

          rtl_tv_out_file >> AESL_token; //data
          while (AESL_token != "[[/transaction]]"){

            RTLOutputCheckAndReplacement(AESL_token, "pss_id");
  
            // push token into output port buffer
            if (AESL_token != "") {
              pss_id_V_keep_V_pc_buffer.push_back(AESL_token.c_str());
              i++;
            }
  
            rtl_tv_out_file >> AESL_token; //data or [[/transaction]]
            if (AESL_token == "[[[/runtime]]]" || rtl_tv_out_file.eof())
              exit(1);
          }
          if (i > 0) {xlx_stream_pss_id_size=pss_id_V_keep_V_pc_buffer.size();
pss_id_V_keep_V_pc_buffer_Copy=pss_id_V_keep_V_pc_buffer;
}
        } // end transaction
      } // end file is good
    } // end post check logic bolck
  
          std::vector<sc_bv<32> > pss_id_V_strb_V_pc_buffer_Copy;
{
      static ifstream rtl_tv_out_file;
      if (!rtl_tv_out_file.is_open()) {
        rtl_tv_out_file.open(AUTOTB_TVOUT_PC_pss_id_V_strb_V);
        if (rtl_tv_out_file.good()) {
          rtl_tv_out_file >> AESL_token;
          if (AESL_token != "[[[runtime]]]")
            exit(1);
        }
      }
  
      if (rtl_tv_out_file.good()) {
        rtl_tv_out_file >> AESL_token; 
        rtl_tv_out_file >> AESL_num;  // transaction number
        if (AESL_token != "[[transaction]]") {
          cerr << "Unexpected token: " << AESL_token << endl;
          exit(1);
        }
        if (atoi(AESL_num.c_str()) == AESL_transaction_pc) {
          std::vector<sc_bv<32> > pss_id_V_strb_V_pc_buffer;
          int i = 0;

          rtl_tv_out_file >> AESL_token; //data
          while (AESL_token != "[[/transaction]]"){

            RTLOutputCheckAndReplacement(AESL_token, "pss_id");
  
            // push token into output port buffer
            if (AESL_token != "") {
              pss_id_V_strb_V_pc_buffer.push_back(AESL_token.c_str());
              i++;
            }
  
            rtl_tv_out_file >> AESL_token; //data or [[/transaction]]
            if (AESL_token == "[[[/runtime]]]" || rtl_tv_out_file.eof())
              exit(1);
          }
          if (i > 0) {xlx_stream_pss_id_size=pss_id_V_strb_V_pc_buffer.size();
pss_id_V_strb_V_pc_buffer_Copy=pss_id_V_strb_V_pc_buffer;
}
        } // end transaction
      } // end file is good
    } // end post check logic bolck
  
          std::vector<sc_bv<32> > pss_id_V_last_V_pc_buffer_Copy;
{
      static ifstream rtl_tv_out_file;
      if (!rtl_tv_out_file.is_open()) {
        rtl_tv_out_file.open(AUTOTB_TVOUT_PC_pss_id_V_last_V);
        if (rtl_tv_out_file.good()) {
          rtl_tv_out_file >> AESL_token;
          if (AESL_token != "[[[runtime]]]")
            exit(1);
        }
      }
  
      if (rtl_tv_out_file.good()) {
        rtl_tv_out_file >> AESL_token; 
        rtl_tv_out_file >> AESL_num;  // transaction number
        if (AESL_token != "[[transaction]]") {
          cerr << "Unexpected token: " << AESL_token << endl;
          exit(1);
        }
        if (atoi(AESL_num.c_str()) == AESL_transaction_pc) {
          std::vector<sc_bv<32> > pss_id_V_last_V_pc_buffer;
          int i = 0;

          rtl_tv_out_file >> AESL_token; //data
          while (AESL_token != "[[/transaction]]"){

            RTLOutputCheckAndReplacement(AESL_token, "pss_id");
  
            // push token into output port buffer
            if (AESL_token != "") {
              pss_id_V_last_V_pc_buffer.push_back(AESL_token.c_str());
              i++;
            }
  
            rtl_tv_out_file >> AESL_token; //data or [[/transaction]]
            if (AESL_token == "[[[/runtime]]]" || rtl_tv_out_file.eof())
              exit(1);
          }
          if (i > 0) {xlx_stream_pss_id_size=pss_id_V_last_V_pc_buffer.size();
pss_id_V_last_V_pc_buffer_Copy=pss_id_V_last_V_pc_buffer;
}
        } // end transaction
      } // end file is good
    } // end post check logic bolck
  for (int j = 0, e = xlx_stream_pss_id_size; j != e; ++j) {
xlx_stream_pss_id_pc_buffer.range(31, 0) = pss_id_V_data_V_pc_buffer_Copy[j];
xlx_stream_pss_id_pc_buffer.range(39, 32) = pss_id_V_keep_V_pc_buffer_Copy[j];
xlx_stream_pss_id_pc_buffer.range(47, 40) = pss_id_V_strb_V_pc_buffer_Copy[j];
xlx_stream_pss_id_pc_buffer.range(63, 56) = pss_id_V_last_V_pc_buffer_Copy[j];
__cosim_sC__ xlx_stream_elt;
((long long*)&xlx_stream_elt)[0*1+0] = xlx_stream_pss_id_pc_buffer.range(63,0).to_int64();
((long long*)&xlx_stream_elt)[0*1+1] = xlx_stream_pss_id_pc_buffer.range(95,64).to_int64();
((hls::stream<__cosim_sC__>*)__xlx_apatb_param_pss_id)->write(xlx_stream_elt);
}}{
      static ifstream rtl_tv_out_file;
      if (!rtl_tv_out_file.is_open()) {
        rtl_tv_out_file.open(AUTOTB_TVOUT_PC_OUT_PSS_ID);
        if (rtl_tv_out_file.good()) {
          rtl_tv_out_file >> AESL_token;
          if (AESL_token != "[[[runtime]]]")
            exit(1);
        }
      }
  
      if (rtl_tv_out_file.good()) {
        rtl_tv_out_file >> AESL_token; 
        rtl_tv_out_file >> AESL_num;  // transaction number
        if (AESL_token != "[[transaction]]") {
          cerr << "Unexpected token: " << AESL_token << endl;
          exit(1);
        }
        if (atoi(AESL_num.c_str()) == AESL_transaction_pc) {
          std::vector<sc_bv<32> > OUT_PSS_ID_pc_buffer(1);
          int i = 0;

          rtl_tv_out_file >> AESL_token; //data
          while (AESL_token != "[[/transaction]]"){

            RTLOutputCheckAndReplacement(AESL_token, "OUT_PSS_ID");
  
            // push token into output port buffer
            if (AESL_token != "") {
              OUT_PSS_ID_pc_buffer[i] = AESL_token.c_str();;
              i++;
            }
  
            rtl_tv_out_file >> AESL_token; //data or [[/transaction]]
            if (AESL_token == "[[[/runtime]]]" || rtl_tv_out_file.eof())
              exit(1);
          }
          if (i > 0) {
            ((int*)__xlx_apatb_param_OUT_PSS_ID)[0] = OUT_PSS_ID_pc_buffer[0].to_int64();
          }
        } // end transaction
      } // end file is good
    } // end post check logic bolck
  {
      static ifstream rtl_tv_out_file;
      if (!rtl_tv_out_file.is_open()) {
        rtl_tv_out_file.open(AUTOTB_TVOUT_PC_OUT_PEAK_INDEX);
        if (rtl_tv_out_file.good()) {
          rtl_tv_out_file >> AESL_token;
          if (AESL_token != "[[[runtime]]]")
            exit(1);
        }
      }
  
      if (rtl_tv_out_file.good()) {
        rtl_tv_out_file >> AESL_token; 
        rtl_tv_out_file >> AESL_num;  // transaction number
        if (AESL_token != "[[transaction]]") {
          cerr << "Unexpected token: " << AESL_token << endl;
          exit(1);
        }
        if (atoi(AESL_num.c_str()) == AESL_transaction_pc) {
          std::vector<sc_bv<32> > OUT_PEAK_INDEX_pc_buffer(1);
          int i = 0;

          rtl_tv_out_file >> AESL_token; //data
          while (AESL_token != "[[/transaction]]"){

            RTLOutputCheckAndReplacement(AESL_token, "OUT_PEAK_INDEX");
  
            // push token into output port buffer
            if (AESL_token != "") {
              OUT_PEAK_INDEX_pc_buffer[i] = AESL_token.c_str();;
              i++;
            }
  
            rtl_tv_out_file >> AESL_token; //data or [[/transaction]]
            if (AESL_token == "[[[/runtime]]]" || rtl_tv_out_file.eof())
              exit(1);
          }
          if (i > 0) {
            ((int*)__xlx_apatb_param_OUT_PEAK_INDEX)[0] = OUT_PEAK_INDEX_pc_buffer[0].to_int64();
          }
        } // end transaction
      } // end file is good
    } // end post check logic bolck
  
    AESL_transaction_pc++;
    return ;
  }
static unsigned AESL_transaction;
static AESL_FILE_HANDLER aesl_fh;
static INTER_TCL_FILE tcl_file(INTER_TCL);
std::vector<char> __xlx_sprintf_buffer(1024);
CodeState = ENTER_WRAPC;
//gmem
aesl_fh.touch(AUTOTB_TVIN_gmem);
aesl_fh.touch(AUTOTB_TVOUT_gmem);
//IN_R
aesl_fh.touch(AUTOTB_TVIN_IN_R_V_data_V);
aesl_fh.touch(AUTOTB_TVOUT_IN_R_V_data_V);
aesl_fh.touch(AUTOTB_TVIN_IN_R_V_keep_V);
aesl_fh.touch(AUTOTB_TVOUT_IN_R_V_keep_V);
aesl_fh.touch(AUTOTB_TVIN_IN_R_V_strb_V);
aesl_fh.touch(AUTOTB_TVOUT_IN_R_V_strb_V);
aesl_fh.touch(AUTOTB_TVIN_IN_R_V_last_V);
aesl_fh.touch(AUTOTB_TVOUT_IN_R_V_last_V);
aesl_fh.touch(WRAPC_STREAM_SIZE_IN_IN_R_V_data_V);
aesl_fh.touch(WRAPC_STREAM_INGRESS_STATUS_IN_R_V_data_V);
aesl_fh.touch(WRAPC_STREAM_SIZE_IN_IN_R_V_keep_V);
aesl_fh.touch(WRAPC_STREAM_INGRESS_STATUS_IN_R_V_keep_V);
aesl_fh.touch(WRAPC_STREAM_SIZE_IN_IN_R_V_strb_V);
aesl_fh.touch(WRAPC_STREAM_INGRESS_STATUS_IN_R_V_strb_V);
aesl_fh.touch(WRAPC_STREAM_SIZE_IN_IN_R_V_last_V);
aesl_fh.touch(WRAPC_STREAM_INGRESS_STATUS_IN_R_V_last_V);
//IN_I
aesl_fh.touch(AUTOTB_TVIN_IN_I_V_data_V);
aesl_fh.touch(AUTOTB_TVOUT_IN_I_V_data_V);
aesl_fh.touch(AUTOTB_TVIN_IN_I_V_keep_V);
aesl_fh.touch(AUTOTB_TVOUT_IN_I_V_keep_V);
aesl_fh.touch(AUTOTB_TVIN_IN_I_V_strb_V);
aesl_fh.touch(AUTOTB_TVOUT_IN_I_V_strb_V);
aesl_fh.touch(AUTOTB_TVIN_IN_I_V_last_V);
aesl_fh.touch(AUTOTB_TVOUT_IN_I_V_last_V);
aesl_fh.touch(WRAPC_STREAM_SIZE_IN_IN_I_V_data_V);
aesl_fh.touch(WRAPC_STREAM_INGRESS_STATUS_IN_I_V_data_V);
aesl_fh.touch(WRAPC_STREAM_SIZE_IN_IN_I_V_keep_V);
aesl_fh.touch(WRAPC_STREAM_INGRESS_STATUS_IN_I_V_keep_V);
aesl_fh.touch(WRAPC_STREAM_SIZE_IN_IN_I_V_strb_V);
aesl_fh.touch(WRAPC_STREAM_INGRESS_STATUS_IN_I_V_strb_V);
aesl_fh.touch(WRAPC_STREAM_SIZE_IN_IN_I_V_last_V);
aesl_fh.touch(WRAPC_STREAM_INGRESS_STATUS_IN_I_V_last_V);
//OUT_FFT
aesl_fh.touch(AUTOTB_TVIN_OUT_FFT_V_data_V);
aesl_fh.touch(AUTOTB_TVOUT_OUT_FFT_V_data_V);
aesl_fh.touch(AUTOTB_TVIN_OUT_FFT_V_keep_V);
aesl_fh.touch(AUTOTB_TVOUT_OUT_FFT_V_keep_V);
aesl_fh.touch(AUTOTB_TVIN_OUT_FFT_V_strb_V);
aesl_fh.touch(AUTOTB_TVOUT_OUT_FFT_V_strb_V);
aesl_fh.touch(AUTOTB_TVIN_OUT_FFT_V_last_V);
aesl_fh.touch(AUTOTB_TVOUT_OUT_FFT_V_last_V);
aesl_fh.touch(WRAPC_STREAM_SIZE_OUT_OUT_FFT_V_data_V);
aesl_fh.touch(WRAPC_STREAM_EGRESS_STATUS_OUT_FFT_V_data_V);
aesl_fh.touch(WRAPC_STREAM_SIZE_OUT_OUT_FFT_V_keep_V);
aesl_fh.touch(WRAPC_STREAM_EGRESS_STATUS_OUT_FFT_V_keep_V);
aesl_fh.touch(WRAPC_STREAM_SIZE_OUT_OUT_FFT_V_strb_V);
aesl_fh.touch(WRAPC_STREAM_EGRESS_STATUS_OUT_FFT_V_strb_V);
aesl_fh.touch(WRAPC_STREAM_SIZE_OUT_OUT_FFT_V_last_V);
aesl_fh.touch(WRAPC_STREAM_EGRESS_STATUS_OUT_FFT_V_last_V);
//pss_id
aesl_fh.touch(AUTOTB_TVIN_pss_id_V_data_V);
aesl_fh.touch(AUTOTB_TVOUT_pss_id_V_data_V);
aesl_fh.touch(AUTOTB_TVIN_pss_id_V_keep_V);
aesl_fh.touch(AUTOTB_TVOUT_pss_id_V_keep_V);
aesl_fh.touch(AUTOTB_TVIN_pss_id_V_strb_V);
aesl_fh.touch(AUTOTB_TVOUT_pss_id_V_strb_V);
aesl_fh.touch(AUTOTB_TVIN_pss_id_V_last_V);
aesl_fh.touch(AUTOTB_TVOUT_pss_id_V_last_V);
aesl_fh.touch(WRAPC_STREAM_SIZE_OUT_pss_id_V_data_V);
aesl_fh.touch(WRAPC_STREAM_EGRESS_STATUS_pss_id_V_data_V);
aesl_fh.touch(WRAPC_STREAM_SIZE_OUT_pss_id_V_keep_V);
aesl_fh.touch(WRAPC_STREAM_EGRESS_STATUS_pss_id_V_keep_V);
aesl_fh.touch(WRAPC_STREAM_SIZE_OUT_pss_id_V_strb_V);
aesl_fh.touch(WRAPC_STREAM_EGRESS_STATUS_pss_id_V_strb_V);
aesl_fh.touch(WRAPC_STREAM_SIZE_OUT_pss_id_V_last_V);
aesl_fh.touch(WRAPC_STREAM_EGRESS_STATUS_pss_id_V_last_V);
//OUT_PSS_ID
aesl_fh.touch(AUTOTB_TVIN_OUT_PSS_ID);
aesl_fh.touch(AUTOTB_TVOUT_OUT_PSS_ID);
//OUT_PEAK_INDEX
aesl_fh.touch(AUTOTB_TVIN_OUT_PEAK_INDEX);
aesl_fh.touch(AUTOTB_TVOUT_OUT_PEAK_INDEX);
//OUT_RSLT
aesl_fh.touch(AUTOTB_TVIN_OUT_RSLT);
aesl_fh.touch(AUTOTB_TVOUT_OUT_RSLT);
CodeState = DUMP_INPUTS;
unsigned __xlx_offset_byte_param_OUT_RSLT = 0;
// print gmem Transactions
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVIN_gmem, __xlx_sprintf_buffer.data());
  {  __xlx_offset_byte_param_OUT_RSLT = 0*4;
  if (__xlx_apatb_param_OUT_RSLT) {
    for (int j = 0  - 0, e = 96000 - 0; j != e; ++j) {
sc_bv<32> __xlx_tmp_lv = ((int*)__xlx_apatb_param_OUT_RSLT)[j];

    sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_lv.to_string(SC_HEX).c_str());
    aesl_fh.write(AUTOTB_TVIN_gmem, __xlx_sprintf_buffer.data()); 
      }
  }
}
  tcl_file.set_num(96000, &tcl_file.gmem_depth);
  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVIN_gmem, __xlx_sprintf_buffer.data());
}
std::vector<__cosim_s8__> __xlx_apatb_param_IN_R_stream_buf;
{
  while (!((hls::stream<__cosim_s8__>*)__xlx_apatb_param_IN_R)->empty())
    __xlx_apatb_param_IN_R_stream_buf.push_back(((hls::stream<__cosim_s8__>*)__xlx_apatb_param_IN_R)->read());
  for (int i = 0; i < __xlx_apatb_param_IN_R_stream_buf.size(); ++i)
    ((hls::stream<__cosim_s8__>*)__xlx_apatb_param_IN_R)->write(__xlx_apatb_param_IN_R_stream_buf[i]);
  }
long __xlx_apatb_param_IN_R_stream_buf_size = ((hls::stream<__cosim_s8__>*)__xlx_apatb_param_IN_R)->size();
std::vector<__cosim_s8__> __xlx_apatb_param_IN_I_stream_buf;
{
  while (!((hls::stream<__cosim_s8__>*)__xlx_apatb_param_IN_I)->empty())
    __xlx_apatb_param_IN_I_stream_buf.push_back(((hls::stream<__cosim_s8__>*)__xlx_apatb_param_IN_I)->read());
  for (int i = 0; i < __xlx_apatb_param_IN_I_stream_buf.size(); ++i)
    ((hls::stream<__cosim_s8__>*)__xlx_apatb_param_IN_I)->write(__xlx_apatb_param_IN_I_stream_buf[i]);
  }
long __xlx_apatb_param_IN_I_stream_buf_size = ((hls::stream<__cosim_s8__>*)__xlx_apatb_param_IN_I)->size();
std::vector<__cosim_s10__> __xlx_apatb_param_OUT_FFT_stream_buf;
long __xlx_apatb_param_OUT_FFT_stream_buf_size = ((hls::stream<__cosim_s10__>*)__xlx_apatb_param_OUT_FFT)->size();
std::vector<__cosim_sC__> __xlx_apatb_param_pss_id_stream_buf;
long __xlx_apatb_param_pss_id_stream_buf_size = ((hls::stream<__cosim_sC__>*)__xlx_apatb_param_pss_id)->size();
// print OUT_PSS_ID Transactions
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVIN_OUT_PSS_ID, __xlx_sprintf_buffer.data());
  {
    sc_bv<32> __xlx_tmp_lv = *((int*)__xlx_apatb_param_OUT_PSS_ID);

    sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_lv.to_string(SC_HEX).c_str());
    aesl_fh.write(AUTOTB_TVIN_OUT_PSS_ID, __xlx_sprintf_buffer.data()); 
  }
  tcl_file.set_num(1, &tcl_file.OUT_PSS_ID_depth);
  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVIN_OUT_PSS_ID, __xlx_sprintf_buffer.data());
}
// print OUT_PEAK_INDEX Transactions
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVIN_OUT_PEAK_INDEX, __xlx_sprintf_buffer.data());
  {
    sc_bv<32> __xlx_tmp_lv = *((int*)__xlx_apatb_param_OUT_PEAK_INDEX);

    sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_lv.to_string(SC_HEX).c_str());
    aesl_fh.write(AUTOTB_TVIN_OUT_PEAK_INDEX, __xlx_sprintf_buffer.data()); 
  }
  tcl_file.set_num(1, &tcl_file.OUT_PEAK_INDEX_depth);
  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVIN_OUT_PEAK_INDEX, __xlx_sprintf_buffer.data());
}
// print OUT_RSLT Transactions
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVIN_OUT_RSLT, __xlx_sprintf_buffer.data());
  {
    sc_bv<64> __xlx_tmp_lv = __xlx_offset_byte_param_OUT_RSLT;

    sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_lv.to_string(SC_HEX).c_str());
    aesl_fh.write(AUTOTB_TVIN_OUT_RSLT, __xlx_sprintf_buffer.data()); 
  }
  tcl_file.set_num(1, &tcl_file.OUT_RSLT_depth);
  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVIN_OUT_RSLT, __xlx_sprintf_buffer.data());
}
CodeState = CALL_C_DUT;
lteCellSearch_hw_stub_wrapper(__xlx_apatb_param_IN_R, __xlx_apatb_param_IN_I, __xlx_apatb_param_OUT_FFT, __xlx_apatb_param_pss_id, __xlx_apatb_param_OUT_PSS_ID, __xlx_apatb_param_OUT_PEAK_INDEX, __xlx_apatb_param_OUT_RSLT);
CodeState = DUMP_OUTPUTS;
// print gmem Transactions
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVOUT_gmem, __xlx_sprintf_buffer.data());
  {  __xlx_offset_byte_param_OUT_RSLT = 0*4;
  if (__xlx_apatb_param_OUT_RSLT) {
    for (int j = 0  - 0, e = 96000 - 0; j != e; ++j) {
sc_bv<32> __xlx_tmp_lv = ((int*)__xlx_apatb_param_OUT_RSLT)[j];

    sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_lv.to_string(SC_HEX).c_str());
    aesl_fh.write(AUTOTB_TVOUT_gmem, __xlx_sprintf_buffer.data()); 
      }
  }
}
  tcl_file.set_num(96000, &tcl_file.gmem_depth);
  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVOUT_gmem, __xlx_sprintf_buffer.data());
}
long __xlx_apatb_param_IN_R_stream_buf_final_size = __xlx_apatb_param_IN_R_stream_buf_size - ((hls::stream<__cosim_s8__>*)__xlx_apatb_param_IN_R)->size();

  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVIN_IN_R_V_data_V, __xlx_sprintf_buffer.data());
  
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVIN_IN_R_V_keep_V, __xlx_sprintf_buffer.data());
  
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVIN_IN_R_V_strb_V, __xlx_sprintf_buffer.data());
  
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVIN_IN_R_V_last_V, __xlx_sprintf_buffer.data());
  for (int j = 0, e = __xlx_apatb_param_IN_R_stream_buf_final_size; j != e; ++j) {
sc_bv<64> __xlx_tmp_lv = ((long long*)&__xlx_apatb_param_IN_R_stream_buf[j])[0];
sc_bv<16> __xlx_tmp_0_lv = __xlx_tmp_lv.range(15, 0);
sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_0_lv.to_string(SC_HEX).c_str());
aesl_fh.write(AUTOTB_TVIN_IN_R_V_data_V, __xlx_sprintf_buffer.data());
sc_bv<8> __xlx_tmp_1_lv = __xlx_tmp_lv.range(23, 16);
sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_1_lv.to_string(SC_HEX).c_str());
aesl_fh.write(AUTOTB_TVIN_IN_R_V_keep_V, __xlx_sprintf_buffer.data());
sc_bv<8> __xlx_tmp_2_lv = __xlx_tmp_lv.range(31, 24);
sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_2_lv.to_string(SC_HEX).c_str());
aesl_fh.write(AUTOTB_TVIN_IN_R_V_strb_V, __xlx_sprintf_buffer.data());
sc_bv<8> __xlx_tmp_4_lv = __xlx_tmp_lv.range(47, 40);
sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_4_lv.to_string(SC_HEX).c_str());
aesl_fh.write(AUTOTB_TVIN_IN_R_V_last_V, __xlx_sprintf_buffer.data());
}
tcl_file.set_num(__xlx_apatb_param_IN_R_stream_buf_final_size, &tcl_file.IN_R_V_data_V_depth);

  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVIN_IN_R_V_data_V, __xlx_sprintf_buffer.data());
tcl_file.set_num(__xlx_apatb_param_IN_R_stream_buf_final_size, &tcl_file.IN_R_V_keep_V_depth);

  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVIN_IN_R_V_keep_V, __xlx_sprintf_buffer.data());
tcl_file.set_num(__xlx_apatb_param_IN_R_stream_buf_final_size, &tcl_file.IN_R_V_strb_V_depth);

  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVIN_IN_R_V_strb_V, __xlx_sprintf_buffer.data());
tcl_file.set_num(__xlx_apatb_param_IN_R_stream_buf_final_size, &tcl_file.IN_R_V_last_V_depth);

  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVIN_IN_R_V_last_V, __xlx_sprintf_buffer.data());

// dump stream ingress status to file

// dump stream ingress status to file
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_IN_R_V_data_V, __xlx_sprintf_buffer.data());
  if (__xlx_apatb_param_IN_R_stream_buf_final_size > 0) {
  long IN_R_V_data_V_stream_ingress_size = __xlx_apatb_param_IN_R_stream_buf_size;
sprintf(__xlx_sprintf_buffer.data(), "%d\n", IN_R_V_data_V_stream_ingress_size);
 aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_IN_R_V_data_V, __xlx_sprintf_buffer.data());
  for (int j = 0, e = __xlx_apatb_param_IN_R_stream_buf_final_size; j != e; j++) {
    IN_R_V_data_V_stream_ingress_size--;
sprintf(__xlx_sprintf_buffer.data(), "%d\n", IN_R_V_data_V_stream_ingress_size);
 aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_IN_R_V_data_V, __xlx_sprintf_buffer.data());
  }
} else {
  long IN_R_V_data_V_stream_ingress_size = 0;
sprintf(__xlx_sprintf_buffer.data(), "%d\n", IN_R_V_data_V_stream_ingress_size);
 aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_IN_R_V_data_V, __xlx_sprintf_buffer.data());
}

  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_IN_R_V_data_V, __xlx_sprintf_buffer.data());
}
// dump stream ingress status to file
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_IN_R_V_keep_V, __xlx_sprintf_buffer.data());
  if (__xlx_apatb_param_IN_R_stream_buf_final_size > 0) {
  long IN_R_V_keep_V_stream_ingress_size = __xlx_apatb_param_IN_R_stream_buf_size;
sprintf(__xlx_sprintf_buffer.data(), "%d\n", IN_R_V_keep_V_stream_ingress_size);
 aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_IN_R_V_keep_V, __xlx_sprintf_buffer.data());
  for (int j = 0, e = __xlx_apatb_param_IN_R_stream_buf_final_size; j != e; j++) {
    IN_R_V_keep_V_stream_ingress_size--;
sprintf(__xlx_sprintf_buffer.data(), "%d\n", IN_R_V_keep_V_stream_ingress_size);
 aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_IN_R_V_keep_V, __xlx_sprintf_buffer.data());
  }
} else {
  long IN_R_V_keep_V_stream_ingress_size = 0;
sprintf(__xlx_sprintf_buffer.data(), "%d\n", IN_R_V_keep_V_stream_ingress_size);
 aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_IN_R_V_keep_V, __xlx_sprintf_buffer.data());
}

  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_IN_R_V_keep_V, __xlx_sprintf_buffer.data());
}
// dump stream ingress status to file
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_IN_R_V_strb_V, __xlx_sprintf_buffer.data());
  if (__xlx_apatb_param_IN_R_stream_buf_final_size > 0) {
  long IN_R_V_strb_V_stream_ingress_size = __xlx_apatb_param_IN_R_stream_buf_size;
sprintf(__xlx_sprintf_buffer.data(), "%d\n", IN_R_V_strb_V_stream_ingress_size);
 aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_IN_R_V_strb_V, __xlx_sprintf_buffer.data());
  for (int j = 0, e = __xlx_apatb_param_IN_R_stream_buf_final_size; j != e; j++) {
    IN_R_V_strb_V_stream_ingress_size--;
sprintf(__xlx_sprintf_buffer.data(), "%d\n", IN_R_V_strb_V_stream_ingress_size);
 aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_IN_R_V_strb_V, __xlx_sprintf_buffer.data());
  }
} else {
  long IN_R_V_strb_V_stream_ingress_size = 0;
sprintf(__xlx_sprintf_buffer.data(), "%d\n", IN_R_V_strb_V_stream_ingress_size);
 aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_IN_R_V_strb_V, __xlx_sprintf_buffer.data());
}

  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_IN_R_V_strb_V, __xlx_sprintf_buffer.data());
}
// dump stream ingress status to file
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_IN_R_V_last_V, __xlx_sprintf_buffer.data());
  if (__xlx_apatb_param_IN_R_stream_buf_final_size > 0) {
  long IN_R_V_last_V_stream_ingress_size = __xlx_apatb_param_IN_R_stream_buf_size;
sprintf(__xlx_sprintf_buffer.data(), "%d\n", IN_R_V_last_V_stream_ingress_size);
 aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_IN_R_V_last_V, __xlx_sprintf_buffer.data());
  for (int j = 0, e = __xlx_apatb_param_IN_R_stream_buf_final_size; j != e; j++) {
    IN_R_V_last_V_stream_ingress_size--;
sprintf(__xlx_sprintf_buffer.data(), "%d\n", IN_R_V_last_V_stream_ingress_size);
 aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_IN_R_V_last_V, __xlx_sprintf_buffer.data());
  }
} else {
  long IN_R_V_last_V_stream_ingress_size = 0;
sprintf(__xlx_sprintf_buffer.data(), "%d\n", IN_R_V_last_V_stream_ingress_size);
 aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_IN_R_V_last_V, __xlx_sprintf_buffer.data());
}

  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_IN_R_V_last_V, __xlx_sprintf_buffer.data());
}{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(WRAPC_STREAM_SIZE_IN_IN_R_V_data_V, __xlx_sprintf_buffer.data());
  sprintf(__xlx_sprintf_buffer.data(), "%d\n", __xlx_apatb_param_IN_R_stream_buf_final_size);
 aesl_fh.write(WRAPC_STREAM_SIZE_IN_IN_R_V_data_V, __xlx_sprintf_buffer.data());

  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(WRAPC_STREAM_SIZE_IN_IN_R_V_data_V, __xlx_sprintf_buffer.data());
}{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(WRAPC_STREAM_SIZE_IN_IN_R_V_keep_V, __xlx_sprintf_buffer.data());
  sprintf(__xlx_sprintf_buffer.data(), "%d\n", __xlx_apatb_param_IN_R_stream_buf_final_size);
 aesl_fh.write(WRAPC_STREAM_SIZE_IN_IN_R_V_keep_V, __xlx_sprintf_buffer.data());

  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(WRAPC_STREAM_SIZE_IN_IN_R_V_keep_V, __xlx_sprintf_buffer.data());
}{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(WRAPC_STREAM_SIZE_IN_IN_R_V_strb_V, __xlx_sprintf_buffer.data());
  sprintf(__xlx_sprintf_buffer.data(), "%d\n", __xlx_apatb_param_IN_R_stream_buf_final_size);
 aesl_fh.write(WRAPC_STREAM_SIZE_IN_IN_R_V_strb_V, __xlx_sprintf_buffer.data());

  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(WRAPC_STREAM_SIZE_IN_IN_R_V_strb_V, __xlx_sprintf_buffer.data());
}{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(WRAPC_STREAM_SIZE_IN_IN_R_V_last_V, __xlx_sprintf_buffer.data());
  sprintf(__xlx_sprintf_buffer.data(), "%d\n", __xlx_apatb_param_IN_R_stream_buf_final_size);
 aesl_fh.write(WRAPC_STREAM_SIZE_IN_IN_R_V_last_V, __xlx_sprintf_buffer.data());

  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(WRAPC_STREAM_SIZE_IN_IN_R_V_last_V, __xlx_sprintf_buffer.data());
}long __xlx_apatb_param_IN_I_stream_buf_final_size = __xlx_apatb_param_IN_I_stream_buf_size - ((hls::stream<__cosim_s8__>*)__xlx_apatb_param_IN_I)->size();

  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVIN_IN_I_V_data_V, __xlx_sprintf_buffer.data());
  
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVIN_IN_I_V_keep_V, __xlx_sprintf_buffer.data());
  
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVIN_IN_I_V_strb_V, __xlx_sprintf_buffer.data());
  
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVIN_IN_I_V_last_V, __xlx_sprintf_buffer.data());
  for (int j = 0, e = __xlx_apatb_param_IN_I_stream_buf_final_size; j != e; ++j) {
sc_bv<64> __xlx_tmp_lv = ((long long*)&__xlx_apatb_param_IN_I_stream_buf[j])[0];
sc_bv<16> __xlx_tmp_0_lv = __xlx_tmp_lv.range(15, 0);
sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_0_lv.to_string(SC_HEX).c_str());
aesl_fh.write(AUTOTB_TVIN_IN_I_V_data_V, __xlx_sprintf_buffer.data());
sc_bv<8> __xlx_tmp_1_lv = __xlx_tmp_lv.range(23, 16);
sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_1_lv.to_string(SC_HEX).c_str());
aesl_fh.write(AUTOTB_TVIN_IN_I_V_keep_V, __xlx_sprintf_buffer.data());
sc_bv<8> __xlx_tmp_2_lv = __xlx_tmp_lv.range(31, 24);
sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_2_lv.to_string(SC_HEX).c_str());
aesl_fh.write(AUTOTB_TVIN_IN_I_V_strb_V, __xlx_sprintf_buffer.data());
sc_bv<8> __xlx_tmp_4_lv = __xlx_tmp_lv.range(47, 40);
sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_4_lv.to_string(SC_HEX).c_str());
aesl_fh.write(AUTOTB_TVIN_IN_I_V_last_V, __xlx_sprintf_buffer.data());
}
tcl_file.set_num(__xlx_apatb_param_IN_I_stream_buf_final_size, &tcl_file.IN_I_V_data_V_depth);

  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVIN_IN_I_V_data_V, __xlx_sprintf_buffer.data());
tcl_file.set_num(__xlx_apatb_param_IN_I_stream_buf_final_size, &tcl_file.IN_I_V_keep_V_depth);

  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVIN_IN_I_V_keep_V, __xlx_sprintf_buffer.data());
tcl_file.set_num(__xlx_apatb_param_IN_I_stream_buf_final_size, &tcl_file.IN_I_V_strb_V_depth);

  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVIN_IN_I_V_strb_V, __xlx_sprintf_buffer.data());
tcl_file.set_num(__xlx_apatb_param_IN_I_stream_buf_final_size, &tcl_file.IN_I_V_last_V_depth);

  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVIN_IN_I_V_last_V, __xlx_sprintf_buffer.data());

// dump stream ingress status to file

// dump stream ingress status to file
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_IN_I_V_data_V, __xlx_sprintf_buffer.data());
  if (__xlx_apatb_param_IN_I_stream_buf_final_size > 0) {
  long IN_I_V_data_V_stream_ingress_size = __xlx_apatb_param_IN_I_stream_buf_size;
sprintf(__xlx_sprintf_buffer.data(), "%d\n", IN_I_V_data_V_stream_ingress_size);
 aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_IN_I_V_data_V, __xlx_sprintf_buffer.data());
  for (int j = 0, e = __xlx_apatb_param_IN_I_stream_buf_final_size; j != e; j++) {
    IN_I_V_data_V_stream_ingress_size--;
sprintf(__xlx_sprintf_buffer.data(), "%d\n", IN_I_V_data_V_stream_ingress_size);
 aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_IN_I_V_data_V, __xlx_sprintf_buffer.data());
  }
} else {
  long IN_I_V_data_V_stream_ingress_size = 0;
sprintf(__xlx_sprintf_buffer.data(), "%d\n", IN_I_V_data_V_stream_ingress_size);
 aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_IN_I_V_data_V, __xlx_sprintf_buffer.data());
}

  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_IN_I_V_data_V, __xlx_sprintf_buffer.data());
}
// dump stream ingress status to file
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_IN_I_V_keep_V, __xlx_sprintf_buffer.data());
  if (__xlx_apatb_param_IN_I_stream_buf_final_size > 0) {
  long IN_I_V_keep_V_stream_ingress_size = __xlx_apatb_param_IN_I_stream_buf_size;
sprintf(__xlx_sprintf_buffer.data(), "%d\n", IN_I_V_keep_V_stream_ingress_size);
 aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_IN_I_V_keep_V, __xlx_sprintf_buffer.data());
  for (int j = 0, e = __xlx_apatb_param_IN_I_stream_buf_final_size; j != e; j++) {
    IN_I_V_keep_V_stream_ingress_size--;
sprintf(__xlx_sprintf_buffer.data(), "%d\n", IN_I_V_keep_V_stream_ingress_size);
 aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_IN_I_V_keep_V, __xlx_sprintf_buffer.data());
  }
} else {
  long IN_I_V_keep_V_stream_ingress_size = 0;
sprintf(__xlx_sprintf_buffer.data(), "%d\n", IN_I_V_keep_V_stream_ingress_size);
 aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_IN_I_V_keep_V, __xlx_sprintf_buffer.data());
}

  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_IN_I_V_keep_V, __xlx_sprintf_buffer.data());
}
// dump stream ingress status to file
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_IN_I_V_strb_V, __xlx_sprintf_buffer.data());
  if (__xlx_apatb_param_IN_I_stream_buf_final_size > 0) {
  long IN_I_V_strb_V_stream_ingress_size = __xlx_apatb_param_IN_I_stream_buf_size;
sprintf(__xlx_sprintf_buffer.data(), "%d\n", IN_I_V_strb_V_stream_ingress_size);
 aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_IN_I_V_strb_V, __xlx_sprintf_buffer.data());
  for (int j = 0, e = __xlx_apatb_param_IN_I_stream_buf_final_size; j != e; j++) {
    IN_I_V_strb_V_stream_ingress_size--;
sprintf(__xlx_sprintf_buffer.data(), "%d\n", IN_I_V_strb_V_stream_ingress_size);
 aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_IN_I_V_strb_V, __xlx_sprintf_buffer.data());
  }
} else {
  long IN_I_V_strb_V_stream_ingress_size = 0;
sprintf(__xlx_sprintf_buffer.data(), "%d\n", IN_I_V_strb_V_stream_ingress_size);
 aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_IN_I_V_strb_V, __xlx_sprintf_buffer.data());
}

  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_IN_I_V_strb_V, __xlx_sprintf_buffer.data());
}
// dump stream ingress status to file
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_IN_I_V_last_V, __xlx_sprintf_buffer.data());
  if (__xlx_apatb_param_IN_I_stream_buf_final_size > 0) {
  long IN_I_V_last_V_stream_ingress_size = __xlx_apatb_param_IN_I_stream_buf_size;
sprintf(__xlx_sprintf_buffer.data(), "%d\n", IN_I_V_last_V_stream_ingress_size);
 aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_IN_I_V_last_V, __xlx_sprintf_buffer.data());
  for (int j = 0, e = __xlx_apatb_param_IN_I_stream_buf_final_size; j != e; j++) {
    IN_I_V_last_V_stream_ingress_size--;
sprintf(__xlx_sprintf_buffer.data(), "%d\n", IN_I_V_last_V_stream_ingress_size);
 aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_IN_I_V_last_V, __xlx_sprintf_buffer.data());
  }
} else {
  long IN_I_V_last_V_stream_ingress_size = 0;
sprintf(__xlx_sprintf_buffer.data(), "%d\n", IN_I_V_last_V_stream_ingress_size);
 aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_IN_I_V_last_V, __xlx_sprintf_buffer.data());
}

  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_IN_I_V_last_V, __xlx_sprintf_buffer.data());
}{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(WRAPC_STREAM_SIZE_IN_IN_I_V_data_V, __xlx_sprintf_buffer.data());
  sprintf(__xlx_sprintf_buffer.data(), "%d\n", __xlx_apatb_param_IN_I_stream_buf_final_size);
 aesl_fh.write(WRAPC_STREAM_SIZE_IN_IN_I_V_data_V, __xlx_sprintf_buffer.data());

  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(WRAPC_STREAM_SIZE_IN_IN_I_V_data_V, __xlx_sprintf_buffer.data());
}{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(WRAPC_STREAM_SIZE_IN_IN_I_V_keep_V, __xlx_sprintf_buffer.data());
  sprintf(__xlx_sprintf_buffer.data(), "%d\n", __xlx_apatb_param_IN_I_stream_buf_final_size);
 aesl_fh.write(WRAPC_STREAM_SIZE_IN_IN_I_V_keep_V, __xlx_sprintf_buffer.data());

  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(WRAPC_STREAM_SIZE_IN_IN_I_V_keep_V, __xlx_sprintf_buffer.data());
}{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(WRAPC_STREAM_SIZE_IN_IN_I_V_strb_V, __xlx_sprintf_buffer.data());
  sprintf(__xlx_sprintf_buffer.data(), "%d\n", __xlx_apatb_param_IN_I_stream_buf_final_size);
 aesl_fh.write(WRAPC_STREAM_SIZE_IN_IN_I_V_strb_V, __xlx_sprintf_buffer.data());

  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(WRAPC_STREAM_SIZE_IN_IN_I_V_strb_V, __xlx_sprintf_buffer.data());
}{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(WRAPC_STREAM_SIZE_IN_IN_I_V_last_V, __xlx_sprintf_buffer.data());
  sprintf(__xlx_sprintf_buffer.data(), "%d\n", __xlx_apatb_param_IN_I_stream_buf_final_size);
 aesl_fh.write(WRAPC_STREAM_SIZE_IN_IN_I_V_last_V, __xlx_sprintf_buffer.data());

  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(WRAPC_STREAM_SIZE_IN_IN_I_V_last_V, __xlx_sprintf_buffer.data());
}
//********************** dump C output stream *******************
long __xlx_apatb_param_OUT_FFT_stream_buf_final_size = ((hls::stream<__cosim_s10__>*)__xlx_apatb_param_OUT_FFT)->size() - __xlx_apatb_param_OUT_FFT_stream_buf_size;
{
  while (!((hls::stream<__cosim_s10__>*)__xlx_apatb_param_OUT_FFT)->empty())
    __xlx_apatb_param_OUT_FFT_stream_buf.push_back(((hls::stream<__cosim_s10__>*)__xlx_apatb_param_OUT_FFT)->read());
  for (int i = 0; i < __xlx_apatb_param_OUT_FFT_stream_buf.size(); ++i)
    ((hls::stream<__cosim_s10__>*)__xlx_apatb_param_OUT_FFT)->write(__xlx_apatb_param_OUT_FFT_stream_buf[i]);
  }

  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVOUT_OUT_FFT_V_data_V, __xlx_sprintf_buffer.data());
  
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVOUT_OUT_FFT_V_keep_V, __xlx_sprintf_buffer.data());
  
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVOUT_OUT_FFT_V_strb_V, __xlx_sprintf_buffer.data());
  
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVOUT_OUT_FFT_V_last_V, __xlx_sprintf_buffer.data());
  for (int j = 0, e = __xlx_apatb_param_OUT_FFT_stream_buf_final_size; j != e; ++j) {
sc_bv<128> __xlx_tmp_lv;
__xlx_tmp_lv.range(63,0) = ((long long*)&__xlx_apatb_param_OUT_FFT_stream_buf[__xlx_apatb_param_OUT_FFT_stream_buf_size+j])[0*2+0];
__xlx_tmp_lv.range(127,64) = ((long long*)&__xlx_apatb_param_OUT_FFT_stream_buf[__xlx_apatb_param_OUT_FFT_stream_buf_size+j])[0*2+1];
sc_bv<64> __xlx_tmp_0_lv = __xlx_tmp_lv.range(63, 0);
sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_0_lv.to_string(SC_HEX).c_str());
aesl_fh.write(AUTOTB_TVOUT_OUT_FFT_V_data_V, __xlx_sprintf_buffer.data());
sc_bv<8> __xlx_tmp_1_lv = __xlx_tmp_lv.range(71, 64);
sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_1_lv.to_string(SC_HEX).c_str());
aesl_fh.write(AUTOTB_TVOUT_OUT_FFT_V_keep_V, __xlx_sprintf_buffer.data());
sc_bv<8> __xlx_tmp_2_lv = __xlx_tmp_lv.range(79, 72);
sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_2_lv.to_string(SC_HEX).c_str());
aesl_fh.write(AUTOTB_TVOUT_OUT_FFT_V_strb_V, __xlx_sprintf_buffer.data());
sc_bv<8> __xlx_tmp_4_lv = __xlx_tmp_lv.range(95, 88);
sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_4_lv.to_string(SC_HEX).c_str());
aesl_fh.write(AUTOTB_TVOUT_OUT_FFT_V_last_V, __xlx_sprintf_buffer.data());
}
tcl_file.set_num(__xlx_apatb_param_OUT_FFT_stream_buf_final_size, &tcl_file.OUT_FFT_V_data_V_depth);

  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVOUT_OUT_FFT_V_data_V, __xlx_sprintf_buffer.data());
tcl_file.set_num(__xlx_apatb_param_OUT_FFT_stream_buf_final_size, &tcl_file.OUT_FFT_V_keep_V_depth);

  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVOUT_OUT_FFT_V_keep_V, __xlx_sprintf_buffer.data());
tcl_file.set_num(__xlx_apatb_param_OUT_FFT_stream_buf_final_size, &tcl_file.OUT_FFT_V_strb_V_depth);

  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVOUT_OUT_FFT_V_strb_V, __xlx_sprintf_buffer.data());
tcl_file.set_num(__xlx_apatb_param_OUT_FFT_stream_buf_final_size, &tcl_file.OUT_FFT_V_last_V_depth);

  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVOUT_OUT_FFT_V_last_V, __xlx_sprintf_buffer.data());
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(WRAPC_STREAM_SIZE_OUT_OUT_FFT_V_data_V, __xlx_sprintf_buffer.data());
  sprintf(__xlx_sprintf_buffer.data(), "%d\n", __xlx_apatb_param_OUT_FFT_stream_buf_final_size);
 aesl_fh.write(WRAPC_STREAM_SIZE_OUT_OUT_FFT_V_data_V, __xlx_sprintf_buffer.data());

  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(WRAPC_STREAM_SIZE_OUT_OUT_FFT_V_data_V, __xlx_sprintf_buffer.data());
}{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(WRAPC_STREAM_SIZE_OUT_OUT_FFT_V_keep_V, __xlx_sprintf_buffer.data());
  sprintf(__xlx_sprintf_buffer.data(), "%d\n", __xlx_apatb_param_OUT_FFT_stream_buf_final_size);
 aesl_fh.write(WRAPC_STREAM_SIZE_OUT_OUT_FFT_V_keep_V, __xlx_sprintf_buffer.data());

  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(WRAPC_STREAM_SIZE_OUT_OUT_FFT_V_keep_V, __xlx_sprintf_buffer.data());
}{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(WRAPC_STREAM_SIZE_OUT_OUT_FFT_V_strb_V, __xlx_sprintf_buffer.data());
  sprintf(__xlx_sprintf_buffer.data(), "%d\n", __xlx_apatb_param_OUT_FFT_stream_buf_final_size);
 aesl_fh.write(WRAPC_STREAM_SIZE_OUT_OUT_FFT_V_strb_V, __xlx_sprintf_buffer.data());

  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(WRAPC_STREAM_SIZE_OUT_OUT_FFT_V_strb_V, __xlx_sprintf_buffer.data());
}{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(WRAPC_STREAM_SIZE_OUT_OUT_FFT_V_last_V, __xlx_sprintf_buffer.data());
  sprintf(__xlx_sprintf_buffer.data(), "%d\n", __xlx_apatb_param_OUT_FFT_stream_buf_final_size);
 aesl_fh.write(WRAPC_STREAM_SIZE_OUT_OUT_FFT_V_last_V, __xlx_sprintf_buffer.data());

  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(WRAPC_STREAM_SIZE_OUT_OUT_FFT_V_last_V, __xlx_sprintf_buffer.data());
}
//********************** dump C output stream *******************
long __xlx_apatb_param_pss_id_stream_buf_final_size = ((hls::stream<__cosim_sC__>*)__xlx_apatb_param_pss_id)->size() - __xlx_apatb_param_pss_id_stream_buf_size;
{
  while (!((hls::stream<__cosim_sC__>*)__xlx_apatb_param_pss_id)->empty())
    __xlx_apatb_param_pss_id_stream_buf.push_back(((hls::stream<__cosim_sC__>*)__xlx_apatb_param_pss_id)->read());
  for (int i = 0; i < __xlx_apatb_param_pss_id_stream_buf.size(); ++i)
    ((hls::stream<__cosim_sC__>*)__xlx_apatb_param_pss_id)->write(__xlx_apatb_param_pss_id_stream_buf[i]);
  }

  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVOUT_pss_id_V_data_V, __xlx_sprintf_buffer.data());
  
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVOUT_pss_id_V_keep_V, __xlx_sprintf_buffer.data());
  
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVOUT_pss_id_V_strb_V, __xlx_sprintf_buffer.data());
  
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVOUT_pss_id_V_last_V, __xlx_sprintf_buffer.data());
  for (int j = 0, e = __xlx_apatb_param_pss_id_stream_buf_final_size; j != e; ++j) {
sc_bv<96> __xlx_tmp_lv;
__xlx_tmp_lv.range(63,0) = ((long long*)&__xlx_apatb_param_pss_id_stream_buf[__xlx_apatb_param_pss_id_stream_buf_size+j])[0*1+0];
__xlx_tmp_lv.range(95,64) = ((long long*)&__xlx_apatb_param_pss_id_stream_buf[__xlx_apatb_param_pss_id_stream_buf_size+j])[0*1+1];
sc_bv<32> __xlx_tmp_0_lv = __xlx_tmp_lv.range(31, 0);
sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_0_lv.to_string(SC_HEX).c_str());
aesl_fh.write(AUTOTB_TVOUT_pss_id_V_data_V, __xlx_sprintf_buffer.data());
sc_bv<8> __xlx_tmp_1_lv = __xlx_tmp_lv.range(39, 32);
sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_1_lv.to_string(SC_HEX).c_str());
aesl_fh.write(AUTOTB_TVOUT_pss_id_V_keep_V, __xlx_sprintf_buffer.data());
sc_bv<8> __xlx_tmp_2_lv = __xlx_tmp_lv.range(47, 40);
sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_2_lv.to_string(SC_HEX).c_str());
aesl_fh.write(AUTOTB_TVOUT_pss_id_V_strb_V, __xlx_sprintf_buffer.data());
sc_bv<8> __xlx_tmp_4_lv = __xlx_tmp_lv.range(63, 56);
sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_4_lv.to_string(SC_HEX).c_str());
aesl_fh.write(AUTOTB_TVOUT_pss_id_V_last_V, __xlx_sprintf_buffer.data());
}
tcl_file.set_num(__xlx_apatb_param_pss_id_stream_buf_final_size, &tcl_file.pss_id_V_data_V_depth);

  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVOUT_pss_id_V_data_V, __xlx_sprintf_buffer.data());
tcl_file.set_num(__xlx_apatb_param_pss_id_stream_buf_final_size, &tcl_file.pss_id_V_keep_V_depth);

  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVOUT_pss_id_V_keep_V, __xlx_sprintf_buffer.data());
tcl_file.set_num(__xlx_apatb_param_pss_id_stream_buf_final_size, &tcl_file.pss_id_V_strb_V_depth);

  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVOUT_pss_id_V_strb_V, __xlx_sprintf_buffer.data());
tcl_file.set_num(__xlx_apatb_param_pss_id_stream_buf_final_size, &tcl_file.pss_id_V_last_V_depth);

  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVOUT_pss_id_V_last_V, __xlx_sprintf_buffer.data());
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(WRAPC_STREAM_SIZE_OUT_pss_id_V_data_V, __xlx_sprintf_buffer.data());
  sprintf(__xlx_sprintf_buffer.data(), "%d\n", __xlx_apatb_param_pss_id_stream_buf_final_size);
 aesl_fh.write(WRAPC_STREAM_SIZE_OUT_pss_id_V_data_V, __xlx_sprintf_buffer.data());

  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(WRAPC_STREAM_SIZE_OUT_pss_id_V_data_V, __xlx_sprintf_buffer.data());
}{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(WRAPC_STREAM_SIZE_OUT_pss_id_V_keep_V, __xlx_sprintf_buffer.data());
  sprintf(__xlx_sprintf_buffer.data(), "%d\n", __xlx_apatb_param_pss_id_stream_buf_final_size);
 aesl_fh.write(WRAPC_STREAM_SIZE_OUT_pss_id_V_keep_V, __xlx_sprintf_buffer.data());

  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(WRAPC_STREAM_SIZE_OUT_pss_id_V_keep_V, __xlx_sprintf_buffer.data());
}{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(WRAPC_STREAM_SIZE_OUT_pss_id_V_strb_V, __xlx_sprintf_buffer.data());
  sprintf(__xlx_sprintf_buffer.data(), "%d\n", __xlx_apatb_param_pss_id_stream_buf_final_size);
 aesl_fh.write(WRAPC_STREAM_SIZE_OUT_pss_id_V_strb_V, __xlx_sprintf_buffer.data());

  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(WRAPC_STREAM_SIZE_OUT_pss_id_V_strb_V, __xlx_sprintf_buffer.data());
}{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(WRAPC_STREAM_SIZE_OUT_pss_id_V_last_V, __xlx_sprintf_buffer.data());
  sprintf(__xlx_sprintf_buffer.data(), "%d\n", __xlx_apatb_param_pss_id_stream_buf_final_size);
 aesl_fh.write(WRAPC_STREAM_SIZE_OUT_pss_id_V_last_V, __xlx_sprintf_buffer.data());

  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(WRAPC_STREAM_SIZE_OUT_pss_id_V_last_V, __xlx_sprintf_buffer.data());
}// print OUT_PSS_ID Transactions
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVOUT_OUT_PSS_ID, __xlx_sprintf_buffer.data());
  {
    sc_bv<32> __xlx_tmp_lv = *((int*)__xlx_apatb_param_OUT_PSS_ID);

    sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_lv.to_string(SC_HEX).c_str());
    aesl_fh.write(AUTOTB_TVOUT_OUT_PSS_ID, __xlx_sprintf_buffer.data()); 
  }
  tcl_file.set_num(1, &tcl_file.OUT_PSS_ID_depth);
  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVOUT_OUT_PSS_ID, __xlx_sprintf_buffer.data());
}
// print OUT_PEAK_INDEX Transactions
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVOUT_OUT_PEAK_INDEX, __xlx_sprintf_buffer.data());
  {
    sc_bv<32> __xlx_tmp_lv = *((int*)__xlx_apatb_param_OUT_PEAK_INDEX);

    sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_lv.to_string(SC_HEX).c_str());
    aesl_fh.write(AUTOTB_TVOUT_OUT_PEAK_INDEX, __xlx_sprintf_buffer.data()); 
  }
  tcl_file.set_num(1, &tcl_file.OUT_PEAK_INDEX_depth);
  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVOUT_OUT_PEAK_INDEX, __xlx_sprintf_buffer.data());
}
CodeState = DELETE_CHAR_BUFFERS;
AESL_transaction++;
tcl_file.set_num(AESL_transaction , &tcl_file.trans_num);
}
