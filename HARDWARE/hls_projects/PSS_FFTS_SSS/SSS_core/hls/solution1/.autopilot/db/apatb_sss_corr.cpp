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
#define AUTOTB_TVIN_gmem "../tv/cdatafile/c.sss_corr.autotvin_gmem.dat"
#define AUTOTB_TVOUT_gmem "../tv/cdatafile/c.sss_corr.autotvout_gmem.dat"
// wrapc file define:
#define AUTOTB_TVIN_IN_R_V_data_V "../tv/cdatafile/c.sss_corr.autotvin_IN_R_V_data_V.dat"
#define AUTOTB_TVOUT_IN_R_V_data_V "../tv/cdatafile/c.sss_corr.autotvout_IN_R_V_data_V.dat"
#define AUTOTB_TVIN_IN_R_V_keep_V "../tv/cdatafile/c.sss_corr.autotvin_IN_R_V_keep_V.dat"
#define AUTOTB_TVOUT_IN_R_V_keep_V "../tv/cdatafile/c.sss_corr.autotvout_IN_R_V_keep_V.dat"
#define AUTOTB_TVIN_IN_R_V_strb_V "../tv/cdatafile/c.sss_corr.autotvin_IN_R_V_strb_V.dat"
#define AUTOTB_TVOUT_IN_R_V_strb_V "../tv/cdatafile/c.sss_corr.autotvout_IN_R_V_strb_V.dat"
#define AUTOTB_TVIN_IN_R_V_last_V "../tv/cdatafile/c.sss_corr.autotvin_IN_R_V_last_V.dat"
#define AUTOTB_TVOUT_IN_R_V_last_V "../tv/cdatafile/c.sss_corr.autotvout_IN_R_V_last_V.dat"
#define WRAPC_STREAM_SIZE_IN_IN_R_V_data_V "../tv/stream_size/stream_size_in_IN_R_V_data_V.dat"
#define WRAPC_STREAM_INGRESS_STATUS_IN_R_V_data_V "../tv/stream_size/stream_ingress_status_IN_R_V_data_V.dat"
#define WRAPC_STREAM_SIZE_IN_IN_R_V_keep_V "../tv/stream_size/stream_size_in_IN_R_V_keep_V.dat"
#define WRAPC_STREAM_INGRESS_STATUS_IN_R_V_keep_V "../tv/stream_size/stream_ingress_status_IN_R_V_keep_V.dat"
#define WRAPC_STREAM_SIZE_IN_IN_R_V_strb_V "../tv/stream_size/stream_size_in_IN_R_V_strb_V.dat"
#define WRAPC_STREAM_INGRESS_STATUS_IN_R_V_strb_V "../tv/stream_size/stream_ingress_status_IN_R_V_strb_V.dat"
#define WRAPC_STREAM_SIZE_IN_IN_R_V_last_V "../tv/stream_size/stream_size_in_IN_R_V_last_V.dat"
#define WRAPC_STREAM_INGRESS_STATUS_IN_R_V_last_V "../tv/stream_size/stream_ingress_status_IN_R_V_last_V.dat"
// wrapc file define:
#define AUTOTB_TVIN_IN_I_V_data_V "../tv/cdatafile/c.sss_corr.autotvin_IN_I_V_data_V.dat"
#define AUTOTB_TVOUT_IN_I_V_data_V "../tv/cdatafile/c.sss_corr.autotvout_IN_I_V_data_V.dat"
#define AUTOTB_TVIN_IN_I_V_keep_V "../tv/cdatafile/c.sss_corr.autotvin_IN_I_V_keep_V.dat"
#define AUTOTB_TVOUT_IN_I_V_keep_V "../tv/cdatafile/c.sss_corr.autotvout_IN_I_V_keep_V.dat"
#define AUTOTB_TVIN_IN_I_V_strb_V "../tv/cdatafile/c.sss_corr.autotvin_IN_I_V_strb_V.dat"
#define AUTOTB_TVOUT_IN_I_V_strb_V "../tv/cdatafile/c.sss_corr.autotvout_IN_I_V_strb_V.dat"
#define AUTOTB_TVIN_IN_I_V_last_V "../tv/cdatafile/c.sss_corr.autotvin_IN_I_V_last_V.dat"
#define AUTOTB_TVOUT_IN_I_V_last_V "../tv/cdatafile/c.sss_corr.autotvout_IN_I_V_last_V.dat"
#define WRAPC_STREAM_SIZE_IN_IN_I_V_data_V "../tv/stream_size/stream_size_in_IN_I_V_data_V.dat"
#define WRAPC_STREAM_INGRESS_STATUS_IN_I_V_data_V "../tv/stream_size/stream_ingress_status_IN_I_V_data_V.dat"
#define WRAPC_STREAM_SIZE_IN_IN_I_V_keep_V "../tv/stream_size/stream_size_in_IN_I_V_keep_V.dat"
#define WRAPC_STREAM_INGRESS_STATUS_IN_I_V_keep_V "../tv/stream_size/stream_ingress_status_IN_I_V_keep_V.dat"
#define WRAPC_STREAM_SIZE_IN_IN_I_V_strb_V "../tv/stream_size/stream_size_in_IN_I_V_strb_V.dat"
#define WRAPC_STREAM_INGRESS_STATUS_IN_I_V_strb_V "../tv/stream_size/stream_ingress_status_IN_I_V_strb_V.dat"
#define WRAPC_STREAM_SIZE_IN_IN_I_V_last_V "../tv/stream_size/stream_size_in_IN_I_V_last_V.dat"
#define WRAPC_STREAM_INGRESS_STATUS_IN_I_V_last_V "../tv/stream_size/stream_ingress_status_IN_I_V_last_V.dat"
// wrapc file define:
#define AUTOTB_TVIN_OUT1 "../tv/cdatafile/c.sss_corr.autotvin_OUT1.dat"
#define AUTOTB_TVOUT_OUT1 "../tv/cdatafile/c.sss_corr.autotvout_OUT1.dat"
// wrapc file define:
#define AUTOTB_TVIN_OUT2 "../tv/cdatafile/c.sss_corr.autotvin_OUT2.dat"
#define AUTOTB_TVOUT_OUT2 "../tv/cdatafile/c.sss_corr.autotvout_OUT2.dat"
// wrapc file define:
#define AUTOTB_TVIN_pss_id_V_data_V "../tv/cdatafile/c.sss_corr.autotvin_pss_id_V_data_V.dat"
#define AUTOTB_TVOUT_pss_id_V_data_V "../tv/cdatafile/c.sss_corr.autotvout_pss_id_V_data_V.dat"
#define AUTOTB_TVIN_pss_id_V_keep_V "../tv/cdatafile/c.sss_corr.autotvin_pss_id_V_keep_V.dat"
#define AUTOTB_TVOUT_pss_id_V_keep_V "../tv/cdatafile/c.sss_corr.autotvout_pss_id_V_keep_V.dat"
#define AUTOTB_TVIN_pss_id_V_strb_V "../tv/cdatafile/c.sss_corr.autotvin_pss_id_V_strb_V.dat"
#define AUTOTB_TVOUT_pss_id_V_strb_V "../tv/cdatafile/c.sss_corr.autotvout_pss_id_V_strb_V.dat"
#define AUTOTB_TVIN_pss_id_V_last_V "../tv/cdatafile/c.sss_corr.autotvin_pss_id_V_last_V.dat"
#define AUTOTB_TVOUT_pss_id_V_last_V "../tv/cdatafile/c.sss_corr.autotvout_pss_id_V_last_V.dat"
#define WRAPC_STREAM_SIZE_IN_pss_id_V_data_V "../tv/stream_size/stream_size_in_pss_id_V_data_V.dat"
#define WRAPC_STREAM_INGRESS_STATUS_pss_id_V_data_V "../tv/stream_size/stream_ingress_status_pss_id_V_data_V.dat"
#define WRAPC_STREAM_SIZE_IN_pss_id_V_keep_V "../tv/stream_size/stream_size_in_pss_id_V_keep_V.dat"
#define WRAPC_STREAM_INGRESS_STATUS_pss_id_V_keep_V "../tv/stream_size/stream_ingress_status_pss_id_V_keep_V.dat"
#define WRAPC_STREAM_SIZE_IN_pss_id_V_strb_V "../tv/stream_size/stream_size_in_pss_id_V_strb_V.dat"
#define WRAPC_STREAM_INGRESS_STATUS_pss_id_V_strb_V "../tv/stream_size/stream_ingress_status_pss_id_V_strb_V.dat"
#define WRAPC_STREAM_SIZE_IN_pss_id_V_last_V "../tv/stream_size/stream_size_in_pss_id_V_last_V.dat"
#define WRAPC_STREAM_INGRESS_STATUS_pss_id_V_last_V "../tv/stream_size/stream_ingress_status_pss_id_V_last_V.dat"

