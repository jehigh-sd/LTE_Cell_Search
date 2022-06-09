set moduleName compute_threshold
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
set C_modelName {compute_threshold}
set C_modelType { int 32 }
set C_modelArgList {
	{ IN_real_V int 23 regular {array 96000 { 1 3 } 1 1 }  }
	{ trunc_ln264 int 17 regular {fifo 0}  }
	{ IN_imag_V int 23 regular {array 96000 { 1 3 } 1 1 }  }
	{ trunc_ln264_out int 17 regular {fifo 1}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "IN_real_V", "interface" : "memory", "bitwidth" : 23, "direction" : "READONLY"} , 
 	{ "Name" : "trunc_ln264", "interface" : "fifo", "bitwidth" : 17, "direction" : "READONLY"} , 
 	{ "Name" : "IN_imag_V", "interface" : "memory", "bitwidth" : 23, "direction" : "READONLY"} , 
 	{ "Name" : "trunc_ln264_out", "interface" : "fifo", "bitwidth" : 17, "direction" : "WRITEONLY"} , 
 	{ "Name" : "ap_return", "interface" : "wire", "bitwidth" : 32} ]}
# RTL Port declarations: 
set portNum 20
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_continue sc_in sc_logic 1 continue -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ IN_real_V_address0 sc_out sc_lv 17 signal 0 } 
	{ IN_real_V_ce0 sc_out sc_logic 1 signal 0 } 
	{ IN_real_V_q0 sc_in sc_lv 23 signal 0 } 
	{ trunc_ln264_dout sc_in sc_lv 17 signal 1 } 
	{ trunc_ln264_empty_n sc_in sc_logic 1 signal 1 } 
	{ trunc_ln264_read sc_out sc_logic 1 signal 1 } 
	{ IN_imag_V_address0 sc_out sc_lv 17 signal 2 } 
	{ IN_imag_V_ce0 sc_out sc_logic 1 signal 2 } 
	{ IN_imag_V_q0 sc_in sc_lv 23 signal 2 } 
	{ trunc_ln264_out_din sc_out sc_lv 17 signal 3 } 
	{ trunc_ln264_out_full_n sc_in sc_logic 1 signal 3 } 
	{ trunc_ln264_out_write sc_out sc_logic 1 signal 3 } 
	{ ap_return sc_out sc_lv 32 signal -1 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_continue", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "continue", "bundle":{"name": "ap_continue", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "IN_real_V_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":17, "type": "signal", "bundle":{"name": "IN_real_V", "role": "address0" }} , 
 	{ "name": "IN_real_V_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "IN_real_V", "role": "ce0" }} , 
 	{ "name": "IN_real_V_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":23, "type": "signal", "bundle":{"name": "IN_real_V", "role": "q0" }} , 
 	{ "name": "trunc_ln264_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":17, "type": "signal", "bundle":{"name": "trunc_ln264", "role": "dout" }} , 
 	{ "name": "trunc_ln264_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "trunc_ln264", "role": "empty_n" }} , 
 	{ "name": "trunc_ln264_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "trunc_ln264", "role": "read" }} , 
 	{ "name": "IN_imag_V_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":17, "type": "signal", "bundle":{"name": "IN_imag_V", "role": "address0" }} , 
 	{ "name": "IN_imag_V_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "IN_imag_V", "role": "ce0" }} , 
 	{ "name": "IN_imag_V_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":23, "type": "signal", "bundle":{"name": "IN_imag_V", "role": "q0" }} , 
 	{ "name": "trunc_ln264_out_din", "direction": "out", "datatype": "sc_lv", "bitwidth":17, "type": "signal", "bundle":{"name": "trunc_ln264_out", "role": "din" }} , 
 	{ "name": "trunc_ln264_out_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "trunc_ln264_out", "role": "full_n" }} , 
 	{ "name": "trunc_ln264_out_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "trunc_ln264_out", "role": "write" }} , 
 	{ "name": "ap_return", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "ap_return", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3", "4", "5", "6"],
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
			{"Name" : "trunc_ln264", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "0", "DependentChan" : "0", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "trunc_ln264_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "IN_imag_V", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "trunc_ln264_out", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "0", "DependentChan" : "0", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "trunc_ln264_out_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "sum_mag_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "mag_buff_V_0", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "mag_buff_V_1", "Type" : "Memory", "Direction" : "IO"}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mag_buff_V_0_U", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mag_buff_V_1_U", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_23s_20ns_43_1_1_U4", "Parent" : "0"},
	{"ID" : "4", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_23s_20ns_43_1_1_U5", "Parent" : "0"},
	{"ID" : "5", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_23s_23s_46_1_1_U6", "Parent" : "0"},
	{"ID" : "6", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_23s_23s_46_1_1_U7", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	compute_threshold {
		IN_real_V {Type I LastRead 0 FirstWrite -1}
		trunc_ln264 {Type I LastRead 0 FirstWrite -1}
		IN_imag_V {Type I LastRead 0 FirstWrite -1}
		trunc_ln264_out {Type O LastRead -1 FirstWrite 0}
		sum_mag_V {Type IO LastRead -1 FirstWrite -1}
		mag_buff_V_0 {Type IO LastRead -1 FirstWrite -1}
		mag_buff_V_1 {Type IO LastRead -1 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "132", "Max" : "261"}
	, {"Name" : "Interval", "Min" : "132", "Max" : "261"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "1", "EnableSignal" : "ap_enable_pp1"}
]}

set Spec2ImplPortList { 
	IN_real_V { ap_memory {  { IN_real_V_address0 mem_address 1 17 }  { IN_real_V_ce0 mem_ce 1 1 }  { IN_real_V_q0 mem_dout 0 23 } } }
	trunc_ln264 { ap_fifo {  { trunc_ln264_dout fifo_data 0 17 }  { trunc_ln264_empty_n fifo_status 0 1 }  { trunc_ln264_read fifo_update 1 1 } } }
	IN_imag_V { ap_memory {  { IN_imag_V_address0 mem_address 1 17 }  { IN_imag_V_ce0 mem_ce 1 1 }  { IN_imag_V_q0 mem_dout 0 23 } } }
	trunc_ln264_out { ap_fifo {  { trunc_ln264_out_din fifo_data 1 17 }  { trunc_ln264_out_full_n fifo_status 0 1 }  { trunc_ln264_out_write fifo_update 1 1 } } }
}
