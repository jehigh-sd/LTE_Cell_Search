set moduleName track_pss_peak
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
set C_modelName {track_pss_peak}
set C_modelType { void 0 }
set C_modelArgList {
	{ p_read int 20 regular  }
	{ p_read1 int 20 regular  }
	{ p_read2 int 20 regular  }
	{ p_read3 int 32 regular  }
	{ pss_id_temp int 2 regular {pointer 1}  }
	{ peak_id_temp int 17 regular {pointer 1}  }
	{ trunc_ln264 int 17 regular {fifo 0}  }
	{ pss_rslt_temp int 12 regular {array 288000 { 0 0 } 0 1 }  }
}
set C_modelArgMapList {[ 
	{ "Name" : "p_read", "interface" : "wire", "bitwidth" : 20, "direction" : "READONLY"} , 
 	{ "Name" : "p_read1", "interface" : "wire", "bitwidth" : 20, "direction" : "READONLY"} , 
 	{ "Name" : "p_read2", "interface" : "wire", "bitwidth" : 20, "direction" : "READONLY"} , 
 	{ "Name" : "p_read3", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "pss_id_temp", "interface" : "wire", "bitwidth" : 2, "direction" : "WRITEONLY"} , 
 	{ "Name" : "peak_id_temp", "interface" : "wire", "bitwidth" : 17, "direction" : "WRITEONLY"} , 
 	{ "Name" : "trunc_ln264", "interface" : "fifo", "bitwidth" : 17, "direction" : "READONLY"} , 
 	{ "Name" : "pss_rslt_temp", "interface" : "memory", "bitwidth" : 12, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 26
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_continue sc_in sc_logic 1 continue -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ p_read sc_in sc_lv 20 signal 0 } 
	{ p_read1 sc_in sc_lv 20 signal 1 } 
	{ p_read2 sc_in sc_lv 20 signal 2 } 
	{ p_read3 sc_in sc_lv 32 signal 3 } 
	{ pss_id_temp sc_out sc_lv 2 signal 4 } 
	{ pss_id_temp_ap_vld sc_out sc_logic 1 outvld 4 } 
	{ peak_id_temp sc_out sc_lv 17 signal 5 } 
	{ peak_id_temp_ap_vld sc_out sc_logic 1 outvld 5 } 
	{ trunc_ln264_dout sc_in sc_lv 17 signal 6 } 
	{ trunc_ln264_empty_n sc_in sc_logic 1 signal 6 } 
	{ trunc_ln264_read sc_out sc_logic 1 signal 6 } 
	{ pss_rslt_temp_address0 sc_out sc_lv 19 signal 7 } 
	{ pss_rslt_temp_ce0 sc_out sc_logic 1 signal 7 } 
	{ pss_rslt_temp_we0 sc_out sc_logic 1 signal 7 } 
	{ pss_rslt_temp_d0 sc_out sc_lv 12 signal 7 } 
	{ pss_rslt_temp_address1 sc_out sc_lv 19 signal 7 } 
	{ pss_rslt_temp_ce1 sc_out sc_logic 1 signal 7 } 
	{ pss_rslt_temp_we1 sc_out sc_logic 1 signal 7 } 
	{ pss_rslt_temp_d1 sc_out sc_lv 12 signal 7 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_continue", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "continue", "bundle":{"name": "ap_continue", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "p_read", "direction": "in", "datatype": "sc_lv", "bitwidth":20, "type": "signal", "bundle":{"name": "p_read", "role": "default" }} , 
 	{ "name": "p_read1", "direction": "in", "datatype": "sc_lv", "bitwidth":20, "type": "signal", "bundle":{"name": "p_read1", "role": "default" }} , 
 	{ "name": "p_read2", "direction": "in", "datatype": "sc_lv", "bitwidth":20, "type": "signal", "bundle":{"name": "p_read2", "role": "default" }} , 
 	{ "name": "p_read3", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "p_read3", "role": "default" }} , 
 	{ "name": "pss_id_temp", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "pss_id_temp", "role": "default" }} , 
 	{ "name": "pss_id_temp_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "pss_id_temp", "role": "ap_vld" }} , 
 	{ "name": "peak_id_temp", "direction": "out", "datatype": "sc_lv", "bitwidth":17, "type": "signal", "bundle":{"name": "peak_id_temp", "role": "default" }} , 
 	{ "name": "peak_id_temp_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "peak_id_temp", "role": "ap_vld" }} , 
 	{ "name": "trunc_ln264_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":17, "type": "signal", "bundle":{"name": "trunc_ln264", "role": "dout" }} , 
 	{ "name": "trunc_ln264_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "trunc_ln264", "role": "empty_n" }} , 
 	{ "name": "trunc_ln264_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "trunc_ln264", "role": "read" }} , 
 	{ "name": "pss_rslt_temp_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":19, "type": "signal", "bundle":{"name": "pss_rslt_temp", "role": "address0" }} , 
 	{ "name": "pss_rslt_temp_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "pss_rslt_temp", "role": "ce0" }} , 
 	{ "name": "pss_rslt_temp_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "pss_rslt_temp", "role": "we0" }} , 
 	{ "name": "pss_rslt_temp_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":12, "type": "signal", "bundle":{"name": "pss_rslt_temp", "role": "d0" }} , 
 	{ "name": "pss_rslt_temp_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":19, "type": "signal", "bundle":{"name": "pss_rslt_temp", "role": "address1" }} , 
 	{ "name": "pss_rslt_temp_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "pss_rslt_temp", "role": "ce1" }} , 
 	{ "name": "pss_rslt_temp_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "pss_rslt_temp", "role": "we1" }} , 
 	{ "name": "pss_rslt_temp_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":12, "type": "signal", "bundle":{"name": "pss_rslt_temp", "role": "d1" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3"],
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
			{"Name" : "p_read", "Type" : "None", "Direction" : "I", "DependentProc" : "0", "DependentChan" : "0", "DependentChanDepth" : "2", "DependentChanType" : "1"},
			{"Name" : "p_read1", "Type" : "None", "Direction" : "I", "DependentProc" : "0", "DependentChan" : "0", "DependentChanDepth" : "2", "DependentChanType" : "1"},
			{"Name" : "p_read2", "Type" : "None", "Direction" : "I", "DependentProc" : "0", "DependentChan" : "0", "DependentChanDepth" : "2", "DependentChanType" : "1"},
			{"Name" : "p_read3", "Type" : "None", "Direction" : "I", "DependentProc" : "0", "DependentChan" : "0", "DependentChanDepth" : "2", "DependentChanType" : "1"},
			{"Name" : "pss_id_temp", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "peak_id_temp", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "trunc_ln264", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "0", "DependentChan" : "0", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "trunc_ln264_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "pss_rslt_temp", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "curr_max_V", "Type" : "OVld", "Direction" : "IO"}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_42ns_37ns_78_1_1_U53", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_42ns_37ns_78_1_1_U54", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_42ns_37ns_78_1_1_U55", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	track_pss_peak {
		p_read {Type I LastRead 0 FirstWrite -1}
		p_read1 {Type I LastRead 0 FirstWrite -1}
		p_read2 {Type I LastRead 0 FirstWrite -1}
		p_read3 {Type I LastRead 0 FirstWrite -1}
		pss_id_temp {Type O LastRead -1 FirstWrite 0}
		peak_id_temp {Type O LastRead -1 FirstWrite 0}
		trunc_ln264 {Type I LastRead 0 FirstWrite -1}
		pss_rslt_temp {Type O LastRead -1 FirstWrite 0}
		curr_max_V {Type IO LastRead -1 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "1", "Max" : "1"}
	, {"Name" : "Interval", "Min" : "1", "Max" : "1"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	p_read { ap_none {  { p_read in_data 0 20 } } }
	p_read1 { ap_none {  { p_read1 in_data 0 20 } } }
	p_read2 { ap_none {  { p_read2 in_data 0 20 } } }
	p_read3 { ap_none {  { p_read3 in_data 0 32 } } }
	pss_id_temp { ap_vld {  { pss_id_temp out_data 1 2 }  { pss_id_temp_ap_vld out_vld 1 1 } } }
	peak_id_temp { ap_vld {  { peak_id_temp out_data 1 17 }  { peak_id_temp_ap_vld out_vld 1 1 } } }
	trunc_ln264 { ap_fifo {  { trunc_ln264_dout fifo_data 0 17 }  { trunc_ln264_empty_n fifo_status 0 1 }  { trunc_ln264_read fifo_update 1 1 } } }
	pss_rslt_temp { ap_memory {  { pss_rslt_temp_address0 mem_address 1 19 }  { pss_rslt_temp_ce0 mem_ce 1 1 }  { pss_rslt_temp_we0 mem_we 1 1 }  { pss_rslt_temp_d0 mem_din 1 12 }  { pss_rslt_temp_address1 MemPortADDR2 1 19 }  { pss_rslt_temp_ce1 MemPortCE2 1 1 }  { pss_rslt_temp_we1 MemPortWE2 1 1 }  { pss_rslt_temp_d1 MemPortDIN2 1 12 } } }
}