#define INTER_TCL "../tv/cdatafile/ref.tcl"

// tvout file define:
#define AUTOTB_TVOUT_PC_gmem "../tv/rtldatafile/rtl.sss_corr.autotvout_gmem.dat"
// tvout file define:
#define AUTOTB_TVOUT_PC_IN_R_V_data_V "../tv/rtldatafile/rtl.sss_corr.autotvout_IN_R_V_data_V.dat"
#define AUTOTB_TVOUT_PC_IN_R_V_keep_V "../tv/rtldatafile/rtl.sss_corr.autotvout_IN_R_V_keep_V.dat"
#define AUTOTB_TVOUT_PC_IN_R_V_strb_V "../tv/rtldatafile/rtl.sss_corr.autotvout_IN_R_V_strb_V.dat"
#define AUTOTB_TVOUT_PC_IN_R_V_last_V "../tv/rtldatafile/rtl.sss_corr.autotvout_IN_R_V_last_V.dat"
// tvout file define:
#define AUTOTB_TVOUT_PC_IN_I_V_data_V "../tv/rtldatafile/rtl.sss_corr.autotvout_IN_I_V_data_V.dat"
#define AUTOTB_TVOUT_PC_IN_I_V_keep_V "../tv/rtldatafile/rtl.sss_corr.autotvout_IN_I_V_keep_V.dat"
#define AUTOTB_TVOUT_PC_IN_I_V_strb_V "../tv/rtldatafile/rtl.sss_corr.autotvout_IN_I_V_strb_V.dat"
#define AUTOTB_TVOUT_PC_IN_I_V_last_V "../tv/rtldatafile/rtl.sss_corr.autotvout_IN_I_V_last_V.dat"
// tvout file define:
#define AUTOTB_TVOUT_PC_OUT1 "../tv/rtldatafile/rtl.sss_corr.autotvout_OUT1.dat"
// tvout file define:
#define AUTOTB_TVOUT_PC_OUT2 "../tv/rtldatafile/rtl.sss_corr.autotvout_OUT2.dat"
// tvout file define:
#define AUTOTB_TVOUT_PC_pss_id_V_data_V "../tv/rtldatafile/rtl.sss_corr.autotvout_pss_id_V_data_V.dat"
#define AUTOTB_TVOUT_PC_pss_id_V_keep_V "../tv/rtldatafile/rtl.sss_corr.autotvout_pss_id_V_keep_V.dat"
#define AUTOTB_TVOUT_PC_pss_id_V_strb_V "../tv/rtldatafile/rtl.sss_corr.autotvout_pss_id_V_strb_V.dat"
#define AUTOTB_TVOUT_PC_pss_id_V_last_V "../tv/rtldatafile/rtl.sss_corr.autotvout_pss_id_V_last_V.dat"

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
  OUT1_depth = 0;
  OUT2_depth = 0;
  pss_id_V_data_V_depth = 0;
  pss_id_V_keep_V_depth = 0;
  pss_id_V_strb_V_depth = 0;
  pss_id_V_last_V_depth = 0;
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
  total_list << "{OUT1 " << OUT1_depth << "}\n";
  total_list << "{OUT2 " << OUT2_depth << "}\n";
  total_list << "{pss_id_V_data_V " << pss_id_V_data_V_depth << "}\n";
  total_list << "{pss_id_V_keep_V " << pss_id_V_keep_V_depth << "}\n";
  total_list << "{pss_id_V_strb_V " << pss_id_V_strb_V_depth << "}\n";
  total_list << "{pss_id_V_last_V " << pss_id_V_last_V_depth << "}\n";
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
    int OUT1_depth;
    int OUT2_depth;
    int pss_id_V_data_V_depth;
    int pss_id_V_keep_V_depth;
    int pss_id_V_strb_V_depth;
    int pss_id_V_last_V_depth;
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
struct __cosim_sC__ { char data[12]; };
extern "C" void sss_corr_hw_stub_wrapper(volatile void *, volatile void *, volatile void *, volatile void *, volatile void *);

