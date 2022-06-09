set moduleName write_buffer_fft
set isTopModule 0
set isCombinational 0
set isDatapathOnly 0
set isPipelined 0
set pipeline_type none
set FunctionProtocol ap_ctrl_hs
set isOneStateSeq 0
set ProfileFlag 0
set StallSigGenFlag 0
set isEnableWaveformDebug 1
set C_modelName {write_buffer_fft}
set C_modelType { void 0 }
set C_modelArgList {
	{ IN_real_V int 23 regular {array 96000 { 1 3 } 1 1 }  }
	{ IN_imag_V int 23 regular {array 96000 { 1 3 } 1 1 }  }
	{ OUT_FFT_V_data_V int 64 regular {axi_s 1 volatile  { OUT_FFT Data } }  }
	{ OUT_FFT_V_keep_V int 8 regular {axi_s 1 volatile  { OUT_FFT Keep } }  }
	{ OUT_FFT_V_strb_V int 8 regular {axi_s 1 volatile  { OUT_FFT Strb } }  }
	{ OUT_FFT_V_last_V int 1 regular {axi_s 1 volatile  { OUT_FFT Last } }  }
	{ index int 17 regular  }
	{ pss_id int 2 regular  }
	{ PSS_V_data_V int 32 regular {axi_s 1 volatile  { pss_id Data } }  }
	{ PSS_V_keep_V int 4 regular {axi_s 1 volatile  { pss_id Keep } }  }
	{ PSS_V_strb_V int 4 regular {axi_s 1 volatile  { pss_id Strb } }  }
	{ PSS_V_last_V int 1 regular {axi_s 1 volatile  { pss_id Last } }  }
}
set C_modelArgMapList {[ 
	{ "Name" : "IN_real_V", "interface" : "memory", "bitwidth" : 23, "direction" : "READONLY"} , 
 	{ "Name" : "IN_imag_V", "interface" : "memory", "bitwidth" : 23, "direction" : "READONLY"} , 
 	{ "Name" : "OUT_FFT_V_data_V", "interface" : "axis", "bitwidth" : 64, "direction" : "WRITEONLY"} , 
 	{ "Name" : "OUT_FFT_V_keep_V", "interface" : "axis", "bitwidth" : 8, "direction" : "WRITEONLY"} , 
 	{ "Name" : "OUT_FFT_V_strb_V", "interface" : "axis", "bitwidth" : 8, "direction" : "WRITEONLY"} , 
 	{ "Name" : "OUT_FFT_V_last_V", "interface" : "axis", "bitwidth" : 1, "direction" : "WRITEONLY"} , 
 	{ "Name" : "index", "interface" : "wire", "bitwidth" : 17, "direction" : "READONLY"} , 
 	{ "Name" : "pss_id", "interface" : "wire", "bitwidth" : 2, "direction" : "READONLY"} , 
 	{ "Name" : "PSS_V_data_V", "interface" : "axis", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "PSS_V_keep_V", "interface" : "axis", "bitwidth" : 4, "direction" : "WRITEONLY"} , 
 	{ "Name" : "PSS_V_strb_V", "interface" : "axis", "bitwidth" : 4, "direction" : "WRITEONLY"} , 
 	{ "Name" : "PSS_V_last_V", "interface" : "axis", "bitwidth" : 1, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 26
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ IN_real_V_address0 sc_out sc_lv 17 signal 0 } 
	{ IN_real_V_ce0 sc_out sc_logic 1 signal 0 } 
	{ IN_real_V_q0 sc_in sc_lv 23 signal 0 } 
	{ IN_imag_V_address0 sc_out sc_lv 17 signal 1 } 
	{ IN_imag_V_ce0 sc_out sc_logic 1 signal 1 } 
	{ IN_imag_V_q0 sc_in sc_lv 23 signal 1 } 
	{ OUT_FFT_TDATA sc_out sc_lv 64 signal 2 } 
	{ OUT_FFT_TVALID sc_out sc_logic 1 outvld 5 } 
	{ OUT_FFT_TREADY sc_in sc_logic 1 outacc 2 } 
	{ OUT_FFT_TKEEP sc_out sc_lv 8 signal 3 } 
	{ OUT_FFT_TSTRB sc_out sc_lv 8 signal 4 } 
	{ OUT_FFT_TLAST sc_out sc_lv 1 signal 5 } 
	{ index sc_in sc_lv 17 signal 6 } 
	{ pss_id sc_in sc_lv 2 signal 7 } 
	{ pss_id_TDATA sc_out sc_lv 32 signal 8 } 
	{ pss_id_TVALID sc_out sc_logic 1 outvld 11 } 
	{ pss_id_TREADY sc_in sc_logic 1 outacc 8 } 
	{ pss_id_TKEEP sc_out sc_lv 4 signal 9 } 
	{ pss_id_TSTRB sc_out sc_lv 4 signal 10 } 
	{ pss_id_TLAST sc_out sc_lv 1 signal 11 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "IN_real_V_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":17, "type": "signal", "bundle":{"name": "IN_real_V", "role": "address0" }} , 
 	{ "name": "IN_real_V_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "IN_real_V", "role": "ce0" }} , 
 	{ "name": "IN_real_V_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":23, "type": "signal", "bundle":{"name": "IN_real_V", "role": "q0" }} , 
 	{ "name": "IN_imag_V_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":17, "type": "signal", "bundle":{"name": "IN_imag_V", "role": "address0" }} , 
 	{ "name": "IN_imag_V_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "IN_imag_V", "role": "ce0" }} , 
 	{ "name": "IN_imag_V_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":23, "type": "signal", "bundle":{"name": "IN_imag_V", "role": "q0" }} , 
 	{ "name": "OUT_FFT_TDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "OUT_FFT_V_data_V", "role": "default" }} , 
 	{ "name": "OUT_FFT_TVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "OUT_FFT_V_last_V", "role": "default" }} , 
 	{ "name": "OUT_FFT_TREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "outacc", "bundle":{"name": "OUT_FFT_V_data_V", "role": "default" }} , 
 	{ "name": "OUT_FFT_TKEEP", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "OUT_FFT_V_keep_V", "role": "default" }} , 
 	{ "name": "OUT_FFT_TSTRB", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "OUT_FFT_V_strb_V", "role": "default" }} , 
 	{ "name": "OUT_FFT_TLAST", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "OUT_FFT_V_last_V", "role": "default" }} , 
 	{ "name": "index", "direction": "in", "datatype": "sc_lv", "bitwidth":17, "type": "signal", "bundle":{"name": "index", "role": "default" }} , 
 	{ "name": "pss_id", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "pss_id", "role": "default" }} , 
 	{ "name": "pss_id_TDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "PSS_V_data_V", "role": "default" }} , 
 	{ "name": "pss_id_TVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "PSS_V_last_V", "role": "" }} , 
 	{ "name": "pss_id_TREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "outacc", "bundle":{"name": "PSS_V_data_V", "role": "" }} , 
 	{ "name": "pss_id_TKEEP", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "PSS_V_keep_V", "role": "default" }} , 
 	{ "name": "pss_id_TSTRB", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "PSS_V_strb_V", "role": "default" }} , 
 	{ "name": "pss_id_TLAST", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "PSS_V_last_V", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "",
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
			{"Name" : "PSS_V_last_V", "Type" : "Axis", "Direction" : "O"}]}]}


set ArgLastReadFirstWriteLatency {
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
	, {"Name" : "Interval", "Min" : "-1", "Max" : "-1"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	IN_real_V { ap_memory {  { IN_real_V_address0 mem_address 1 17 }  { IN_real_V_ce0 mem_ce 1 1 }  { IN_real_V_q0 mem_dout 0 23 } } }
	IN_imag_V { ap_memory {  { IN_imag_V_address0 mem_address 1 17 }  { IN_imag_V_ce0 mem_ce 1 1 }  { IN_imag_V_q0 mem_dout 0 23 } } }
	OUT_FFT_V_data_V { axis {  { OUT_FFT_TDATA out_data 1 64 }  { OUT_FFT_TREADY out_acc 0 1 } } }
	OUT_FFT_V_keep_V { axis {  { OUT_FFT_TKEEP out_data 1 8 } } }
	OUT_FFT_V_strb_V { axis {  { OUT_FFT_TSTRB out_data 1 8 } } }
	OUT_FFT_V_last_V { axis {  { OUT_FFT_TVALID out_vld 1 1 }  { OUT_FFT_TLAST out_data 1 1 } } }
	index { ap_none {  { index in_data 0 17 } } }
	pss_id { ap_none {  { pss_id in_data 0 2 } } }
	PSS_V_data_V { axis {  { pss_id_TDATA out_data 1 32 }  { pss_id_TREADY out_acc 0 1 } } }
	PSS_V_keep_V { axis {  { pss_id_TKEEP out_data 1 4 } } }
	PSS_V_strb_V { axis {  { pss_id_TSTRB out_data 1 4 } } }
	PSS_V_last_V { axis {  { pss_id_TVALID out_vld 1 1 }  { pss_id_TLAST out_data 1 1 } } }
}
