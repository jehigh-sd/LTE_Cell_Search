set moduleName get_sss_id
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
set C_modelName {get_sss_id}
set C_modelType { void 0 }
set C_modelArgList {
	{ IN_R float 32 regular {array 128 { 1 3 } 1 1 }  }
	{ IN_I float 32 regular {array 128 { 1 3 } 1 1 }  }
	{ pss_id int 32 regular  }
	{ OUT_1 float 32 regular {array 168 { 0 3 } 0 1 }  }
	{ OUT_2 float 32 regular {array 168 { 0 3 } 0 1 }  }
}
set C_modelArgMapList {[ 
	{ "Name" : "IN_R", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "IN_I", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "pss_id", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "OUT_1", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "OUT_2", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 21
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ IN_R_address0 sc_out sc_lv 7 signal 0 } 
	{ IN_R_ce0 sc_out sc_logic 1 signal 0 } 
	{ IN_R_q0 sc_in sc_lv 32 signal 0 } 
	{ IN_I_address0 sc_out sc_lv 7 signal 1 } 
	{ IN_I_ce0 sc_out sc_logic 1 signal 1 } 
	{ IN_I_q0 sc_in sc_lv 32 signal 1 } 
	{ pss_id sc_in sc_lv 32 signal 2 } 
	{ OUT_1_address0 sc_out sc_lv 8 signal 3 } 
	{ OUT_1_ce0 sc_out sc_logic 1 signal 3 } 
	{ OUT_1_we0 sc_out sc_logic 1 signal 3 } 
	{ OUT_1_d0 sc_out sc_lv 32 signal 3 } 
	{ OUT_2_address0 sc_out sc_lv 8 signal 4 } 
	{ OUT_2_ce0 sc_out sc_logic 1 signal 4 } 
	{ OUT_2_we0 sc_out sc_logic 1 signal 4 } 
	{ OUT_2_d0 sc_out sc_lv 32 signal 4 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "IN_R_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "IN_R", "role": "address0" }} , 
 	{ "name": "IN_R_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "IN_R", "role": "ce0" }} , 
 	{ "name": "IN_R_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "IN_R", "role": "q0" }} , 
 	{ "name": "IN_I_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "IN_I", "role": "address0" }} , 
 	{ "name": "IN_I_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "IN_I", "role": "ce0" }} , 
 	{ "name": "IN_I_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "IN_I", "role": "q0" }} , 
 	{ "name": "pss_id", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "pss_id", "role": "default" }} , 
 	{ "name": "OUT_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "OUT_1", "role": "address0" }} , 
 	{ "name": "OUT_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "OUT_1", "role": "ce0" }} , 
 	{ "name": "OUT_1_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "OUT_1", "role": "we0" }} , 
 	{ "name": "OUT_1_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "OUT_1", "role": "d0" }} , 
 	{ "name": "OUT_2_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "OUT_2", "role": "address0" }} , 
 	{ "name": "OUT_2_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "OUT_2", "role": "ce0" }} , 
 	{ "name": "OUT_2_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "OUT_2", "role": "we0" }} , 
 	{ "name": "OUT_2_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "OUT_2", "role": "d0" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16"],
		"CDFG" : "get_sss_id",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "1", "EstimateLatencyMax" : "91394",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "IN_R", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "IN_I", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "pss_id", "Type" : "None", "Direction" : "I"},
			{"Name" : "OUT_1", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "OUT_2", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "ss_1_0", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "ss_2_0", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "ss_1_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "ss_2_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "ss_1_2", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "ss_2_2", "Type" : "Memory", "Direction" : "I"}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.ss_1_0_U", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.ss_2_0_U", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.ss_1_1_U", "Parent" : "0"},
	{"ID" : "4", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.ss_2_1_U", "Parent" : "0"},
	{"ID" : "5", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.ss_1_2_U", "Parent" : "0"},
	{"ID" : "6", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.ss_2_2_U", "Parent" : "0"},
	{"ID" : "7", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.faddfsub_32ns_32ns_32_3_full_dsp_1_U1", "Parent" : "0"},
	{"ID" : "8", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fmul_32ns_32ns_32_2_max_dsp_1_U2", "Parent" : "0"},
	{"ID" : "9", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fmul_32ns_32ns_32_2_max_dsp_1_U3", "Parent" : "0"},
	{"ID" : "10", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fsqrt_32ns_32ns_32_6_no_dsp_1_U4", "Parent" : "0"},
	{"ID" : "11", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.facc_32ns_32ns_1ns_32_2_no_dsp_1_U5", "Parent" : "0"},
	{"ID" : "12", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.facc_32ns_32ns_1ns_32_2_no_dsp_1_U6", "Parent" : "0"},
	{"ID" : "13", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.facc_32ns_32ns_1ns_32_2_no_dsp_1_U7", "Parent" : "0"},
	{"ID" : "14", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.facc_32ns_32ns_1ns_32_2_no_dsp_1_U8", "Parent" : "0"},
	{"ID" : "15", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.facc_32ns_32ns_1ns_32_2_no_dsp_1_U9", "Parent" : "0"},
	{"ID" : "16", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.facc_32ns_32ns_1ns_32_2_no_dsp_1_U10", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	get_sss_id {
		IN_R {Type I LastRead 4 FirstWrite -1}
		IN_I {Type I LastRead 4 FirstWrite -1}
		pss_id {Type I LastRead 0 FirstWrite -1}
		OUT_1 {Type O LastRead -1 FirstWrite 14}
		OUT_2 {Type O LastRead -1 FirstWrite 14}
		ss_1_0 {Type I LastRead -1 FirstWrite -1}
		ss_2_0 {Type I LastRead -1 FirstWrite -1}
		ss_1_1 {Type I LastRead -1 FirstWrite -1}
		ss_2_1 {Type I LastRead -1 FirstWrite -1}
		ss_1_2 {Type I LastRead -1 FirstWrite -1}
		ss_2_2 {Type I LastRead -1 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "1", "Max" : "91394"}
	, {"Name" : "Interval", "Min" : "1", "Max" : "91394"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
	{"Pipeline" : "1", "EnableSignal" : "ap_enable_pp1"}
	{"Pipeline" : "2", "EnableSignal" : "ap_enable_pp2"}
	{"Pipeline" : "3", "EnableSignal" : "ap_enable_pp3"}
	{"Pipeline" : "4", "EnableSignal" : "ap_enable_pp4"}
	{"Pipeline" : "5", "EnableSignal" : "ap_enable_pp5"}
]}

set Spec2ImplPortList { 
	IN_R { ap_memory {  { IN_R_address0 mem_address 1 7 }  { IN_R_ce0 mem_ce 1 1 }  { IN_R_q0 mem_dout 0 32 } } }
	IN_I { ap_memory {  { IN_I_address0 mem_address 1 7 }  { IN_I_ce0 mem_ce 1 1 }  { IN_I_q0 mem_dout 0 32 } } }
	pss_id { ap_none {  { pss_id in_data 0 32 } } }
	OUT_1 { ap_memory {  { OUT_1_address0 mem_address 1 8 }  { OUT_1_ce0 mem_ce 1 1 }  { OUT_1_we0 mem_we 1 1 }  { OUT_1_d0 mem_din 1 32 } } }
	OUT_2 { ap_memory {  { OUT_2_address0 mem_address 1 8 }  { OUT_2_ce0 mem_ce 1 1 }  { OUT_2_we0 mem_we 1 1 }  { OUT_2_d0 mem_din 1 32 } } }
}