extern "C" void apatb_sss_corr_hw(volatile void * __xlx_apatb_param_IN_R, volatile void * __xlx_apatb_param_IN_I, volatile void * __xlx_apatb_param_OUT1, volatile void * __xlx_apatb_param_OUT2, volatile void * __xlx_apatb_param_pss_id) {
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
          std::vector<sc_bv<32> > gmem_pc_buffer(336);
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
            for (int j = 0, e = 168; j < e; j += 1, ++i) {
            ((int*)__xlx_apatb_param_OUT1)[j] = gmem_pc_buffer[i].to_int64();
          }
            for (int j = 0, e = 168; j < e; j += 1, ++i) {
            ((int*)__xlx_apatb_param_OUT2)[j] = gmem_pc_buffer[i].to_int64();
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
  for (long i = 0; i < __xlx_apatb_param_IN_R_stream_buf_final_size; ++i)((hls::stream<__cosim_sC__>*)__xlx_apatb_param_IN_R)->read();
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
  for (long i = 0; i < __xlx_apatb_param_IN_I_stream_buf_final_size; ++i)((hls::stream<__cosim_sC__>*)__xlx_apatb_param_IN_I)->read();
long __xlx_apatb_param_pss_id_stream_buf_final_size;
{
      static ifstream rtl_tv_out_file;
      if (!rtl_tv_out_file.is_open()) {
        rtl_tv_out_file.open(WRAPC_STREAM_SIZE_IN_pss_id_V_data_V);
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
          while (AESL_token != "[[/transaction]]"){__xlx_apatb_param_pss_id_stream_buf_final_size = atoi(AESL_token.c_str());

            rtl_tv_out_file >> AESL_token; //data or [[/transaction]]
            if (AESL_token == "[[[/runtime]]]" || rtl_tv_out_file.eof())
              exit(1);
          }
        } // end transaction
      } // end file is good
    } // end post check logic bolck
  for (long i = 0; i < __xlx_apatb_param_pss_id_stream_buf_final_size; ++i)((hls::stream<__cosim_sC__>*)__xlx_apatb_param_pss_id)->read();

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
//OUT1
aesl_fh.touch(AUTOTB_TVIN_OUT1);
aesl_fh.touch(AUTOTB_TVOUT_OUT1);
//OUT2
aesl_fh.touch(AUTOTB_TVIN_OUT2);
aesl_fh.touch(AUTOTB_TVOUT_OUT2);
//pss_id
aesl_fh.touch(AUTOTB_TVIN_pss_id_V_data_V);
aesl_fh.touch(AUTOTB_TVOUT_pss_id_V_data_V);
aesl_fh.touch(AUTOTB_TVIN_pss_id_V_keep_V);
aesl_fh.touch(AUTOTB_TVOUT_pss_id_V_keep_V);
aesl_fh.touch(AUTOTB_TVIN_pss_id_V_strb_V);
aesl_fh.touch(AUTOTB_TVOUT_pss_id_V_strb_V);
aesl_fh.touch(AUTOTB_TVIN_pss_id_V_last_V);
aesl_fh.touch(AUTOTB_TVOUT_pss_id_V_last_V);
aesl_fh.touch(WRAPC_STREAM_SIZE_IN_pss_id_V_data_V);
aesl_fh.touch(WRAPC_STREAM_INGRESS_STATUS_pss_id_V_data_V);
aesl_fh.touch(WRAPC_STREAM_SIZE_IN_pss_id_V_keep_V);
aesl_fh.touch(WRAPC_STREAM_INGRESS_STATUS_pss_id_V_keep_V);
aesl_fh.touch(WRAPC_STREAM_SIZE_IN_pss_id_V_strb_V);
aesl_fh.touch(WRAPC_STREAM_INGRESS_STATUS_pss_id_V_strb_V);
aesl_fh.touch(WRAPC_STREAM_SIZE_IN_pss_id_V_last_V);
aesl_fh.touch(WRAPC_STREAM_INGRESS_STATUS_pss_id_V_last_V);
CodeState = DUMP_INPUTS;
unsigned __xlx_offset_byte_param_OUT1 = 0;
unsigned __xlx_offset_byte_param_OUT2 = 0;
// print gmem Transactions
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVIN_gmem, __xlx_sprintf_buffer.data());
  {  __xlx_offset_byte_param_OUT1 = 0*4;
  if (__xlx_apatb_param_OUT1) {
    for (int j = 0  - 0, e = 168 - 0; j != e; ++j) {
sc_bv<32> __xlx_tmp_lv = ((int*)__xlx_apatb_param_OUT1)[j];

    sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_lv.to_string(SC_HEX).c_str());
    aesl_fh.write(AUTOTB_TVIN_gmem, __xlx_sprintf_buffer.data()); 
      }
  }
  __xlx_offset_byte_param_OUT2 = 168*4;
  if (__xlx_apatb_param_OUT2) {
    for (int j = 0  - 0, e = 168 - 0; j != e; ++j) {
sc_bv<32> __xlx_tmp_lv = ((int*)__xlx_apatb_param_OUT2)[j];

    sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_lv.to_string(SC_HEX).c_str());
    aesl_fh.write(AUTOTB_TVIN_gmem, __xlx_sprintf_buffer.data()); 
      }
  }
}
  tcl_file.set_num(336, &tcl_file.gmem_depth);
  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVIN_gmem, __xlx_sprintf_buffer.data());
}
std::vector<__cosim_sC__> __xlx_apatb_param_IN_R_stream_buf;
{
  while (!((hls::stream<__cosim_sC__>*)__xlx_apatb_param_IN_R)->empty())
    __xlx_apatb_param_IN_R_stream_buf.push_back(((hls::stream<__cosim_sC__>*)__xlx_apatb_param_IN_R)->read());
  for (int i = 0; i < __xlx_apatb_param_IN_R_stream_buf.size(); ++i)
    ((hls::stream<__cosim_sC__>*)__xlx_apatb_param_IN_R)->write(__xlx_apatb_param_IN_R_stream_buf[i]);
  }
