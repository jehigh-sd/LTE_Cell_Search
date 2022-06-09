# This script segment is generated automatically by AutoPilot

set id 17
set name lteCellSearch_mul_23s_31ns_48_1_1
set corename simcore_mul
set op mul
set stage_num 1
set max_latency -1
set registered_input 1
set in0_width 23
set in0_signed 1
set in1_width 31
set in1_signed 0
set out_width 48
if {${::AESL::PGuard_simmodel_gen}} {
if {[info proc ap_gen_simcore_mul] == "ap_gen_simcore_mul"} {
eval "ap_gen_simcore_mul { \
    id ${id} \
    name ${name} \
    corename ${corename} \
    op ${op} \
    reset_level 1 \
    sync_rst true \
    stage_num ${stage_num} \
    max_latency ${max_latency} \
    registered_input ${registered_input} \
    in0_width ${in0_width} \
    in0_signed ${in0_signed} \
    in1_width ${in1_width} \
    in1_signed ${in1_signed} \
    out_width ${out_width} \
}"
} else {
puts "@W \[IMPL-100\] Cannot find ap_gen_simcore_mul, check your AutoPilot builtin lib"
}
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler ${name}
}


set op mul
set corename Multiplier
if {${::AESL::PGuard_autocg_gen} && ${::AESL::PGuard_autocg_ipmgen}} {
if {[info proc ::AESL_LIB_VIRTEX::xil_gen_multicycle_mul] == "::AESL_LIB_VIRTEX::xil_gen_multicycle_mul"} {
eval "::AESL_LIB_VIRTEX::xil_gen_multicycle_mul { \
    id ${id} \
    name ${name} \
    corename ${corename} \
    op ${op} \
    reset_level 1 \
    sync_rst true \
    stage_num ${stage_num} \
    max_latency ${max_latency} \
    registered_input ${registered_input} \
    in0_width ${in0_width} \
    in0_signed ${in0_signed} \
    in1_width ${in1_width} \
    in1_signed ${in1_signed} \
    out_width ${out_width} \
}"
} else {
puts "@W \[IMPL-101\] Cannot find ::AESL_LIB_VIRTEX::xil_gen_multicycle_mul, check your platform lib"
}
}


set id 19
set name lteCellSearch_mul_32s_23s_54_1_1
set corename simcore_mul
set op mul
set stage_num 1
set max_latency -1
set registered_input 1
set in0_width 32
set in0_signed 1
set in1_width 23
set in1_signed 1
set out_width 54
if {${::AESL::PGuard_simmodel_gen}} {
if {[info proc ap_gen_simcore_mul] == "ap_gen_simcore_mul"} {
eval "ap_gen_simcore_mul { \
    id ${id} \
    name ${name} \
    corename ${corename} \
    op ${op} \
    reset_level 1 \
    sync_rst true \
    stage_num ${stage_num} \
    max_latency ${max_latency} \
    registered_input ${registered_input} \
    in0_width ${in0_width} \
    in0_signed ${in0_signed} \
    in1_width ${in1_width} \
    in1_signed ${in1_signed} \
    out_width ${out_width} \
}"
} else {
puts "@W \[IMPL-100\] Cannot find ap_gen_simcore_mul, check your AutoPilot builtin lib"
}
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler ${name}
}


set op mul
set corename Multiplier
if {${::AESL::PGuard_autocg_gen} && ${::AESL::PGuard_autocg_ipmgen}} {
if {[info proc ::AESL_LIB_VIRTEX::xil_gen_multicycle_mul] == "::AESL_LIB_VIRTEX::xil_gen_multicycle_mul"} {
eval "::AESL_LIB_VIRTEX::xil_gen_multicycle_mul { \
    id ${id} \
    name ${name} \
    corename ${corename} \
    op ${op} \
    reset_level 1 \
    sync_rst true \
    stage_num ${stage_num} \
    max_latency ${max_latency} \
    registered_input ${registered_input} \
    in0_width ${in0_width} \
    in0_signed ${in0_signed} \
    in1_width ${in1_width} \
    in1_signed ${in1_signed} \
    out_width ${out_width} \
}"
} else {
puts "@W \[IMPL-101\] Cannot find ::AESL_LIB_VIRTEX::xil_gen_multicycle_mul, check your platform lib"
}
}


set id 20
set name lteCellSearch_mul_32s_22s_53_1_1
set corename simcore_mul
set op mul
set stage_num 1
set max_latency -1
set registered_input 1
set in0_width 32
set in0_signed 1
set in1_width 22
set in1_signed 1
set out_width 53
if {${::AESL::PGuard_simmodel_gen}} {
if {[info proc ap_gen_simcore_mul] == "ap_gen_simcore_mul"} {
eval "ap_gen_simcore_mul { \
    id ${id} \
    name ${name} \
    corename ${corename} \
    op ${op} \
    reset_level 1 \
    sync_rst true \
    stage_num ${stage_num} \
    max_latency ${max_latency} \
    registered_input ${registered_input} \
    in0_width ${in0_width} \
    in0_signed ${in0_signed} \
    in1_width ${in1_width} \
    in1_signed ${in1_signed} \
    out_width ${out_width} \
}"
} else {
puts "@W \[IMPL-100\] Cannot find ap_gen_simcore_mul, check your AutoPilot builtin lib"
}
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler ${name}
}


set op mul
set corename Multiplier
if {${::AESL::PGuard_autocg_gen} && ${::AESL::PGuard_autocg_ipmgen}} {
if {[info proc ::AESL_LIB_VIRTEX::xil_gen_multicycle_mul] == "::AESL_LIB_VIRTEX::xil_gen_multicycle_mul"} {
eval "::AESL_LIB_VIRTEX::xil_gen_multicycle_mul { \
    id ${id} \
    name ${name} \
    corename ${corename} \
    op ${op} \
    reset_level 1 \
    sync_rst true \
    stage_num ${stage_num} \
    max_latency ${max_latency} \
    registered_input ${registered_input} \
    in0_width ${in0_width} \
    in0_signed ${in0_signed} \
    in1_width ${in1_width} \
    in1_signed ${in1_signed} \
    out_width ${out_width} \
}"
} else {
puts "@W \[IMPL-101\] Cannot find ::AESL_LIB_VIRTEX::xil_gen_multicycle_mul, check your platform lib"
}
}


