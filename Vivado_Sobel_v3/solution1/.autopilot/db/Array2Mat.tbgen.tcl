set moduleName Array2Mat
set isTopModule 0
set isTaskLevelControl 1
set isCombinational 0
set isDatapathOnly 0
set isFreeRunPipelineModule 0
set isPipelined 0
set pipeline_type none
set FunctionProtocol ap_ctrl_hs
set isOneStateSeq 0
set ProfileFlag 0
set StallSigGenFlag 0
set isEnableWaveformDebug 1
set C_modelName {Array2Mat}
set C_modelType { void 0 }
set C_modelArgList {
	{ fb int 8 regular {array 100 { 1 } 1 1 }  }
	{ img_rows_V_read int 5 regular  }
	{ img_cols_V_read int 5 regular  }
	{ img_data_stream_V int 8 regular {fifo 1 volatile }  }
}
set C_modelArgMapList {[ 
	{ "Name" : "fb", "interface" : "memory", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "img_rows_V_read", "interface" : "wire", "bitwidth" : 5, "direction" : "READONLY"} , 
 	{ "Name" : "img_cols_V_read", "interface" : "wire", "bitwidth" : 5, "direction" : "READONLY"} , 
 	{ "Name" : "img_data_stream_V", "interface" : "fifo", "bitwidth" : 8, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 14
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ fb_address0 sc_out sc_lv 7 signal 0 } 
	{ fb_ce0 sc_out sc_logic 1 signal 0 } 
	{ fb_q0 sc_in sc_lv 8 signal 0 } 
	{ img_rows_V_read sc_in sc_lv 5 signal 1 } 
	{ img_cols_V_read sc_in sc_lv 5 signal 2 } 
	{ img_data_stream_V_din sc_out sc_lv 8 signal 3 } 
	{ img_data_stream_V_full_n sc_in sc_logic 1 signal 3 } 
	{ img_data_stream_V_write sc_out sc_logic 1 signal 3 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "fb_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "fb", "role": "address0" }} , 
 	{ "name": "fb_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "fb", "role": "ce0" }} , 
 	{ "name": "fb_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "fb", "role": "q0" }} , 
 	{ "name": "img_rows_V_read", "direction": "in", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "img_rows_V_read", "role": "default" }} , 
 	{ "name": "img_cols_V_read", "direction": "in", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "img_cols_V_read", "role": "default" }} , 
 	{ "name": "img_data_stream_V_din", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "img_data_stream_V", "role": "din" }} , 
 	{ "name": "img_data_stream_V_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "img_data_stream_V", "role": "full_n" }} , 
 	{ "name": "img_data_stream_V_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "img_data_stream_V", "role": "write" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "",
		"CDFG" : "Array2Mat",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "1", "EstimateLatencyMax" : "131",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "fb", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "img_rows_V_read", "Type" : "None", "Direction" : "I"},
			{"Name" : "img_cols_V_read", "Type" : "None", "Direction" : "I"},
			{"Name" : "img_data_stream_V", "Type" : "Fifo", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "img_data_stream_V_blk_n", "Type" : "RtlSignal"}]}]}]}


set ArgLastReadFirstWriteLatency {
	Array2Mat {
		fb {Type I LastRead 2 FirstWrite -1}
		img_rows_V_read {Type I LastRead 0 FirstWrite -1}
		img_cols_V_read {Type I LastRead 0 FirstWrite -1}
		img_data_stream_V {Type O LastRead -1 FirstWrite 3}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "1", "Max" : "131"}
	, {"Name" : "Interval", "Min" : "1", "Max" : "131"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	fb { ap_memory {  { fb_address0 mem_address 1 7 }  { fb_ce0 mem_ce 1 1 }  { fb_q0 mem_dout 0 8 } } }
	img_rows_V_read { ap_none {  { img_rows_V_read in_data 0 5 } } }
	img_cols_V_read { ap_none {  { img_cols_V_read in_data 0 5 } } }
	img_data_stream_V { ap_fifo {  { img_data_stream_V_din fifo_data 1 8 }  { img_data_stream_V_full_n fifo_status 0 1 }  { img_data_stream_V_write fifo_update 1 1 } } }
}
