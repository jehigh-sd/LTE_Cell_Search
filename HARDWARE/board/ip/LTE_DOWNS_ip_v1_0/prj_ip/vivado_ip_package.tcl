create_project prj_ip {} -part xczu28dr-ffvg1517-2-e -force
set_property ip_repo_paths {../../} [current_fileset]

# Add HDL source files to project
add_files -norecurse {../hdl/vhdl/LTE_DOWNS_ip_src_LTE_DOWNSAMPLE_HDL_pac.vhd}
add_files -norecurse {../hdl/vhdl/LTE_DOWNS_ip_src_Front_End_FIR_Decimation.vhd}
add_files -norecurse {../hdl/vhdl/LTE_DOWNS_ip_src_Front_End_FIR_Decimation2.vhd}
add_files -norecurse {../hdl/vhdl/LTE_DOWNS_ip_src_Front_End_FIR_Decimation1.vhd}
add_files -norecurse {../hdl/vhdl/LTE_DOWNS_ip_src_CIC_Interpolation1.vhd}
add_files -norecurse {../hdl/vhdl/LTE_DOWNS_ip_src_Cascade_Downsampler.vhd}
add_files -norecurse {../hdl/vhdl/LTE_DOWNS_ip_src_Test_Data_Generator.vhd}
add_files -norecurse {../hdl/vhdl/LTE_DOWNS_ip_src_Unpack_into_vector_v2.vhd}
add_files -norecurse {../hdl/vhdl/LTE_DOWNS_ip_src_ADC_To_Vector_I.vhd}
add_files -norecurse {../hdl/vhdl/LTE_DOWNS_ip_src_Unpack_into_vector_v2_block.vhd}
add_files -norecurse {../hdl/vhdl/LTE_DOWNS_ip_src_ADC_To_Vector_Q.vhd}
add_files -norecurse {../hdl/vhdl/LTE_DOWNS_ip_src_FilterCoef.vhd}
add_files -norecurse {../hdl/vhdl/LTE_DOWNS_ip_src_FilterTapSystolicWvldin.vhd}
add_files -norecurse {../hdl/vhdl/LTE_DOWNS_ip_src_FilterTapSystolicWvldInC0.vhd}
add_files -norecurse {../hdl/vhdl/LTE_DOWNS_ip_src_subFilter.vhd}
add_files -norecurse {../hdl/vhdl/LTE_DOWNS_ip_src_FilterCoef_block.vhd}
add_files -norecurse {../hdl/vhdl/LTE_DOWNS_ip_src_FilterTapSystolicWvldin_block.vhd}
add_files -norecurse {../hdl/vhdl/LTE_DOWNS_ip_src_FilterTapSystolicWvldInC0_block.vhd}
add_files -norecurse {../hdl/vhdl/LTE_DOWNS_ip_src_subFilter_block.vhd}
add_files -norecurse {../hdl/vhdl/LTE_DOWNS_ip_src_FilterCoef_block1.vhd}
add_files -norecurse {../hdl/vhdl/LTE_DOWNS_ip_src_FilterTapSystolicWvldin_block1.vhd}
add_files -norecurse {../hdl/vhdl/LTE_DOWNS_ip_src_FilterTapSystolicWvldInC0_block1.vhd}
add_files -norecurse {../hdl/vhdl/LTE_DOWNS_ip_src_subFilter_block1.vhd}
add_files -norecurse {../hdl/vhdl/LTE_DOWNS_ip_src_FilterCoef_block2.vhd}
add_files -norecurse {../hdl/vhdl/LTE_DOWNS_ip_src_FilterTapSystolicWvldin_block2.vhd}
add_files -norecurse {../hdl/vhdl/LTE_DOWNS_ip_src_FilterTapSystolicWvldInC0_block2.vhd}
add_files -norecurse {../hdl/vhdl/LTE_DOWNS_ip_src_subFilter_block2.vhd}
add_files -norecurse {../hdl/vhdl/LTE_DOWNS_ip_src_FilterCoef_block3.vhd}
add_files -norecurse {../hdl/vhdl/LTE_DOWNS_ip_src_FilterTapSystolicWvldin_block3.vhd}
add_files -norecurse {../hdl/vhdl/LTE_DOWNS_ip_src_subFilter_block3.vhd}
add_files -norecurse {../hdl/vhdl/LTE_DOWNS_ip_src_FilterCoef_block4.vhd}
add_files -norecurse {../hdl/vhdl/LTE_DOWNS_ip_src_FilterTapSystolicWvldin_block4.vhd}
add_files -norecurse {../hdl/vhdl/LTE_DOWNS_ip_src_subFilter_block4.vhd}
add_files -norecurse {../hdl/vhdl/LTE_DOWNS_ip_src_FilterCoef_block5.vhd}
add_files -norecurse {../hdl/vhdl/LTE_DOWNS_ip_src_FilterTapSystolicWvldin_block5.vhd}
add_files -norecurse {../hdl/vhdl/LTE_DOWNS_ip_src_subFilter_block5.vhd}
add_files -norecurse {../hdl/vhdl/LTE_DOWNS_ip_src_FilterCoef_block6.vhd}
add_files -norecurse {../hdl/vhdl/LTE_DOWNS_ip_src_FilterTapSystolicWvldin_block6.vhd}
add_files -norecurse {../hdl/vhdl/LTE_DOWNS_ip_src_subFilter_block6.vhd}
add_files -norecurse {../hdl/vhdl/LTE_DOWNS_ip_src_FilterBank.vhd}
add_files -norecurse {../hdl/vhdl/LTE_DOWNS_ip_src_sumTree.vhd}
add_files -norecurse {../hdl/vhdl/LTE_DOWNS_ip_src_FIR_Decimation_HDL_Optimized1.vhd}
add_files -norecurse {../hdl/vhdl/LTE_DOWNS_ip_src_Decimation.vhd}
add_files -norecurse {../hdl/vhdl/LTE_DOWNS_ip_src_Vector_Decimator.vhd}
add_files -norecurse {../hdl/vhdl/LTE_DOWNS_ip_src_DOWNSAMPLE.vhd}
add_files -norecurse {../hdl/vhdl/LTE_DOWNS_ip_src_LTE_DOWNSAMPLE_HDL_tc.vhd}
add_files -norecurse {../hdl/vhdl/LTE_DOWNS_ip_src_LTE_DOWNSAMPLE_HDL.vhd}
add_files -norecurse {../hdl/vhdl/LTE_DOWNS_ip_reset_sync.vhd}
add_files -norecurse {../hdl/vhdl/LTE_DOWNS_ip_dut.vhd}
add_files -norecurse {../hdl/vhdl/LTE_DOWNS_ip_SimpleDualPortRAM_generic.vhd}
add_files -norecurse {../hdl/vhdl/LTE_DOWNS_ip_fifo_data_OUT.vhd}
add_files -norecurse {../hdl/vhdl/LTE_DOWNS_ip_SimpleDualPortRAM_singlebit.vhd}
add_files -norecurse {../hdl/vhdl/LTE_DOWNS_ip_fifo_TLAST_OUT.vhd}
add_files -norecurse {../hdl/vhdl/LTE_DOWNS_ip_axi4_stream_i_master.vhd}
add_files -norecurse {../hdl/vhdl/LTE_DOWNS_ip_fifo_data.vhd}
add_files -norecurse {../hdl/vhdl/LTE_DOWNS_ip_axi4_stream_i_slave.vhd}
add_files -norecurse {../hdl/vhdl/LTE_DOWNS_ip_fifo_data_OUT_block.vhd}
add_files -norecurse {../hdl/vhdl/LTE_DOWNS_ip_fifo_TLAST_OUT_block.vhd}
add_files -norecurse {../hdl/vhdl/LTE_DOWNS_ip_axi4_stream_q_master.vhd}
add_files -norecurse {../hdl/vhdl/LTE_DOWNS_ip_fifo_data_block.vhd}
add_files -norecurse {../hdl/vhdl/LTE_DOWNS_ip_axi4_stream_q_slave.vhd}
add_files -norecurse {../hdl/vhdl/LTE_DOWNS_ip_addr_decoder.vhd}
add_files -norecurse {../hdl/vhdl/LTE_DOWNS_ip_axi_lite_module.vhd}
add_files -norecurse {../hdl/vhdl/LTE_DOWNS_ip_axi_lite.vhd}
add_files -norecurse {../hdl/vhdl/LTE_DOWNS_ip.vhd}
set_property top LTE_DOWNS_ip [get_filesets sources_1]
set_property top LTE_DOWNS_ip [get_filesets sim_1]
update_compile_order -fileset sources_1
update_compile_order -fileset sim_1