long __xlx_apatb_param_IN_R_stream_buf_size = ((hls::stream<__cosim_sC__>*)__xlx_apatb_param_IN_R)->size();
std::vector<__cosim_sC__> __xlx_apatb_param_IN_I_stream_buf;
{
  while (!((hls::stream<__cosim_sC__>*)__xlx_apatb_param_IN_I)->empty())
    __xlx_apatb_param_IN_I_stream_buf.push_back(((hls::stream<__cosim_sC__>*)__xlx_apatb_param_IN_I)->read());
  for (int i = 0; i < __xlx_apatb_param_IN_I_stream_buf.size(); ++i)
    ((hls::stream<__cosim_sC__>*)__xlx_apatb_param_IN_I)->write(__xlx_apatb_param_IN_I_stream_buf[i]);
  }
long __xlx_apatb_param_IN_I_stream_buf_size = ((hls::stream<__cosim_sC__>*)__xlx_apatb_param_IN_I)->size();
// print OUT1 Transactions
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVIN_OUT1, __xlx_sprintf_buffer.data());
  {
    sc_bv<64> __xlx_tmp_lv = __xlx_offset_byte_param_OUT1;

    sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_lv.to_string(SC_HEX).c_str());
    aesl_fh.write(AUTOTB_TVIN_OUT1, __xlx_sprintf_buffer.data()); 
  }
  tcl_file.set_num(1, &tcl_file.OUT1_depth);
  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVIN_OUT1, __xlx_sprintf_buffer.data());
}
// print OUT2 Transactions
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVIN_OUT2, __xlx_sprintf_buffer.data());
  {
    sc_bv<64> __xlx_tmp_lv = __xlx_offset_byte_param_OUT2;

    sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_lv.to_string(SC_HEX).c_str());
    aesl_fh.write(AUTOTB_TVIN_OUT2, __xlx_sprintf_buffer.data()); 
  }
  tcl_file.set_num(1, &tcl_file.OUT2_depth);
  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVIN_OUT2, __xlx_sprintf_buffer.data());
}
std::vector<__cosim_sC__> __xlx_apatb_param_pss_id_stream_buf;
{
  while (!((hls::stream<__cosim_sC__>*)__xlx_apatb_param_pss_id)->empty())
    __xlx_apatb_param_pss_id_stream_buf.push_back(((hls::stream<__cosim_sC__>*)__xlx_apatb_param_pss_id)->read());
  for (int i = 0; i < __xlx_apatb_param_pss_id_stream_buf.size(); ++i)
    ((hls::stream<__cosim_sC__>*)__xlx_apatb_param_pss_id)->write(__xlx_apatb_param_pss_id_stream_buf[i]);
  }
