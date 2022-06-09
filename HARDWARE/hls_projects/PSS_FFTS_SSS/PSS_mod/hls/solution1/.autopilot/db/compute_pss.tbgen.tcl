set moduleName compute_pss
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
set C_modelName {compute_pss}
set C_modelType { int 60 }
set C_modelArgList {
	{ IN_real_V int 23 regular {array 96000 { 3 1 } 1 1 }  }
	{ trunc_ln264 int 17 regular {fifo 0}  }
	{ IN_imag_V int 23 regular {array 96000 { 3 1 } 1 1 }  }
}
set C_modelArgMapList {[ 
	{ "Name" : "IN_real_V", "interface" : "memory", "bitwidth" : 23, "direction" : "READONLY"} , 
 	{ "Name" : "trunc_ln264", "interface" : "fifo", "bitwidth" : 17, "direction" : "READONLY"} , 
 	{ "Name" : "IN_imag_V", "interface" : "memory", "bitwidth" : 23, "direction" : "READONLY"} , 
 	{ "Name" : "ap_return", "interface" : "wire", "bitwidth" : 60} ]}
# RTL Port declarations: 
set portNum 19
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_continue sc_in sc_logic 1 continue -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ IN_real_V_address1 sc_out sc_lv 17 signal 0 } 
	{ IN_real_V_ce1 sc_out sc_logic 1 signal 0 } 
	{ IN_real_V_q1 sc_in sc_lv 23 signal 0 } 
	{ trunc_ln264_dout sc_in sc_lv 17 signal 1 } 
	{ trunc_ln264_empty_n sc_in sc_logic 1 signal 1 } 
	{ trunc_ln264_read sc_out sc_logic 1 signal 1 } 
	{ IN_imag_V_address1 sc_out sc_lv 17 signal 2 } 
	{ IN_imag_V_ce1 sc_out sc_logic 1 signal 2 } 
	{ IN_imag_V_q1 sc_in sc_lv 23 signal 2 } 
	{ ap_return_0 sc_out sc_lv 20 signal -1 } 
	{ ap_return_1 sc_out sc_lv 20 signal -1 } 
	{ ap_return_2 sc_out sc_lv 20 signal -1 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_continue", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "continue", "bundle":{"name": "ap_continue", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "IN_real_V_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":17, "type": "signal", "bundle":{"name": "IN_real_V", "role": "address1" }} , 
 	{ "name": "IN_real_V_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "IN_real_V", "role": "ce1" }} , 
 	{ "name": "IN_real_V_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":23, "type": "signal", "bundle":{"name": "IN_real_V", "role": "q1" }} , 
 	{ "name": "trunc_ln264_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":17, "type": "signal", "bundle":{"name": "trunc_ln264", "role": "dout" }} , 
 	{ "name": "trunc_ln264_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "trunc_ln264", "role": "empty_n" }} , 
 	{ "name": "trunc_ln264_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "trunc_ln264", "role": "read" }} , 
 	{ "name": "IN_imag_V_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":17, "type": "signal", "bundle":{"name": "IN_imag_V", "role": "address1" }} , 
 	{ "name": "IN_imag_V_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "IN_imag_V", "role": "ce1" }} , 
 	{ "name": "IN_imag_V_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":23, "type": "signal", "bundle":{"name": "IN_imag_V", "role": "q1" }} , 
 	{ "name": "ap_return_0", "direction": "out", "datatype": "sc_lv", "bitwidth":20, "type": "signal", "bundle":{"name": "ap_return_0", "role": "default" }} , 
 	{ "name": "ap_return_1", "direction": "out", "datatype": "sc_lv", "bitwidth":20, "type": "signal", "bundle":{"name": "ap_return_1", "role": "default" }} , 
 	{ "name": "ap_return_2", "direction": "out", "datatype": "sc_lv", "bitwidth":20, "type": "signal", "bundle":{"name": "ap_return_2", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33"],
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
			{"Name" : "trunc_ln264", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "0", "DependentChan" : "0", "DependentChanDepth" : "2", "DependentChanType" : "2",
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
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.IN_R_buff_V_0_U", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.IN_R_buff_V_1_U", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.IN_I_buff_V_0_U", "Parent" : "0"},
	{"ID" : "4", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.IN_I_buff_V_1_U", "Parent" : "0"},
	{"ID" : "5", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.td_pss_real_V_0_U", "Parent" : "0"},
	{"ID" : "6", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.td_pss_imag_V_0_U", "Parent" : "0"},
	{"ID" : "7", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.td_pss_real_V_1_U", "Parent" : "0"},
	{"ID" : "8", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.td_pss_imag_V_1_U", "Parent" : "0"},
	{"ID" : "9", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.td_pss_real_V_2_U", "Parent" : "0"},
	{"ID" : "10", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.td_pss_imag_V_2_U", "Parent" : "0"},
	{"ID" : "11", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_sqrt_fixed_40_18_s_fu_535", "Parent" : "0",
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
	{"ID" : "12", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_sqrt_fixed_40_18_s_fu_540", "Parent" : "0",
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
	{"ID" : "13", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_sqrt_fixed_40_18_s_fu_545", "Parent" : "0",
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
	{"ID" : "14", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_23s_31ns_48_1_1_U17", "Parent" : "0"},
	{"ID" : "15", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_23s_31ns_48_1_1_U18", "Parent" : "0"},
	{"ID" : "16", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_32s_23s_54_1_1_U19", "Parent" : "0"},
	{"ID" : "17", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_32s_22s_53_1_1_U20", "Parent" : "0"},
	{"ID" : "18", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_33s_23s_55_1_1_U21", "Parent" : "0"},
	{"ID" : "19", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_32s_22s_53_1_1_U22", "Parent" : "0"},
	{"ID" : "20", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_32s_22s_53_1_1_U23", "Parent" : "0"},
	{"ID" : "21", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_33s_23s_55_1_1_U24", "Parent" : "0"},
	{"ID" : "22", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_32s_22s_53_1_1_U25", "Parent" : "0"},
	{"ID" : "23", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_32s_22s_53_1_1_U26", "Parent" : "0"},
	{"ID" : "24", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_33s_23s_55_1_1_U27", "Parent" : "0"},
	{"ID" : "25", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_32s_32s_50_1_1_U28", "Parent" : "0"},
	{"ID" : "26", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_32s_32s_50_1_1_U29", "Parent" : "0"},
	{"ID" : "27", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_32s_32s_50_1_1_U30", "Parent" : "0"},
	{"ID" : "28", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_32s_32s_50_1_1_U31", "Parent" : "0"},
	{"ID" : "29", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_32s_32s_50_1_1_U32", "Parent" : "0"},
	{"ID" : "30", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_32s_32s_50_1_1_U33", "Parent" : "0"},
	{"ID" : "31", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_31ns_14ns_44_1_1_U34", "Parent" : "0"},
	{"ID" : "32", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_31ns_14ns_44_1_1_U35", "Parent" : "0"},
	{"ID" : "33", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_31ns_14ns_44_1_1_U36", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
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
		x {Type I LastRead 0 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "268", "Max" : "397"}
	, {"Name" : "Interval", "Min" : "268", "Max" : "397"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "1", "EnableSignal" : "ap_enable_pp1"}
	{"Pipeline" : "2", "EnableSignal" : "ap_enable_pp2"}
]}

set Spec2ImplPortList { 
	IN_real_V { ap_memory {  { IN_real_V_address1 MemPortADDR2 1 17 }  { IN_real_V_ce1 MemPortCE2 1 1 }  { IN_real_V_q1 MemPortDOUT2 0 23 } } }
	trunc_ln264 { ap_fifo {  { trunc_ln264_dout fifo_data 0 17 }  { trunc_ln264_empty_n fifo_status 0 1 }  { trunc_ln264_read fifo_update 1 1 } } }
	IN_imag_V { ap_memory {  { IN_imag_V_address1 MemPortADDR2 1 17 }  { IN_imag_V_ce1 MemPortCE2 1 1 }  { IN_imag_V_q1 MemPortDOUT2 0 23 } } }
}