# Package IP from project
ipx::package_project -root_dir {../} -force

# Set IP properties
set_property name LTE_DOWNS_ip [ipx::current_core]
set_property display_name LTE_DOWNS_ip [ipx::current_core]
set_property version {1.0} [ipx::current_core]
set_property library {ip} [ipx::current_core]
set Families [split [lsort -uniq [get_property C_FAMILY [get_parts]]]]
set IPSupportedFamily {}
foreach family $Families {append IPSupportedFamily "{$family} {Production} "}
set_property supported_families $IPSupportedFamily [ipx::current_core]
set_property taxonomy {{/HDL Coder Generated IP}} [ipx::current_core]
set_property description {HDL Coder generated IP} [ipx::current_core]
set_property core_revision 2112520675 [ipx::current_core]

# Add HDL source files to IP
ipx::add_file {hdl/vhdl/LTE_DOWNS_ip_src_LTE_DOWNSAMPLE_HDL_pac.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/LTE_DOWNS_ip_src_LTE_DOWNSAMPLE_HDL_pac.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/LTE_DOWNS_ip_src_LTE_DOWNSAMPLE_HDL_pac.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/LTE_DOWNS_ip_src_LTE_DOWNSAMPLE_HDL_pac.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/LTE_DOWNS_ip_src_Front_End_FIR_Decimation.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/LTE_DOWNS_ip_src_Front_End_FIR_Decimation.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/LTE_DOWNS_ip_src_Front_End_FIR_Decimation.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/LTE_DOWNS_ip_src_Front_End_FIR_Decimation.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/LTE_DOWNS_ip_src_Front_End_FIR_Decimation2.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/LTE_DOWNS_ip_src_Front_End_FIR_Decimation2.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/LTE_DOWNS_ip_src_Front_End_FIR_Decimation2.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/LTE_DOWNS_ip_src_Front_End_FIR_Decimation2.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/LTE_DOWNS_ip_src_Front_End_FIR_Decimation1.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/LTE_DOWNS_ip_src_Front_End_FIR_Decimation1.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/LTE_DOWNS_ip_src_Front_End_FIR_Decimation1.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/LTE_DOWNS_ip_src_Front_End_FIR_Decimation1.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/LTE_DOWNS_ip_src_CIC_Interpolation1.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/LTE_DOWNS_ip_src_CIC_Interpolation1.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/LTE_DOWNS_ip_src_CIC_Interpolation1.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/LTE_DOWNS_ip_src_CIC_Interpolation1.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/LTE_DOWNS_ip_src_Cascade_Downsampler.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/LTE_DOWNS_ip_src_Cascade_Downsampler.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/LTE_DOWNS_ip_src_Cascade_Downsampler.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/LTE_DOWNS_ip_src_Cascade_Downsampler.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/LTE_DOWNS_ip_src_Test_Data_Generator.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/LTE_DOWNS_ip_src_Test_Data_Generator.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/LTE_DOWNS_ip_src_Test_Data_Generator.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/LTE_DOWNS_ip_src_Test_Data_Generator.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/LTE_DOWNS_ip_src_Unpack_into_vector_v2.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/LTE_DOWNS_ip_src_Unpack_into_vector_v2.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/LTE_DOWNS_ip_src_Unpack_into_vector_v2.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/LTE_DOWNS_ip_src_Unpack_into_vector_v2.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/LTE_DOWNS_ip_src_ADC_To_Vector_I.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/LTE_DOWNS_ip_src_ADC_To_Vector_I.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/LTE_DOWNS_ip_src_ADC_To_Vector_I.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/LTE_DOWNS_ip_src_ADC_To_Vector_I.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/LTE_DOWNS_ip_src_Unpack_into_vector_v2_block.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/LTE_DOWNS_ip_src_Unpack_into_vector_v2_block.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/LTE_DOWNS_ip_src_Unpack_into_vector_v2_block.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/LTE_DOWNS_ip_src_Unpack_into_vector_v2_block.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/LTE_DOWNS_ip_src_ADC_To_Vector_Q.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/LTE_DOWNS_ip_src_ADC_To_Vector_Q.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/LTE_DOWNS_ip_src_ADC_To_Vector_Q.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/LTE_DOWNS_ip_src_ADC_To_Vector_Q.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/LTE_DOWNS_ip_src_FilterCoef.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/LTE_DOWNS_ip_src_FilterCoef.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/LTE_DOWNS_ip_src_FilterCoef.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/LTE_DOWNS_ip_src_FilterCoef.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/LTE_DOWNS_ip_src_FilterTapSystolicWvldin.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/LTE_DOWNS_ip_src_FilterTapSystolicWvldin.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/LTE_DOWNS_ip_src_FilterTapSystolicWvldin.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/LTE_DOWNS_ip_src_FilterTapSystolicWvldin.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/LTE_DOWNS_ip_src_FilterTapSystolicWvldInC0.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/LTE_DOWNS_ip_src_FilterTapSystolicWvldInC0.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/LTE_DOWNS_ip_src_FilterTapSystolicWvldInC0.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/LTE_DOWNS_ip_src_FilterTapSystolicWvldInC0.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/LTE_DOWNS_ip_src_subFilter.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/LTE_DOWNS_ip_src_subFilter.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/LTE_DOWNS_ip_src_subFilter.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/LTE_DOWNS_ip_src_subFilter.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/LTE_DOWNS_ip_src_FilterCoef_block.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/LTE_DOWNS_ip_src_FilterCoef_block.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/LTE_DOWNS_ip_src_FilterCoef_block.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/LTE_DOWNS_ip_src_FilterCoef_block.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/LTE_DOWNS_ip_src_FilterTapSystolicWvldin_block.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/LTE_DOWNS_ip_src_FilterTapSystolicWvldin_block.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/LTE_DOWNS_ip_src_FilterTapSystolicWvldin_block.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/LTE_DOWNS_ip_src_FilterTapSystolicWvldin_block.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/LTE_DOWNS_ip_src_FilterTapSystolicWvldInC0_block.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/LTE_DOWNS_ip_src_FilterTapSystolicWvldInC0_block.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/LTE_DOWNS_ip_src_FilterTapSystolicWvldInC0_block.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/LTE_DOWNS_ip_src_FilterTapSystolicWvldInC0_block.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/LTE_DOWNS_ip_src_subFilter_block.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/LTE_DOWNS_ip_src_subFilter_block.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/LTE_DOWNS_ip_src_subFilter_block.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/LTE_DOWNS_ip_src_subFilter_block.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/LTE_DOWNS_ip_src_FilterCoef_block1.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/LTE_DOWNS_ip_src_FilterCoef_block1.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/LTE_DOWNS_ip_src_FilterCoef_block1.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/LTE_DOWNS_ip_src_FilterCoef_block1.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/LTE_DOWNS_ip_src_FilterTapSystolicWvldin_block1.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/LTE_DOWNS_ip_src_FilterTapSystolicWvldin_block1.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/LTE_DOWNS_ip_src_FilterTapSystolicWvldin_block1.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/LTE_DOWNS_ip_src_FilterTapSystolicWvldin_block1.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/LTE_DOWNS_ip_src_FilterTapSystolicWvldInC0_block1.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/LTE_DOWNS_ip_src_FilterTapSystolicWvldInC0_block1.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/LTE_DOWNS_ip_src_FilterTapSystolicWvldInC0_block1.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/LTE_DOWNS_ip_src_FilterTapSystolicWvldInC0_block1.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/LTE_DOWNS_ip_src_subFilter_block1.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/LTE_DOWNS_ip_src_subFilter_block1.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/LTE_DOWNS_ip_src_subFilter_block1.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/LTE_DOWNS_ip_src_subFilter_block1.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/LTE_DOWNS_ip_src_FilterCoef_block2.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/LTE_DOWNS_ip_src_FilterCoef_block2.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/LTE_DOWNS_ip_src_FilterCoef_block2.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/LTE_DOWNS_ip_src_FilterCoef_block2.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/LTE_DOWNS_ip_src_FilterTapSystolicWvldin_block2.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/LTE_DOWNS_ip_src_FilterTapSystolicWvldin_block2.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/LTE_DOWNS_ip_src_FilterTapSystolicWvldin_block2.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/LTE_DOWNS_ip_src_FilterTapSystolicWvldin_block2.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/LTE_DOWNS_ip_src_FilterTapSystolicWvldInC0_block2.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/LTE_DOWNS_ip_src_FilterTapSystolicWvldInC0_block2.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/LTE_DOWNS_ip_src_FilterTapSystolicWvldInC0_block2.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/LTE_DOWNS_ip_src_FilterTapSystolicWvldInC0_block2.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/LTE_DOWNS_ip_src_subFilter_block2.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/LTE_DOWNS_ip_src_subFilter_block2.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/LTE_DOWNS_ip_src_subFilter_block2.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/LTE_DOWNS_ip_src_subFilter_block2.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/LTE_DOWNS_ip_src_FilterCoef_block3.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/LTE_DOWNS_ip_src_FilterCoef_block3.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/LTE_DOWNS_ip_src_FilterCoef_block3.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/LTE_DOWNS_ip_src_FilterCoef_block3.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/LTE_DOWNS_ip_src_FilterTapSystolicWvldin_block3.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/LTE_DOWNS_ip_src_FilterTapSystolicWvldin_block3.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/LTE_DOWNS_ip_src_FilterTapSystolicWvldin_block3.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/LTE_DOWNS_ip_src_FilterTapSystolicWvldin_block3.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/LTE_DOWNS_ip_src_subFilter_block3.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/LTE_DOWNS_ip_src_subFilter_block3.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/LTE_DOWNS_ip_src_subFilter_block3.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/LTE_DOWNS_ip_src_subFilter_block3.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/LTE_DOWNS_ip_src_FilterCoef_block4.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/LTE_DOWNS_ip_src_FilterCoef_block4.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/LTE_DOWNS_ip_src_FilterCoef_block4.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/LTE_DOWNS_ip_src_FilterCoef_block4.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/LTE_DOWNS_ip_src_FilterTapSystolicWvldin_block4.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/LTE_DOWNS_ip_src_FilterTapSystolicWvldin_block4.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/LTE_DOWNS_ip_src_FilterTapSystolicWvldin_block4.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/LTE_DOWNS_ip_src_FilterTapSystolicWvldin_block4.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/LTE_DOWNS_ip_src_subFilter_block4.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/LTE_DOWNS_ip_src_subFilter_block4.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/LTE_DOWNS_ip_src_subFilter_block4.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/LTE_DOWNS_ip_src_subFilter_block4.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/LTE_DOWNS_ip_src_FilterCoef_block5.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/LTE_DOWNS_ip_src_FilterCoef_block5.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/LTE_DOWNS_ip_src_FilterCoef_block5.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/LTE_DOWNS_ip_src_FilterCoef_block5.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/LTE_DOWNS_ip_src_FilterTapSystolicWvldin_block5.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/LTE_DOWNS_ip_src_FilterTapSystolicWvldin_block5.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/LTE_DOWNS_ip_src_FilterTapSystolicWvldin_block5.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/LTE_DOWNS_ip_src_FilterTapSystolicWvldin_block5.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/LTE_DOWNS_ip_src_subFilter_block5.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/LTE_DOWNS_ip_src_subFilter_block5.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/LTE_DOWNS_ip_src_subFilter_block5.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/LTE_DOWNS_ip_src_subFilter_block5.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/LTE_DOWNS_ip_src_FilterCoef_block6.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/LTE_DOWNS_ip_src_FilterCoef_block6.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/LTE_DOWNS_ip_src_FilterCoef_block6.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/LTE_DOWNS_ip_src_FilterCoef_block6.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/LTE_DOWNS_ip_src_FilterTapSystolicWvldin_block6.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/LTE_DOWNS_ip_src_FilterTapSystolicWvldin_block6.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/LTE_DOWNS_ip_src_FilterTapSystolicWvldin_block6.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/LTE_DOWNS_ip_src_FilterTapSystolicWvldin_block6.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/LTE_DOWNS_ip_src_subFilter_block6.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/LTE_DOWNS_ip_src_subFilter_block6.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/LTE_DOWNS_ip_src_subFilter_block6.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/LTE_DOWNS_ip_src_subFilter_block6.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/LTE_DOWNS_ip_src_FilterBank.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/LTE_DOWNS_ip_src_FilterBank.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/LTE_DOWNS_ip_src_FilterBank.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/LTE_DOWNS_ip_src_FilterBank.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/LTE_DOWNS_ip_src_sumTree.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/LTE_DOWNS_ip_src_sumTree.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/LTE_DOWNS_ip_src_sumTree.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/LTE_DOWNS_ip_src_sumTree.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/LTE_DOWNS_ip_src_FIR_Decimation_HDL_Optimized1.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/LTE_DOWNS_ip_src_FIR_Decimation_HDL_Optimized1.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/LTE_DOWNS_ip_src_FIR_Decimation_HDL_Optimized1.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/LTE_DOWNS_ip_src_FIR_Decimation_HDL_Optimized1.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/LTE_DOWNS_ip_src_Decimation.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/LTE_DOWNS_ip_src_Decimation.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/LTE_DOWNS_ip_src_Decimation.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/LTE_DOWNS_ip_src_Decimation.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/LTE_DOWNS_ip_src_Vector_Decimator.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/LTE_DOWNS_ip_src_Vector_Decimator.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/LTE_DOWNS_ip_src_Vector_Decimator.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/LTE_DOWNS_ip_src_Vector_Decimator.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/LTE_DOWNS_ip_src_DOWNSAMPLE.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/LTE_DOWNS_ip_src_DOWNSAMPLE.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/LTE_DOWNS_ip_src_DOWNSAMPLE.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/LTE_DOWNS_ip_src_DOWNSAMPLE.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/LTE_DOWNS_ip_src_LTE_DOWNSAMPLE_HDL_tc.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/LTE_DOWNS_ip_src_LTE_DOWNSAMPLE_HDL_tc.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/LTE_DOWNS_ip_src_LTE_DOWNSAMPLE_HDL_tc.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/LTE_DOWNS_ip_src_LTE_DOWNSAMPLE_HDL_tc.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/LTE_DOWNS_ip_src_LTE_DOWNSAMPLE_HDL.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/LTE_DOWNS_ip_src_LTE_DOWNSAMPLE_HDL.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/LTE_DOWNS_ip_src_LTE_DOWNSAMPLE_HDL.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/LTE_DOWNS_ip_src_LTE_DOWNSAMPLE_HDL.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/LTE_DOWNS_ip_reset_sync.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/LTE_DOWNS_ip_reset_sync.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/LTE_DOWNS_ip_reset_sync.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/LTE_DOWNS_ip_reset_sync.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/LTE_DOWNS_ip_dut.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/LTE_DOWNS_ip_dut.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/LTE_DOWNS_ip_dut.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/LTE_DOWNS_ip_dut.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/LTE_DOWNS_ip_SimpleDualPortRAM_generic.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/LTE_DOWNS_ip_SimpleDualPortRAM_generic.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/LTE_DOWNS_ip_SimpleDualPortRAM_generic.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/LTE_DOWNS_ip_SimpleDualPortRAM_generic.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/LTE_DOWNS_ip_fifo_data_OUT.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/LTE_DOWNS_ip_fifo_data_OUT.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/LTE_DOWNS_ip_fifo_data_OUT.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/LTE_DOWNS_ip_fifo_data_OUT.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/LTE_DOWNS_ip_SimpleDualPortRAM_singlebit.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/LTE_DOWNS_ip_SimpleDualPortRAM_singlebit.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/LTE_DOWNS_ip_SimpleDualPortRAM_singlebit.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/LTE_DOWNS_ip_SimpleDualPortRAM_singlebit.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/LTE_DOWNS_ip_fifo_TLAST_OUT.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/LTE_DOWNS_ip_fifo_TLAST_OUT.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/LTE_DOWNS_ip_fifo_TLAST_OUT.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/LTE_DOWNS_ip_fifo_TLAST_OUT.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/LTE_DOWNS_ip_axi4_stream_i_master.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/LTE_DOWNS_ip_axi4_stream_i_master.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/LTE_DOWNS_ip_axi4_stream_i_master.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/LTE_DOWNS_ip_axi4_stream_i_master.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/LTE_DOWNS_ip_fifo_data.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/LTE_DOWNS_ip_fifo_data.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/LTE_DOWNS_ip_fifo_data.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/LTE_DOWNS_ip_fifo_data.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/LTE_DOWNS_ip_axi4_stream_i_slave.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/LTE_DOWNS_ip_axi4_stream_i_slave.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/LTE_DOWNS_ip_axi4_stream_i_slave.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/LTE_DOWNS_ip_axi4_stream_i_slave.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/LTE_DOWNS_ip_fifo_data_OUT_block.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/LTE_DOWNS_ip_fifo_data_OUT_block.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/LTE_DOWNS_ip_fifo_data_OUT_block.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/LTE_DOWNS_ip_fifo_data_OUT_block.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/LTE_DOWNS_ip_fifo_TLAST_OUT_block.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/LTE_DOWNS_ip_fifo_TLAST_OUT_block.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/LTE_DOWNS_ip_fifo_TLAST_OUT_block.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/LTE_DOWNS_ip_fifo_TLAST_OUT_block.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/LTE_DOWNS_ip_axi4_stream_q_master.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/LTE_DOWNS_ip_axi4_stream_q_master.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/LTE_DOWNS_ip_axi4_stream_q_master.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/LTE_DOWNS_ip_axi4_stream_q_master.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/LTE_DOWNS_ip_fifo_data_block.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/LTE_DOWNS_ip_fifo_data_block.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/LTE_DOWNS_ip_fifo_data_block.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/LTE_DOWNS_ip_fifo_data_block.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/LTE_DOWNS_ip_axi4_stream_q_slave.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/LTE_DOWNS_ip_axi4_stream_q_slave.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/LTE_DOWNS_ip_axi4_stream_q_slave.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/LTE_DOWNS_ip_axi4_stream_q_slave.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/LTE_DOWNS_ip_addr_decoder.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/LTE_DOWNS_ip_addr_decoder.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/LTE_DOWNS_ip_addr_decoder.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/LTE_DOWNS_ip_addr_decoder.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/LTE_DOWNS_ip_axi_lite_module.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/LTE_DOWNS_ip_axi_lite_module.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/LTE_DOWNS_ip_axi_lite_module.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/LTE_DOWNS_ip_axi_lite_module.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/LTE_DOWNS_ip_axi_lite.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/LTE_DOWNS_ip_axi_lite.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/LTE_DOWNS_ip_axi_lite.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/LTE_DOWNS_ip_axi_lite.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/LTE_DOWNS_ip.vhd} [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/LTE_DOWNS_ip.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagesynthesis -of_objects [ipx::current_core]]]
ipx::add_file {hdl/vhdl/LTE_DOWNS_ip.vhd} [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]
set_property type {{vhdlSource}} [ipx::get_files {hdl/vhdl/LTE_DOWNS_ip.vhd} -of_objects [ipx::get_file_groups xilinx_anylanguagebehavioralsimulation -of_objects [ipx::current_core]]]