set id 21
set name lteCellSearch_mul_33s_23s_55_1_1
set corename simcore_mul
set op mul
set stage_num 1
set max_latency -1
set registered_input 1
set in0_width 33
set in0_signed 1
set in1_width 23
set in1_signed 1
set out_width 55
if {${::AESL::PGuard_simmodel_gen}} {
if {[info proc ap_gen_simcore_mul] == "ap_gen_simcore_mul"} {
eval "ap_gen_simcore_mul { \
    id ${id} \
    name ${name} \
    corename ${corename} \
    op ${op} \
    reset_level 1 \
    sync_rst true \
    stage_num ${stage_num} \
    max_latency ${max_latency} \
    registered_input ${registered_input} \
    in0_width ${in0_width} \
    in0_signed ${in0_signed} \
    in1_width ${in1_width} \
    in1_signed ${in1_signed} \
    out_width ${out_width} \
}"
} else {
puts "@W \[IMPL-100\] Cannot find ap_gen_simcore_mul, check your AutoPilot builtin lib"
}
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler ${name}
}


set op mul
set corename Multiplier
if {${::AESL::PGuard_autocg_gen} && ${::AESL::PGuard_autocg_ipmgen}} {
if {[info proc ::AESL_LIB_VIRTEX::xil_gen_multicycle_mul] == "::AESL_LIB_VIRTEX::xil_gen_multicycle_mul"} {
eval "::AESL_LIB_VIRTEX::xil_gen_multicycle_mul { \
    id ${id} \
    name ${name} \
    corename ${corename} \
    op ${op} \
    reset_level 1 \
    sync_rst true \
    stage_num ${stage_num} \
    max_latency ${max_latency} \
    registered_input ${registered_input} \
    in0_width ${in0_width} \
    in0_signed ${in0_signed} \
    in1_width ${in1_width} \
    in1_signed ${in1_signed} \
    out_width ${out_width} \
}"
} else {
puts "@W \[IMPL-101\] Cannot find ::AESL_LIB_VIRTEX::xil_gen_multicycle_mul, check your platform lib"
}
}


set id 28
set name lteCellSearch_mul_32s_32s_50_1_1
set corename simcore_mul
set op mul
set stage_num 1
set max_latency -1
set registered_input 1
set in0_width 32
set in0_signed 1
set in1_width 32
set in1_signed 1
set out_width 50
if {${::AESL::PGuard_simmodel_gen}} {
if {[info proc ap_gen_simcore_mul] == "ap_gen_simcore_mul"} {
eval "ap_gen_simcore_mul { \
    id ${id} \
    name ${name} \
    corename ${corename} \
    op ${op} \
    reset_level 1 \
    sync_rst true \
    stage_num ${stage_num} \
    max_latency ${max_latency} \
    registered_input ${registered_input} \
    in0_width ${in0_width} \
    in0_signed ${in0_signed} \
    in1_width ${in1_width} \
    in1_signed ${in1_signed} \
    out_width ${out_width} \
}"
} else {
puts "@W \[IMPL-100\] Cannot find ap_gen_simcore_mul, check your AutoPilot builtin lib"
}
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler ${name}
}


set op mul
set corename Multiplier
if {${::AESL::PGuard_autocg_gen} && ${::AESL::PGuard_autocg_ipmgen}} {
if {[info proc ::AESL_LIB_VIRTEX::xil_gen_multicycle_mul] == "::AESL_LIB_VIRTEX::xil_gen_multicycle_mul"} {
eval "::AESL_LIB_VIRTEX::xil_gen_multicycle_mul { \
    id ${id} \
    name ${name} \
    corename ${corename} \
    op ${op} \
    reset_level 1 \
    sync_rst true \
    stage_num ${stage_num} \
    max_latency ${max_latency} \
    registered_input ${registered_input} \
    in0_width ${in0_width} \
    in0_signed ${in0_signed} \
    in1_width ${in1_width} \
    in1_signed ${in1_signed} \
    out_width ${out_width} \
}"
} else {
puts "@W \[IMPL-101\] Cannot find ::AESL_LIB_VIRTEX::xil_gen_multicycle_mul, check your platform lib"
}
}


set id 34
set name lteCellSearch_mul_31ns_14ns_44_1_1
set corename simcore_mul
set op mul
set stage_num 1
set max_latency -1
set registered_input 1
set in0_width 31
set in0_signed 0
set in1_width 14
set in1_signed 0
set out_width 44
if {${::AESL::PGuard_simmodel_gen}} {
if {[info proc ap_gen_simcore_mul] == "ap_gen_simcore_mul"} {
eval "ap_gen_simcore_mul { \
    id ${id} \
    name ${name} \
    corename ${corename} \
    op ${op} \
    reset_level 1 \
    sync_rst true \
    stage_num ${stage_num} \
    max_latency ${max_latency} \
    registered_input ${registered_input} \
    in0_width ${in0_width} \
    in0_signed ${in0_signed} \
    in1_width ${in1_width} \
    in1_signed ${in1_signed} \
    out_width ${out_width} \
}"
} else {
puts "@W \[IMPL-100\] Cannot find ap_gen_simcore_mul, check your AutoPilot builtin lib"
}
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler ${name}
}


set op mul
set corename Multiplier
if {${::AESL::PGuard_autocg_gen} && ${::AESL::PGuard_autocg_ipmgen}} {
if {[info proc ::AESL_LIB_VIRTEX::xil_gen_multicycle_mul] == "::AESL_LIB_VIRTEX::xil_gen_multicycle_mul"} {
eval "::AESL_LIB_VIRTEX::xil_gen_multicycle_mul { \
    id ${id} \
    name ${name} \
    corename ${corename} \
    op ${op} \
    reset_level 1 \
    sync_rst true \
    stage_num ${stage_num} \
    max_latency ${max_latency} \
    registered_input ${registered_input} \
    in0_width ${in0_width} \
    in0_signed ${in0_signed} \
    in1_width ${in1_width} \
    in1_signed ${in1_signed} \
    out_width ${out_width} \
}"
} else {
puts "@W \[IMPL-101\] Cannot find ::AESL_LIB_VIRTEX::xil_gen_multicycle_mul, check your platform lib"
}
}


