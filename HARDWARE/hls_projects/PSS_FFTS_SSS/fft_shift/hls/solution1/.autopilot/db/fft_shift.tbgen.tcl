set moduleName fft_shift
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
set C_modelName {fft_shift}
set C_modelType { void 0 }
set C_modelArgList {
	{ IN_R_V_data_V int 64 regular {axi_s 0 volatile  { IN_R Data } }  }
	{ IN_R_V_keep_V int 8 regular {axi_s 0 volatile  { IN_R Keep } }  }
	{ IN_R_V_strb_V int 8 regular {axi_s 0 volatile  { IN_R Strb } }  }
	{ IN_R_V_last_V int 1 regular {axi_s 0 volatile  { IN_R Last } }  }
	{ OUT_R_V_data_V int 32 regular {axi_s 1 volatile  { OUT_R Data } }  }
	{ OUT_R_V_keep_V int 4 regular {axi_s 1 volatile  { OUT_R Keep } }  }
	{ OUT_R_V_strb_V int 4 regular {axi_s 1 volatile  { OUT_R Strb } }  }
	{ OUT_R_V_last_V int 1 regular {axi_s 1 volatile  { OUT_R Last } }  }
	{ OUT_I_V_data_V int 32 regular {axi_s 1 volatile  { OUT_I Data } }  }
	{ OUT_I_V_keep_V int 4 regular {axi_s 1 volatile  { OUT_I Keep } }  }
	{ OUT_I_V_strb_V int 4 regular {axi_s 1 volatile  { OUT_I Strb } }  }
	{ OUT_I_V_last_V int 1 regular {axi_s 1 volatile  { OUT_I Last } }  }
}
set C_modelArgMapList {[ 
	{ "Name" : "IN_R_V_data_V", "interface" : "axis", "bitwidth" : 64, "direction" : "READONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "IN_R.V.data.V","cData": "long","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "IN_R_V_keep_V", "interface" : "axis", "bitwidth" : 8, "direction" : "READONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "IN_R.V.keep.V","cData": "char","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "IN_R_V_strb_V", "interface" : "axis", "bitwidth" : 8, "direction" : "READONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "IN_R.V.strb.V","cData": "char","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "IN_R_V_last_V", "interface" : "axis", "bitwidth" : 1, "direction" : "READONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "IN_R.V.last.V","cData": "int1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "OUT_R_V_data_V", "interface" : "axis", "bitwidth" : 32, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "OUT_R.V.data.V","cData": "int","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "OUT_R_V_keep_V", "interface" : "axis", "bitwidth" : 4, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "OUT_R.V.keep.V","cData": "int4","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "OUT_R_V_strb_V", "interface" : "axis", "bitwidth" : 4, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "OUT_R.V.strb.V","cData": "int4","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "OUT_R_V_last_V", "interface" : "axis", "bitwidth" : 1, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "OUT_R.V.last.V","cData": "int1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "OUT_I_V_data_V", "interface" : "axis", "bitwidth" : 32, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "OUT_I.V.data.V","cData": "int","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "OUT_I_V_keep_V", "interface" : "axis", "bitwidth" : 4, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "OUT_I.V.keep.V","cData": "int4","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "OUT_I_V_strb_V", "interface" : "axis", "bitwidth" : 4, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "OUT_I.V.strb.V","cData": "int4","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "OUT_I_V_last_V", "interface" : "axis", "bitwidth" : 1, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "OUT_I.V.last.V","cData": "int1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} ]}