# Add bus interfaces
ipx::remove_all_bus_interface [ipx::current_core]
ipx::remove_all_memory_map [ipx::current_core]
ipx::remove_all_address_space [ipx::current_core]
# AXI4_Lite Slave
ipx::add_bus_interface {AXI4_Lite} [ipx::current_core]
set_property abstraction_type_vlnv {xilinx.com:interface:aximm_rtl:1.0} [ipx::get_bus_interfaces AXI4_Lite -of_objects [ipx::current_core]]
set_property bus_type_vlnv {xilinx.com:interface:aximm:1.0} [ipx::get_bus_interfaces AXI4_Lite -of_objects [ipx::current_core]]
ipx::add_port_map {AWADDR} [ipx::get_bus_interfaces AXI4_Lite -of_objects [ipx::current_core]]
set_property physical_name {AXI4_Lite_AWADDR} [ipx::get_port_maps AWADDR -of_objects [ipx::get_bus_interfaces AXI4_Lite -of_objects [ipx::current_core]]]
ipx::add_port_map {AWVALID} [ipx::get_bus_interfaces AXI4_Lite -of_objects [ipx::current_core]]
set_property physical_name {AXI4_Lite_AWVALID} [ipx::get_port_maps AWVALID -of_objects [ipx::get_bus_interfaces AXI4_Lite -of_objects [ipx::current_core]]]
ipx::add_port_map {WDATA} [ipx::get_bus_interfaces AXI4_Lite -of_objects [ipx::current_core]]
set_property physical_name {AXI4_Lite_WDATA} [ipx::get_port_maps WDATA -of_objects [ipx::get_bus_interfaces AXI4_Lite -of_objects [ipx::current_core]]]
ipx::add_port_map {WSTRB} [ipx::get_bus_interfaces AXI4_Lite -of_objects [ipx::current_core]]
set_property physical_name {AXI4_Lite_WSTRB} [ipx::get_port_maps WSTRB -of_objects [ipx::get_bus_interfaces AXI4_Lite -of_objects [ipx::current_core]]]
ipx::add_port_map {WVALID} [ipx::get_bus_interfaces AXI4_Lite -of_objects [ipx::current_core]]
set_property physical_name {AXI4_Lite_WVALID} [ipx::get_port_maps WVALID -of_objects [ipx::get_bus_interfaces AXI4_Lite -of_objects [ipx::current_core]]]
ipx::add_port_map {BREADY} [ipx::get_bus_interfaces AXI4_Lite -of_objects [ipx::current_core]]
set_property physical_name {AXI4_Lite_BREADY} [ipx::get_port_maps BREADY -of_objects [ipx::get_bus_interfaces AXI4_Lite -of_objects [ipx::current_core]]]
ipx::add_port_map {ARADDR} [ipx::get_bus_interfaces AXI4_Lite -of_objects [ipx::current_core]]
set_property physical_name {AXI4_Lite_ARADDR} [ipx::get_port_maps ARADDR -of_objects [ipx::get_bus_interfaces AXI4_Lite -of_objects [ipx::current_core]]]
ipx::add_port_map {ARVALID} [ipx::get_bus_interfaces AXI4_Lite -of_objects [ipx::current_core]]
set_property physical_name {AXI4_Lite_ARVALID} [ipx::get_port_maps ARVALID -of_objects [ipx::get_bus_interfaces AXI4_Lite -of_objects [ipx::current_core]]]
ipx::add_port_map {RREADY} [ipx::get_bus_interfaces AXI4_Lite -of_objects [ipx::current_core]]
set_property physical_name {AXI4_Lite_RREADY} [ipx::get_port_maps RREADY -of_objects [ipx::get_bus_interfaces AXI4_Lite -of_objects [ipx::current_core]]]
ipx::add_port_map {AWREADY} [ipx::get_bus_interfaces AXI4_Lite -of_objects [ipx::current_core]]
set_property physical_name {AXI4_Lite_AWREADY} [ipx::get_port_maps AWREADY -of_objects [ipx::get_bus_interfaces AXI4_Lite -of_objects [ipx::current_core]]]
ipx::add_port_map {WREADY} [ipx::get_bus_interfaces AXI4_Lite -of_objects [ipx::current_core]]
set_property physical_name {AXI4_Lite_WREADY} [ipx::get_port_maps WREADY -of_objects [ipx::get_bus_interfaces AXI4_Lite -of_objects [ipx::current_core]]]
ipx::add_port_map {BRESP} [ipx::get_bus_interfaces AXI4_Lite -of_objects [ipx::current_core]]
set_property physical_name {AXI4_Lite_BRESP} [ipx::get_port_maps BRESP -of_objects [ipx::get_bus_interfaces AXI4_Lite -of_objects [ipx::current_core]]]
ipx::add_port_map {BVALID} [ipx::get_bus_interfaces AXI4_Lite -of_objects [ipx::current_core]]
set_property physical_name {AXI4_Lite_BVALID} [ipx::get_port_maps BVALID -of_objects [ipx::get_bus_interfaces AXI4_Lite -of_objects [ipx::current_core]]]
ipx::add_port_map {ARREADY} [ipx::get_bus_interfaces AXI4_Lite -of_objects [ipx::current_core]]
set_property physical_name {AXI4_Lite_ARREADY} [ipx::get_port_maps ARREADY -of_objects [ipx::get_bus_interfaces AXI4_Lite -of_objects [ipx::current_core]]]
ipx::add_port_map {RDATA} [ipx::get_bus_interfaces AXI4_Lite -of_objects [ipx::current_core]]
set_property physical_name {AXI4_Lite_RDATA} [ipx::get_port_maps RDATA -of_objects [ipx::get_bus_interfaces AXI4_Lite -of_objects [ipx::current_core]]]
ipx::add_port_map {RRESP} [ipx::get_bus_interfaces AXI4_Lite -of_objects [ipx::current_core]]
set_property physical_name {AXI4_Lite_RRESP} [ipx::get_port_maps RRESP -of_objects [ipx::get_bus_interfaces AXI4_Lite -of_objects [ipx::current_core]]]
ipx::add_port_map {RVALID} [ipx::get_bus_interfaces AXI4_Lite -of_objects [ipx::current_core]]
set_property physical_name {AXI4_Lite_RVALID} [ipx::get_port_maps RVALID -of_objects [ipx::get_bus_interfaces AXI4_Lite -of_objects [ipx::current_core]]]
ipx::add_bus_interface {AXI4_Lite_signal_clock} [ipx::current_core]
set_property abstraction_type_vlnv {xilinx.com:signal:clock_rtl:1.0} [ipx::get_bus_interfaces AXI4_Lite_signal_clock -of_objects [ipx::current_core]]
set_property bus_type_vlnv {xilinx.com:signal:clock:1.0} [ipx::get_bus_interfaces AXI4_Lite_signal_clock -of_objects [ipx::current_core]]
ipx::add_port_map {CLK} [ipx::get_bus_interfaces AXI4_Lite_signal_clock -of_objects [ipx::current_core]]
set_property physical_name {AXI4_Lite_ACLK} [ipx::get_port_maps CLK -of_objects [ipx::get_bus_interfaces AXI4_Lite_signal_clock -of_objects [ipx::current_core]]]
ipx::add_bus_interface {AXI4_Lite_signal_reset} [ipx::current_core]
set_property abstraction_type_vlnv {xilinx.com:signal:reset_rtl:1.0} [ipx::get_bus_interfaces AXI4_Lite_signal_reset -of_objects [ipx::current_core]]
set_property bus_type_vlnv {xilinx.com:signal:reset:1.0} [ipx::get_bus_interfaces AXI4_Lite_signal_reset -of_objects [ipx::current_core]]
ipx::add_port_map {RST} [ipx::get_bus_interfaces AXI4_Lite_signal_reset -of_objects [ipx::current_core]]
set_property physical_name {AXI4_Lite_ARESETN} [ipx::get_port_maps RST -of_objects [ipx::get_bus_interfaces AXI4_Lite_signal_reset -of_objects [ipx::current_core]]]
ipx::add_bus_parameter {ASSOCIATED_BUSIF} [ipx::get_bus_interfaces AXI4_Lite_signal_clock -of_objects [ipx::current_core]]
set_property value {AXI4_Lite} [ipx::get_bus_parameters ASSOCIATED_BUSIF -of_objects [ipx::get_bus_interfaces AXI4_Lite_signal_clock -of_objects [ipx::current_core]]]
ipx::add_bus_parameter {ASSOCIATED_RESET} [ipx::get_bus_interfaces AXI4_Lite_signal_clock -of_objects [ipx::current_core]]
set_property value {AXI4_Lite_ARESETN} [ipx::get_bus_parameters ASSOCIATED_RESET -of_objects [ipx::get_bus_interfaces AXI4_Lite_signal_clock -of_objects [ipx::current_core]]]
ipx::add_bus_parameter {POLARITY} [ipx::get_bus_interfaces AXI4_Lite_signal_reset -of_objects [ipx::current_core]]
set_property value {ACTIVE_LOW} [ipx::get_bus_parameters POLARITY -of_objects [ipx::get_bus_interfaces AXI4_Lite_signal_reset -of_objects [ipx::current_core]]]
ipx::add_memory_map {AXI4_Lite} [ipx::current_core]
set_property slave_memory_map_ref {AXI4_Lite} [ipx::get_bus_interfaces AXI4_Lite -of_objects [ipx::current_core]]
ipx::add_address_block {reg0} [ipx::get_memory_maps AXI4_Lite -of_objects [ipx::current_core]]
set_property range {65536} [ipx::get_address_blocks reg0 -of_objects [ipx::get_memory_maps AXI4_Lite -of_objects [ipx::current_core]]]