# Memory (RAM/ROM)  definition:
set ID 43
set hasByteEnable 0
set MemName lteCellSearch_compute_pss_IN_R_buff_V_0
set CoreName ap_simcore_mem
set PortList { 0 1 }
set DataWd 32
set AddrRange 64
set AddrWd 6
set impl_style auto
set TrueReset 0
set IsROM 0
set ROMData { }
set HasInitializer 1
set Initializer $ROMData
set NumOfStage 2
set MaxLatency -1
set DelayBudget 1.237
set ClkPeriod 16.3
set RegisteredInput 0
if {${::AESL::PGuard_simmodel_gen}} {
if {[info proc ap_gen_simcore_mem] == "ap_gen_simcore_mem"} {
    eval "ap_gen_simcore_mem { \
    id ${ID} \
    name ${MemName} \
    corename ${CoreName}  \
    op mem \
    hasByteEnable ${hasByteEnable} \
    reset_level 1 \
    sync_rst true \
    stage_num ${NumOfStage}  \
    registered_input ${RegisteredInput} \
    port_num 2 \
    port_list \{${PortList}\} \
    data_wd ${DataWd} \
    addr_wd ${AddrWd} \
    addr_range ${AddrRange} \
    style ${impl_style} \
    true_reset ${TrueReset} \
    delay_budget ${DelayBudget} \
    clk_period ${ClkPeriod} \
    HasInitializer ${HasInitializer} \
    rom_data \{${ROMData}\} \
 } "
} else {
    puts "@W \[IMPL-102\] Cannot find ap_gen_simcore_mem, check your platform lib"
}
}


if {${::AESL::PGuard_rtl_comp_handler}} {
  ::AP::rtl_comp_handler $MemName
}


set CoreName RAM
if {${::AESL::PGuard_autocg_gen} && ${::AESL::PGuard_autocg_ipmgen}} {
if {[info proc ::AESL_LIB_VIRTEX::xil_gen_RAM] == "::AESL_LIB_VIRTEX::xil_gen_RAM"} {
    eval "::AESL_LIB_VIRTEX::xil_gen_RAM { \
    id ${ID} \
    name ${MemName} \
    corename ${CoreName}  \
    op mem \
    hasByteEnable ${hasByteEnable} \
    reset_level 1 \
    sync_rst true \
    stage_num ${NumOfStage}  \
    registered_input ${RegisteredInput} \
    port_num 2 \
    port_list \{${PortList}\} \
    data_wd ${DataWd} \
    addr_wd ${AddrWd} \
    addr_range ${AddrRange} \
    style ${impl_style} \
    true_reset ${TrueReset} \
    delay_budget ${DelayBudget} \
    clk_period ${ClkPeriod} \
    HasInitializer ${HasInitializer} \
    rom_data \{${ROMData}\} \
 } "
  } else {
    puts "@W \[IMPL-104\] Cannot find ::AESL_LIB_VIRTEX::xil_gen_RAM, check your platform lib"
  }
}


# Memory (RAM/ROM)  definition:
set ID 44
set hasByteEnable 0
set MemName lteCellSearch_compute_pss_IN_R_buff_V_1
set CoreName ap_simcore_mem
set PortList { 2 2 }
set DataWd 32
set AddrRange 64
set AddrWd 6
set impl_style auto
set TrueReset 0
set IsROM 0
set ROMData { }
set HasInitializer 1
set Initializer $ROMData
set NumOfStage 2
set MaxLatency -1
set DelayBudget 1.237
set ClkPeriod 16.3
set RegisteredInput 0
if {${::AESL::PGuard_simmodel_gen}} {
if {[info proc ap_gen_simcore_mem] == "ap_gen_simcore_mem"} {
    eval "ap_gen_simcore_mem { \
    id ${ID} \
    name ${MemName} \
    corename ${CoreName}  \
    op mem \
    hasByteEnable ${hasByteEnable} \
    reset_level 1 \
    sync_rst true \
    stage_num ${NumOfStage}  \
    registered_input ${RegisteredInput} \
    port_num 2 \
    port_list \{${PortList}\} \
    data_wd ${DataWd} \
    addr_wd ${AddrWd} \
    addr_range ${AddrRange} \
    style ${impl_style} \
    true_reset ${TrueReset} \
    delay_budget ${DelayBudget} \
    clk_period ${ClkPeriod} \
    HasInitializer ${HasInitializer} \
    rom_data \{${ROMData}\} \
 } "
} else {
    puts "@W \[IMPL-102\] Cannot find ap_gen_simcore_mem, check your platform lib"
}
}


if {${::AESL::PGuard_rtl_comp_handler}} {
  ::AP::rtl_comp_handler $MemName
}


set CoreName RAM
if {${::AESL::PGuard_autocg_gen} && ${::AESL::PGuard_autocg_ipmgen}} {
if {[info proc ::AESL_LIB_VIRTEX::xil_gen_RAM] == "::AESL_LIB_VIRTEX::xil_gen_RAM"} {
    eval "::AESL_LIB_VIRTEX::xil_gen_RAM { \
    id ${ID} \
    name ${MemName} \
    corename ${CoreName}  \
    op mem \
    hasByteEnable ${hasByteEnable} \
    reset_level 1 \
    sync_rst true \
    stage_num ${NumOfStage}  \
    registered_input ${RegisteredInput} \
    port_num 2 \
    port_list \{${PortList}\} \
    data_wd ${DataWd} \
    addr_wd ${AddrWd} \
    addr_range ${AddrRange} \
    style ${impl_style} \
    true_reset ${TrueReset} \
    delay_budget ${DelayBudget} \
    clk_period ${ClkPeriod} \
    HasInitializer ${HasInitializer} \
    rom_data \{${ROMData}\} \
 } "
  } else {
    puts "@W \[IMPL-104\] Cannot find ::AESL_LIB_VIRTEX::xil_gen_RAM, check your platform lib"
  }
}


