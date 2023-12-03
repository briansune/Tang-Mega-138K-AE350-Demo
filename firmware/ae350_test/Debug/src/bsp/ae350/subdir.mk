################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../src/bsp/ae350/ae350.c \
../src/bsp/ae350/cache.c \
../src/bsp/ae350/initfini.c \
../src/bsp/ae350/interrupt.c \
../src/bsp/ae350/loader.c \
../src/bsp/ae350/reset.c \
../src/bsp/ae350/trap.c 

S_UPPER_SRCS += \
../src/bsp/ae350/start.S 

OBJS += \
./src/bsp/ae350/ae350.o \
./src/bsp/ae350/cache.o \
./src/bsp/ae350/initfini.o \
./src/bsp/ae350/interrupt.o \
./src/bsp/ae350/loader.o \
./src/bsp/ae350/reset.o \
./src/bsp/ae350/start.o \
./src/bsp/ae350/trap.o 

S_UPPER_DEPS += \
./src/bsp/ae350/start.d 

C_DEPS += \
./src/bsp/ae350/ae350.d \
./src/bsp/ae350/cache.d \
./src/bsp/ae350/initfini.d \
./src/bsp/ae350/interrupt.d \
./src/bsp/ae350/loader.d \
./src/bsp/ae350/reset.d \
./src/bsp/ae350/trap.d 


# Each subdirectory must supply rules for building sources it contributes
src/bsp/ae350/%.o: ../src/bsp/ae350/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: Andes C Compiler'
	$(CROSS_COMPILE)gcc -I/cygdrive/G/TangMega138K/ae350_test/firmware/ae350_test/src/bsp/ae350 -I/cygdrive/G/TangMega138K/ae350_test/firmware/ae350_test/src/bsp/config -I/cygdrive/G/TangMega138K/ae350_test/firmware/ae350_test/src/bsp/driver/ae350 -I/cygdrive/G/TangMega138K/ae350_test/firmware/ae350_test/src/bsp/driver/include -I/cygdrive/G/TangMega138K/ae350_test/firmware/ae350_test/src/bsp/lib -I/cygdrive/G/TangMega138K/ae350_test/firmware/ae350_test/src/demo -Og -mcmodel=medium -g3 -Wall -mcpu=a25 -ffunction-sections -fdata-sections -c -fmessage-length=0 -fno-builtin -fomit-frame-pointer -fno-strict-aliasing -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d) $(@:%.o=%.o)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

src/bsp/ae350/%.o: ../src/bsp/ae350/%.S
	@echo 'Building file: $<'
	@echo 'Invoking: Andes C Compiler'
	$(CROSS_COMPILE)gcc -I/cygdrive/G/TangMega138K/ae350_test/firmware/ae350_test/src/bsp/ae350 -I/cygdrive/G/TangMega138K/ae350_test/firmware/ae350_test/src/bsp/config -I/cygdrive/G/TangMega138K/ae350_test/firmware/ae350_test/src/bsp/driver/ae350 -I/cygdrive/G/TangMega138K/ae350_test/firmware/ae350_test/src/bsp/driver/include -I/cygdrive/G/TangMega138K/ae350_test/firmware/ae350_test/src/bsp/lib -I/cygdrive/G/TangMega138K/ae350_test/firmware/ae350_test/src/demo -Og -mcmodel=medium -g3 -Wall -mcpu=a25 -ffunction-sections -fdata-sections -c -fmessage-length=0 -fno-builtin -fomit-frame-pointer -fno-strict-aliasing -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d) $(@:%.o=%.o)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


