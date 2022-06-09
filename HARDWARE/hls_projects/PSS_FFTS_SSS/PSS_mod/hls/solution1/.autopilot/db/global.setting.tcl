
set TopModule "lteCellSearch"
set ClockPeriod 16.3
set ClockList ap_clk
set HasVivadoClockPeriod 0
set CombLogicFlag 0
set PipelineFlag 0
set DataflowTaskPipelineFlag 1
set TrivialPipelineFlag 0
set noPortSwitchingFlag 0
set FloatingPointFlag 0
set FftOrFirFlag 0
set NbRWValue 0
set intNbAccess 0
set NewDSPMapping 1
set HasDSPModule 0
set ResetLevelFlag 0
set ResetStyle control
set ResetSyncFlag 1
set ResetRegisterFlag 0
set ResetVariableFlag 0
set ResetRegisterNum 0
set FsmEncStyle onehot
set MaxFanout 0
set RtlPrefix {}
set RtlSubPrefix lteCellSearch_
set ExtraCCFlags {}
set ExtraCLdFlags {}
set SynCheckOptions {}
set PresynOptions {}
set PreprocOptions {}
set SchedOptions {}
set BindOptions {}
set RtlGenOptions {}
set RtlWriterOptions {}
set CbcGenFlag {}
set CasGenFlag {}
set CasMonitorFlag {}
set AutoSimOptions {}
set ExportMCPathFlag 0
set SCTraceFileName mytrace
set SCTraceFileFormat vcd
set SCTraceOption all
set TargetInfo xczu28dr:-ffvg1517:-2-e
set SourceFiles {sc {} c ../../lte_cell_search.cpp}
set SourceFlags {sc {} c {{}}}
set DirectiveFile /home/jhigh/Capstone_Project/main/HARDWARE/HLS_Pjts/PSS_FFTS_SSS/PSS_mod/hls/solution1/solution1.directive
set TBFiles {verilog {../../lte_cell_search_test.cpp ../../input.real.dat ../../input.imag.dat ../../output.dat} bc {../../lte_cell_search_test.cpp ../../input.real.dat ../../input.imag.dat ../../output.dat} sc {../../lte_cell_search_test.cpp ../../input.real.dat ../../input.imag.dat ../../output.dat} vhdl {../../lte_cell_search_test.cpp ../../input.real.dat ../../input.imag.dat ../../output.dat} c {} cas {../../lte_cell_search_test.cpp ../../input.real.dat ../../input.imag.dat ../../output.dat}}
set SpecLanguage C
set TVInFiles {bc {} c {} sc {} cas {} vhdl {} verilog {}}
set TVOutFiles {bc {} c {} sc {} cas {} vhdl {} verilog {}}
set TBTops {verilog {} bc {} sc {} vhdl {} c {} cas {}}
set TBInstNames {verilog {} bc {} sc {} vhdl {} c {} cas {}}
set XDCFiles {}
set ExtraGlobalOptions {"area_timing" 1 "clock_gate" 1 "impl_flow" map "power_gate" 0}
set TBTVFileNotFound {}
set AppFile ../hls.app
set ApsFile solution1.aps
set AvePath ../..
set DefaultPlatform DefaultPlatform
set multiClockList {}
set SCPortClockMap {}
set intNbAccess 0
set PlatformFiles {{DefaultPlatform {xilinx/zynquplus/zynquplus}}}
set HPFPO 0