# AXI4-Stream I Master
ipx::add_bus_interface {AXI4_Stream_I_Master} [ipx::current_core]
set_property abstraction_type_vlnv {xilinx.com:interface:axis_rtl:1.0} [ipx::get_bus_interfaces AXI4_Stream_I_Master -of_objects [ipx::current_core]]
set_property bus_type_vlnv {xilinx.com:interface:axis:1.0} [ipx::get_bus_interfaces AXI4_Stream_I_Master -of_objects [ipx::current_core]]
set_property interface_mode {master} [ipx::get_bus_interfaces AXI4_Stream_I_Master -of_objects [ipx::current_core]]
ipx::add_port_map {TREADY} [ipx::get_bus_interfaces AXI4_Stream_I_Master -of_objects [ipx::current_core]]
set_property physical_name {AXI4_Stream_I_Master_TREADY} [ipx::get_port_maps TREADY -of_objects [ipx::get_bus_interfaces AXI4_Stream_I_Master -of_objects [ipx::current_core]]]
ipx::add_port_map {TDATA} [ipx::get_bus_interfaces AXI4_Stream_I_Master -of_objects [ipx::current_core]]
set_property physical_name {AXI4_Stream_I_Master_TDATA} [ipx::get_port_maps TDATA -of_objects [ipx::get_bus_interfaces AXI4_Stream_I_Master -of_objects [ipx::current_core]]]
ipx::add_port_map {TVALID} [ipx::get_bus_interfaces AXI4_Stream_I_Master -of_objects [ipx::current_core]]
set_property physical_name {AXI4_Stream_I_Master_TVALID} [ipx::get_port_maps TVALID -of_objects [ipx::get_bus_interfaces AXI4_Stream_I_Master -of_objects [ipx::current_core]]]
ipx::add_port_map {TLAST} [ipx::get_bus_interfaces AXI4_Stream_I_Master -of_objects [ipx::current_core]]
set_property physical_name {AXI4_Stream_I_Master_TLAST} [ipx::get_port_maps TLAST -of_objects [ipx::get_bus_interfaces AXI4_Stream_I_Master -of_objects [ipx::current_core]]]