long __xlx_apatb_param_pss_id_stream_buf_size = ((hls::stream<__cosim_sC__>*)__xlx_apatb_param_pss_id)->size();
CodeState = CALL_C_DUT;
sss_corr_hw_stub_wrapper(__xlx_apatb_param_IN_R, __xlx_apatb_param_IN_I, __xlx_apatb_param_OUT1, __xlx_apatb_param_OUT2, __xlx_apatb_param_pss_id);
CodeState = DUMP_OUTPUTS;
// print gmem Transactions
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVOUT_gmem, __xlx_sprintf_buffer.data());
  {  __xlx_offset_byte_param_OUT1 = 0*4;
  if (__xlx_apatb_param_OUT1) {
    for (int j = 0  - 0, e = 168 - 0; j != e; ++j) {
sc_bv<32> __xlx_tmp_lv = ((int*)__xlx_apatb_param_OUT1)[j];

    sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_lv.to_string(SC_HEX).c_str());
    aesl_fh.write(AUTOTB_TVOUT_gmem, __xlx_sprintf_buffer.data()); 
      }
  }
  __xlx_offset_byte_param_OUT2 = 168*4;
  if (__xlx_apatb_param_OUT2) {
    for (int j = 0  - 0, e = 168 - 0; j != e; ++j) {
sc_bv<32> __xlx_tmp_lv = ((int*)__xlx_apatb_param_OUT2)[j];

    sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_lv.to_string(SC_HEX).c_str());
    aesl_fh.write(AUTOTB_TVOUT_gmem, __xlx_sprintf_buffer.data()); 
      }
  }
}
  tcl_file.set_num(336, &tcl_file.gmem_depth);
  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVOUT_gmem, __xlx_sprintf_buffer.data());
}
long __xlx_apatb_param_IN_R_stream_buf_final_size = __xlx_apatb_param_IN_R_stream_buf_size - ((hls::stream<__cosim_sC__>*)__xlx_apatb_param_IN_R)->size();

  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVIN_IN_R_V_data_V, __xlx_sprintf_buffer.data());
  
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVIN_IN_R_V_keep_V, __xlx_sprintf_buffer.data());
  
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVIN_IN_R_V_strb_V, __xlx_sprintf_buffer.data());
  
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVIN_IN_R_V_last_V, __xlx_sprintf_buffer.data());
  for (int j = 0, e = __xlx_apatb_param_IN_R_stream_buf_final_size; j != e; ++j) {
sc_bv<96> __xlx_tmp_lv;
__xlx_tmp_lv.range(63,0) = ((long long*)&__xlx_apatb_param_IN_R_stream_buf[j])[0*1+0];
__xlx_tmp_lv.range(95,64) = ((long long*)&__xlx_apatb_param_IN_R_stream_buf[j])[0*1+1];
sc_bv<32> __xlx_tmp_0_lv = __xlx_tmp_lv.range(31, 0);
sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_0_lv.to_string(SC_HEX).c_str());
aesl_fh.write(AUTOTB_TVIN_IN_R_V_data_V, __xlx_sprintf_buffer.data());
sc_bv<8> __xlx_tmp_1_lv = __xlx_tmp_lv.range(39, 32);
sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_1_lv.to_string(SC_HEX).c_str());
aesl_fh.write(AUTOTB_TVIN_IN_R_V_keep_V, __xlx_sprintf_buffer.data());
sc_bv<8> __xlx_tmp_2_lv = __xlx_tmp_lv.range(47, 40);
sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_2_lv.to_string(SC_HEX).c_str());
aesl_fh.write(AUTOTB_TVIN_IN_R_V_strb_V, __xlx_sprintf_buffer.data());
sc_bv<8> __xlx_tmp_4_lv = __xlx_tmp_lv.range(63, 56);
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
}long __xlx_apatb_param_IN_I_stream_buf_final_size = __xlx_apatb_param_IN_I_stream_buf_size - ((hls::stream<__cosim_sC__>*)__xlx_apatb_param_IN_I)->size();

  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVIN_IN_I_V_data_V, __xlx_sprintf_buffer.data());
  
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVIN_IN_I_V_keep_V, __xlx_sprintf_buffer.data());
  
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVIN_IN_I_V_strb_V, __xlx_sprintf_buffer.data());
  
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVIN_IN_I_V_last_V, __xlx_sprintf_buffer.data());
  for (int j = 0, e = __xlx_apatb_param_IN_I_stream_buf_final_size; j != e; ++j) {
sc_bv<96> __xlx_tmp_lv;
__xlx_tmp_lv.range(63,0) = ((long long*)&__xlx_apatb_param_IN_I_stream_buf[j])[0*1+0];
__xlx_tmp_lv.range(95,64) = ((long long*)&__xlx_apatb_param_IN_I_stream_buf[j])[0*1+1];
sc_bv<32> __xlx_tmp_0_lv = __xlx_tmp_lv.range(31, 0);
sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_0_lv.to_string(SC_HEX).c_str());
aesl_fh.write(AUTOTB_TVIN_IN_I_V_data_V, __xlx_sprintf_buffer.data());
sc_bv<8> __xlx_tmp_1_lv = __xlx_tmp_lv.range(39, 32);
sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_1_lv.to_string(SC_HEX).c_str());
aesl_fh.write(AUTOTB_TVIN_IN_I_V_keep_V, __xlx_sprintf_buffer.data());
sc_bv<8> __xlx_tmp_2_lv = __xlx_tmp_lv.range(47, 40);
sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_2_lv.to_string(SC_HEX).c_str());
aesl_fh.write(AUTOTB_TVIN_IN_I_V_strb_V, __xlx_sprintf_buffer.data());
sc_bv<8> __xlx_tmp_4_lv = __xlx_tmp_lv.range(63, 56);
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
}long __xlx_apatb_param_pss_id_stream_buf_final_size = __xlx_apatb_param_pss_id_stream_buf_size - ((hls::stream<__cosim_sC__>*)__xlx_apatb_param_pss_id)->size();

  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVIN_pss_id_V_data_V, __xlx_sprintf_buffer.data());
  
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVIN_pss_id_V_keep_V, __xlx_sprintf_buffer.data());
  
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVIN_pss_id_V_strb_V, __xlx_sprintf_buffer.data());
  
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVIN_pss_id_V_last_V, __xlx_sprintf_buffer.data());
  for (int j = 0, e = __xlx_apatb_param_pss_id_stream_buf_final_size; j != e; ++j) {
sc_bv<96> __xlx_tmp_lv;
__xlx_tmp_lv.range(63,0) = ((long long*)&__xlx_apatb_param_pss_id_stream_buf[j])[0*1+0];
__xlx_tmp_lv.range(95,64) = ((long long*)&__xlx_apatb_param_pss_id_stream_buf[j])[0*1+1];
sc_bv<32> __xlx_tmp_0_lv = __xlx_tmp_lv.range(31, 0);
sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_0_lv.to_string(SC_HEX).c_str());
aesl_fh.write(AUTOTB_TVIN_pss_id_V_data_V, __xlx_sprintf_buffer.data());
sc_bv<8> __xlx_tmp_1_lv = __xlx_tmp_lv.range(39, 32);
sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_1_lv.to_string(SC_HEX).c_str());
aesl_fh.write(AUTOTB_TVIN_pss_id_V_keep_V, __xlx_sprintf_buffer.data());
sc_bv<8> __xlx_tmp_2_lv = __xlx_tmp_lv.range(47, 40);
sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_2_lv.to_string(SC_HEX).c_str());
aesl_fh.write(AUTOTB_TVIN_pss_id_V_strb_V, __xlx_sprintf_buffer.data());
sc_bv<8> __xlx_tmp_4_lv = __xlx_tmp_lv.range(63, 56);
sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_4_lv.to_string(SC_HEX).c_str());
aesl_fh.write(AUTOTB_TVIN_pss_id_V_last_V, __xlx_sprintf_buffer.data());
}
tcl_file.set_num(__xlx_apatb_param_pss_id_stream_buf_final_size, &tcl_file.pss_id_V_data_V_depth);

  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVIN_pss_id_V_data_V, __xlx_sprintf_buffer.data());