# Memory (RAM/ROM)  definition:
set ID 45
set hasByteEnable 0
set MemName lteCellSearch_compute_pss_td_pss_real_V_0
set CoreName ap_simcore_mem
set PortList { 1 }
set DataWd 23
set AddrRange 128
set AddrWd 7
set impl_style auto
set TrueReset 0
set IsROM 1
set ROMData { "00100101111110001111001" "00001010001111001100101" "11011100001011011110110" "11010111001011001111000" "11111110111010100101001" "00100100110010101011001" "00101000010110001110000" "00010001100000101011110" "11110101010111100101101" "11011111101010010111001" "11010100100101110011100" "11010010001010111011100" "11010000011100011011111" "11001100111101011001100" "11001110101011001001110" "11010110000110101100111" "11011010011110111101001" "11100000111101001101100" "11111100101010110010111" "00100101111100111100110" "00110001000100000010110" "00001011000100110011001" "11100001010011010100000" "11100100110011001000110" "00000010010101001100001" "00000111001111110100011" "11110110011111110101100" "11111011101100101100000" "00010100111111011101001" "00001111110000000011101" "11100010110000010101000" "11001000010001111010101" "11100110110010100000001" "00011001000001010000010" "00101100001010101111010" "00100101000001000001100" "00100011010100100001000" "00101001001110100111100" "00100110111001001110001" "00100000011111010111100" "00100011011100111100101" "00101010111100001010101" "00101010111101011011100" "00100010000010110001011" "00001101001010100111001" "11101000001011110001000" "11001011011011110011001" "11011110010011110100001" "00010011010101001110111" "00100100111001000111110" "11111011000000010000000" "11011011001010101100100" "11111100010100000110110" "00100101101111010100111" "00001000010100111110100" "11001000111011110101010" "11001101011000101111010" "00010111110011010011000" "01000011001100001011010" "00100100110011000101111" "00000001001100011110110" "00001001100101001110000" "00010001000000011101101" "11110001011110110111000" "11011000111010111110110" "11110001011110110111000" "00010001000000011101101" "00001001100101001110000" "00000001001100011110110" "00100100110011000101111" "01000011001100001011010" "00010111110011010011000" "11001101011000101111010" "11001000111011110101010" "00001000010100111110100" "00100101101111010100111" "11111100010100000110110" "11011011001010101100100" "11111011000000010000000" "00100100111001000111110" "00010011010101001110111" "11011110010011110100001" "11001011011011110011001" "11101000001011110001000" "00001101001010100111001" "00100010000010110001011" "00101010111101011011100" "00101010111100001010101" "00100011011100111100101" "00100000011111010111100" "00100110111001001110001" "00101001001110100111100" "00100011010100100001000" "00100101000001000001100" "00101100001010101111010" "00011001000001010000010" "11100110110010100000001" "11001000010001111010101" "11100010110000010101000" "00001111110000000011101" "00010100111111011101001" "11111011101100101100000" "11110110011111110101100" "00000111001111110100011" "00000010010101001100001" "11100100110011001000110" "11100001010011010100000" "00001011000100110011001" "00110001000100000010110" "00100101111100111100110" "11111100101010110010111" "11100000111101001101100" "11011010011110111101001" "11010110000110101100111" "11001110101011001001110" "11001100111101011001100" "11010000011100011011111" "11010010001010111011100" "11010100100101110011100" "11011111101010010111001" "11110101010111100101101" "00010001100000101011110" "00101000010110001110000" "00100100110010101011001" "11111110111010100101001" "11010111001011001111000" "11011100001011011110110" "00001010001111001100101" }
set HasInitializer 1
set Initializer $ROMData
set NumOfStage 2
set MaxLatency -1
set DelayBudget 1.237
set ClkPeriod 16.3
set RegisteredInput 0
if {${::AESL::PGuard_simmodel_gen}} {
if {[info proc ap_gen_simcore_mem] == "ap_gen_simcore_mem"} {
    eval "ap_gen_simcore_mem { \
    id ${ID} \
    name ${MemName} \
    corename ${CoreName}  \
    op mem \
    hasByteEnable ${hasByteEnable} \
    reset_level 1 \
    sync_rst true \
    stage_num ${NumOfStage}  \
    registered_input ${RegisteredInput} \
    port_num 1 \
    port_list \{${PortList}\} \
    data_wd ${DataWd} \
    addr_wd ${AddrWd} \
    addr_range ${AddrRange} \
    style ${impl_style} \
    true_reset ${TrueReset} \
    delay_budget ${DelayBudget} \
    clk_period ${ClkPeriod} \
    HasInitializer ${HasInitializer} \
    rom_data \{${ROMData}\} \
 } "
} else {
    puts "@W \[IMPL-102\] Cannot find ap_gen_simcore_mem, check your platform lib"
}
}


if {${::AESL::PGuard_rtl_comp_handler}} {
  ::AP::rtl_comp_handler $MemName
}


set CoreName ROM
if {${::AESL::PGuard_autocg_gen} && ${::AESL::PGuard_autocg_ipmgen}} {
if {[info proc ::AESL_LIB_VIRTEX::xil_gen_ROM] == "::AESL_LIB_VIRTEX::xil_gen_ROM"} {
    eval "::AESL_LIB_VIRTEX::xil_gen_ROM { \
    id ${ID} \
    name ${MemName} \
    corename ${CoreName}  \
    op mem \
    hasByteEnable ${hasByteEnable} \
    reset_level 1 \
    sync_rst true \
    stage_num ${NumOfStage}  \
    registered_input ${RegisteredInput} \
    port_num 1 \
    port_list \{${PortList}\} \
    data_wd ${DataWd} \
    addr_wd ${AddrWd} \
    addr_range ${AddrRange} \
    style ${impl_style} \
    true_reset ${TrueReset} \
    delay_budget ${DelayBudget} \
    clk_period ${ClkPeriod} \
    HasInitializer ${HasInitializer} \
    rom_data \{${ROMData}\} \
 } "
  } else {
    puts "@W \[IMPL-104\] Cannot find ::AESL_LIB_VIRTEX::xil_gen_ROM, check your platform lib"
  }
}