# AXI4-Stream I Slave
ipx::add_bus_interface {AXI4_Stream_I_Slave} [ipx::current_core]
set_property abstraction_type_vlnv {xilinx.com:interface:axis_rtl:1.0} [ipx::get_bus_interfaces AXI4_Stream_I_Slave -of_objects [ipx::current_core]]
set_property bus_type_vlnv {xilinx.com:interface:axis:1.0} [ipx::get_bus_interfaces AXI4_Stream_I_Slave -of_objects [ipx::current_core]]
set_property interface_mode {slave} [ipx::get_bus_interfaces AXI4_Stream_I_Slave -of_objects [ipx::current_core]]
ipx::add_port_map {TDATA} [ipx::get_bus_interfaces AXI4_Stream_I_Slave -of_objects [ipx::current_core]]
set_property physical_name {AXI4_Stream_I_Slave_TDATA} [ipx::get_port_maps TDATA -of_objects [ipx::get_bus_interfaces AXI4_Stream_I_Slave -of_objects [ipx::current_core]]]
ipx::add_port_map {TVALID} [ipx::get_bus_interfaces AXI4_Stream_I_Slave -of_objects [ipx::current_core]]
set_property physical_name {AXI4_Stream_I_Slave_TVALID} [ipx::get_port_maps TVALID -of_objects [ipx::get_bus_interfaces AXI4_Stream_I_Slave -of_objects [ipx::current_core]]]
ipx::add_port_map {TREADY} [ipx::get_bus_interfaces AXI4_Stream_I_Slave -of_objects [ipx::current_core]]
set_property physical_name {AXI4_Stream_I_Slave_TREADY} [ipx::get_port_maps TREADY -of_objects [ipx::get_bus_interfaces AXI4_Stream_I_Slave -of_objects [ipx::current_core]]]

