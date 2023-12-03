################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../src/demo/cache_lock/demo_cache_lock.c 

OBJS += \
./src/demo/cache_lock/demo_cache_lock.o 

C_DEPS += \
./src/demo/cache_lock/demo_cache_lock.d 


# Each subdirectory must supply rules for building sources it contributes
src/demo/cache_lock/%.o: ../src/demo/cache_lock/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: Andes C Compiler'
	$(CROSS_COMPILE)gcc -I/cygdrive/G/TangMega138K/ae350_test/firmware/ae350_test/src/bsp/ae350 -I/cygdrive/G/TangMega138K/ae350_test/firmware/ae350_test/src/bsp/config -I/cygdrive/G/TangMega138K/ae350_test/firmware/ae350_test/src/bsp/driver/ae350 -I/cygdrive/G/TangMega138K/ae350_test/firmware/ae350_test/src/bsp/driver/include -I/cygdrive/G/TangMega138K/ae350_test/firmware/ae350_test/src/bsp/lib -I/cygdrive/G/TangMega138K/ae350_test/firmware/ae350_test/src/demo -Og -mcmodel=medium -g3 -Wall -mcpu=a25 -ffunction-sections -fdata-sections -c -fmessage-length=0 -fno-builtin -fomit-frame-pointer -fno-strict-aliasing -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d) $(@:%.o=%.o)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