# Memory (RAM/ROM)  definition:
set ID 46
set hasByteEnable 0
set MemName lteCellSearch_compute_pss_td_pss_imag_V_0
set CoreName ap_simcore_mem
set PortList { 1 }
set DataWd 22
set AddrRange 128
set AddrWd 7
set impl_style auto
set TrueReset 0
set IsROM 1
set ROMData { "1100110000100101111001" "1111101100010000111011" "0011000111100000001111" "0000000001011000110010" "1001111100000011111111" "1010000001010101011001" "0000111110101101010100" "0110010110101101111100" "0101010100001000100000" "0010001010101110101111" "0001100110111101010001" "0001110110101101101101" "1111111111011100010101" "1110001000011110110001" "1111011011101110111001" "0010001101110011001001" "0011001010110110011110" "0011001011001111001100" "0100011111011010111110" "0100101101010100110001" "0000000010101000101101" "1001101001011001111100" "1001011100110101111101" "0000010101100001001010" "0101010001111100110111" "0001101011110111011001" "1010111101111000101011" "1010101110101110100100" "0001001011011101011001" "0101100001111001000111" "0010100001010010010101" "1100010101111011100001" "1001011011000010111000" "1010100110101011100010" "1100110100110011010100" "1110100111000010000010" "0000100011010100011111" "0010011010010010000101" "0011000000000110101110" "0010010111001000100010" "0001100111001110100001" "0000110011101100001001" "1110110100110111000010" "1011101011100110011100" "1001011110111001100001" "1010011100101000000111" "1110011011111101000001" "0010101001111100100111" "0011101110110010000010" "0000101101110011010111" "1100100001101010010000" "1011100101111011001011" "1111000110100101000111" "0011001100111100011001" "0011001000110010101111" "1110110000101110101100" "1010100010011111100100" "1010010011000110010100" "1101100101111100011000" "0001011100010101001110" "0011111001001110010000" "0100111010010110011001" "0101000101100010110011" "0100111000011111110010" "0100101111001100110000" "0100111000011111110010" "0101000101100010110011" "0100111010010110011001" "0011111001001110010000" "0001011100010101001110" "1101100101111100011000" "1010010011000110010100" "1010100010011111100100" "1110110000101110101100" "0011001000110010101111" "0011001100111100011001" "1111000110100101000111" "1011100101111011001011" "1100100001101010010000" "0000101101110011010111" "0011101110110010000010" "0010101001111100100111" "1110011011111101000001" "1010011100101000000111" "1001011110111001100001" "1011101011100110011100" "1110110100110111000010" "0000110011101100001001" "0001100111001110100001" "0010010111001000100010" "0011000000000110101110" "0010011010010010000101" "0000100011010100011111" "1110100111000010000010" "1100110100110011010100" "1010100110101011100010" "1001011011000010111000" "1100010101111011100001" "0010100001010010010101" "0101100001111001000111" "0001001011011101011001" "1010101110101110100100" "1010111101111000101011" "0001101011110111011001" "0101010001111100110111" "0000010101100001001010" "1001011100110101111101" "1001101001011001111100" "0000000010101000101101" "0100101101010100110001" "0100011111011010111110" "0011001011001111001100" "0011001010110110011110" "0010001101110011001001" "1111011011101110111001" "1110001000011110110001" "1111111111011100010101" "0001110110101101101101" "0001100110111101010001" "0010001010101110101111" "0101010100001000100000" "0110010110101101111100" "0000111110101101010100" "1010000001010101011001" "1001111100000011111111" "0000000001011000110010" "0011000111100000001111" "1111101100010000111011" }
set HasInitializer 1
set Initializer $ROMData
set NumOfStage 2
set MaxLatency -1
set DelayBudget 1.237
set ClkPeriod 16.3
set RegisteredInput 0
if {${::AESL::PGuard_simmodel_gen}} {
if {[info proc ap_gen_simcore_mem] == "ap_gen_simcore_mem"} {
    eval "ap_gen_simcore_mem { \
    id ${ID} \
    name ${MemName} \
    corename ${CoreName}  \
    op mem \
    hasByteEnable ${hasByteEnable} \
    reset_level 1 \
    sync_rst true \
    stage_num ${NumOfStage}  \
    registered_input ${RegisteredInput} \
    port_num 1 \
    port_list \{${PortList}\} \
    data_wd ${DataWd} \
    addr_wd ${AddrWd} \
    addr_range ${AddrRange} \
    style ${impl_style} \
    true_reset ${TrueReset} \
    delay_budget ${DelayBudget} \
    clk_period ${ClkPeriod} \
    HasInitializer ${HasInitializer} \
    rom_data \{${ROMData}\} \
 } "
} else {
    puts "@W \[IMPL-102\] Cannot find ap_gen_simcore_mem, check your platform lib"
}
}


if {${::AESL::PGuard_rtl_comp_handler}} {
  ::AP::rtl_comp_handler $MemName
}


set CoreName ROM
if {${::AESL::PGuard_autocg_gen} && ${::AESL::PGuard_autocg_ipmgen}} {
if {[info proc ::AESL_LIB_VIRTEX::xil_gen_ROM] == "::AESL_LIB_VIRTEX::xil_gen_ROM"} {
    eval "::AESL_LIB_VIRTEX::xil_gen_ROM { \
    id ${ID} \
    name ${MemName} \
    corename ${CoreName}  \
    op mem \
    hasByteEnable ${hasByteEnable} \
    reset_level 1 \
    sync_rst true \
    stage_num ${NumOfStage}  \
    registered_input ${RegisteredInput} \
    port_num 1 \
    port_list \{${PortList}\} \
    data_wd ${DataWd} \
    addr_wd ${AddrWd} \
    addr_range ${AddrRange} \
    style ${impl_style} \
    true_reset ${TrueReset} \
    delay_budget ${DelayBudget} \
    clk_period ${ClkPeriod} \
    HasInitializer ${HasInitializer} \
    rom_data \{${ROMData}\} \
 } "
  } else {
    puts "@W \[IMPL-104\] Cannot find ::AESL_LIB_VIRTEX::xil_gen_ROM, check your platform lib"
  }
}