# AXI4-Stream Q Master
ipx::add_bus_interface {AXI4_Stream_Q_Master} [ipx::current_core]
set_property abstraction_type_vlnv {xilinx.com:interface:axis_rtl:1.0} [ipx::get_bus_interfaces AXI4_Stream_Q_Master -of_objects [ipx::current_core]]
set_property bus_type_vlnv {xilinx.com:interface:axis:1.0} [ipx::get_bus_interfaces AXI4_Stream_Q_Master -of_objects [ipx::current_core]]
set_property interface_mode {master} [ipx::get_bus_interfaces AXI4_Stream_Q_Master -of_objects [ipx::current_core]]
ipx::add_port_map {TREADY} [ipx::get_bus_interfaces AXI4_Stream_Q_Master -of_objects [ipx::current_core]]
set_property physical_name {AXI4_Stream_Q_Master_TREADY} [ipx::get_port_maps TREADY -of_objects [ipx::get_bus_interfaces AXI4_Stream_Q_Master -of_objects [ipx::current_core]]]
ipx::add_port_map {TDATA} [ipx::get_bus_interfaces AXI4_Stream_Q_Master -of_objects [ipx::current_core]]
set_property physical_name {AXI4_Stream_Q_Master_TDATA} [ipx::get_port_maps TDATA -of_objects [ipx::get_bus_interfaces AXI4_Stream_Q_Master -of_objects [ipx::current_core]]]
ipx::add_port_map {TVALID} [ipx::get_bus_interfaces AXI4_Stream_Q_Master -of_objects [ipx::current_core]]
set_property physical_name {AXI4_Stream_Q_Master_TVALID} [ipx::get_port_maps TVALID -of_objects [ipx::get_bus_interfaces AXI4_Stream_Q_Master -of_objects [ipx::current_core]]]
ipx::add_port_map {TLAST} [ipx::get_bus_interfaces AXI4_Stream_Q_Master -of_objects [ipx::current_core]]
set_property physical_name {AXI4_Stream_Q_Master_TLAST} [ipx::get_port_maps TLAST -of_objects [ipx::get_bus_interfaces AXI4_Stream_Q_Master -of_objects [ipx::current_core]]]

