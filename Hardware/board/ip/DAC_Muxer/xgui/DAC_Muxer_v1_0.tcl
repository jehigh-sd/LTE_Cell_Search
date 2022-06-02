
# Loading additional proc with user specified bodies to compute parameter values.
source [file join [file dirname [file dirname [info script]]] gui/DAC_Muxer_v1_0.gtcl]

# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0"]
  ipgui::add_param $IPINST -name "IQMODE" -parent ${Page_0}
  ipgui::add_param $IPINST -name "SAMPLESPERCLOCK" -parent ${Page_0}
  ipgui::add_param $IPINST -name "LOWER_WIDTH_0" -parent ${Page_0}
  ipgui::add_param $IPINST -name "UPPER_WIDTH_0" -parent ${Page_0}
  ipgui::add_param $IPINST -name "LOWER_WIDTH_1" -parent ${Page_0}
  ipgui::add_param $IPINST -name "UPPER_WIDTH_1" -parent ${Page_0}


}

proc update_PARAM_VALUE.LOWER_WIDTH_0 { PARAM_VALUE.LOWER_WIDTH_0 PARAM_VALUE.SAMPLESPERCLOCK } {
	# Procedure called to update LOWER_WIDTH_0 when any of the dependent parameters in the arguments change
	
	set LOWER_WIDTH_0 ${PARAM_VALUE.LOWER_WIDTH_0}
	set SAMPLESPERCLOCK ${PARAM_VALUE.SAMPLESPERCLOCK}
	set values(SAMPLESPERCLOCK) [get_property value $SAMPLESPERCLOCK]
	set_property value [gen_USERPARAMETER_LOWER_WIDTH_0_VALUE $values(SAMPLESPERCLOCK)] $LOWER_WIDTH_0
}

proc validate_PARAM_VALUE.LOWER_WIDTH_0 { PARAM_VALUE.LOWER_WIDTH_0 } {
	# Procedure called to validate LOWER_WIDTH_0
	return true
}

proc update_PARAM_VALUE.LOWER_WIDTH_1 { PARAM_VALUE.LOWER_WIDTH_1 PARAM_VALUE.SAMPLESPERCLOCK PARAM_VALUE.IQMODE } {
	# Procedure called to update LOWER_WIDTH_1 when any of the dependent parameters in the arguments change
	
	set LOWER_WIDTH_1 ${PARAM_VALUE.LOWER_WIDTH_1}
	set SAMPLESPERCLOCK ${PARAM_VALUE.SAMPLESPERCLOCK}
	set IQMODE ${PARAM_VALUE.IQMODE}
	set values(SAMPLESPERCLOCK) [get_property value $SAMPLESPERCLOCK]
	set values(IQMODE) [get_property value $IQMODE]
	set_property value [gen_USERPARAMETER_LOWER_WIDTH_1_VALUE $values(SAMPLESPERCLOCK) $values(IQMODE)] $LOWER_WIDTH_1
}

proc validate_PARAM_VALUE.LOWER_WIDTH_1 { PARAM_VALUE.LOWER_WIDTH_1 } {
	# Procedure called to validate LOWER_WIDTH_1
	return true
}

proc update_PARAM_VALUE.UPPER_WIDTH_0 { PARAM_VALUE.UPPER_WIDTH_0 PARAM_VALUE.SAMPLESPERCLOCK } {
	# Procedure called to update UPPER_WIDTH_0 when any of the dependent parameters in the arguments change
	
	set UPPER_WIDTH_0 ${PARAM_VALUE.UPPER_WIDTH_0}
	set SAMPLESPERCLOCK ${PARAM_VALUE.SAMPLESPERCLOCK}
	set values(SAMPLESPERCLOCK) [get_property value $SAMPLESPERCLOCK]
	set_property value [gen_USERPARAMETER_UPPER_WIDTH_0_VALUE $values(SAMPLESPERCLOCK)] $UPPER_WIDTH_0
}