# Memory (RAM/ROM)  definition:
set ID 47
set hasByteEnable 0
set MemName lteCellSearch_compute_pss_td_pss_real_V_1
set CoreName ap_simcore_mem
set PortList { 1 }
set DataWd 22
set AddrRange 128
set AddrWd 7
set impl_style auto
set TrueReset 0
set IsROM 1
set ROMData { "1011000110010000100011" "1101101100001001111010" "0010110111110001100111" "0110000010110010110010" "0110000000100011011000" "0101011011101000001010" "0101111100101010000101" "0101011101000110000000" "0010000000000011001001" "1101111001001010001110" "1100101110101111000100" "1110000100010001011010" "1111000011101011101010" "0000000101010000110011" "0011011011100011011100" "0110110001010100001101" "0100100101100101011011" "1101101110110001101011" "1010100101000010010011" "1111000110111000111011" "0100010010100111001011" "0010011101111010101100" "1100011100010100011101" "1001110000010111111010" "1010111000000111000111" "1011000001011101100101" "1010001011101000110000" "1100011000100000001001" "0000101001000001101000" "0001101011001000111001" "1111100011101010001100" "1111111111111111100101" "0100001001111010001000" "0110101001000010101011" "0101010101101110001001" "0100100100100001100010" "0101111110011111100001" "0100111111000010101010" "0000001110101100001000" "1101110110011011000110" "0001000100101011010111" "0011100000101110010001" "1111011011001100110001" "1001011101100101111111" "1000101011101010011101" "1011011000110100000100" "1100011001011010010101" "1101011101110010110101" "0010011000001011101100" "0110010110001011001111" "0001111110000101000011" "1001011001001101011111" "1000010000010011010101" "1111011110010111101111" "0011010101111111101101" "1110000101111110001101" "1000100101011001010111" "1011100000100010001101" "0010001010001011001010" "0011000011011010111000" "1110001110101100010011" "1011001100110110110111" "1101011001010110011010" "0001011110101111011001" "0011010011111001011111" "0001011110101111011001" "1101011001010110011010" "1011001100110110110111" "1110001110101100010011" "0011000011011010111000" "0010001010001011001010" "1011100000100010001101" "1000100101011001010111" "1110000101111110001101" "0011010101111111101101" "1111011110010111101111" "1000010000010011010101" "1001011001001101011111" "0001111110000101000011" "0110010110001011001111" "0010011000001011101100" "1101011101110010110101" "1100011001011010010101" "1011011000110100000100" "1000101011101010011101" "1001011101100101111111" "1111011011001100110001" "0011100000101110010001" "0001000100101011010111" "1101110110011011000110" "0000001110101100001000" "0100111111000010101010" "0101111110011111100001" "0100100100100001100010" "0101010101101110001001" "0110101001000010101011" "0100001001111010001000" "1111111111111111100101" "1111100011101010001100" "0001101011001000111001" "0000101001000001101000" "1100011000100000001001" "1010001011101000110000" "1011000001011101100101" "1010111000000111000111" "1001110000010111111010" "1100011100010100011101" "0010011101111010101100" "0100010010100111001011" "1111000110111000111011" "1010100101000010010011" "1101101110110001101011" "0100100101100101011011" "0110110001010100001101" "0011011011100011011100" "0000000101010000110011" "1111000011101011101010" "1110000100010001011010" "1100101110101111000100" "1101111001001010001110" "0010000000000011001001" "0101011101000110000000" "0101111100101010000101" "0101011011101000001010" "0110000000100011011000" "0110000010110010110010" "0010110111110001100111" "1101101100001001111010" }
set HasInitializer 1
set Initializer $ROMData
set NumOfStage 2
set MaxLatency -1
set DelayBudget 1.237
set ClkPeriod 16.3
set RegisteredInput 0
if {${::AESL::PGuard_simmodel_gen}} {
if {[info proc ap_gen_simcore_mem] == "ap_gen_simcore_mem"} {
    eval "ap_gen_simcore_mem { \
    id ${ID} \
    name ${MemName} \
    corename ${CoreName}  \
    op mem \
    hasByteEnable ${hasByteEnable} \
    reset_level 1 \
    sync_rst true \
    stage_num ${NumOfStage}  \
    registered_input ${RegisteredInput} \
    port_num 1 \
    port_list \{${PortList}\} \
    data_wd ${DataWd} \
    addr_wd ${AddrWd} \
    addr_range ${AddrRange} \
    style ${impl_style} \
    true_reset ${TrueReset} \
    delay_budget ${DelayBudget} \
    clk_period ${ClkPeriod} \
    HasInitializer ${HasInitializer} \
    rom_data \{${ROMData}\} \
 } "
} else {
    puts "@W \[IMPL-102\] Cannot find ap_gen_simcore_mem, check your platform lib"
}
}


if {${::AESL::PGuard_rtl_comp_handler}} {
  ::AP::rtl_comp_handler $MemName
}


set CoreName ROM
if {${::AESL::PGuard_autocg_gen} && ${::AESL::PGuard_autocg_ipmgen}} {
if {[info proc ::AESL_LIB_VIRTEX::xil_gen_ROM] == "::AESL_LIB_VIRTEX::xil_gen_ROM"} {
    eval "::AESL_LIB_VIRTEX::xil_gen_ROM { \
    id ${ID} \
    name ${MemName} \
    corename ${CoreName}  \
    op mem \
    hasByteEnable ${hasByteEnable} \
    reset_level 1 \
    sync_rst true \
    stage_num ${NumOfStage}  \
    registered_input ${RegisteredInput} \
    port_num 1 \
    port_list \{${PortList}\} \
    data_wd ${DataWd} \
    addr_wd ${AddrWd} \
    addr_range ${AddrRange} \
    style ${impl_style} \
    true_reset ${TrueReset} \
    delay_budget ${DelayBudget} \
    clk_period ${ClkPeriod} \
    HasInitializer ${HasInitializer} \
    rom_data \{${ROMData}\} \
 } "
  } else {
    puts "@W \[IMPL-104\] Cannot find ::AESL_LIB_VIRTEX::xil_gen_ROM, check your platform lib"
  }
}