# AXI4-Stream Q Slave
ipx::add_bus_interface {AXI4_Stream_Q_Slave} [ipx::current_core]
set_property abstraction_type_vlnv {xilinx.com:interface:axis_rtl:1.0} [ipx::get_bus_interfaces AXI4_Stream_Q_Slave -of_objects [ipx::current_core]]
set_property bus_type_vlnv {xilinx.com:interface:axis:1.0} [ipx::get_bus_interfaces AXI4_Stream_Q_Slave -of_objects [ipx::current_core]]
set_property interface_mode {slave} [ipx::get_bus_interfaces AXI4_Stream_Q_Slave -of_objects [ipx::current_core]]
ipx::add_port_map {TDATA} [ipx::get_bus_interfaces AXI4_Stream_Q_Slave -of_objects [ipx::current_core]]
set_property physical_name {AXI4_Stream_Q_Slave_TDATA} [ipx::get_port_maps TDATA -of_objects [ipx::get_bus_interfaces AXI4_Stream_Q_Slave -of_objects [ipx::current_core]]]
ipx::add_port_map {TVALID} [ipx::get_bus_interfaces AXI4_Stream_Q_Slave -of_objects [ipx::current_core]]
set_property physical_name {AXI4_Stream_Q_Slave_TVALID} [ipx::get_port_maps TVALID -of_objects [ipx::get_bus_interfaces AXI4_Stream_Q_Slave -of_objects [ipx::current_core]]]
ipx::add_port_map {TREADY} [ipx::get_bus_interfaces AXI4_Stream_Q_Slave -of_objects [ipx::current_core]]
set_property physical_name {AXI4_Stream_Q_Slave_TREADY} [ipx::get_port_maps TREADY -of_objects [ipx::get_bus_interfaces AXI4_Stream_Q_Slave -of_objects [ipx::current_core]]]


