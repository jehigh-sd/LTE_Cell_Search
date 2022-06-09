set moduleName dataflow_parent_loop_proc
set isTopModule 0
set isCombinational 0
set isDatapathOnly 0
set isPipelined 1
set pipeline_type none
set FunctionProtocol ap_ctrl_hs
set isOneStateSeq 0
set ProfileFlag 0
set StallSigGenFlag 0
set isEnableWaveformDebug 1
set C_modelName {dataflow_parent_loop_proc}
set C_modelType { void 0 }
set C_modelArgList {
	{ IN_real_V int 23 regular {array 96000 { 1 1 } 1 1 }  }
	{ IN_imag_V int 23 regular {array 96000 { 1 1 } 1 1 }  }
	{ pss_id_temp int 2 regular {pointer 1}  }
	{ peak_id_temp int 17 regular {pointer 1}  }
	{ pss_rslt_temp int 12 regular {array 288000 { 0 0 } 0 1 }  }
}
set C_modelArgMapList {[ 
	{ "Name" : "IN_real_V", "interface" : "memory", "bitwidth" : 23, "direction" : "READONLY"} , 
 	{ "Name" : "IN_imag_V", "interface" : "memory", "bitwidth" : 23, "direction" : "READONLY"} , 
 	{ "Name" : "pss_id_temp", "interface" : "wire", "bitwidth" : 2, "direction" : "WRITEONLY"} , 
 	{ "Name" : "peak_id_temp", "interface" : "wire", "bitwidth" : 17, "direction" : "WRITEONLY"} , 
 	{ "Name" : "pss_rslt_temp", "interface" : "memory", "bitwidth" : 12, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 41
set portList { 
	{ IN_real_V_address0 sc_out sc_lv 17 signal 0 } 
	{ IN_real_V_ce0 sc_out sc_logic 1 signal 0 } 
	{ IN_real_V_d0 sc_out sc_lv 23 signal 0 } 
	{ IN_real_V_q0 sc_in sc_lv 23 signal 0 } 
	{ IN_real_V_we0 sc_out sc_logic 1 signal 0 } 
	{ IN_real_V_address1 sc_out sc_lv 17 signal 0 } 
	{ IN_real_V_ce1 sc_out sc_logic 1 signal 0 } 
	{ IN_real_V_d1 sc_out sc_lv 23 signal 0 } 
	{ IN_real_V_q1 sc_in sc_lv 23 signal 0 } 
	{ IN_real_V_we1 sc_out sc_logic 1 signal 0 } 
	{ IN_imag_V_address0 sc_out sc_lv 17 signal 1 } 
	{ IN_imag_V_ce0 sc_out sc_logic 1 signal 1 } 
	{ IN_imag_V_d0 sc_out sc_lv 23 signal 1 } 
	{ IN_imag_V_q0 sc_in sc_lv 23 signal 1 } 
	{ IN_imag_V_we0 sc_out sc_logic 1 signal 1 } 
	{ IN_imag_V_address1 sc_out sc_lv 17 signal 1 } 
	{ IN_imag_V_ce1 sc_out sc_logic 1 signal 1 } 
	{ IN_imag_V_d1 sc_out sc_lv 23 signal 1 } 
	{ IN_imag_V_q1 sc_in sc_lv 23 signal 1 } 
	{ IN_imag_V_we1 sc_out sc_logic 1 signal 1 } 
	{ pss_id_temp sc_out sc_lv 2 signal 2 } 
	{ peak_id_temp sc_out sc_lv 17 signal 3 } 
	{ pss_rslt_temp_address0 sc_out sc_lv 19 signal 4 } 
	{ pss_rslt_temp_ce0 sc_out sc_logic 1 signal 4 } 
	{ pss_rslt_temp_d0 sc_out sc_lv 12 signal 4 } 
	{ pss_rslt_temp_q0 sc_in sc_lv 12 signal 4 } 
	{ pss_rslt_temp_we0 sc_out sc_logic 1 signal 4 } 
	{ pss_rslt_temp_address1 sc_out sc_lv 19 signal 4 } 
	{ pss_rslt_temp_ce1 sc_out sc_logic 1 signal 4 } 
	{ pss_rslt_temp_d1 sc_out sc_lv 12 signal 4 } 
	{ pss_rslt_temp_q1 sc_in sc_lv 12 signal 4 } 
	{ pss_rslt_temp_we1 sc_out sc_logic 1 signal 4 } 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ pss_id_temp_ap_vld sc_out sc_logic 1 outvld 2 } 
	{ peak_id_temp_ap_vld sc_out sc_logic 1 outvld 3 } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_continue sc_in sc_logic 1 continue -1 } 
}
set NewPortList {[ 
	{ "name": "IN_real_V_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":17, "type": "signal", "bundle":{"name": "IN_real_V", "role": "address0" }} , 
 	{ "name": "IN_real_V_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "IN_real_V", "role": "ce0" }} , 
 	{ "name": "IN_real_V_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":23, "type": "signal", "bundle":{"name": "IN_real_V", "role": "d0" }} , 
 	{ "name": "IN_real_V_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":23, "type": "signal", "bundle":{"name": "IN_real_V", "role": "q0" }} , 
 	{ "name": "IN_real_V_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "IN_real_V", "role": "we0" }} , 
 	{ "name": "IN_real_V_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":17, "type": "signal", "bundle":{"name": "IN_real_V", "role": "address1" }} , 
 	{ "name": "IN_real_V_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "IN_real_V", "role": "ce1" }} , 
 	{ "name": "IN_real_V_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":23, "type": "signal", "bundle":{"name": "IN_real_V", "role": "d1" }} , 
 	{ "name": "IN_real_V_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":23, "type": "signal", "bundle":{"name": "IN_real_V", "role": "q1" }} , 
 	{ "name": "IN_real_V_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "IN_real_V", "role": "we1" }} , 
 	{ "name": "IN_imag_V_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":17, "type": "signal", "bundle":{"name": "IN_imag_V", "role": "address0" }} , 
 	{ "name": "IN_imag_V_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "IN_imag_V", "role": "ce0" }} , 
 	{ "name": "IN_imag_V_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":23, "type": "signal", "bundle":{"name": "IN_imag_V", "role": "d0" }} , 
 	{ "name": "IN_imag_V_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":23, "type": "signal", "bundle":{"name": "IN_imag_V", "role": "q0" }} , 
 	{ "name": "IN_imag_V_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "IN_imag_V", "role": "we0" }} , 
 	{ "name": "IN_imag_V_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":17, "type": "signal", "bundle":{"name": "IN_imag_V", "role": "address1" }} , 
 	{ "name": "IN_imag_V_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "IN_imag_V", "role": "ce1" }} , 
 	{ "name": "IN_imag_V_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":23, "type": "signal", "bundle":{"name": "IN_imag_V", "role": "d1" }} , 
 	{ "name": "IN_imag_V_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":23, "type": "signal", "bundle":{"name": "IN_imag_V", "role": "q1" }} , 
 	{ "name": "IN_imag_V_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "IN_imag_V", "role": "we1" }} , 
 	{ "name": "pss_id_temp", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "pss_id_temp", "role": "default" }} , 
 	{ "name": "peak_id_temp", "direction": "out", "datatype": "sc_lv", "bitwidth":17, "type": "signal", "bundle":{"name": "peak_id_temp", "role": "default" }} , 
 	{ "name": "pss_rslt_temp_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":19, "type": "signal", "bundle":{"name": "pss_rslt_temp", "role": "address0" }} , 
 	{ "name": "pss_rslt_temp_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "pss_rslt_temp", "role": "ce0" }} , 
 	{ "name": "pss_rslt_temp_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":12, "type": "signal", "bundle":{"name": "pss_rslt_temp", "role": "d0" }} , 
 	{ "name": "pss_rslt_temp_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":12, "type": "signal", "bundle":{"name": "pss_rslt_temp", "role": "q0" }} , 
 	{ "name": "pss_rslt_temp_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "pss_rslt_temp", "role": "we0" }} , 
 	{ "name": "pss_rslt_temp_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":19, "type": "signal", "bundle":{"name": "pss_rslt_temp", "role": "address1" }} , 
 	{ "name": "pss_rslt_temp_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "pss_rslt_temp", "role": "ce1" }} , 
 	{ "name": "pss_rslt_temp_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":12, "type": "signal", "bundle":{"name": "pss_rslt_temp", "role": "d1" }} , 
 	{ "name": "pss_rslt_temp_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":12, "type": "signal", "bundle":{"name": "pss_rslt_temp", "role": "q1" }} , 
 	{ "name": "pss_rslt_temp_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "pss_rslt_temp", "role": "we1" }} , 
 	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "pss_id_temp_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "pss_id_temp", "role": "ap_vld" }} , 
 	{ "name": "peak_id_temp_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "peak_id_temp", "role": "ap_vld" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_continue", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "continue", "bundle":{"name": "ap_continue", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1"],
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
			{"ID" : "1", "Name" : "dataflow_in_loop_lteCellSearch_U0"}],
		"OutputProcess" : [
			{"ID" : "1", "Name" : "dataflow_in_loop_lteCellSearch_U0"}],
		"Port" : [
			{"Name" : "IN_real_V", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "dataflow_in_loop_lteCellSearch_U0", "Port" : "IN_real_V"}]},
			{"Name" : "IN_imag_V", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "dataflow_in_loop_lteCellSearch_U0", "Port" : "IN_imag_V"}]},
			{"Name" : "pss_id_temp", "Type" : "Vld", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "dataflow_in_loop_lteCellSearch_U0", "Port" : "pss_id_temp"}]},
			{"Name" : "peak_id_temp", "Type" : "Vld", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "dataflow_in_loop_lteCellSearch_U0", "Port" : "peak_id_temp"}]},
			{"Name" : "pss_rslt_temp", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "dataflow_in_loop_lteCellSearch_U0", "Port" : "pss_rslt_temp"}]},
			{"Name" : "sum_mag_V", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "dataflow_in_loop_lteCellSearch_U0", "Port" : "sum_mag_V"}]},
			{"Name" : "mag_buff_V_0", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "dataflow_in_loop_lteCellSearch_U0", "Port" : "mag_buff_V_0"}]},
			{"Name" : "mag_buff_V_1", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "dataflow_in_loop_lteCellSearch_U0", "Port" : "mag_buff_V_1"}]},
			{"Name" : "IN_R_buff_V_0", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "dataflow_in_loop_lteCellSearch_U0", "Port" : "IN_R_buff_V_0"}]},
			{"Name" : "IN_R_buff_V_1", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "dataflow_in_loop_lteCellSearch_U0", "Port" : "IN_R_buff_V_1"}]},
			{"Name" : "IN_I_buff_V_0", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "dataflow_in_loop_lteCellSearch_U0", "Port" : "IN_I_buff_V_0"}]},
			{"Name" : "IN_I_buff_V_1", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "dataflow_in_loop_lteCellSearch_U0", "Port" : "IN_I_buff_V_1"}]},
			{"Name" : "td_pss_real_V_0", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "dataflow_in_loop_lteCellSearch_U0", "Port" : "td_pss_real_V_0"}]},
			{"Name" : "td_pss_imag_V_0", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "dataflow_in_loop_lteCellSearch_U0", "Port" : "td_pss_imag_V_0"}]},
			{"Name" : "td_pss_real_V_1", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "dataflow_in_loop_lteCellSearch_U0", "Port" : "td_pss_real_V_1"}]},
			{"Name" : "td_pss_imag_V_1", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "dataflow_in_loop_lteCellSearch_U0", "Port" : "td_pss_imag_V_1"}]},
			{"Name" : "td_pss_real_V_2", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "dataflow_in_loop_lteCellSearch_U0", "Port" : "td_pss_real_V_2"}]},
			{"Name" : "td_pss_imag_V_2", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "dataflow_in_loop_lteCellSearch_U0", "Port" : "td_pss_imag_V_2"}]},
			{"Name" : "curr_max_V", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "dataflow_in_loop_lteCellSearch_U0", "Port" : "curr_max_V"}]}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.dataflow_in_loop_lteCellSearch_U0", "Parent" : "0", "Child" : ["2", "3", "10", "44", "48", "49", "50", "51", "52", "53", "54"],
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
			{"ID" : "2", "Name" : "dataflow_in_loop_lteCellSearch_entry25_U0"},
			{"ID" : "3", "Name" : "compute_threshold_U0"},
			{"ID" : "10", "Name" : "compute_pss_U0"}],
		"OutputProcess" : [
			{"ID" : "44", "Name" : "track_pss_peak_U0"}],
		"Port" : [
			{"Name" : "IN_real_V", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "3", "SubInstance" : "compute_threshold_U0", "Port" : "IN_real_V"},
					{"ID" : "10", "SubInstance" : "compute_pss_U0", "Port" : "IN_real_V"}]},
			{"Name" : "trunc_ln264", "Type" : "None", "Direction" : "I"},
			{"Name" : "IN_imag_V", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "3", "SubInstance" : "compute_threshold_U0", "Port" : "IN_imag_V"},
					{"ID" : "10", "SubInstance" : "compute_pss_U0", "Port" : "IN_imag_V"}]},
			{"Name" : "pss_id_temp", "Type" : "Vld", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "44", "SubInstance" : "track_pss_peak_U0", "Port" : "pss_id_temp"}]},
			{"Name" : "peak_id_temp", "Type" : "Vld", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "44", "SubInstance" : "track_pss_peak_U0", "Port" : "peak_id_temp"}]},
			{"Name" : "pss_rslt_temp", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "44", "SubInstance" : "track_pss_peak_U0", "Port" : "pss_rslt_temp"}]},
			{"Name" : "sum_mag_V", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "3", "SubInstance" : "compute_threshold_U0", "Port" : "sum_mag_V"}]},
			{"Name" : "mag_buff_V_0", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "3", "SubInstance" : "compute_threshold_U0", "Port" : "mag_buff_V_0"}]},
			{"Name" : "mag_buff_V_1", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "3", "SubInstance" : "compute_threshold_U0", "Port" : "mag_buff_V_1"}]},
			{"Name" : "IN_R_buff_V_0", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "10", "SubInstance" : "compute_pss_U0", "Port" : "IN_R_buff_V_0"}]},
			{"Name" : "IN_R_buff_V_1", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "10", "SubInstance" : "compute_pss_U0", "Port" : "IN_R_buff_V_1"}]},
			{"Name" : "IN_I_buff_V_0", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "10", "SubInstance" : "compute_pss_U0", "Port" : "IN_I_buff_V_0"}]},
			{"Name" : "IN_I_buff_V_1", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "10", "SubInstance" : "compute_pss_U0", "Port" : "IN_I_buff_V_1"}]},
			{"Name" : "td_pss_real_V_0", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "10", "SubInstance" : "compute_pss_U0", "Port" : "td_pss_real_V_0"}]},
			{"Name" : "td_pss_imag_V_0", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "10", "SubInstance" : "compute_pss_U0", "Port" : "td_pss_imag_V_0"}]},
			{"Name" : "td_pss_real_V_1", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "10", "SubInstance" : "compute_pss_U0", "Port" : "td_pss_real_V_1"}]},
			{"Name" : "td_pss_imag_V_1", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "10", "SubInstance" : "compute_pss_U0", "Port" : "td_pss_imag_V_1"}]},
			{"Name" : "td_pss_real_V_2", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "10", "SubInstance" : "compute_pss_U0", "Port" : "td_pss_real_V_2"}]},
			{"Name" : "td_pss_imag_V_2", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "10", "SubInstance" : "compute_pss_U0", "Port" : "td_pss_imag_V_2"}]},
			{"Name" : "curr_max_V", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "44", "SubInstance" : "track_pss_peak_U0", "Port" : "curr_max_V"}]}]},
	{"ID" : "2", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.dataflow_in_loop_lteCellSearch_U0.dataflow_in_loop_lteCellSearch_entry25_U0", "Parent" : "1",
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
			{"Name" : "trunc_ln264_out", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "3", "DependentChan" : "48", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "trunc_ln264_out_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "trunc_ln264_out1", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "10", "DependentChan" : "49", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "trunc_ln264_out1_blk_n", "Type" : "RtlSignal"}]}]},
	{"ID" : "3", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.dataflow_in_loop_lteCellSearch_U0.compute_threshold_U0", "Parent" : "1", "Child" : ["4", "5", "6", "7", "8", "9"],
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
			{"Name" : "trunc_ln264", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "2", "DependentChan" : "48", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "trunc_ln264_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "IN_imag_V", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "trunc_ln264_out", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "44", "DependentChan" : "50", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "trunc_ln264_out_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "sum_mag_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "mag_buff_V_0", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "mag_buff_V_1", "Type" : "Memory", "Direction" : "IO"}]},
	{"ID" : "4", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.dataflow_in_loop_lteCellSearch_U0.compute_threshold_U0.mag_buff_V_0_U", "Parent" : "3"},
	{"ID" : "5", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.dataflow_in_loop_lteCellSearch_U0.compute_threshold_U0.mag_buff_V_1_U", "Parent" : "3"},
	{"ID" : "6", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.dataflow_in_loop_lteCellSearch_U0.compute_threshold_U0.mul_23s_20ns_43_1_1_U4", "Parent" : "3"},
	{"ID" : "7", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.dataflow_in_loop_lteCellSearch_U0.compute_threshold_U0.mul_23s_20ns_43_1_1_U5", "Parent" : "3"},
	{"ID" : "8", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.dataflow_in_loop_lteCellSearch_U0.compute_threshold_U0.mul_23s_23s_46_1_1_U6", "Parent" : "3"},
	{"ID" : "9", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.dataflow_in_loop_lteCellSearch_U0.compute_threshold_U0.mul_23s_23s_46_1_1_U7", "Parent" : "3"},
	{"ID" : "10", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.dataflow_in_loop_lteCellSearch_U0.compute_pss_U0", "Parent" : "1", "Child" : ["11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "43"],
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
			{"Name" : "trunc_ln264", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "2", "DependentChan" : "49", "DependentChanDepth" : "2", "DependentChanType" : "2",
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
	{"ID" : "11", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.dataflow_in_loop_lteCellSearch_U0.compute_pss_U0.IN_R_buff_V_0_U", "Parent" : "10"},
	{"ID" : "12", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.dataflow_in_loop_lteCellSearch_U0.compute_pss_U0.IN_R_buff_V_1_U", "Parent" : "10"},
	{"ID" : "13", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.dataflow_in_loop_lteCellSearch_U0.compute_pss_U0.IN_I_buff_V_0_U", "Parent" : "10"},
	{"ID" : "14", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.dataflow_in_loop_lteCellSearch_U0.compute_pss_U0.IN_I_buff_V_1_U", "Parent" : "10"},
	{"ID" : "15", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.dataflow_in_loop_lteCellSearch_U0.compute_pss_U0.td_pss_real_V_0_U", "Parent" : "10"},
	{"ID" : "16", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.dataflow_in_loop_lteCellSearch_U0.compute_pss_U0.td_pss_imag_V_0_U", "Parent" : "10"},
	{"ID" : "17", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.dataflow_in_loop_lteCellSearch_U0.compute_pss_U0.td_pss_real_V_1_U", "Parent" : "10"},
	{"ID" : "18", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.dataflow_in_loop_lteCellSearch_U0.compute_pss_U0.td_pss_imag_V_1_U", "Parent" : "10"},
	{"ID" : "19", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.dataflow_in_loop_lteCellSearch_U0.compute_pss_U0.td_pss_real_V_2_U", "Parent" : "10"},
	{"ID" : "20", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.dataflow_in_loop_lteCellSearch_U0.compute_pss_U0.td_pss_imag_V_2_U", "Parent" : "10"},
	{"ID" : "21", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.dataflow_in_loop_lteCellSearch_U0.compute_pss_U0.grp_sqrt_fixed_40_18_s_fu_535", "Parent" : "10",
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
	{"ID" : "22", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.dataflow_in_loop_lteCellSearch_U0.compute_pss_U0.grp_sqrt_fixed_40_18_s_fu_540", "Parent" : "10",
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
	{"ID" : "23", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.dataflow_in_loop_lteCellSearch_U0.compute_pss_U0.grp_sqrt_fixed_40_18_s_fu_545", "Parent" : "10",
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
	{"ID" : "24", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.dataflow_in_loop_lteCellSearch_U0.compute_pss_U0.mul_23s_31ns_48_1_1_U17", "Parent" : "10"},
	{"ID" : "25", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.dataflow_in_loop_lteCellSearch_U0.compute_pss_U0.mul_23s_31ns_48_1_1_U18", "Parent" : "10"},
	{"ID" : "26", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.dataflow_in_loop_lteCellSearch_U0.compute_pss_U0.mul_32s_23s_54_1_1_U19", "Parent" : "10"},
	{"ID" : "27", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.dataflow_in_loop_lteCellSearch_U0.compute_pss_U0.mul_32s_22s_53_1_1_U20", "Parent" : "10"},
	{"ID" : "28", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.dataflow_in_loop_lteCellSearch_U0.compute_pss_U0.mul_33s_23s_55_1_1_U21", "Parent" : "10"},
	{"ID" : "29", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.dataflow_in_loop_lteCellSearch_U0.compute_pss_U0.mul_32s_22s_53_1_1_U22", "Parent" : "10"},
	{"ID" : "30", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.dataflow_in_loop_lteCellSearch_U0.compute_pss_U0.mul_32s_22s_53_1_1_U23", "Parent" : "10"},
	{"ID" : "31", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.dataflow_in_loop_lteCellSearch_U0.compute_pss_U0.mul_33s_23s_55_1_1_U24", "Parent" : "10"},
	{"ID" : "32", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.dataflow_in_loop_lteCellSearch_U0.compute_pss_U0.mul_32s_22s_53_1_1_U25", "Parent" : "10"},
	{"ID" : "33", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.dataflow_in_loop_lteCellSearch_U0.compute_pss_U0.mul_32s_22s_53_1_1_U26", "Parent" : "10"},
	{"ID" : "34", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.dataflow_in_loop_lteCellSearch_U0.compute_pss_U0.mul_33s_23s_55_1_1_U27", "Parent" : "10"},
	{"ID" : "35", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.dataflow_in_loop_lteCellSearch_U0.compute_pss_U0.mul_32s_32s_50_1_1_U28", "Parent" : "10"},
	{"ID" : "36", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.dataflow_in_loop_lteCellSearch_U0.compute_pss_U0.mul_32s_32s_50_1_1_U29", "Parent" : "10"},
	{"ID" : "37", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.dataflow_in_loop_lteCellSearch_U0.compute_pss_U0.mul_32s_32s_50_1_1_U30", "Parent" : "10"},
	{"ID" : "38", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.dataflow_in_loop_lteCellSearch_U0.compute_pss_U0.mul_32s_32s_50_1_1_U31", "Parent" : "10"},
	{"ID" : "39", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.dataflow_in_loop_lteCellSearch_U0.compute_pss_U0.mul_32s_32s_50_1_1_U32", "Parent" : "10"},
	{"ID" : "40", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.dataflow_in_loop_lteCellSearch_U0.compute_pss_U0.mul_32s_32s_50_1_1_U33", "Parent" : "10"},
	{"ID" : "41", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.dataflow_in_loop_lteCellSearch_U0.compute_pss_U0.mul_31ns_14ns_44_1_1_U34", "Parent" : "10"},
	{"ID" : "42", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.dataflow_in_loop_lteCellSearch_U0.compute_pss_U0.mul_31ns_14ns_44_1_1_U35", "Parent" : "10"},
	{"ID" : "43", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.dataflow_in_loop_lteCellSearch_U0.compute_pss_U0.mul_31ns_14ns_44_1_1_U36", "Parent" : "10"},
	{"ID" : "44", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.dataflow_in_loop_lteCellSearch_U0.track_pss_peak_U0", "Parent" : "1", "Child" : ["45", "46", "47"],
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
			{"Name" : "p_read", "Type" : "None", "Direction" : "I", "DependentProc" : "10", "DependentChan" : "52", "DependentChanDepth" : "2", "DependentChanType" : "1"},
			{"Name" : "p_read1", "Type" : "None", "Direction" : "I", "DependentProc" : "10", "DependentChan" : "53", "DependentChanDepth" : "2", "DependentChanType" : "1"},
			{"Name" : "p_read2", "Type" : "None", "Direction" : "I", "DependentProc" : "10", "DependentChan" : "54", "DependentChanDepth" : "2", "DependentChanType" : "1"},
			{"Name" : "p_read3", "Type" : "None", "Direction" : "I", "DependentProc" : "3", "DependentChan" : "51", "DependentChanDepth" : "2", "DependentChanType" : "1"},
			{"Name" : "pss_id_temp", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "peak_id_temp", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "trunc_ln264", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "3", "DependentChan" : "50", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "trunc_ln264_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "pss_rslt_temp", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "curr_max_V", "Type" : "OVld", "Direction" : "IO"}]},
	{"ID" : "45", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.dataflow_in_loop_lteCellSearch_U0.track_pss_peak_U0.mul_42ns_37ns_78_1_1_U53", "Parent" : "44"},
	{"ID" : "46", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.dataflow_in_loop_lteCellSearch_U0.track_pss_peak_U0.mul_42ns_37ns_78_1_1_U54", "Parent" : "44"},
	{"ID" : "47", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.dataflow_in_loop_lteCellSearch_U0.track_pss_peak_U0.mul_42ns_37ns_78_1_1_U55", "Parent" : "44"},
	{"ID" : "48", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.dataflow_in_loop_lteCellSearch_U0.trunc_ln264_c_U", "Parent" : "1"},
	{"ID" : "49", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.dataflow_in_loop_lteCellSearch_U0.trunc_ln264_c1_U", "Parent" : "1"},
	{"ID" : "50", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.dataflow_in_loop_lteCellSearch_U0.trunc_ln264_c2_U", "Parent" : "1"},
	{"ID" : "51", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.dataflow_in_loop_lteCellSearch_U0.thresh_V_U", "Parent" : "1"},
	{"ID" : "52", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.dataflow_in_loop_lteCellSearch_U0.pss_rslt_0_V_U", "Parent" : "1"},
	{"ID" : "53", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.dataflow_in_loop_lteCellSearch_U0.pss_rslt_1_V_U", "Parent" : "1"},
	{"ID" : "54", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.dataflow_in_loop_lteCellSearch_U0.pss_rslt_2_V_U", "Parent" : "1"}]}


set ArgLastReadFirstWriteLatency {
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
		curr_max_V {Type IO LastRead -1 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "25824004", "Max" : "38208004"}
	, {"Name" : "Interval", "Min" : "25824004", "Max" : "38208004"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	IN_real_V { ap_memory {  { IN_real_V_address0 mem_address 1 17 }  { IN_real_V_ce0 mem_ce 1 1 }  { IN_real_V_d0 mem_din 1 23 }  { IN_real_V_q0 mem_dout 0 23 }  { IN_real_V_we0 mem_we 1 1 }  { IN_real_V_address1 MemPortADDR2 1 17 }  { IN_real_V_ce1 MemPortCE2 1 1 }  { IN_real_V_d1 mem_din 1 23 }  { IN_real_V_q1 MemPortDOUT2 0 23 }  { IN_real_V_we1 mem_we 1 1 } } }
	IN_imag_V { ap_memory {  { IN_imag_V_address0 mem_address 1 17 }  { IN_imag_V_ce0 mem_ce 1 1 }  { IN_imag_V_d0 mem_din 1 23 }  { IN_imag_V_q0 mem_dout 0 23 }  { IN_imag_V_we0 mem_we 1 1 }  { IN_imag_V_address1 MemPortADDR2 1 17 }  { IN_imag_V_ce1 MemPortCE2 1 1 }  { IN_imag_V_d1 mem_din 1 23 }  { IN_imag_V_q1 MemPortDOUT2 0 23 }  { IN_imag_V_we1 mem_we 1 1 } } }
	pss_id_temp { ap_vld {  { pss_id_temp out_data 1 2 }  { pss_id_temp_ap_vld out_vld 1 1 } } }
	peak_id_temp { ap_vld {  { peak_id_temp out_data 1 17 }  { peak_id_temp_ap_vld out_vld 1 1 } } }
	pss_rslt_temp { ap_memory {  { pss_rslt_temp_address0 mem_address 1 19 }  { pss_rslt_temp_ce0 mem_ce 1 1 }  { pss_rslt_temp_d0 mem_din 1 12 }  { pss_rslt_temp_q0 mem_dout 0 12 }  { pss_rslt_temp_we0 mem_we 1 1 }  { pss_rslt_temp_address1 MemPortADDR2 1 19 }  { pss_rslt_temp_ce1 MemPortCE2 1 1 }  { pss_rslt_temp_d1 MemPortDIN2 1 12 }  { pss_rslt_temp_q1 mem_dout 0 12 }  { pss_rslt_temp_we1 MemPortWE2 1 1 } } }
}