# Memory (RAM/ROM)  definition:
set ID 48
set hasByteEnable 0
set MemName lteCellSearch_compute_pss_td_pss_imag_V_1
set CoreName ap_simcore_mem
set PortList { 1 }
set DataWd 22
set AddrRange 128
set AddrWd 7
set impl_style auto
set TrueReset 0
set IsROM 1
set ROMData { "0011000000000000100001" "0000001111001000111011" "1011101111010000010110" "1011111000100011111100" "0001000000101000000110" "0100011111100100100110" "0001010111101100001111" "1011011010101100111010" "1010100110111111000101" "0000010100001000011100" "0101000100101010100101" "0010100100100111000010" "1100000011101111000100" "1001010101101100000011" "1011111011000111110010" "1110000110010001010101" "1100010111010111100010" "1010011010010101100101" "1100101100111110010101" "0001100101101101010011" "0100010100010101010010" "0011111001101001011010" "0010110011000011111000" "0001101001001110101111" "1111001010100001001011" "1100111000101110011011" "1110101100011010101100" "0100001100011111010001" "0111000111010011111011" "0011010000101011111110" "1100110010101111011100" "1010111100111011011001" "1110110100100110101101" "0011010010010110011001" "0100101100010011110111" "0011111101010110011001" "0010010110101100110011" "1111010001111111010101" "1011110111110011011100" "1100001110001010001110" "0001101010100111110111" "0110111101011110110010" "0110010001011000000000" "0001010010111011010111" "1111000010111001110111" "0010000011011011001001" "0101011010011010000010" "0100100011101100110110" "0001100100010100001010" "0000111101100010101101" "0010011111100001001100" "0010000101010100010000" "1110011111010111110000" "1010111100111010110111" "1010001010011010000110" "1011010000110100111000" "1100110101000011100011" "1111011111011000001000" "0011011000010001111111" "0101100010011100010111" "0011000100100111101100" "1101110100001001010110" "1010100111111110010000" "1011000101100111111011" "1100000001110101111101" "1011000101100111111011" "1010100111111110010000" "1101110100001001010110" "0011000100100111101100" "0101100010011100010111" "0011011000010001111111" "1111011111011000001000" "1100110101000011100011" "1011010000110100111000" "1010001010011010000110" "1010111100111010110111" "1110011111010111110000" "0010000101010100010000" "0010011111100001001100" "0000111101100010101101" "0001100100010100001010" "0100100011101100110110" "0101011010011010000010" "0010000011011011001001" "1111000010111001110111" "0001010010111011010111" "0110010001011000000000" "0110111101011110110010" "0001101010100111110111" "1100001110001010001110" "1011110111110011011100" "1111010001111111010101" "0010010110101100110011" "0011111101010110011001" "0100101100010011110111" "0011010010010110011001" "1110110100100110101101" "1010111100111011011001" "1100110010101111011100" "0011010000101011111110" "0111000111010011111011" "0100001100011111010001" "1110101100011010101100" "1100111000101110011011" "1111001010100001001011" "0001101001001110101111" "0010110011000011111000" "0011111001101001011010" "0100010100010101010010" "0001100101101101010011" "1100101100111110010101" "1010011010010101100101" "1100010111010111100010" "1110000110010001010101" "1011111011000111110010" "1001010101101100000011" "1100000011101111000100" "0010100100100111000010" "0101000100101010100101" "0000010100001000011100" "1010100110111111000101" "1011011010101100111010" "0001010111101100001111" "0100011111100100100110" "0001000000101000000110" "1011111000100011111100" "1011101111010000010110" "0000001111001000111011" }
set HasInitializer 1
set Initializer $ROMData
set NumOfStage 2
set MaxLatency -1
set DelayBudget 1.237
set ClkPeriod 16.3
set RegisteredInput 0
if {${::AESL::PGuard_simmodel_gen}} {
if {[info proc ap_gen_simcore_mem] == "ap_gen_simcore_mem"} {
    eval "ap_gen_simcore_mem { \
    id ${ID} \
    name ${MemName} \
    corename ${CoreName}  \
    op mem \
    hasByteEnable ${hasByteEnable} \
    reset_level 1 \
    sync_rst true \
    stage_num ${NumOfStage}  \
    registered_input ${RegisteredInput} \
    port_num 1 \
    port_list \{${PortList}\} \
    data_wd ${DataWd} \
    addr_wd ${AddrWd} \
    addr_range ${AddrRange} \
    style ${impl_style} \
    true_reset ${TrueReset} \
    delay_budget ${DelayBudget} \
    clk_period ${ClkPeriod} \
    HasInitializer ${HasInitializer} \
    rom_data \{${ROMData}\} \
 } "
} else {
    puts "@W \[IMPL-102\] Cannot find ap_gen_simcore_mem, check your platform lib"
}
}


if {${::AESL::PGuard_rtl_comp_handler}} {
  ::AP::rtl_comp_handler $MemName
}


set CoreName ROM
if {${::AESL::PGuard_autocg_gen} && ${::AESL::PGuard_autocg_ipmgen}} {
if {[info proc ::AESL_LIB_VIRTEX::xil_gen_ROM] == "::AESL_LIB_VIRTEX::xil_gen_ROM"} {
    eval "::AESL_LIB_VIRTEX::xil_gen_ROM { \
    id ${ID} \
    name ${MemName} \
    corename ${CoreName}  \
    op mem \
    hasByteEnable ${hasByteEnable} \
    reset_level 1 \
    sync_rst true \
    stage_num ${NumOfStage}  \
    registered_input ${RegisteredInput} \
    port_num 1 \
    port_list \{${PortList}\} \
    data_wd ${DataWd} \
    addr_wd ${AddrWd} \
    addr_range ${AddrRange} \
    style ${impl_style} \
    true_reset ${TrueReset} \
    delay_budget ${DelayBudget} \
    clk_period ${ClkPeriod} \
    HasInitializer ${HasInitializer} \
    rom_data \{${ROMData}\} \
 } "
  } else {
    puts "@W \[IMPL-104\] Cannot find ::AESL_LIB_VIRTEX::xil_gen_ROM, check your platform lib"
  }
}


