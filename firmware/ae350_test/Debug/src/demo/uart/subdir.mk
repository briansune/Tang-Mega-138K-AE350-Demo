################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../src/demo/uart/demo_uart.c 

OBJS += \
./src/demo/uart/demo_uart.o 

C_DEPS += \
./src/demo/uart/demo_uart.d 


# Each subdirectory must supply rules for building sources it contributes
src/demo/uart/%.o: ../src/demo/uart/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: Andes C Compiler'
	$(CROSS_COMPILE)gcc -I/cygdrive/G/TangMega138K/ae350_test/firmware/ae350_test/src/bsp/ae350 -I/cygdrive/G/TangMega138K/ae350_test/firmware/ae350_test/src/bsp/config -I/cygdrive/G/TangMega138K/ae350_test/firmware/ae350_test/src/bsp/driver/ae350 -I/cygdrive/G/TangMega138K/ae350_test/firmware/ae350_test/src/bsp/driver/include -I/cygdrive/G/TangMega138K/ae350_test/firmware/ae350_test/src/bsp/lib -I/cygdrive/G/TangMega138K/ae350_test/firmware/ae350_test/src/demo -Og -mcmodel=medium -g3 -Wall -mcpu=a25 -ffunction-sections -fdata-sections -c -fmessage-length=0 -fno-builtin -fomit-frame-pointer -fno-strict-aliasing -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d) $(@:%.o=%.o)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