tcl_file.set_num(__xlx_apatb_param_pss_id_stream_buf_final_size, &tcl_file.pss_id_V_keep_V_depth);

  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVIN_pss_id_V_keep_V, __xlx_sprintf_buffer.data());
tcl_file.set_num(__xlx_apatb_param_pss_id_stream_buf_final_size, &tcl_file.pss_id_V_strb_V_depth);

  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVIN_pss_id_V_strb_V, __xlx_sprintf_buffer.data());
tcl_file.set_num(__xlx_apatb_param_pss_id_stream_buf_final_size, &tcl_file.pss_id_V_last_V_depth);

  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVIN_pss_id_V_last_V, __xlx_sprintf_buffer.data());

// dump stream ingress status to file

// dump stream ingress status to file
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_pss_id_V_data_V, __xlx_sprintf_buffer.data());
  if (__xlx_apatb_param_pss_id_stream_buf_final_size > 0) {
  long pss_id_V_data_V_stream_ingress_size = __xlx_apatb_param_pss_id_stream_buf_size;
sprintf(__xlx_sprintf_buffer.data(), "%d\n", pss_id_V_data_V_stream_ingress_size);
 aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_pss_id_V_data_V, __xlx_sprintf_buffer.data());
  for (int j = 0, e = __xlx_apatb_param_pss_id_stream_buf_final_size; j != e; j++) {
    pss_id_V_data_V_stream_ingress_size--;
sprintf(__xlx_sprintf_buffer.data(), "%d\n", pss_id_V_data_V_stream_ingress_size);
 aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_pss_id_V_data_V, __xlx_sprintf_buffer.data());
  }
} else {
  long pss_id_V_data_V_stream_ingress_size = 0;
sprintf(__xlx_sprintf_buffer.data(), "%d\n", pss_id_V_data_V_stream_ingress_size);
 aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_pss_id_V_data_V, __xlx_sprintf_buffer.data());
}

  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_pss_id_V_data_V, __xlx_sprintf_buffer.data());
}
// dump stream ingress status to file
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_pss_id_V_keep_V, __xlx_sprintf_buffer.data());
  if (__xlx_apatb_param_pss_id_stream_buf_final_size > 0) {
  long pss_id_V_keep_V_stream_ingress_size = __xlx_apatb_param_pss_id_stream_buf_size;
sprintf(__xlx_sprintf_buffer.data(), "%d\n", pss_id_V_keep_V_stream_ingress_size);
 aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_pss_id_V_keep_V, __xlx_sprintf_buffer.data());
  for (int j = 0, e = __xlx_apatb_param_pss_id_stream_buf_final_size; j != e; j++) {
    pss_id_V_keep_V_stream_ingress_size--;
sprintf(__xlx_sprintf_buffer.data(), "%d\n", pss_id_V_keep_V_stream_ingress_size);
 aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_pss_id_V_keep_V, __xlx_sprintf_buffer.data());
  }
} else {
  long pss_id_V_keep_V_stream_ingress_size = 0;
sprintf(__xlx_sprintf_buffer.data(), "%d\n", pss_id_V_keep_V_stream_ingress_size);
 aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_pss_id_V_keep_V, __xlx_sprintf_buffer.data());
}

  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_pss_id_V_keep_V, __xlx_sprintf_buffer.data());
}
// dump stream ingress status to file
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_pss_id_V_strb_V, __xlx_sprintf_buffer.data());
  if (__xlx_apatb_param_pss_id_stream_buf_final_size > 0) {
  long pss_id_V_strb_V_stream_ingress_size = __xlx_apatb_param_pss_id_stream_buf_size;
sprintf(__xlx_sprintf_buffer.data(), "%d\n", pss_id_V_strb_V_stream_ingress_size);
 aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_pss_id_V_strb_V, __xlx_sprintf_buffer.data());
  for (int j = 0, e = __xlx_apatb_param_pss_id_stream_buf_final_size; j != e; j++) {
    pss_id_V_strb_V_stream_ingress_size--;
sprintf(__xlx_sprintf_buffer.data(), "%d\n", pss_id_V_strb_V_stream_ingress_size);
 aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_pss_id_V_strb_V, __xlx_sprintf_buffer.data());
  }
} else {
  long pss_id_V_strb_V_stream_ingress_size = 0;
sprintf(__xlx_sprintf_buffer.data(), "%d\n", pss_id_V_strb_V_stream_ingress_size);
 aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_pss_id_V_strb_V, __xlx_sprintf_buffer.data());
}

  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_pss_id_V_strb_V, __xlx_sprintf_buffer.data());
}
// dump stream ingress status to file
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_pss_id_V_last_V, __xlx_sprintf_buffer.data());
  if (__xlx_apatb_param_pss_id_stream_buf_final_size > 0) {
  long pss_id_V_last_V_stream_ingress_size = __xlx_apatb_param_pss_id_stream_buf_size;
sprintf(__xlx_sprintf_buffer.data(), "%d\n", pss_id_V_last_V_stream_ingress_size);
 aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_pss_id_V_last_V, __xlx_sprintf_buffer.data());
  for (int j = 0, e = __xlx_apatb_param_pss_id_stream_buf_final_size; j != e; j++) {
    pss_id_V_last_V_stream_ingress_size--;
sprintf(__xlx_sprintf_buffer.data(), "%d\n", pss_id_V_last_V_stream_ingress_size);
 aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_pss_id_V_last_V, __xlx_sprintf_buffer.data());
  }
} else {
  long pss_id_V_last_V_stream_ingress_size = 0;
sprintf(__xlx_sprintf_buffer.data(), "%d\n", pss_id_V_last_V_stream_ingress_size);
 aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_pss_id_V_last_V, __xlx_sprintf_buffer.data());
}

  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_pss_id_V_last_V, __xlx_sprintf_buffer.data());
}{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(WRAPC_STREAM_SIZE_IN_pss_id_V_data_V, __xlx_sprintf_buffer.data());
  sprintf(__xlx_sprintf_buffer.data(), "%d\n", __xlx_apatb_param_pss_id_stream_buf_final_size);
 aesl_fh.write(WRAPC_STREAM_SIZE_IN_pss_id_V_data_V, __xlx_sprintf_buffer.data());

  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(WRAPC_STREAM_SIZE_IN_pss_id_V_data_V, __xlx_sprintf_buffer.data());
}{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(WRAPC_STREAM_SIZE_IN_pss_id_V_keep_V, __xlx_sprintf_buffer.data());
  sprintf(__xlx_sprintf_buffer.data(), "%d\n", __xlx_apatb_param_pss_id_stream_buf_final_size);
 aesl_fh.write(WRAPC_STREAM_SIZE_IN_pss_id_V_keep_V, __xlx_sprintf_buffer.data());

  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(WRAPC_STREAM_SIZE_IN_pss_id_V_keep_V, __xlx_sprintf_buffer.data());
}{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(WRAPC_STREAM_SIZE_IN_pss_id_V_strb_V, __xlx_sprintf_buffer.data());
  sprintf(__xlx_sprintf_buffer.data(), "%d\n", __xlx_apatb_param_pss_id_stream_buf_final_size);
 aesl_fh.write(WRAPC_STREAM_SIZE_IN_pss_id_V_strb_V, __xlx_sprintf_buffer.data());

  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(WRAPC_STREAM_SIZE_IN_pss_id_V_strb_V, __xlx_sprintf_buffer.data());
}{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(WRAPC_STREAM_SIZE_IN_pss_id_V_last_V, __xlx_sprintf_buffer.data());
  sprintf(__xlx_sprintf_buffer.data(), "%d\n", __xlx_apatb_param_pss_id_stream_buf_final_size);
 aesl_fh.write(WRAPC_STREAM_SIZE_IN_pss_id_V_last_V, __xlx_sprintf_buffer.data());

  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(WRAPC_STREAM_SIZE_IN_pss_id_V_last_V, __xlx_sprintf_buffer.data());
}CodeState = DELETE_CHAR_BUFFERS;
AESL_transaction++;
tcl_file.set_num(AESL_transaction , &tcl_file.trans_num);
}
