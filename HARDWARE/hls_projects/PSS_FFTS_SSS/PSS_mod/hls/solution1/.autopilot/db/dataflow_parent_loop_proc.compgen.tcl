# This script segment is generated automatically by AutoPilot

# clear list
if {${::AESL::PGuard_autoexp_gen}} {
    cg_default_interface_gen_dc_begin
    cg_default_interface_gen_bundle_begin
    AESL_LIB_XILADAPTER::native_axis_begin
}

# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 78 \
    name IN_real_V \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename IN_real_V \
    op interface \
    ports { IN_real_V_address0 { O 17 vector } IN_real_V_ce0 { O 1 bit } IN_real_V_d0 { O 23 vector } IN_real_V_q0 { I 23 vector } IN_real_V_we0 { O 1 bit } IN_real_V_address1 { O 17 vector } IN_real_V_ce1 { O 1 bit } IN_real_V_d1 { O 23 vector } IN_real_V_q1 { I 23 vector } IN_real_V_we1 { O 1 bit } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'IN_real_V'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 79 \
    name IN_imag_V \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename IN_imag_V \
    op interface \
    ports { IN_imag_V_address0 { O 17 vector } IN_imag_V_ce0 { O 1 bit } IN_imag_V_d0 { O 23 vector } IN_imag_V_q0 { I 23 vector } IN_imag_V_we0 { O 1 bit } IN_imag_V_address1 { O 17 vector } IN_imag_V_ce1 { O 1 bit } IN_imag_V_d1 { O 23 vector } IN_imag_V_q1 { I 23 vector } IN_imag_V_we1 { O 1 bit } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'IN_imag_V'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 82 \
    name pss_rslt_temp \
    reset_level 1 \
    sync_rst true \
    dir O \
    corename pss_rslt_temp \
    op interface \
    ports { pss_rslt_temp_address0 { O 19 vector } pss_rslt_temp_ce0 { O 1 bit } pss_rslt_temp_d0 { O 12 vector } pss_rslt_temp_q0 { I 12 vector } pss_rslt_temp_we0 { O 1 bit } pss_rslt_temp_address1 { O 19 vector } pss_rslt_temp_ce1 { O 1 bit } pss_rslt_temp_d1 { O 12 vector } pss_rslt_temp_q1 { I 12 vector } pss_rslt_temp_we1 { O 1 bit } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'pss_rslt_temp'"
}
}


# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 80 \
    name pss_id_temp \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_pss_id_temp \
    op interface \
    ports { pss_id_temp { O 2 vector } pss_id_temp_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 81 \
    name peak_id_temp \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_peak_id_temp \
    op interface \
    ports { peak_id_temp { O 17 vector } peak_id_temp_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id -1 \
    name ap_ctrl \
    type ap_ctrl \
    reset_level 1 \
    sync_rst true \
    corename ap_ctrl \
    op interface \
    ports { ap_start { I 1 bit } ap_ready { O 1 bit } ap_done { O 1 bit } ap_idle { O 1 bit } ap_continue { I 1 bit } } \
} "
}


# Adapter definition:
set PortName ap_clk
set DataWd 1 
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc cg_default_interface_gen_clock] == "cg_default_interface_gen_clock"} {
eval "cg_default_interface_gen_clock { \
    id -2 \
    name ${PortName} \
    reset_level 1 \
    sync_rst true \
    corename apif_ap_clk \
    data_wd ${DataWd} \
    op interface \
}"
} else {
puts "@W \[IMPL-113\] Cannot find bus interface model in the library. Ignored generation of bus interface for '${PortName}'"
}
}


# Adapter definition:
set PortName ap_rst
set DataWd 1 
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc cg_default_interface_gen_reset] == "cg_default_interface_gen_reset"} {
eval "cg_default_interface_gen_reset { \
    id -3 \
    name ${PortName} \
    reset_level 1 \
    sync_rst true \
    corename apif_ap_rst \
    data_wd ${DataWd} \
    op interface \
}"
} else {
puts "@W \[IMPL-114\] Cannot find bus interface model in the library. Ignored generation of bus interface for '${PortName}'"
}
}



# merge
if {${::AESL::PGuard_autoexp_gen}} {
    cg_default_interface_gen_dc_end
    cg_default_interface_gen_bundle_end
    AESL_LIB_XILADAPTER::native_axis_end
}


