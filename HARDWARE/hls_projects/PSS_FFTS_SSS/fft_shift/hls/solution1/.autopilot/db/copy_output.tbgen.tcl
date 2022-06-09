set moduleName copy_output
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
set C_modelName {copy_output}
set C_modelType { void 0 }
set C_modelArgList {
	{ OUT_temp_R float 32 regular {array 128 { 1 3 } 1 1 }  }
	{ OUT_temp_I float 32 regular {array 128 { 1 3 } 1 1 }  }
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
	{ "Name" : "OUT_temp_R", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "OUT_temp_I", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "OUT_R_V_data_V", "interface" : "axis", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "OUT_R_V_keep_V", "interface" : "axis", "bitwidth" : 4, "direction" : "WRITEONLY"} , 
 	{ "Name" : "OUT_R_V_strb_V", "interface" : "axis", "bitwidth" : 4, "direction" : "WRITEONLY"} , 
 	{ "Name" : "OUT_R_V_last_V", "interface" : "axis", "bitwidth" : 1, "direction" : "WRITEONLY"} , 
 	{ "Name" : "OUT_I_V_data_V", "interface" : "axis", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "OUT_I_V_keep_V", "interface" : "axis", "bitwidth" : 4, "direction" : "WRITEONLY"} , 
 	{ "Name" : "OUT_I_V_strb_V", "interface" : "axis", "bitwidth" : 4, "direction" : "WRITEONLY"} , 
 	{ "Name" : "OUT_I_V_last_V", "interface" : "axis", "bitwidth" : 1, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 24
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ OUT_temp_R_address0 sc_out sc_lv 7 signal 0 } 
	{ OUT_temp_R_ce0 sc_out sc_logic 1 signal 0 } 
	{ OUT_temp_R_q0 sc_in sc_lv 32 signal 0 } 
	{ OUT_temp_I_address0 sc_out sc_lv 7 signal 1 } 
	{ OUT_temp_I_ce0 sc_out sc_logic 1 signal 1 } 
	{ OUT_temp_I_q0 sc_in sc_lv 32 signal 1 } 
	{ OUT_R_TDATA sc_out sc_lv 32 signal 2 } 
	{ OUT_R_TVALID sc_out sc_logic 1 outvld 5 } 
	{ OUT_R_TREADY sc_in sc_logic 1 outacc 2 } 
	{ OUT_R_TKEEP sc_out sc_lv 4 signal 3 } 
	{ OUT_R_TSTRB sc_out sc_lv 4 signal 4 } 
	{ OUT_R_TLAST sc_out sc_lv 1 signal 5 } 
	{ OUT_I_TDATA sc_out sc_lv 32 signal 6 } 
	{ OUT_I_TVALID sc_out sc_logic 1 outvld 9 } 
	{ OUT_I_TREADY sc_in sc_logic 1 outacc 6 } 
	{ OUT_I_TKEEP sc_out sc_lv 4 signal 7 } 
	{ OUT_I_TSTRB sc_out sc_lv 4 signal 8 } 
	{ OUT_I_TLAST sc_out sc_lv 1 signal 9 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "OUT_temp_R_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "OUT_temp_R", "role": "address0" }} , 
 	{ "name": "OUT_temp_R_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "OUT_temp_R", "role": "ce0" }} , 
 	{ "name": "OUT_temp_R_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "OUT_temp_R", "role": "q0" }} , 
 	{ "name": "OUT_temp_I_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "OUT_temp_I", "role": "address0" }} , 
 	{ "name": "OUT_temp_I_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "OUT_temp_I", "role": "ce0" }} , 
 	{ "name": "OUT_temp_I_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "OUT_temp_I", "role": "q0" }} , 
 	{ "name": "OUT_R_TDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "OUT_R_V_data_V", "role": "default" }} , 
 	{ "name": "OUT_R_TVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "OUT_R_V_last_V", "role": "default" }} , 
 	{ "name": "OUT_R_TREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "outacc", "bundle":{"name": "OUT_R_V_data_V", "role": "default" }} , 
 	{ "name": "OUT_R_TKEEP", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "OUT_R_V_keep_V", "role": "default" }} , 
 	{ "name": "OUT_R_TSTRB", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "OUT_R_V_strb_V", "role": "default" }} , 
 	{ "name": "OUT_R_TLAST", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "OUT_R_V_last_V", "role": "default" }} , 
 	{ "name": "OUT_I_TDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "OUT_I_V_data_V", "role": "default" }} , 
 	{ "name": "OUT_I_TVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "OUT_I_V_last_V", "role": "default" }} , 
 	{ "name": "OUT_I_TREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "outacc", "bundle":{"name": "OUT_I_V_data_V", "role": "default" }} , 
 	{ "name": "OUT_I_TKEEP", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "OUT_I_V_keep_V", "role": "default" }} , 
 	{ "name": "OUT_I_TSTRB", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "OUT_I_V_strb_V", "role": "default" }} , 
 	{ "name": "OUT_I_TLAST", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "OUT_I_V_last_V", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "",
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
			{"Name" : "OUT_I_V_last_V", "Type" : "Axis", "Direction" : "O"}]}]}


set ArgLastReadFirstWriteLatency {
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
	{"Name" : "Latency", "Min" : "131", "Max" : "131"}
	, {"Name" : "Interval", "Min" : "131", "Max" : "131"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	OUT_temp_R { ap_memory {  { OUT_temp_R_address0 mem_address 1 7 }  { OUT_temp_R_ce0 mem_ce 1 1 }  { OUT_temp_R_q0 mem_dout 0 32 } } }
	OUT_temp_I { ap_memory {  { OUT_temp_I_address0 mem_address 1 7 }  { OUT_temp_I_ce0 mem_ce 1 1 }  { OUT_temp_I_q0 mem_dout 0 32 } } }
	OUT_R_V_data_V { axis {  { OUT_R_TDATA out_data 1 32 }  { OUT_R_TREADY out_acc 0 1 } } }
	OUT_R_V_keep_V { axis {  { OUT_R_TKEEP out_data 1 4 } } }
	OUT_R_V_strb_V { axis {  { OUT_R_TSTRB out_data 1 4 } } }
	OUT_R_V_last_V { axis {  { OUT_R_TVALID out_vld 1 1 }  { OUT_R_TLAST out_data 1 1 } } }
	OUT_I_V_data_V { axis {  { OUT_I_TDATA out_data 1 32 }  { OUT_I_TREADY out_acc 0 1 } } }
	OUT_I_V_keep_V { axis {  { OUT_I_TKEEP out_data 1 4 } } }
	OUT_I_V_strb_V { axis {  { OUT_I_TSTRB out_data 1 4 } } }
	OUT_I_V_last_V { axis {  { OUT_I_TVALID out_vld 1 1 }  { OUT_I_TLAST out_data 1 1 } } }
}
