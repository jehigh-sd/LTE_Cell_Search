# This script segment is generated automatically by AutoPilot

set axilite_register_dict [dict create]
set port_control {
OUT_PSS_ID { 
	dir O
	width 32
	depth 1
	mode ap_vld
	offset 16
	offset_end 23
}
OUT_PEAK_INDEX { 
	dir O
	width 32
	depth 1
	mode ap_vld
	offset 32
	offset_end 39
}
OUT_RSLT { 
	dir I
	width 64
	depth 1
	mode ap_none
	offset 48
	offset_end 59
}
ap_start { }
ap_done { }
ap_ready { }
ap_idle { }
}
dict set axilite_register_dict control $port_control


