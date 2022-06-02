################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CPP_SRCS += \
C:/Capstone/cp_corr_pss_sss/cp_corr_pss_sss.cpp 

OBJS += \
./source/cp_corr_pss_sss.o 

CPP_DEPS += \
./source/cp_corr_pss_sss.d 


# Each subdirectory must supply rules for building sources it contributes
source/cp_corr_pss_sss.o: C:/Capstone/cp_corr_pss_sss/cp_corr_pss_sss.cpp
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C++ Compiler'
	g++ -DAESL_TB -D__llvm__ -D__llvm__ -IC:/Xilinx/Vitis_HLS/2020.2/include/ap_sysc -IC:/Xilinx/Vitis_HLS/2020.2/win64/tools/systemc/include -IC:/Xilinx/Vitis_HLS/2020.2/include/etc -IC:/Xilinx/Vitis_HLS/2020.2/include -IC:/Xilinx/Vitis_HLS/2020.2/win64/tools/auto_cc/include -IC:/Capstone/cp_corr_pss_sss -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