# Memory (RAM/ROM)  definition:
set ID 49
set hasByteEnable 0
set MemName lteCellSearch_compute_pss_td_pss_imag_V_2
set CoreName ap_simcore_mem
set PortList { 1 }
set DataWd 22
set AddrRange 128
set AddrWd 7
set impl_style auto
set TrueReset 0
set IsROM 1
set ROMData { "1100111111111111011110" "1111110000110111000100" "0100010000101111101001" "0100000111011100000011" "1110111111010111111001" "1011100000011011011001" "1110101000010011110000" "0100100101010011000101" "0101011001000000111010" "1111101011110111100011" "1010111011010101011010" "1101011011011000111101" "0011111100010000111011" "0110101010010011111100" "0100000100111000001101" "0001111001101110101010" "0011101000101000011101" "0101100101101010011010" "0011010011000001101010" "1110011010010010101100" "1011101011101010101101" "1100000110010110100101" "1101001100111100000111" "1110010110110001010000" "0000110101011110110100" "0011000111010001100100" "0001010011100101010011" "1011110011100000101110" "1000111000101100000100" "1100101111010100000001" "0011001101010000100011" "0101000011000100100110" "0001001011011001010010" "1100101101101001100110" "1011010011101100001000" "1100000010101001100110" "1101101001010011001100" "0000101110000000101010" "0100001000001100100011" "0011110001110101110001" "1110010101011000001000" "1001000010100001001101" "1001101110100111111111" "1110101101000100101000" "0000111101000110001000" "1101111100100100110110" "1010100101100101111101" "1011011100010011001001" "1110011011101011110101" "1111000010011101010010" "1101100000011110110011" "1101111010101011101111" "0001100000101000001111" "0101000011000101001000" "0101110101100101111001" "0100101111001011000111" "0011001010111100011100" "0000100000100111110111" "1100100111101110000000" "1010011101100011101000" "1100111011011000010011" "0010001011110110101001" "0101011000000001101111" "0100111010011000000100" "0011111110001010000010" "0100111010011000000100" "0101011000000001101111" "0010001011110110101001" "1100111011011000010011" "1010011101100011101000" "1100100111101110000000" "0000100000100111110111" "0011001010111100011100" "0100101111001011000111" "0101110101100101111001" "0101000011000101001000" "0001100000101000001111" "1101111010101011101111" "1101100000011110110011" "1111000010011101010010" "1110011011101011110101" "1011011100010011001001" "1010100101100101111101" "1101111100100100110110" "0000111101000110001000" "1110101101000100101000" "1001101110100111111111" "1001000010100001001101" "1110010101011000001000" "0011110001110101110001" "0100001000001100100011" "0000101110000000101010" "1101101001010011001100" "1100000010101001100110" "1011010011101100001000" "1100101101101001100110" "0001001011011001010010" "0101000011000100100110" "0011001101010000100011" "1100101111010100000001" "1000111000101100000100" "1011110011100000101110" "0001010011100101010011" "0011000111010001100100" "0000110101011110110100" "1110010110110001010000" "1101001100111100000111" "1100000110010110100101" "1011101011101010101101" "1110011010010010101100" "0011010011000001101010" "0101100101101010011010" "0011101000101000011101" "0001111001101110101010" "0100000100111000001101" "0110101010010011111100" "0011111100010000111011" "1101011011011000111101" "1010111011010101011010" "1111101011110111100011" "0101011001000000111010" "0100100101010011000101" "1110101000010011110000" "1011100000011011011001" "1110111111010111111001" "0100000111011100000011" "0100010000101111101001" "1111110000110111000100" }
set HasInitializer 1
set Initializer $ROMData
set NumOfStage 2
set MaxLatency -1
set DelayBudget 1.237
set ClkPeriod 16.3
set RegisteredInput 0
if {${::AESL::PGuard_simmodel_gen}} {
if {[info proc ap_gen_simcore_mem] == "ap_gen_simcore_mem"} {
    eval "ap_gen_simcore_mem { \
    id ${ID} \
    name ${MemName} \
    corename ${CoreName}  \
    op mem \
    hasByteEnable ${hasByteEnable} \
    reset_level 1 \
    sync_rst true \
    stage_num ${NumOfStage}  \
    registered_input ${RegisteredInput} \
    port_num 1 \
    port_list \{${PortList}\} \
    data_wd ${DataWd} \
    addr_wd ${AddrWd} \
    addr_range ${AddrRange} \
    style ${impl_style} \
    true_reset ${TrueReset} \
    delay_budget ${DelayBudget} \
    clk_period ${ClkPeriod} \
    HasInitializer ${HasInitializer} \
    rom_data \{${ROMData}\} \
 } "
} else {
    puts "@W \[IMPL-102\] Cannot find ap_gen_simcore_mem, check your platform lib"
}
}


if {${::AESL::PGuard_rtl_comp_handler}} {
  ::AP::rtl_comp_handler $MemName
}


set CoreName ROM
if {${::AESL::PGuard_autocg_gen} && ${::AESL::PGuard_autocg_ipmgen}} {
if {[info proc ::AESL_LIB_VIRTEX::xil_gen_ROM] == "::AESL_LIB_VIRTEX::xil_gen_ROM"} {
    eval "::AESL_LIB_VIRTEX::xil_gen_ROM { \
    id ${ID} \
    name ${MemName} \
    corename ${CoreName}  \
    op mem \
    hasByteEnable ${hasByteEnable} \
    reset_level 1 \
    sync_rst true \
    stage_num ${NumOfStage}  \
    registered_input ${RegisteredInput} \
    port_num 1 \
    port_list \{${PortList}\} \
    data_wd ${DataWd} \
    addr_wd ${AddrWd} \
    addr_range ${AddrRange} \
    style ${impl_style} \
    true_reset ${TrueReset} \
    delay_budget ${DelayBudget} \
    clk_period ${ClkPeriod} \
    HasInitializer ${HasInitializer} \
    rom_data \{${ROMData}\} \
 } "
  } else {
    puts "@W \[IMPL-104\] Cannot find ::AESL_LIB_VIRTEX::xil_gen_ROM, check your platform lib"
  }
}


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
    id 50 \
    name IN_real_V \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename IN_real_V \
    op interface \
    ports { IN_real_V_address1 { O 17 vector } IN_real_V_ce1 { O 1 bit } IN_real_V_q1 { I 23 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'IN_real_V'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 52 \
    name IN_imag_V \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename IN_imag_V \
    op interface \
    ports { IN_imag_V_address1 { O 17 vector } IN_imag_V_ce1 { O 1 bit } IN_imag_V_q1 { I 23 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'IN_imag_V'"
}
}


# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 51 \
    name trunc_ln264 \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_trunc_ln264 \
    op interface \
    ports { trunc_ln264_dout { I 17 vector } trunc_ln264_empty_n { I 1 bit } trunc_ln264_read { O 1 bit } } \
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

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id -2 \
    name ap_return \
    type ap_return \
    reset_level 1 \
    sync_rst true \
    corename ap_return \
    op interface \
    ports { ap_return { O 1 vector } } \
} "
}


# Adapter definition:
set PortName ap_clk
set DataWd 1 
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc cg_default_interface_gen_clock] == "cg_default_interface_gen_clock"} {
eval "cg_default_interface_gen_clock { \
    id -3 \
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
    id -4 \
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


