set moduleName lteCellSearch
set isTopModule 1
set isCombinational 0
set isDatapathOnly 0
set isPipelined 0
set pipeline_type none
set FunctionProtocol ap_ctrl_hs
set isOneStateSeq 0
set ProfileFlag 0
set StallSigGenFlag 0
set isEnableWaveformDebug 1
set C_modelName {lteCellSearch}
set C_modelType { void 0 }
set C_modelArgList {
	{ gmem int 32 regular {axi_master 1}  }
	{ IN_R_V_data_V int 16 regular {axi_s 0 volatile  { IN_R Data } }  }
	{ IN_R_V_keep_V int 2 regular {axi_s 0 volatile  { IN_R Keep } }  }
	{ IN_R_V_strb_V int 2 regular {axi_s 0 volatile  { IN_R Strb } }  }
	{ IN_R_V_last_V int 1 regular {axi_s 0 volatile  { IN_R Last } }  }
	{ IN_I_V_data_V int 16 regular {axi_s 0 volatile  { IN_I Data } }  }
	{ IN_I_V_keep_V int 2 regular {axi_s 0 volatile  { IN_I Keep } }  }
	{ IN_I_V_strb_V int 2 regular {axi_s 0 volatile  { IN_I Strb } }  }
	{ IN_I_V_last_V int 1 regular {axi_s 0 volatile  { IN_I Last } }  }
	{ OUT_FFT_V_data_V int 64 regular {axi_s 1 volatile  { OUT_FFT Data } }  }
	{ OUT_FFT_V_keep_V int 8 regular {axi_s 1 volatile  { OUT_FFT Keep } }  }
	{ OUT_FFT_V_strb_V int 8 regular {axi_s 1 volatile  { OUT_FFT Strb } }  }
	{ OUT_FFT_V_last_V int 1 regular {axi_s 1 volatile  { OUT_FFT Last } }  }
	{ pss_id_V_data_V int 32 regular {axi_s 1 volatile  { pss_id Data } }  }
	{ pss_id_V_keep_V int 4 regular {axi_s 1 volatile  { pss_id Keep } }  }
	{ pss_id_V_strb_V int 4 regular {axi_s 1 volatile  { pss_id Strb } }  }
	{ pss_id_V_last_V int 1 regular {axi_s 1 volatile  { pss_id Last } }  }
	{ OUT_PSS_ID int 32 regular {axi_slave 1}  }
	{ OUT_PEAK_INDEX int 32 regular {axi_slave 1}  }
	{ OUT_RSLT int 64 regular {axi_slave 0}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "gmem", "interface" : "axi_master", "bitwidth" : 32, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "OUT_RSLT","cData": "int","bit_use": { "low": 0,"up": 0},"offset": { "type": "dynamic","port_name": "OUT_RSLT","bundle": "control"},"direction": "WRITEONLY","cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "IN_R_V_data_V", "interface" : "axis", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "IN_R.V.data.V","cData": "short","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "IN_R_V_keep_V", "interface" : "axis", "bitwidth" : 2, "direction" : "READONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "IN_R.V.keep.V","cData": "int2","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "IN_R_V_strb_V", "interface" : "axis", "bitwidth" : 2, "direction" : "READONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "IN_R.V.strb.V","cData": "int2","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "IN_R_V_last_V", "interface" : "axis", "bitwidth" : 1, "direction" : "READONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "IN_R.V.last.V","cData": "int1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "IN_I_V_data_V", "interface" : "axis", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "IN_I.V.data.V","cData": "short","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "IN_I_V_keep_V", "interface" : "axis", "bitwidth" : 2, "direction" : "READONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "IN_I.V.keep.V","cData": "int2","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "IN_I_V_strb_V", "interface" : "axis", "bitwidth" : 2, "direction" : "READONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "IN_I.V.strb.V","cData": "int2","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "IN_I_V_last_V", "interface" : "axis", "bitwidth" : 1, "direction" : "READONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "IN_I.V.last.V","cData": "int1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "OUT_FFT_V_data_V", "interface" : "axis", "bitwidth" : 64, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "OUT_FFT.V.data.V","cData": "long","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "OUT_FFT_V_keep_V", "interface" : "axis", "bitwidth" : 8, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "OUT_FFT.V.keep.V","cData": "char","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "OUT_FFT_V_strb_V", "interface" : "axis", "bitwidth" : 8, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "OUT_FFT.V.strb.V","cData": "char","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "OUT_FFT_V_last_V", "interface" : "axis", "bitwidth" : 1, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "OUT_FFT.V.last.V","cData": "int1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "pss_id_V_data_V", "interface" : "axis", "bitwidth" : 32, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "pss_id.V.data.V","cData": "int","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "pss_id_V_keep_V", "interface" : "axis", "bitwidth" : 4, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "pss_id.V.keep.V","cData": "int4","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "pss_id_V_strb_V", "interface" : "axis", "bitwidth" : 4, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "pss_id.V.strb.V","cData": "int4","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "pss_id_V_last_V", "interface" : "axis", "bitwidth" : 1, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "pss_id.V.last.V","cData": "int1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "OUT_PSS_ID", "interface" : "axi_slave", "bundle":"control","type":"ap_vld","bitwidth" : 32, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "OUT_PSS_ID","cData": "int","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}], "offset" : {"out":16}, "offset_end" : {"out":23}} , 
 	{ "Name" : "OUT_PEAK_INDEX", "interface" : "axi_slave", "bundle":"control","type":"ap_vld","bitwidth" : 32, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "OUT_PEAK_INDEX","cData": "int","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}], "offset" : {"out":32}, "offset_end" : {"out":39}} , 
 	{ "Name" : "OUT_RSLT", "interface" : "axi_slave", "bundle":"control","type":"ap_none","bitwidth" : 64, "direction" : "READONLY", "offset" : {"in":48}, "offset_end" : {"in":59}} ]}