# Add IP clock and reset definition
ipx::add_bus_interface {IPCORE_CLK} [ipx::current_core]
set_property abstraction_type_vlnv {xilinx.com:signal:clock_rtl:1.0} [ipx::get_bus_interfaces IPCORE_CLK -of_objects [ipx::current_core]]
set_property bus_type_vlnv {xilinx.com:signal:clock:1.0} [ipx::get_bus_interfaces IPCORE_CLK -of_objects [ipx::current_core]]
ipx::add_port_map {CLK} [ipx::get_bus_interfaces IPCORE_CLK -of_objects [ipx::current_core]]
set_property physical_name {IPCORE_CLK} [ipx::get_port_maps CLK -of_objects [ipx::get_bus_interfaces IPCORE_CLK -of_objects [ipx::current_core]]]
ipx::add_bus_interface {IPCORE_RESETN} [ipx::current_core]
set_property abstraction_type_vlnv {xilinx.com:signal:reset_rtl:1.0} [ipx::get_bus_interfaces IPCORE_RESETN -of_objects [ipx::current_core]]
set_property bus_type_vlnv {xilinx.com:signal:reset:1.0} [ipx::get_bus_interfaces IPCORE_RESETN -of_objects [ipx::current_core]]
ipx::add_port_map {RST} [ipx::get_bus_interfaces IPCORE_RESETN -of_objects [ipx::current_core]]
set_property physical_name {IPCORE_RESETN} [ipx::get_port_maps RST -of_objects [ipx::get_bus_interfaces IPCORE_RESETN -of_objects [ipx::current_core]]]
ipx::add_bus_parameter {ASSOCIATED_RESET} [ipx::get_bus_interfaces IPCORE_CLK -of_objects [ipx::current_core]]
set_property value {IPCORE_RESETN} [ipx::get_bus_parameters ASSOCIATED_RESET -of_objects [ipx::get_bus_interfaces IPCORE_CLK -of_objects [ipx::current_core]]]
ipx::add_bus_parameter {POLARITY} [ipx::get_bus_interfaces IPCORE_RESETN -of_objects [ipx::current_core]]
set_property value {ACTIVE_LOW} [ipx::get_bus_parameters POLARITY -of_objects [ipx::get_bus_interfaces IPCORE_RESETN -of_objects [ipx::current_core]]]
ipx::add_bus_parameter {ASSOCIATED_BUSIF} [ipx::get_bus_interfaces IPCORE_CLK -of_objects [ipx::current_core]]
set_property value {AXI4_Stream_I_Master:AXI4_Stream_I_Slave:AXI4_Stream_Q_Master:AXI4_Stream_Q_Slave} [ipx::get_bus_parameters ASSOCIATED_BUSIF -of_objects [ipx::get_bus_interfaces IPCORE_CLK -of_objects [ipx::current_core]]]


# Add report files
ipx::add_file_group -type {product_guide} {} [ipx::current_core]
ipx::add_file {doc/doc_arch_axi4_lite_stream.jpg} [ipx::get_file_groups xilinx_productguide -of_objects [ipx::current_core]]
set_property type {{image}} [ipx::get_files {doc/doc_arch_axi4_lite_stream.jpg} -of_objects [ipx::get_file_groups xilinx_productguide -of_objects [ipx::current_core]]]
ipx::add_file {doc/free_running.jpg} [ipx::get_file_groups xilinx_productguide -of_objects [ipx::current_core]]
set_property type {{image}} [ipx::get_files {doc/free_running.jpg} -of_objects [ipx::get_file_groups xilinx_productguide -of_objects [ipx::current_core]]]
ipx::add_file {doc/zynqRadioHWSWLTEDecimatorRFSoC2x2_ip_core_report.html} [ipx::get_file_groups xilinx_productguide -of_objects [ipx::current_core]]
set_property type {{html}} [ipx::get_files {doc/zynqRadioHWSWLTEDecimatorRFSoC2x2_ip_core_report.html} -of_objects [ipx::get_file_groups xilinx_productguide -of_objects [ipx::current_core]]]

# Add C files
ipx::add_file_group -type {misc} {} [ipx::current_core]
ipx::add_file {include/LTE_DOWNS_ip_addr.h} [ipx::get_file_groups xilinx_miscfiles -of_objects [ipx::current_core]]
set_property type {{cSource}} [ipx::get_files {include/LTE_DOWNS_ip_addr.h} -of_objects [ipx::get_file_groups xilinx_miscfiles -of_objects [ipx::current_core]]]
ipx::create_xgui_files [ipx::current_core]
ipx::check_integrity -quiet [ipx::current_core]
ipx::save_core [ipx::current_core]

# Package IP
ipx::archive_core {../LTE_DOWNS_ip_v1_0.zip} [ipx::current_core]
close_project
exit