proc validate_PARAM_VALUE.UPPER_WIDTH_0 { PARAM_VALUE.UPPER_WIDTH_0 } {
	# Procedure called to validate UPPER_WIDTH_0
	return true
}

proc update_PARAM_VALUE.UPPER_WIDTH_1 { PARAM_VALUE.UPPER_WIDTH_1 PARAM_VALUE.SAMPLESPERCLOCK PARAM_VALUE.IQMODE } {
	# Procedure called to update UPPER_WIDTH_1 when any of the dependent parameters in the arguments change
	
	set UPPER_WIDTH_1 ${PARAM_VALUE.UPPER_WIDTH_1}
	set SAMPLESPERCLOCK ${PARAM_VALUE.SAMPLESPERCLOCK}
	set IQMODE ${PARAM_VALUE.IQMODE}
	set values(SAMPLESPERCLOCK) [get_property value $SAMPLESPERCLOCK]
	set values(IQMODE) [get_property value $IQMODE]
	if { [gen_USERPARAMETER_UPPER_WIDTH_1_ENABLEMENT $values(SAMPLESPERCLOCK)] } {
		set_property enabled true $UPPER_WIDTH_1
	} else {
		set_property enabled false $UPPER_WIDTH_1
		set_property value [gen_USERPARAMETER_UPPER_WIDTH_1_VALUE $values(SAMPLESPERCLOCK) $values(IQMODE)] $UPPER_WIDTH_1
	}
}

proc validate_PARAM_VALUE.UPPER_WIDTH_1 { PARAM_VALUE.UPPER_WIDTH_1 } {
	# Procedure called to validate UPPER_WIDTH_1
	return true
}

proc update_PARAM_VALUE.IQMODE { PARAM_VALUE.IQMODE } {
	# Procedure called to update IQMODE when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.IQMODE { PARAM_VALUE.IQMODE } {
	# Procedure called to validate IQMODE
	return true
}

proc update_PARAM_VALUE.SAMPLESPERCLOCK { PARAM_VALUE.SAMPLESPERCLOCK } {
	# Procedure called to update SAMPLESPERCLOCK when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.SAMPLESPERCLOCK { PARAM_VALUE.SAMPLESPERCLOCK } {
	# Procedure called to validate SAMPLESPERCLOCK
	return true
}


proc update_MODELPARAM_VALUE.UPPER_WIDTH_0 { MODELPARAM_VALUE.UPPER_WIDTH_0 PARAM_VALUE.UPPER_WIDTH_0 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.UPPER_WIDTH_0}] ${MODELPARAM_VALUE.UPPER_WIDTH_0}
}

proc update_MODELPARAM_VALUE.LOWER_WIDTH_0 { MODELPARAM_VALUE.LOWER_WIDTH_0 PARAM_VALUE.LOWER_WIDTH_0 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.LOWER_WIDTH_0}] ${MODELPARAM_VALUE.LOWER_WIDTH_0}
}

proc update_MODELPARAM_VALUE.UPPER_WIDTH_1 { MODELPARAM_VALUE.UPPER_WIDTH_1 PARAM_VALUE.UPPER_WIDTH_1 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.UPPER_WIDTH_1}] ${MODELPARAM_VALUE.UPPER_WIDTH_1}
}

proc update_MODELPARAM_VALUE.LOWER_WIDTH_1 { MODELPARAM_VALUE.LOWER_WIDTH_1 PARAM_VALUE.LOWER_WIDTH_1 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.LOWER_WIDTH_1}] ${MODELPARAM_VALUE.LOWER_WIDTH_1}
}

proc update_MODELPARAM_VALUE.IQMODE { MODELPARAM_VALUE.IQMODE PARAM_VALUE.IQMODE } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.IQMODE}] ${MODELPARAM_VALUE.IQMODE}
}

proc update_MODELPARAM_VALUE.SAMPLESPERCLOCK { MODELPARAM_VALUE.SAMPLESPERCLOCK PARAM_VALUE.SAMPLESPERCLOCK } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.SAMPLESPERCLOCK}] ${MODELPARAM_VALUE.SAMPLESPERCLOCK}
}