# RTL Port declarations: 
set portNum 38
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst_n sc_in sc_logic 1 reset -1 active_low_sync } 
	{ IN_R_TDATA sc_in sc_lv 64 signal 0 } 
	{ IN_R_TVALID sc_in sc_logic 1 invld 3 } 
	{ IN_R_TREADY sc_out sc_logic 1 inacc 3 } 
	{ IN_R_TKEEP sc_in sc_lv 8 signal 1 } 
	{ IN_R_TSTRB sc_in sc_lv 8 signal 2 } 
	{ IN_R_TLAST sc_in sc_lv 1 signal 3 } 
	{ OUT_R_TDATA sc_out sc_lv 32 signal 4 } 
	{ OUT_R_TVALID sc_out sc_logic 1 outvld 7 } 
	{ OUT_R_TREADY sc_in sc_logic 1 outacc 7 } 
	{ OUT_R_TKEEP sc_out sc_lv 4 signal 5 } 
	{ OUT_R_TSTRB sc_out sc_lv 4 signal 6 } 
	{ OUT_R_TLAST sc_out sc_lv 1 signal 7 } 
	{ OUT_I_TDATA sc_out sc_lv 32 signal 8 } 
	{ OUT_I_TVALID sc_out sc_logic 1 outvld 11 } 
	{ OUT_I_TREADY sc_in sc_logic 1 outacc 11 } 
	{ OUT_I_TKEEP sc_out sc_lv 4 signal 9 } 
	{ OUT_I_TSTRB sc_out sc_lv 4 signal 10 } 
	{ OUT_I_TLAST sc_out sc_lv 1 signal 11 } 
	{ s_axi_control_AWVALID sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_AWREADY sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_AWADDR sc_in sc_lv 4 signal -1 } 
	{ s_axi_control_WVALID sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_WREADY sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_WDATA sc_in sc_lv 32 signal -1 } 
	{ s_axi_control_WSTRB sc_in sc_lv 4 signal -1 } 
	{ s_axi_control_ARVALID sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_ARREADY sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_ARADDR sc_in sc_lv 4 signal -1 } 
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
	{ "name": "s_axi_control_AWADDR", "direction": "in", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "control", "role": "AWADDR" },"address":[{"name":"fft_shift","role":"start","value":"0","valid_bit":"0"},{"name":"fft_shift","role":"continue","value":"0","valid_bit":"4"},{"name":"fft_shift","role":"auto_start","value":"0","valid_bit":"7"}] },
	{ "name": "s_axi_control_AWVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "AWVALID" } },
	{ "name": "s_axi_control_AWREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "AWREADY" } },
	{ "name": "s_axi_control_WVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "WVALID" } },
	{ "name": "s_axi_control_WREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "WREADY" } },
	{ "name": "s_axi_control_WDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "control", "role": "WDATA" } },
	{ "name": "s_axi_control_WSTRB", "direction": "in", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "control", "role": "WSTRB" } },
	{ "name": "s_axi_control_ARADDR", "direction": "in", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "control", "role": "ARADDR" },"address":[{"name":"fft_shift","role":"start","value":"0","valid_bit":"0"},{"name":"fft_shift","role":"done","value":"0","valid_bit":"1"},{"name":"fft_shift","role":"idle","value":"0","valid_bit":"2"},{"name":"fft_shift","role":"ready","value":"0","valid_bit":"3"},{"name":"fft_shift","role":"auto_start","value":"0","valid_bit":"7"}] },
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
 	{ "name": "IN_R_TDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "IN_R_V_data_V", "role": "default" }} , 
 	{ "name": "IN_R_TVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "invld", "bundle":{"name": "IN_R_V_last_V", "role": "default" }} , 
 	{ "name": "IN_R_TREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "inacc", "bundle":{"name": "IN_R_V_last_V", "role": "default" }} , 
 	{ "name": "IN_R_TKEEP", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "IN_R_V_keep_V", "role": "default" }} , 
 	{ "name": "IN_R_TSTRB", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "IN_R_V_strb_V", "role": "default" }} , 
 	{ "name": "IN_R_TLAST", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "IN_R_V_last_V", "role": "default" }} , 
 	{ "name": "OUT_R_TDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "OUT_R_V_data_V", "role": "default" }} , 
 	{ "name": "OUT_R_TVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "OUT_R_V_last_V", "role": "default" }} , 
 	{ "name": "OUT_R_TREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "outacc", "bundle":{"name": "OUT_R_V_last_V", "role": "default" }} , 
 	{ "name": "OUT_R_TKEEP", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "OUT_R_V_keep_V", "role": "default" }} , 
 	{ "name": "OUT_R_TSTRB", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "OUT_R_V_strb_V", "role": "default" }} , 
 	{ "name": "OUT_R_TLAST", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "OUT_R_V_last_V", "role": "default" }} , 
 	{ "name": "OUT_I_TDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "OUT_I_V_data_V", "role": "default" }} , 
 	{ "name": "OUT_I_TVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "OUT_I_V_last_V", "role": "default" }} , 
 	{ "name": "OUT_I_TREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "outacc", "bundle":{"name": "OUT_I_V_last_V", "role": "default" }} , 
 	{ "name": "OUT_I_TKEEP", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "OUT_I_V_keep_V", "role": "default" }} , 
 	{ "name": "OUT_I_TSTRB", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "OUT_I_V_strb_V", "role": "default" }} , 
 	{ "name": "OUT_I_TLAST", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "OUT_I_V_last_V", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18"],
		"CDFG" : "fft_shift",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "395", "EstimateLatencyMax" : "395",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "IN_R_V_data_V", "Type" : "Axis", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "IN_R_TDATA_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "IN_R_V_keep_V", "Type" : "Axis", "Direction" : "I"},
			{"Name" : "IN_R_V_strb_V", "Type" : "Axis", "Direction" : "I"},
			{"Name" : "IN_R_V_last_V", "Type" : "Axis", "Direction" : "I"},
			{"Name" : "OUT_R_V_data_V", "Type" : "Axis", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "6", "SubInstance" : "grp_copy_output_fu_246", "Port" : "OUT_R_V_data_V"}]},
			{"Name" : "OUT_R_V_keep_V", "Type" : "Axis", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "6", "SubInstance" : "grp_copy_output_fu_246", "Port" : "OUT_R_V_keep_V"}]},
			{"Name" : "OUT_R_V_strb_V", "Type" : "Axis", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "6", "SubInstance" : "grp_copy_output_fu_246", "Port" : "OUT_R_V_strb_V"}]},
			{"Name" : "OUT_R_V_last_V", "Type" : "Axis", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "6", "SubInstance" : "grp_copy_output_fu_246", "Port" : "OUT_R_V_last_V"}]},
			{"Name" : "OUT_I_V_data_V", "Type" : "Axis", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "6", "SubInstance" : "grp_copy_output_fu_246", "Port" : "OUT_I_V_data_V"}]},
			{"Name" : "OUT_I_V_keep_V", "Type" : "Axis", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "6", "SubInstance" : "grp_copy_output_fu_246", "Port" : "OUT_I_V_keep_V"}]},
			{"Name" : "OUT_I_V_strb_V", "Type" : "Axis", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "6", "SubInstance" : "grp_copy_output_fu_246", "Port" : "OUT_I_V_strb_V"}]},
			{"Name" : "OUT_I_V_last_V", "Type" : "Axis", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "6", "SubInstance" : "grp_copy_output_fu_246", "Port" : "OUT_I_V_last_V"}]}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.control_s_axi_U", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.in_temp_r_U", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.in_temp_i_U", "Parent" : "0"},
	{"ID" : "4", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.out_temp_r_U", "Parent" : "0"},
	{"ID" : "5", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.out_temp_i_U", "Parent" : "0"},
	{"ID" : "6", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_copy_output_fu_246", "Parent" : "0",
		"CDFG" : "copy_output",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "131", "EstimateLatencyMax" : "131",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "OUT_temp_R", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "OUT_temp_I", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "OUT_R_V_data_V", "Type" : "Axis", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "OUT_R_TDATA_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "OUT_R_V_keep_V", "Type" : "Axis", "Direction" : "O"},
			{"Name" : "OUT_R_V_strb_V", "Type" : "Axis", "Direction" : "O"},
			{"Name" : "OUT_R_V_last_V", "Type" : "Axis", "Direction" : "O"},
			{"Name" : "OUT_I_V_data_V", "Type" : "Axis", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "OUT_I_TDATA_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "OUT_I_V_keep_V", "Type" : "Axis", "Direction" : "O"},
			{"Name" : "OUT_I_V_strb_V", "Type" : "Axis", "Direction" : "O"},
			{"Name" : "OUT_I_V_last_V", "Type" : "Axis", "Direction" : "O"}]},
	{"ID" : "7", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_IN_R_V_data_V_U", "Parent" : "0"},
	{"ID" : "8", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_IN_R_V_keep_V_U", "Parent" : "0"},
	{"ID" : "9", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_IN_R_V_strb_V_U", "Parent" : "0"},
	{"ID" : "10", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_IN_R_V_last_V_U", "Parent" : "0"},
	{"ID" : "11", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_OUT_R_V_data_V_U", "Parent" : "0"},
	{"ID" : "12", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_OUT_R_V_keep_V_U", "Parent" : "0"},
	{"ID" : "13", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_OUT_R_V_strb_V_U", "Parent" : "0"},
	{"ID" : "14", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_OUT_R_V_last_V_U", "Parent" : "0"},
	{"ID" : "15", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_OUT_I_V_data_V_U", "Parent" : "0"},
	{"ID" : "16", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_OUT_I_V_keep_V_U", "Parent" : "0"},
	{"ID" : "17", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_OUT_I_V_strb_V_U", "Parent" : "0"},
	{"ID" : "18", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_OUT_I_V_last_V_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	fft_shift {
		IN_R_V_data_V {Type I LastRead 1 FirstWrite -1}
		IN_R_V_keep_V {Type I LastRead 1 FirstWrite -1}
		IN_R_V_strb_V {Type I LastRead 1 FirstWrite -1}
		IN_R_V_last_V {Type I LastRead 1 FirstWrite -1}
		OUT_R_V_data_V {Type O LastRead -1 FirstWrite 2}
		OUT_R_V_keep_V {Type O LastRead -1 FirstWrite 2}
		OUT_R_V_strb_V {Type O LastRead -1 FirstWrite 2}
		OUT_R_V_last_V {Type O LastRead -1 FirstWrite 2}
		OUT_I_V_data_V {Type O LastRead -1 FirstWrite 2}
		OUT_I_V_keep_V {Type O LastRead -1 FirstWrite 2}
		OUT_I_V_strb_V {Type O LastRead -1 FirstWrite 2}
		OUT_I_V_last_V {Type O LastRead -1 FirstWrite 2}}
	copy_output {
		OUT_temp_R {Type I LastRead 2 FirstWrite -1}
		OUT_temp_I {Type I LastRead 2 FirstWrite -1}
		OUT_R_V_data_V {Type O LastRead -1 FirstWrite 2}
		OUT_R_V_keep_V {Type O LastRead -1 FirstWrite 2}
		OUT_R_V_strb_V {Type O LastRead -1 FirstWrite 2}
		OUT_R_V_last_V {Type O LastRead -1 FirstWrite 2}
		OUT_I_V_data_V {Type O LastRead -1 FirstWrite 2}
		OUT_I_V_keep_V {Type O LastRead -1 FirstWrite 2}
		OUT_I_V_strb_V {Type O LastRead -1 FirstWrite 2}
		OUT_I_V_last_V {Type O LastRead -1 FirstWrite 2}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "395", "Max" : "395"}
	, {"Name" : "Interval", "Min" : "396", "Max" : "396"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "1", "EnableSignal" : "ap_enable_pp1"}
	{"Pipeline" : "2", "EnableSignal" : "ap_enable_pp2"}
]}

set Spec2ImplPortList { 
	IN_R_V_data_V { axis {  { IN_R_TDATA in_data 0 64 } } }
	IN_R_V_keep_V { axis {  { IN_R_TKEEP in_data 0 8 } } }
	IN_R_V_strb_V { axis {  { IN_R_TSTRB in_data 0 8 } } }
	IN_R_V_last_V { axis {  { IN_R_TVALID in_vld 0 1 }  { IN_R_TREADY in_acc 1 1 }  { IN_R_TLAST in_data 0 1 } } }
	OUT_R_V_data_V { axis {  { OUT_R_TDATA out_data 1 32 } } }
	OUT_R_V_keep_V { axis {  { OUT_R_TKEEP out_data 1 4 } } }
	OUT_R_V_strb_V { axis {  { OUT_R_TSTRB out_data 1 4 } } }
	OUT_R_V_last_V { axis {  { OUT_R_TVALID out_vld 1 1 }  { OUT_R_TREADY out_acc 0 1 }  { OUT_R_TLAST out_data 1 1 } } }
	OUT_I_V_data_V { axis {  { OUT_I_TDATA out_data 1 32 } } }
	OUT_I_V_keep_V { axis {  { OUT_I_TKEEP out_data 1 4 } } }
	OUT_I_V_strb_V { axis {  { OUT_I_TSTRB out_data 1 4 } } }
	OUT_I_V_last_V { axis {  { OUT_I_TVALID out_vld 1 1 }  { OUT_I_TREADY out_acc 0 1 }  { OUT_I_TLAST out_data 1 1 } } }
}

set busDeadlockParameterList { 
}

# RTL port scheduling information:
set fifoSchedulingInfoList { 
}

# RTL bus port read request latency information:
set busReadReqLatencyList { 
}

# RTL bus port write response latency information:
set busWriteResLatencyList { 
}

# RTL array port load latency information:
set memoryLoadLatencyList { 
}