# RTL Port declarations: 
set portNum 89
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst_n sc_in sc_logic 1 reset -1 active_low_sync } 
	{ m_axi_gmem_AWVALID sc_out sc_logic 1 signal 0 } 
	{ m_axi_gmem_AWREADY sc_in sc_logic 1 signal 0 } 
	{ m_axi_gmem_AWADDR sc_out sc_lv 64 signal 0 } 
	{ m_axi_gmem_AWID sc_out sc_lv 1 signal 0 } 
	{ m_axi_gmem_AWLEN sc_out sc_lv 8 signal 0 } 
	{ m_axi_gmem_AWSIZE sc_out sc_lv 3 signal 0 } 
	{ m_axi_gmem_AWBURST sc_out sc_lv 2 signal 0 } 
	{ m_axi_gmem_AWLOCK sc_out sc_lv 2 signal 0 } 
	{ m_axi_gmem_AWCACHE sc_out sc_lv 4 signal 0 } 
	{ m_axi_gmem_AWPROT sc_out sc_lv 3 signal 0 } 
	{ m_axi_gmem_AWQOS sc_out sc_lv 4 signal 0 } 
	{ m_axi_gmem_AWREGION sc_out sc_lv 4 signal 0 } 
	{ m_axi_gmem_AWUSER sc_out sc_lv 1 signal 0 } 
	{ m_axi_gmem_WVALID sc_out sc_logic 1 signal 0 } 
	{ m_axi_gmem_WREADY sc_in sc_logic 1 signal 0 } 
	{ m_axi_gmem_WDATA sc_out sc_lv 32 signal 0 } 
	{ m_axi_gmem_WSTRB sc_out sc_lv 4 signal 0 } 
	{ m_axi_gmem_WLAST sc_out sc_logic 1 signal 0 } 
	{ m_axi_gmem_WID sc_out sc_lv 1 signal 0 } 
	{ m_axi_gmem_WUSER sc_out sc_lv 1 signal 0 } 
	{ m_axi_gmem_ARVALID sc_out sc_logic 1 signal 0 } 
	{ m_axi_gmem_ARREADY sc_in sc_logic 1 signal 0 } 
	{ m_axi_gmem_ARADDR sc_out sc_lv 64 signal 0 } 
	{ m_axi_gmem_ARID sc_out sc_lv 1 signal 0 } 
	{ m_axi_gmem_ARLEN sc_out sc_lv 8 signal 0 } 
	{ m_axi_gmem_ARSIZE sc_out sc_lv 3 signal 0 } 
	{ m_axi_gmem_ARBURST sc_out sc_lv 2 signal 0 } 
	{ m_axi_gmem_ARLOCK sc_out sc_lv 2 signal 0 } 
	{ m_axi_gmem_ARCACHE sc_out sc_lv 4 signal 0 } 
	{ m_axi_gmem_ARPROT sc_out sc_lv 3 signal 0 } 
	{ m_axi_gmem_ARQOS sc_out sc_lv 4 signal 0 } 
	{ m_axi_gmem_ARREGION sc_out sc_lv 4 signal 0 } 
	{ m_axi_gmem_ARUSER sc_out sc_lv 1 signal 0 } 
	{ m_axi_gmem_RVALID sc_in sc_logic 1 signal 0 } 
	{ m_axi_gmem_RREADY sc_out sc_logic 1 signal 0 } 
	{ m_axi_gmem_RDATA sc_in sc_lv 32 signal 0 } 
	{ m_axi_gmem_RLAST sc_in sc_logic 1 signal 0 } 
	{ m_axi_gmem_RID sc_in sc_lv 1 signal 0 } 
	{ m_axi_gmem_RUSER sc_in sc_lv 1 signal 0 } 
	{ m_axi_gmem_RRESP sc_in sc_lv 2 signal 0 } 
	{ m_axi_gmem_BVALID sc_in sc_logic 1 signal 0 } 
	{ m_axi_gmem_BREADY sc_out sc_logic 1 signal 0 } 
	{ m_axi_gmem_BRESP sc_in sc_lv 2 signal 0 } 
	{ m_axi_gmem_BID sc_in sc_lv 1 signal 0 } 
	{ m_axi_gmem_BUSER sc_in sc_lv 1 signal 0 } 
	{ IN_R_TDATA sc_in sc_lv 16 signal 1 } 
	{ IN_R_TVALID sc_in sc_logic 1 invld 4 } 
	{ IN_R_TREADY sc_out sc_logic 1 inacc 4 } 
	{ IN_R_TKEEP sc_in sc_lv 2 signal 2 } 
	{ IN_R_TSTRB sc_in sc_lv 2 signal 3 } 
	{ IN_R_TLAST sc_in sc_lv 1 signal 4 } 
	{ IN_I_TDATA sc_in sc_lv 16 signal 5 } 
	{ IN_I_TVALID sc_in sc_logic 1 invld 8 } 
	{ IN_I_TREADY sc_out sc_logic 1 inacc 8 } 
	{ IN_I_TKEEP sc_in sc_lv 2 signal 6 } 
	{ IN_I_TSTRB sc_in sc_lv 2 signal 7 } 
	{ IN_I_TLAST sc_in sc_lv 1 signal 8 } 
	{ OUT_FFT_TDATA sc_out sc_lv 64 signal 9 } 
	{ OUT_FFT_TVALID sc_out sc_logic 1 outvld 12 } 
	{ OUT_FFT_TREADY sc_in sc_logic 1 outacc 12 } 
	{ OUT_FFT_TKEEP sc_out sc_lv 8 signal 10 } 
	{ OUT_FFT_TSTRB sc_out sc_lv 8 signal 11 } 
	{ OUT_FFT_TLAST sc_out sc_lv 1 signal 12 } 
	{ pss_id_TDATA sc_out sc_lv 32 signal 13 } 
	{ pss_id_TVALID sc_out sc_logic 1 outvld 16 } 
	{ pss_id_TREADY sc_in sc_logic 1 outacc 16 } 
	{ pss_id_TKEEP sc_out sc_lv 4 signal 14 } 
	{ pss_id_TSTRB sc_out sc_lv 4 signal 15 } 
	{ pss_id_TLAST sc_out sc_lv 1 signal 16 } 
	{ s_axi_control_AWVALID sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_AWREADY sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_AWADDR sc_in sc_lv 6 signal -1 } 
	{ s_axi_control_WVALID sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_WREADY sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_WDATA sc_in sc_lv 32 signal -1 } 
	{ s_axi_control_WSTRB sc_in sc_lv 4 signal -1 } 
	{ s_axi_control_ARVALID sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_ARREADY sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_ARADDR sc_in sc_lv 6 signal -1 } 
	{ s_axi_control_RVALID sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_RREADY sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_RDATA sc_out sc_lv 32 signal -1 } 
	{ s_axi_control_RRESP sc_out sc_lv 2 signal -1 } 
	{ s_axi_control_BVALID sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_BREADY sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_BRESP sc_out sc_lv 2 signal -1 } 
	{ interrupt sc_out sc_logic 1 signal -1 } 
}
set NewPortList {[ 
	{ "name": "s_axi_control_AWADDR", "direction": "in", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "control", "role": "AWADDR" },"address":[{"name":"lteCellSearch","role":"start","value":"0","valid_bit":"0"},{"name":"lteCellSearch","role":"continue","value":"0","valid_bit":"4"},{"name":"lteCellSearch","role":"auto_start","value":"0","valid_bit":"7"},{"name":"OUT_RSLT","role":"data","value":"48"}] },
	{ "name": "s_axi_control_AWVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "AWVALID" } },
	{ "name": "s_axi_control_AWREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "AWREADY" } },
	{ "name": "s_axi_control_WVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "WVALID" } },
	{ "name": "s_axi_control_WREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "WREADY" } },
	{ "name": "s_axi_control_WDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "control", "role": "WDATA" } },
	{ "name": "s_axi_control_WSTRB", "direction": "in", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "control", "role": "WSTRB" } },
	{ "name": "s_axi_control_ARADDR", "direction": "in", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "control", "role": "ARADDR" },"address":[{"name":"lteCellSearch","role":"start","value":"0","valid_bit":"0"},{"name":"lteCellSearch","role":"done","value":"0","valid_bit":"1"},{"name":"lteCellSearch","role":"idle","value":"0","valid_bit":"2"},{"name":"lteCellSearch","role":"ready","value":"0","valid_bit":"3"},{"name":"lteCellSearch","role":"auto_start","value":"0","valid_bit":"7"},{"name":"OUT_PSS_ID","role":"data","value":"16"}, {"name":"OUT_PSS_ID","role":"valid","value":"20","valid_bit":"0"},{"name":"OUT_PEAK_INDEX","role":"data","value":"32"}, {"name":"OUT_PEAK_INDEX","role":"valid","value":"36","valid_bit":"0"}] },
	{ "name": "s_axi_control_ARVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "ARVALID" } },
	{ "name": "s_axi_control_ARREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "ARREADY" } },
	{ "name": "s_axi_control_RVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "RVALID" } },
	{ "name": "s_axi_control_RREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "RREADY" } },
	{ "name": "s_axi_control_RDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "control", "role": "RDATA" } },
	{ "name": "s_axi_control_RRESP", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "control", "role": "RRESP" } },
	{ "name": "s_axi_control_BVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "BVALID" } },
	{ "name": "s_axi_control_BREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "BREADY" } },
	{ "name": "s_axi_control_BRESP", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "control", "role": "BRESP" } },
	{ "name": "interrupt", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "interrupt" } }, 
 	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst_n", "role": "default" }} , 
 	{ "name": "m_axi_gmem_AWVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem", "role": "AWVALID" }} , 
 	{ "name": "m_axi_gmem_AWREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem", "role": "AWREADY" }} , 
 	{ "name": "m_axi_gmem_AWADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "gmem", "role": "AWADDR" }} , 
 	{ "name": "m_axi_gmem_AWID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem", "role": "AWID" }} , 
 	{ "name": "m_axi_gmem_AWLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "gmem", "role": "AWLEN" }} , 
 	{ "name": "m_axi_gmem_AWSIZE", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "gmem", "role": "AWSIZE" }} , 
 	{ "name": "m_axi_gmem_AWBURST", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "gmem", "role": "AWBURST" }} , 
 	{ "name": "m_axi_gmem_AWLOCK", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "gmem", "role": "AWLOCK" }} , 
 	{ "name": "m_axi_gmem_AWCACHE", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem", "role": "AWCACHE" }} , 
 	{ "name": "m_axi_gmem_AWPROT", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "gmem", "role": "AWPROT" }} , 
 	{ "name": "m_axi_gmem_AWQOS", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem", "role": "AWQOS" }} , 
 	{ "name": "m_axi_gmem_AWREGION", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem", "role": "AWREGION" }} , 
 	{ "name": "m_axi_gmem_AWUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem", "role": "AWUSER" }} , 
 	{ "name": "m_axi_gmem_WVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem", "role": "WVALID" }} , 
 	{ "name": "m_axi_gmem_WREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem", "role": "WREADY" }} , 
 	{ "name": "m_axi_gmem_WDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "gmem", "role": "WDATA" }} , 
 	{ "name": "m_axi_gmem_WSTRB", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem", "role": "WSTRB" }} , 
 	{ "name": "m_axi_gmem_WLAST", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem", "role": "WLAST" }} , 
 	{ "name": "m_axi_gmem_WID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem", "role": "WID" }} , 
 	{ "name": "m_axi_gmem_WUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem", "role": "WUSER" }} , 
 	{ "name": "m_axi_gmem_ARVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem", "role": "ARVALID" }} , 
 	{ "name": "m_axi_gmem_ARREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem", "role": "ARREADY" }} , 
 	{ "name": "m_axi_gmem_ARADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "gmem", "role": "ARADDR" }} , 
 	{ "name": "m_axi_gmem_ARID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem", "role": "ARID" }} , 
 	{ "name": "m_axi_gmem_ARLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "gmem", "role": "ARLEN" }} , 
 	{ "name": "m_axi_gmem_ARSIZE", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "gmem", "role": "ARSIZE" }} , 
 	{ "name": "m_axi_gmem_ARBURST", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "gmem", "role": "ARBURST" }} , 
 	{ "name": "m_axi_gmem_ARLOCK", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "gmem", "role": "ARLOCK" }} , 
 	{ "name": "m_axi_gmem_ARCACHE", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem", "role": "ARCACHE" }} , 
 	{ "name": "m_axi_gmem_ARPROT", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "gmem", "role": "ARPROT" }} , 
 	{ "name": "m_axi_gmem_ARQOS", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem", "role": "ARQOS" }} , 
 	{ "name": "m_axi_gmem_ARREGION", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "gmem", "role": "ARREGION" }} , 
 	{ "name": "m_axi_gmem_ARUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem", "role": "ARUSER" }} , 
 	{ "name": "m_axi_gmem_RVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem", "role": "RVALID" }} , 
 	{ "name": "m_axi_gmem_RREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem", "role": "RREADY" }} , 
 	{ "name": "m_axi_gmem_RDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "gmem", "role": "RDATA" }} , 
 	{ "name": "m_axi_gmem_RLAST", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem", "role": "RLAST" }} , 
 	{ "name": "m_axi_gmem_RID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem", "role": "RID" }} , 
 	{ "name": "m_axi_gmem_RUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem", "role": "RUSER" }} , 
 	{ "name": "m_axi_gmem_RRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "gmem", "role": "RRESP" }} , 
 	{ "name": "m_axi_gmem_BVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem", "role": "BVALID" }} , 
 	{ "name": "m_axi_gmem_BREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem", "role": "BREADY" }} , 
 	{ "name": "m_axi_gmem_BRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "gmem", "role": "BRESP" }} , 
 	{ "name": "m_axi_gmem_BID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem", "role": "BID" }} , 
 	{ "name": "m_axi_gmem_BUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "gmem", "role": "BUSER" }} , 
 	{ "name": "IN_R_TDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "IN_R_V_data_V", "role": "default" }} , 
 	{ "name": "IN_R_TVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "invld", "bundle":{"name": "IN_R_V_last_V", "role": "default" }} , 
 	{ "name": "IN_R_TREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "inacc", "bundle":{"name": "IN_R_V_last_V", "role": "default" }} , 
 	{ "name": "IN_R_TKEEP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "IN_R_V_keep_V", "role": "default" }} , 
 	{ "name": "IN_R_TSTRB", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "IN_R_V_strb_V", "role": "default" }} , 
 	{ "name": "IN_R_TLAST", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "IN_R_V_last_V", "role": "default" }} , 
 	{ "name": "IN_I_TDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "IN_I_V_data_V", "role": "default" }} , 
 	{ "name": "IN_I_TVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "invld", "bundle":{"name": "IN_I_V_last_V", "role": "default" }} , 
 	{ "name": "IN_I_TREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "inacc", "bundle":{"name": "IN_I_V_last_V", "role": "default" }} , 
 	{ "name": "IN_I_TKEEP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "IN_I_V_keep_V", "role": "default" }} , 
 	{ "name": "IN_I_TSTRB", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "IN_I_V_strb_V", "role": "default" }} , 
 	{ "name": "IN_I_TLAST", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "IN_I_V_last_V", "role": "default" }} , 
 	{ "name": "OUT_FFT_TDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "OUT_FFT_V_data_V", "role": "default" }} , 
 	{ "name": "OUT_FFT_TVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "OUT_FFT_V_last_V", "role": "default" }} , 
 	{ "name": "OUT_FFT_TREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "outacc", "bundle":{"name": "OUT_FFT_V_last_V", "role": "default" }} , 
 	{ "name": "OUT_FFT_TKEEP", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "OUT_FFT_V_keep_V", "role": "default" }} , 
 	{ "name": "OUT_FFT_TSTRB", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "OUT_FFT_V_strb_V", "role": "default" }} , 
 	{ "name": "OUT_FFT_TLAST", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "OUT_FFT_V_last_V", "role": "default" }} , 
 	{ "name": "pss_id_TDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "pss_id_V_data_V", "role": "default" }} , 
 	{ "name": "pss_id_TVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "pss_id_V_last_V", "role": "default" }} , 
 	{ "name": "pss_id_TREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "outacc", "bundle":{"name": "pss_id_V_last_V", "role": "default" }} , 
 	{ "name": "pss_id_TKEEP", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "pss_id_V_keep_V", "role": "default" }} , 
 	{ "name": "pss_id_TSTRB", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "pss_id_V_strb_V", "role": "default" }} , 
 	{ "name": "pss_id_TLAST", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "pss_id_V_last_V", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3", "4", "5", "6", "61", "62", "63", "64", "65", "66", "67", "68", "69", "70", "71", "72", "73", "74", "75", "76", "77", "78"],
		"CDFG" : "lteCellSearch",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "-1", "EstimateLatencyMax" : "-1",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "1",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "gmem", "Type" : "MAXI", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "gmem_blk_n_AW", "Type" : "RtlSignal"},
					{"Name" : "gmem_blk_n_W", "Type" : "RtlSignal"},
					{"Name" : "gmem_blk_n_B", "Type" : "RtlSignal"}]},
			{"Name" : "IN_R_V_data_V", "Type" : "Axis", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "IN_R_TDATA_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "IN_R_V_keep_V", "Type" : "Axis", "Direction" : "I"},
			{"Name" : "IN_R_V_strb_V", "Type" : "Axis", "Direction" : "I"},
			{"Name" : "IN_R_V_last_V", "Type" : "Axis", "Direction" : "I"},
			{"Name" : "IN_I_V_data_V", "Type" : "Axis", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "IN_I_TDATA_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "IN_I_V_keep_V", "Type" : "Axis", "Direction" : "I"},
			{"Name" : "IN_I_V_strb_V", "Type" : "Axis", "Direction" : "I"},
			{"Name" : "IN_I_V_last_V", "Type" : "Axis", "Direction" : "I"},
			{"Name" : "OUT_FFT_V_data_V", "Type" : "Axis", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "61", "SubInstance" : "grp_write_buffer_fft_fu_374", "Port" : "OUT_FFT_V_data_V"}]},
			{"Name" : "OUT_FFT_V_keep_V", "Type" : "Axis", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "61", "SubInstance" : "grp_write_buffer_fft_fu_374", "Port" : "OUT_FFT_V_keep_V"}]},
			{"Name" : "OUT_FFT_V_strb_V", "Type" : "Axis", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "61", "SubInstance" : "grp_write_buffer_fft_fu_374", "Port" : "OUT_FFT_V_strb_V"}]},
			{"Name" : "OUT_FFT_V_last_V", "Type" : "Axis", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "61", "SubInstance" : "grp_write_buffer_fft_fu_374", "Port" : "OUT_FFT_V_last_V"}]},
			{"Name" : "pss_id_V_data_V", "Type" : "Axis", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "61", "SubInstance" : "grp_write_buffer_fft_fu_374", "Port" : "PSS_V_data_V"}]},
			{"Name" : "pss_id_V_keep_V", "Type" : "Axis", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "61", "SubInstance" : "grp_write_buffer_fft_fu_374", "Port" : "PSS_V_keep_V"}]},
			{"Name" : "pss_id_V_strb_V", "Type" : "Axis", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "61", "SubInstance" : "grp_write_buffer_fft_fu_374", "Port" : "PSS_V_strb_V"}]},
			{"Name" : "pss_id_V_last_V", "Type" : "Axis", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "61", "SubInstance" : "grp_write_buffer_fft_fu_374", "Port" : "PSS_V_last_V"}]},
			{"Name" : "OUT_PSS_ID", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "OUT_PEAK_INDEX", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "OUT_RSLT", "Type" : "None", "Direction" : "I"},
			{"Name" : "sum_mag_V", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "6", "SubInstance" : "grp_dataflow_parent_loop_proc_fu_337", "Port" : "sum_mag_V"}]},
			{"Name" : "mag_buff_V_0", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "6", "SubInstance" : "grp_dataflow_parent_loop_proc_fu_337", "Port" : "mag_buff_V_0"}]},
			{"Name" : "mag_buff_V_1", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "6", "SubInstance" : "grp_dataflow_parent_loop_proc_fu_337", "Port" : "mag_buff_V_1"}]},
			{"Name" : "IN_R_buff_V_0", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "6", "SubInstance" : "grp_dataflow_parent_loop_proc_fu_337", "Port" : "IN_R_buff_V_0"}]},
			{"Name" : "IN_R_buff_V_1", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "6", "SubInstance" : "grp_dataflow_parent_loop_proc_fu_337", "Port" : "IN_R_buff_V_1"}]},
			{"Name" : "IN_I_buff_V_0", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "6", "SubInstance" : "grp_dataflow_parent_loop_proc_fu_337", "Port" : "IN_I_buff_V_0"}]},
			{"Name" : "IN_I_buff_V_1", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "6", "SubInstance" : "grp_dataflow_parent_loop_proc_fu_337", "Port" : "IN_I_buff_V_1"}]},
			{"Name" : "td_pss_real_V_0", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "6", "SubInstance" : "grp_dataflow_parent_loop_proc_fu_337", "Port" : "td_pss_real_V_0"}]},
			{"Name" : "td_pss_imag_V_0", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "6", "SubInstance" : "grp_dataflow_parent_loop_proc_fu_337", "Port" : "td_pss_imag_V_0"}]},
			{"Name" : "td_pss_real_V_1", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "6", "SubInstance" : "grp_dataflow_parent_loop_proc_fu_337", "Port" : "td_pss_real_V_1"}]},
			{"Name" : "td_pss_imag_V_1", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "6", "SubInstance" : "grp_dataflow_parent_loop_proc_fu_337", "Port" : "td_pss_imag_V_1"}]},
			{"Name" : "td_pss_real_V_2", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "6", "SubInstance" : "grp_dataflow_parent_loop_proc_fu_337", "Port" : "td_pss_real_V_2"}]},
			{"Name" : "td_pss_imag_V_2", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "6", "SubInstance" : "grp_dataflow_parent_loop_proc_fu_337", "Port" : "td_pss_imag_V_2"}]},
			{"Name" : "curr_max_V", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "6", "SubInstance" : "grp_dataflow_parent_loop_proc_fu_337", "Port" : "curr_max_V"}]}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.control_s_axi_U", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.gmem_m_axi_U", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.pss_rslt_temp_U", "Parent" : "0"},
	{"ID" : "4", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.IN_real_V_U", "Parent" : "0"},
	{"ID" : "5", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.IN_imag_V_U", "Parent" : "0"},
	{"ID" : "6", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_dataflow_parent_loop_proc_fu_337", "Parent" : "0", "Child" : ["7"],
		"CDFG" : "dataflow_parent_loop_proc",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "Dataflow", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "1",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "25824004", "EstimateLatencyMax" : "38208004",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "1",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"InputProcess" : [
			{"ID" : "7", "Name" : "dataflow_in_loop_lteCellSearch_U0"}],
		"OutputProcess" : [
			{"ID" : "7", "Name" : "dataflow_in_loop_lteCellSearch_U0"}],
		"Port" : [
			{"Name" : "IN_real_V", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "7", "SubInstance" : "dataflow_in_loop_lteCellSearch_U0", "Port" : "IN_real_V"}]},
			{"Name" : "IN_imag_V", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "7", "SubInstance" : "dataflow_in_loop_lteCellSearch_U0", "Port" : "IN_imag_V"}]},
			{"Name" : "pss_id_temp", "Type" : "Vld", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "7", "SubInstance" : "dataflow_in_loop_lteCellSearch_U0", "Port" : "pss_id_temp"}]},
			{"Name" : "peak_id_temp", "Type" : "Vld", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "7", "SubInstance" : "dataflow_in_loop_lteCellSearch_U0", "Port" : "peak_id_temp"}]},
			{"Name" : "pss_rslt_temp", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "7", "SubInstance" : "dataflow_in_loop_lteCellSearch_U0", "Port" : "pss_rslt_temp"}]},
			{"Name" : "sum_mag_V", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "7", "SubInstance" : "dataflow_in_loop_lteCellSearch_U0", "Port" : "sum_mag_V"}]},
			{"Name" : "mag_buff_V_0", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "7", "SubInstance" : "dataflow_in_loop_lteCellSearch_U0", "Port" : "mag_buff_V_0"}]},
			{"Name" : "mag_buff_V_1", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "7", "SubInstance" : "dataflow_in_loop_lteCellSearch_U0", "Port" : "mag_buff_V_1"}]},
			{"Name" : "IN_R_buff_V_0", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "7", "SubInstance" : "dataflow_in_loop_lteCellSearch_U0", "Port" : "IN_R_buff_V_0"}]},
			{"Name" : "IN_R_buff_V_1", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "7", "SubInstance" : "dataflow_in_loop_lteCellSearch_U0", "Port" : "IN_R_buff_V_1"}]},
			{"Name" : "IN_I_buff_V_0", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "7", "SubInstance" : "dataflow_in_loop_lteCellSearch_U0", "Port" : "IN_I_buff_V_0"}]},
			{"Name" : "IN_I_buff_V_1", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "7", "SubInstance" : "dataflow_in_loop_lteCellSearch_U0", "Port" : "IN_I_buff_V_1"}]},
			{"Name" : "td_pss_real_V_0", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "7", "SubInstance" : "dataflow_in_loop_lteCellSearch_U0", "Port" : "td_pss_real_V_0"}]},
			{"Name" : "td_pss_imag_V_0", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "7", "SubInstance" : "dataflow_in_loop_lteCellSearch_U0", "Port" : "td_pss_imag_V_0"}]},
			{"Name" : "td_pss_real_V_1", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "7", "SubInstance" : "dataflow_in_loop_lteCellSearch_U0", "Port" : "td_pss_real_V_1"}]},
			{"Name" : "td_pss_imag_V_1", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "7", "SubInstance" : "dataflow_in_loop_lteCellSearch_U0", "Port" : "td_pss_imag_V_1"}]},
			{"Name" : "td_pss_real_V_2", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "7", "SubInstance" : "dataflow_in_loop_lteCellSearch_U0", "Port" : "td_pss_real_V_2"}]},
			{"Name" : "td_pss_imag_V_2", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "7", "SubInstance" : "dataflow_in_loop_lteCellSearch_U0", "Port" : "td_pss_imag_V_2"}]},
			{"Name" : "curr_max_V", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "7", "SubInstance" : "dataflow_in_loop_lteCellSearch_U0", "Port" : "curr_max_V"}]}]},
	{"ID" : "7", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_dataflow_parent_loop_proc_fu_337.dataflow_in_loop_lteCellSearch_U0", "Parent" : "6", "Child" : ["8", "9", "16", "50", "54", "55", "56", "57", "58", "59", "60"],
		"CDFG" : "dataflow_in_loop_lteCellSearch",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "Dataflow", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "1",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "271", "EstimateLatencyMax" : "400",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "1",
		"InDataflowNetwork" : "1",
		"HasNonBlockingOperation" : "0",
		"InputProcess" : [
			{"ID" : "8", "Name" : "dataflow_in_loop_lteCellSearch_entry25_U0"},
			{"ID" : "9", "Name" : "compute_threshold_U0"},
			{"ID" : "16", "Name" : "compute_pss_U0"}],
		"OutputProcess" : [
			{"ID" : "50", "Name" : "track_pss_peak_U0"}],
		"Port" : [
			{"Name" : "IN_real_V", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "9", "SubInstance" : "compute_threshold_U0", "Port" : "IN_real_V"},
					{"ID" : "16", "SubInstance" : "compute_pss_U0", "Port" : "IN_real_V"}]},
			{"Name" : "trunc_ln264", "Type" : "None", "Direction" : "I"},
			{"Name" : "IN_imag_V", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "9", "SubInstance" : "compute_threshold_U0", "Port" : "IN_imag_V"},
					{"ID" : "16", "SubInstance" : "compute_pss_U0", "Port" : "IN_imag_V"}]},
			{"Name" : "pss_id_temp", "Type" : "Vld", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "50", "SubInstance" : "track_pss_peak_U0", "Port" : "pss_id_temp"}]},
			{"Name" : "peak_id_temp", "Type" : "Vld", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "50", "SubInstance" : "track_pss_peak_U0", "Port" : "peak_id_temp"}]},
			{"Name" : "pss_rslt_temp", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "50", "SubInstance" : "track_pss_peak_U0", "Port" : "pss_rslt_temp"}]},
			{"Name" : "sum_mag_V", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "9", "SubInstance" : "compute_threshold_U0", "Port" : "sum_mag_V"}]},
			{"Name" : "mag_buff_V_0", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "9", "SubInstance" : "compute_threshold_U0", "Port" : "mag_buff_V_0"}]},
			{"Name" : "mag_buff_V_1", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "9", "SubInstance" : "compute_threshold_U0", "Port" : "mag_buff_V_1"}]},
			{"Name" : "IN_R_buff_V_0", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "16", "SubInstance" : "compute_pss_U0", "Port" : "IN_R_buff_V_0"}]},
			{"Name" : "IN_R_buff_V_1", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "16", "SubInstance" : "compute_pss_U0", "Port" : "IN_R_buff_V_1"}]},
			{"Name" : "IN_I_buff_V_0", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "16", "SubInstance" : "compute_pss_U0", "Port" : "IN_I_buff_V_0"}]},
			{"Name" : "IN_I_buff_V_1", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "16", "SubInstance" : "compute_pss_U0", "Port" : "IN_I_buff_V_1"}]},
			{"Name" : "td_pss_real_V_0", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "16", "SubInstance" : "compute_pss_U0", "Port" : "td_pss_real_V_0"}]},
			{"Name" : "td_pss_imag_V_0", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "16", "SubInstance" : "compute_pss_U0", "Port" : "td_pss_imag_V_0"}]},
			{"Name" : "td_pss_real_V_1", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "16", "SubInstance" : "compute_pss_U0", "Port" : "td_pss_real_V_1"}]},
			{"Name" : "td_pss_imag_V_1", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "16", "SubInstance" : "compute_pss_U0", "Port" : "td_pss_imag_V_1"}]},
			{"Name" : "td_pss_real_V_2", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "16", "SubInstance" : "compute_pss_U0", "Port" : "td_pss_real_V_2"}]},
			{"Name" : "td_pss_imag_V_2", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "16", "SubInstance" : "compute_pss_U0", "Port" : "td_pss_imag_V_2"}]},
			{"Name" : "curr_max_V", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "50", "SubInstance" : "track_pss_peak_U0", "Port" : "curr_max_V"}]}]},
	{"ID" : "8", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_dataflow_parent_loop_proc_fu_337.dataflow_in_loop_lteCellSearch_U0.dataflow_in_loop_lteCellSearch_entry25_U0", "Parent" : "7",
		"CDFG" : "dataflow_in_loop_lteCellSearch_entry25",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "0", "EstimateLatencyMin" : "0", "EstimateLatencyMax" : "0",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "1",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "trunc_ln264", "Type" : "None", "Direction" : "I"},
			{"Name" : "trunc_ln264_out", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "9", "DependentChan" : "54", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "trunc_ln264_out_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "trunc_ln264_out1", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "16", "DependentChan" : "55", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "trunc_ln264_out1_blk_n", "Type" : "RtlSignal"}]}]},
	{"ID" : "9", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_dataflow_parent_loop_proc_fu_337.dataflow_in_loop_lteCellSearch_U0.compute_threshold_U0", "Parent" : "7", "Child" : ["10", "11", "12", "13", "14", "15"],
		"CDFG" : "compute_threshold",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "132", "EstimateLatencyMax" : "261",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "1",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "IN_real_V", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "trunc_ln264", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "8", "DependentChan" : "54", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "trunc_ln264_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "IN_imag_V", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "trunc_ln264_out", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "50", "DependentChan" : "56", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "trunc_ln264_out_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "sum_mag_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "mag_buff_V_0", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "mag_buff_V_1", "Type" : "Memory", "Direction" : "IO"}]},
	{"ID" : "10", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_dataflow_parent_loop_proc_fu_337.dataflow_in_loop_lteCellSearch_U0.compute_threshold_U0.mag_buff_V_0_U", "Parent" : "9"},
	{"ID" : "11", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_dataflow_parent_loop_proc_fu_337.dataflow_in_loop_lteCellSearch_U0.compute_threshold_U0.mag_buff_V_1_U", "Parent" : "9"},
	{"ID" : "12", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_dataflow_parent_loop_proc_fu_337.dataflow_in_loop_lteCellSearch_U0.compute_threshold_U0.mul_23s_20ns_43_1_1_U4", "Parent" : "9"},
	{"ID" : "13", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_dataflow_parent_loop_proc_fu_337.dataflow_in_loop_lteCellSearch_U0.compute_threshold_U0.mul_23s_20ns_43_1_1_U5", "Parent" : "9"},
	{"ID" : "14", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_dataflow_parent_loop_proc_fu_337.dataflow_in_loop_lteCellSearch_U0.compute_threshold_U0.mul_23s_23s_46_1_1_U6", "Parent" : "9"},
	{"ID" : "15", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_dataflow_parent_loop_proc_fu_337.dataflow_in_loop_lteCellSearch_U0.compute_threshold_U0.mul_23s_23s_46_1_1_U7", "Parent" : "9"},
	{"ID" : "16", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_dataflow_parent_loop_proc_fu_337.dataflow_in_loop_lteCellSearch_U0.compute_pss_U0", "Parent" : "7", "Child" : ["17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "47", "48", "49"],
		"CDFG" : "compute_pss",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "268", "EstimateLatencyMax" : "397",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "1",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "IN_real_V", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "trunc_ln264", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "8", "DependentChan" : "55", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "trunc_ln264_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "IN_imag_V", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "IN_R_buff_V_0", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "IN_R_buff_V_1", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "IN_I_buff_V_0", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "IN_I_buff_V_1", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "td_pss_real_V_0", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "td_pss_imag_V_0", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "td_pss_real_V_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "td_pss_imag_V_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "td_pss_real_V_2", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "td_pss_imag_V_2", "Type" : "Memory", "Direction" : "I"}]},
	{"ID" : "17", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_dataflow_parent_loop_proc_fu_337.dataflow_in_loop_lteCellSearch_U0.compute_pss_U0.IN_R_buff_V_0_U", "Parent" : "16"},
	{"ID" : "18", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_dataflow_parent_loop_proc_fu_337.dataflow_in_loop_lteCellSearch_U0.compute_pss_U0.IN_R_buff_V_1_U", "Parent" : "16"},
	{"ID" : "19", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_dataflow_parent_loop_proc_fu_337.dataflow_in_loop_lteCellSearch_U0.compute_pss_U0.IN_I_buff_V_0_U", "Parent" : "16"},
	{"ID" : "20", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_dataflow_parent_loop_proc_fu_337.dataflow_in_loop_lteCellSearch_U0.compute_pss_U0.IN_I_buff_V_1_U", "Parent" : "16"},
	{"ID" : "21", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_dataflow_parent_loop_proc_fu_337.dataflow_in_loop_lteCellSearch_U0.compute_pss_U0.td_pss_real_V_0_U", "Parent" : "16"},
	{"ID" : "22", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_dataflow_parent_loop_proc_fu_337.dataflow_in_loop_lteCellSearch_U0.compute_pss_U0.td_pss_imag_V_0_U", "Parent" : "16"},
	{"ID" : "23", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_dataflow_parent_loop_proc_fu_337.dataflow_in_loop_lteCellSearch_U0.compute_pss_U0.td_pss_real_V_1_U", "Parent" : "16"},
	{"ID" : "24", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_dataflow_parent_loop_proc_fu_337.dataflow_in_loop_lteCellSearch_U0.compute_pss_U0.td_pss_imag_V_1_U", "Parent" : "16"},
	{"ID" : "25", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_dataflow_parent_loop_proc_fu_337.dataflow_in_loop_lteCellSearch_U0.compute_pss_U0.td_pss_real_V_2_U", "Parent" : "16"},
	{"ID" : "26", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_dataflow_parent_loop_proc_fu_337.dataflow_in_loop_lteCellSearch_U0.compute_pss_U0.td_pss_imag_V_2_U", "Parent" : "16"},
	{"ID" : "27", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_dataflow_parent_loop_proc_fu_337.dataflow_in_loop_lteCellSearch_U0.compute_pss_U0.grp_sqrt_fixed_40_18_s_fu_535", "Parent" : "16",
		"CDFG" : "sqrt_fixed_40_18_s",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "0", "ap_start" : "0", "ap_ready" : "0", "ap_done" : "0", "ap_continue" : "0", "ap_idle" : "0", "real_start" : "0",
		"Pipeline" : "Aligned", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "4", "EstimateLatencyMin" : "4", "EstimateLatencyMax" : "4",
		"Combinational" : "0",
		"Datapath" : "1",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "x", "Type" : "None", "Direction" : "I"}]},
	{"ID" : "28", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_dataflow_parent_loop_proc_fu_337.dataflow_in_loop_lteCellSearch_U0.compute_pss_U0.grp_sqrt_fixed_40_18_s_fu_540", "Parent" : "16",
		"CDFG" : "sqrt_fixed_40_18_s",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "0", "ap_start" : "0", "ap_ready" : "0", "ap_done" : "0", "ap_continue" : "0", "ap_idle" : "0", "real_start" : "0",
		"Pipeline" : "Aligned", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "4", "EstimateLatencyMin" : "4", "EstimateLatencyMax" : "4",
		"Combinational" : "0",
		"Datapath" : "1",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "x", "Type" : "None", "Direction" : "I"}]},
	{"ID" : "29", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_dataflow_parent_loop_proc_fu_337.dataflow_in_loop_lteCellSearch_U0.compute_pss_U0.grp_sqrt_fixed_40_18_s_fu_545", "Parent" : "16",
		"CDFG" : "sqrt_fixed_40_18_s",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "0", "ap_start" : "0", "ap_ready" : "0", "ap_done" : "0", "ap_continue" : "0", "ap_idle" : "0", "real_start" : "0",
		"Pipeline" : "Aligned", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "4", "EstimateLatencyMin" : "4", "EstimateLatencyMax" : "4",
		"Combinational" : "0",
		"Datapath" : "1",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "x", "Type" : "None", "Direction" : "I"}]},
	{"ID" : "30", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_dataflow_parent_loop_proc_fu_337.dataflow_in_loop_lteCellSearch_U0.compute_pss_U0.mul_23s_31ns_48_1_1_U17", "Parent" : "16"},
	{"ID" : "31", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_dataflow_parent_loop_proc_fu_337.dataflow_in_loop_lteCellSearch_U0.compute_pss_U0.mul_23s_31ns_48_1_1_U18", "Parent" : "16"},
	{"ID" : "32", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_dataflow_parent_loop_proc_fu_337.dataflow_in_loop_lteCellSearch_U0.compute_pss_U0.mul_32s_23s_54_1_1_U19", "Parent" : "16"},
	{"ID" : "33", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_dataflow_parent_loop_proc_fu_337.dataflow_in_loop_lteCellSearch_U0.compute_pss_U0.mul_32s_22s_53_1_1_U20", "Parent" : "16"},
	{"ID" : "34", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_dataflow_parent_loop_proc_fu_337.dataflow_in_loop_lteCellSearch_U0.compute_pss_U0.mul_33s_23s_55_1_1_U21", "Parent" : "16"},
	{"ID" : "35", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_dataflow_parent_loop_proc_fu_337.dataflow_in_loop_lteCellSearch_U0.compute_pss_U0.mul_32s_22s_53_1_1_U22", "Parent" : "16"},
	{"ID" : "36", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_dataflow_parent_loop_proc_fu_337.dataflow_in_loop_lteCellSearch_U0.compute_pss_U0.mul_32s_22s_53_1_1_U23", "Parent" : "16"},
	{"ID" : "37", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_dataflow_parent_loop_proc_fu_337.dataflow_in_loop_lteCellSearch_U0.compute_pss_U0.mul_33s_23s_55_1_1_U24", "Parent" : "16"},
	{"ID" : "38", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_dataflow_parent_loop_proc_fu_337.dataflow_in_loop_lteCellSearch_U0.compute_pss_U0.mul_32s_22s_53_1_1_U25", "Parent" : "16"},
	{"ID" : "39", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_dataflow_parent_loop_proc_fu_337.dataflow_in_loop_lteCellSearch_U0.compute_pss_U0.mul_32s_22s_53_1_1_U26", "Parent" : "16"},
	{"ID" : "40", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_dataflow_parent_loop_proc_fu_337.dataflow_in_loop_lteCellSearch_U0.compute_pss_U0.mul_33s_23s_55_1_1_U27", "Parent" : "16"},
	{"ID" : "41", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_dataflow_parent_loop_proc_fu_337.dataflow_in_loop_lteCellSearch_U0.compute_pss_U0.mul_32s_32s_50_1_1_U28", "Parent" : "16"},
	{"ID" : "42", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_dataflow_parent_loop_proc_fu_337.dataflow_in_loop_lteCellSearch_U0.compute_pss_U0.mul_32s_32s_50_1_1_U29", "Parent" : "16"},
	{"ID" : "43", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_dataflow_parent_loop_proc_fu_337.dataflow_in_loop_lteCellSearch_U0.compute_pss_U0.mul_32s_32s_50_1_1_U30", "Parent" : "16"},
	{"ID" : "44", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_dataflow_parent_loop_proc_fu_337.dataflow_in_loop_lteCellSearch_U0.compute_pss_U0.mul_32s_32s_50_1_1_U31", "Parent" : "16"},
	{"ID" : "45", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_dataflow_parent_loop_proc_fu_337.dataflow_in_loop_lteCellSearch_U0.compute_pss_U0.mul_32s_32s_50_1_1_U32", "Parent" : "16"},
	{"ID" : "46", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_dataflow_parent_loop_proc_fu_337.dataflow_in_loop_lteCellSearch_U0.compute_pss_U0.mul_32s_32s_50_1_1_U33", "Parent" : "16"},
	{"ID" : "47", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_dataflow_parent_loop_proc_fu_337.dataflow_in_loop_lteCellSearch_U0.compute_pss_U0.mul_31ns_14ns_44_1_1_U34", "Parent" : "16"},
	{"ID" : "48", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_dataflow_parent_loop_proc_fu_337.dataflow_in_loop_lteCellSearch_U0.compute_pss_U0.mul_31ns_14ns_44_1_1_U35", "Parent" : "16"},
	{"ID" : "49", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_dataflow_parent_loop_proc_fu_337.dataflow_in_loop_lteCellSearch_U0.compute_pss_U0.mul_31ns_14ns_44_1_1_U36", "Parent" : "16"},
	{"ID" : "50", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_dataflow_parent_loop_proc_fu_337.dataflow_in_loop_lteCellSearch_U0.track_pss_peak_U0", "Parent" : "7", "Child" : ["51", "52", "53"],
		"CDFG" : "track_pss_peak",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "1", "EstimateLatencyMax" : "1",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "1",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "p_read", "Type" : "None", "Direction" : "I", "DependentProc" : "16", "DependentChan" : "58", "DependentChanDepth" : "2", "DependentChanType" : "1"},
			{"Name" : "p_read1", "Type" : "None", "Direction" : "I", "DependentProc" : "16", "DependentChan" : "59", "DependentChanDepth" : "2", "DependentChanType" : "1"},
			{"Name" : "p_read2", "Type" : "None", "Direction" : "I", "DependentProc" : "16", "DependentChan" : "60", "DependentChanDepth" : "2", "DependentChanType" : "1"},
			{"Name" : "p_read3", "Type" : "None", "Direction" : "I", "DependentProc" : "9", "DependentChan" : "57", "DependentChanDepth" : "2", "DependentChanType" : "1"},
			{"Name" : "pss_id_temp", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "peak_id_temp", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "trunc_ln264", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "9", "DependentChan" : "56", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "trunc_ln264_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "pss_rslt_temp", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "curr_max_V", "Type" : "OVld", "Direction" : "IO"}]},
	{"ID" : "51", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_dataflow_parent_loop_proc_fu_337.dataflow_in_loop_lteCellSearch_U0.track_pss_peak_U0.mul_42ns_37ns_78_1_1_U53", "Parent" : "50"},
	{"ID" : "52", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_dataflow_parent_loop_proc_fu_337.dataflow_in_loop_lteCellSearch_U0.track_pss_peak_U0.mul_42ns_37ns_78_1_1_U54", "Parent" : "50"},
	{"ID" : "53", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_dataflow_parent_loop_proc_fu_337.dataflow_in_loop_lteCellSearch_U0.track_pss_peak_U0.mul_42ns_37ns_78_1_1_U55", "Parent" : "50"},
	{"ID" : "54", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_dataflow_parent_loop_proc_fu_337.dataflow_in_loop_lteCellSearch_U0.trunc_ln264_c_U", "Parent" : "7"},
	{"ID" : "55", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_dataflow_parent_loop_proc_fu_337.dataflow_in_loop_lteCellSearch_U0.trunc_ln264_c1_U", "Parent" : "7"},
	{"ID" : "56", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_dataflow_parent_loop_proc_fu_337.dataflow_in_loop_lteCellSearch_U0.trunc_ln264_c2_U", "Parent" : "7"},
	{"ID" : "57", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_dataflow_parent_loop_proc_fu_337.dataflow_in_loop_lteCellSearch_U0.thresh_V_U", "Parent" : "7"},
	{"ID" : "58", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_dataflow_parent_loop_proc_fu_337.dataflow_in_loop_lteCellSearch_U0.pss_rslt_0_V_U", "Parent" : "7"},
	{"ID" : "59", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_dataflow_parent_loop_proc_fu_337.dataflow_in_loop_lteCellSearch_U0.pss_rslt_1_V_U", "Parent" : "7"},
	{"ID" : "60", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_dataflow_parent_loop_proc_fu_337.dataflow_in_loop_lteCellSearch_U0.pss_rslt_2_V_U", "Parent" : "7"},
	{"ID" : "61", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_write_buffer_fft_fu_374", "Parent" : "0",
		"CDFG" : "write_buffer_fft",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "-1", "EstimateLatencyMax" : "-1",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "IN_real_V", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "IN_imag_V", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "OUT_FFT_V_data_V", "Type" : "Axis", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "OUT_FFT_TDATA_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "OUT_FFT_V_keep_V", "Type" : "Axis", "Direction" : "O"},
			{"Name" : "OUT_FFT_V_strb_V", "Type" : "Axis", "Direction" : "O"},
			{"Name" : "OUT_FFT_V_last_V", "Type" : "Axis", "Direction" : "O"},
			{"Name" : "index", "Type" : "None", "Direction" : "I"},
			{"Name" : "pss_id", "Type" : "None", "Direction" : "I"},
			{"Name" : "PSS_V_data_V", "Type" : "Axis", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "pss_id_TDATA_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "PSS_V_keep_V", "Type" : "Axis", "Direction" : "O"},
			{"Name" : "PSS_V_strb_V", "Type" : "Axis", "Direction" : "O"},
			{"Name" : "PSS_V_last_V", "Type" : "Axis", "Direction" : "O"}]},
	{"ID" : "62", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_2ns_18ns_19_1_1_U95", "Parent" : "0"},
	{"ID" : "63", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_IN_R_V_data_V_U", "Parent" : "0"},
	{"ID" : "64", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_IN_R_V_keep_V_U", "Parent" : "0"},
	{"ID" : "65", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_IN_R_V_strb_V_U", "Parent" : "0"},
	{"ID" : "66", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_IN_R_V_last_V_U", "Parent" : "0"},
	{"ID" : "67", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_IN_I_V_data_V_U", "Parent" : "0"},
	{"ID" : "68", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_IN_I_V_keep_V_U", "Parent" : "0"},
	{"ID" : "69", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_IN_I_V_strb_V_U", "Parent" : "0"},
	{"ID" : "70", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_IN_I_V_last_V_U", "Parent" : "0"},
	{"ID" : "71", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_OUT_FFT_V_data_V_U", "Parent" : "0"},
	{"ID" : "72", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_OUT_FFT_V_keep_V_U", "Parent" : "0"},
	{"ID" : "73", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_OUT_FFT_V_strb_V_U", "Parent" : "0"},
	{"ID" : "74", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_OUT_FFT_V_last_V_U", "Parent" : "0"},
	{"ID" : "75", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_pss_id_V_data_V_U", "Parent" : "0"},
	{"ID" : "76", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_pss_id_V_keep_V_U", "Parent" : "0"},
	{"ID" : "77", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_pss_id_V_strb_V_U", "Parent" : "0"},
	{"ID" : "78", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_pss_id_V_last_V_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	lteCellSearch {
		gmem {Type O LastRead 9 FirstWrite 10}
		IN_R_V_data_V {Type I LastRead 3 FirstWrite -1}
		IN_R_V_keep_V {Type I LastRead 3 FirstWrite -1}
		IN_R_V_strb_V {Type I LastRead 3 FirstWrite -1}
		IN_R_V_last_V {Type I LastRead 3 FirstWrite -1}
		IN_I_V_data_V {Type I LastRead 3 FirstWrite -1}
		IN_I_V_keep_V {Type I LastRead 3 FirstWrite -1}
		IN_I_V_strb_V {Type I LastRead 3 FirstWrite -1}
		IN_I_V_last_V {Type I LastRead 3 FirstWrite -1}
		OUT_FFT_V_data_V {Type O LastRead -1 FirstWrite 2}
		OUT_FFT_V_keep_V {Type O LastRead -1 FirstWrite 2}
		OUT_FFT_V_strb_V {Type O LastRead -1 FirstWrite 2}
		OUT_FFT_V_last_V {Type O LastRead -1 FirstWrite 2}
		pss_id_V_data_V {Type O LastRead -1 FirstWrite 3}
		pss_id_V_keep_V {Type O LastRead -1 FirstWrite 3}
		pss_id_V_strb_V {Type O LastRead -1 FirstWrite 3}
		pss_id_V_last_V {Type O LastRead -1 FirstWrite 3}
		OUT_PSS_ID {Type O LastRead -1 FirstWrite 9}
		OUT_PEAK_INDEX {Type O LastRead -1 FirstWrite 9}
		OUT_RSLT {Type I LastRead 0 FirstWrite -1}
		sum_mag_V {Type IO LastRead -1 FirstWrite -1}
		mag_buff_V_0 {Type IO LastRead -1 FirstWrite -1}
		mag_buff_V_1 {Type IO LastRead -1 FirstWrite -1}
		IN_R_buff_V_0 {Type IO LastRead -1 FirstWrite -1}
		IN_R_buff_V_1 {Type IO LastRead -1 FirstWrite -1}
		IN_I_buff_V_0 {Type IO LastRead -1 FirstWrite -1}
		IN_I_buff_V_1 {Type IO LastRead -1 FirstWrite -1}
		td_pss_real_V_0 {Type I LastRead -1 FirstWrite -1}
		td_pss_imag_V_0 {Type I LastRead -1 FirstWrite -1}
		td_pss_real_V_1 {Type I LastRead -1 FirstWrite -1}
		td_pss_imag_V_1 {Type I LastRead -1 FirstWrite -1}
		td_pss_real_V_2 {Type I LastRead -1 FirstWrite -1}
		td_pss_imag_V_2 {Type I LastRead -1 FirstWrite -1}
		curr_max_V {Type IO LastRead -1 FirstWrite -1}}
	dataflow_parent_loop_proc {
		IN_real_V {Type I LastRead 0 FirstWrite -1}
		IN_imag_V {Type I LastRead 0 FirstWrite -1}
		pss_id_temp {Type O LastRead -1 FirstWrite 0}
		peak_id_temp {Type O LastRead -1 FirstWrite 0}
		pss_rslt_temp {Type O LastRead -1 FirstWrite 0}
		sum_mag_V {Type IO LastRead -1 FirstWrite -1}
		mag_buff_V_0 {Type IO LastRead -1 FirstWrite -1}
		mag_buff_V_1 {Type IO LastRead -1 FirstWrite -1}
		IN_R_buff_V_0 {Type IO LastRead -1 FirstWrite -1}
		IN_R_buff_V_1 {Type IO LastRead -1 FirstWrite -1}
		IN_I_buff_V_0 {Type IO LastRead -1 FirstWrite -1}
		IN_I_buff_V_1 {Type IO LastRead -1 FirstWrite -1}
		td_pss_real_V_0 {Type I LastRead -1 FirstWrite -1}
		td_pss_imag_V_0 {Type I LastRead -1 FirstWrite -1}
		td_pss_real_V_1 {Type I LastRead -1 FirstWrite -1}
		td_pss_imag_V_1 {Type I LastRead -1 FirstWrite -1}
		td_pss_real_V_2 {Type I LastRead -1 FirstWrite -1}
		td_pss_imag_V_2 {Type I LastRead -1 FirstWrite -1}
		curr_max_V {Type IO LastRead -1 FirstWrite -1}}
	dataflow_in_loop_lteCellSearch {
		IN_real_V {Type I LastRead 0 FirstWrite -1}
		trunc_ln264 {Type I LastRead 0 FirstWrite -1}
		IN_imag_V {Type I LastRead 0 FirstWrite -1}
		pss_id_temp {Type O LastRead -1 FirstWrite 0}
		peak_id_temp {Type O LastRead -1 FirstWrite 0}
		pss_rslt_temp {Type O LastRead -1 FirstWrite 0}
		sum_mag_V {Type IO LastRead -1 FirstWrite -1}
		mag_buff_V_0 {Type IO LastRead -1 FirstWrite -1}
		mag_buff_V_1 {Type IO LastRead -1 FirstWrite -1}
		IN_R_buff_V_0 {Type IO LastRead -1 FirstWrite -1}
		IN_R_buff_V_1 {Type IO LastRead -1 FirstWrite -1}
		IN_I_buff_V_0 {Type IO LastRead -1 FirstWrite -1}
		IN_I_buff_V_1 {Type IO LastRead -1 FirstWrite -1}
		td_pss_real_V_0 {Type I LastRead -1 FirstWrite -1}
		td_pss_imag_V_0 {Type I LastRead -1 FirstWrite -1}
		td_pss_real_V_1 {Type I LastRead -1 FirstWrite -1}
		td_pss_imag_V_1 {Type I LastRead -1 FirstWrite -1}
		td_pss_real_V_2 {Type I LastRead -1 FirstWrite -1}
		td_pss_imag_V_2 {Type I LastRead -1 FirstWrite -1}
		curr_max_V {Type IO LastRead -1 FirstWrite -1}}
	dataflow_in_loop_lteCellSearch_entry25 {
		trunc_ln264 {Type I LastRead 0 FirstWrite -1}
		trunc_ln264_out {Type O LastRead -1 FirstWrite 0}
		trunc_ln264_out1 {Type O LastRead -1 FirstWrite 0}}
	compute_threshold {
		IN_real_V {Type I LastRead 0 FirstWrite -1}
		trunc_ln264 {Type I LastRead 0 FirstWrite -1}
		IN_imag_V {Type I LastRead 0 FirstWrite -1}
		trunc_ln264_out {Type O LastRead -1 FirstWrite 0}
		sum_mag_V {Type IO LastRead -1 FirstWrite -1}
		mag_buff_V_0 {Type IO LastRead -1 FirstWrite -1}
		mag_buff_V_1 {Type IO LastRead -1 FirstWrite -1}}
	compute_pss {
		IN_real_V {Type I LastRead 0 FirstWrite -1}
		trunc_ln264 {Type I LastRead 0 FirstWrite -1}
		IN_imag_V {Type I LastRead 0 FirstWrite -1}
		IN_R_buff_V_0 {Type IO LastRead -1 FirstWrite -1}
		IN_R_buff_V_1 {Type IO LastRead -1 FirstWrite -1}
		IN_I_buff_V_0 {Type IO LastRead -1 FirstWrite -1}
		IN_I_buff_V_1 {Type IO LastRead -1 FirstWrite -1}
		td_pss_real_V_0 {Type I LastRead -1 FirstWrite -1}
		td_pss_imag_V_0 {Type I LastRead -1 FirstWrite -1}
		td_pss_real_V_1 {Type I LastRead -1 FirstWrite -1}
		td_pss_imag_V_1 {Type I LastRead -1 FirstWrite -1}
		td_pss_real_V_2 {Type I LastRead -1 FirstWrite -1}
		td_pss_imag_V_2 {Type I LastRead -1 FirstWrite -1}}
	sqrt_fixed_40_18_s {
		x {Type I LastRead 0 FirstWrite -1}}
	sqrt_fixed_40_18_s {
		x {Type I LastRead 0 FirstWrite -1}}
	sqrt_fixed_40_18_s {
		x {Type I LastRead 0 FirstWrite -1}}
	track_pss_peak {
		p_read {Type I LastRead 0 FirstWrite -1}
		p_read1 {Type I LastRead 0 FirstWrite -1}
		p_read2 {Type I LastRead 0 FirstWrite -1}
		p_read3 {Type I LastRead 0 FirstWrite -1}
		pss_id_temp {Type O LastRead -1 FirstWrite 0}
		peak_id_temp {Type O LastRead -1 FirstWrite 0}
		trunc_ln264 {Type I LastRead 0 FirstWrite -1}
		pss_rslt_temp {Type O LastRead -1 FirstWrite 0}
		curr_max_V {Type IO LastRead -1 FirstWrite -1}}
	write_buffer_fft {
		IN_real_V {Type I LastRead 2 FirstWrite -1}
		IN_imag_V {Type I LastRead 1 FirstWrite -1}
		OUT_FFT_V_data_V {Type O LastRead -1 FirstWrite 2}
		OUT_FFT_V_keep_V {Type O LastRead -1 FirstWrite 2}
		OUT_FFT_V_strb_V {Type O LastRead -1 FirstWrite 2}
		OUT_FFT_V_last_V {Type O LastRead -1 FirstWrite 2}
		index {Type I LastRead 0 FirstWrite -1}
		pss_id {Type I LastRead 0 FirstWrite -1}
		PSS_V_data_V {Type O LastRead -1 FirstWrite 3}
		PSS_V_keep_V {Type O LastRead -1 FirstWrite 3}
		PSS_V_strb_V {Type O LastRead -1 FirstWrite 3}
		PSS_V_last_V {Type O LastRead -1 FirstWrite 3}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "-1", "Max" : "-1"}
	, {"Name" : "Interval", "Min" : "0", "Max" : "0"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "2", "EnableSignal" : "ap_enable_pp2"}
]}

set Spec2ImplPortList { 
	gmem { m_axi {  { m_axi_gmem_AWVALID VALID 1 1 }  { m_axi_gmem_AWREADY READY 0 1 }  { m_axi_gmem_AWADDR ADDR 1 64 }  { m_axi_gmem_AWID ID 1 1 }  { m_axi_gmem_AWLEN LEN 1 8 }  { m_axi_gmem_AWSIZE SIZE 1 3 }  { m_axi_gmem_AWBURST BURST 1 2 }  { m_axi_gmem_AWLOCK LOCK 1 2 }  { m_axi_gmem_AWCACHE CACHE 1 4 }  { m_axi_gmem_AWPROT PROT 1 3 }  { m_axi_gmem_AWQOS QOS 1 4 }  { m_axi_gmem_AWREGION REGION 1 4 }  { m_axi_gmem_AWUSER USER 1 1 }  { m_axi_gmem_WVALID VALID 1 1 }  { m_axi_gmem_WREADY READY 0 1 }  { m_axi_gmem_WDATA DATA 1 32 }  { m_axi_gmem_WSTRB STRB 1 4 }  { m_axi_gmem_WLAST LAST 1 1 }  { m_axi_gmem_WID ID 1 1 }  { m_axi_gmem_WUSER USER 1 1 }  { m_axi_gmem_ARVALID VALID 1 1 }  { m_axi_gmem_ARREADY READY 0 1 }  { m_axi_gmem_ARADDR ADDR 1 64 }  { m_axi_gmem_ARID ID 1 1 }  { m_axi_gmem_ARLEN LEN 1 8 }  { m_axi_gmem_ARSIZE SIZE 1 3 }  { m_axi_gmem_ARBURST BURST 1 2 }  { m_axi_gmem_ARLOCK LOCK 1 2 }  { m_axi_gmem_ARCACHE CACHE 1 4 }  { m_axi_gmem_ARPROT PROT 1 3 }  { m_axi_gmem_ARQOS QOS 1 4 }  { m_axi_gmem_ARREGION REGION 1 4 }  { m_axi_gmem_ARUSER USER 1 1 }  { m_axi_gmem_RVALID VALID 0 1 }  { m_axi_gmem_RREADY READY 1 1 }  { m_axi_gmem_RDATA DATA 0 32 }  { m_axi_gmem_RLAST LAST 0 1 }  { m_axi_gmem_RID ID 0 1 }  { m_axi_gmem_RUSER USER 0 1 }  { m_axi_gmem_RRESP RESP 0 2 }  { m_axi_gmem_BVALID VALID 0 1 }  { m_axi_gmem_BREADY READY 1 1 }  { m_axi_gmem_BRESP RESP 0 2 }  { m_axi_gmem_BID ID 0 1 }  { m_axi_gmem_BUSER USER 0 1 } } }
	IN_R_V_data_V { axis {  { IN_R_TDATA in_data 0 16 } } }
	IN_R_V_keep_V { axis {  { IN_R_TKEEP in_data 0 2 } } }
	IN_R_V_strb_V { axis {  { IN_R_TSTRB in_data 0 2 } } }
	IN_R_V_last_V { axis {  { IN_R_TVALID in_vld 0 1 }  { IN_R_TREADY in_acc 1 1 }  { IN_R_TLAST in_data 0 1 } } }
	IN_I_V_data_V { axis {  { IN_I_TDATA in_data 0 16 } } }
	IN_I_V_keep_V { axis {  { IN_I_TKEEP in_data 0 2 } } }
	IN_I_V_strb_V { axis {  { IN_I_TSTRB in_data 0 2 } } }
	IN_I_V_last_V { axis {  { IN_I_TVALID in_vld 0 1 }  { IN_I_TREADY in_acc 1 1 }  { IN_I_TLAST in_data 0 1 } } }
	OUT_FFT_V_data_V { axis {  { OUT_FFT_TDATA out_data 1 64 } } }
	OUT_FFT_V_keep_V { axis {  { OUT_FFT_TKEEP out_data 1 8 } } }
	OUT_FFT_V_strb_V { axis {  { OUT_FFT_TSTRB out_data 1 8 } } }
	OUT_FFT_V_last_V { axis {  { OUT_FFT_TVALID out_vld 1 1 }  { OUT_FFT_TREADY out_acc 0 1 }  { OUT_FFT_TLAST out_data 1 1 } } }
	pss_id_V_data_V { axis {  { pss_id_TDATA out_data 1 32 } } }
	pss_id_V_keep_V { axis {  { pss_id_TKEEP out_data 1 4 } } }
	pss_id_V_strb_V { axis {  { pss_id_TSTRB out_data 1 4 } } }
	pss_id_V_last_V { axis {  { pss_id_TVALID out_vld 1 1 }  { pss_id_TREADY out_acc 0 1 }  { pss_id_TLAST out_data 1 1 } } }
}

set busDeadlockParameterList { 
	{ gmem { NUM_READ_OUTSTANDING 16 NUM_WRITE_OUTSTANDING 16 MAX_READ_BURST_LENGTH 16 MAX_WRITE_BURST_LENGTH 16 } } \
}

# RTL port scheduling information:
set fifoSchedulingInfoList { 
}

# RTL bus port read request latency information:
set busReadReqLatencyList { 
	{ gmem 1 }
}

# RTL bus port write response latency information:
set busWriteResLatencyList { 
	{ gmem 1 }
}

# RTL array port load latency information:
set memoryLoadLatencyList { 
}
