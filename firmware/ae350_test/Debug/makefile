################################################################################
# Automatically-generated file. Do not edit!
################################################################################

ifndef ANDESIGHT_ROOT
ANDESIGHT_ROOT=/cygdrive/C/Andestech/AndeSight_RDS_v511
endif

ifndef CROSS_COMPILE
CROSS_COMPILE=riscv32-elf-
endif

ifndef SECONDARY_OUTPUT_PATH
SECONDARY_OUTPUT_PATH=output
endif

$(shell mkdir -p $(SECONDARY_OUTPUT_PATH))

-include ../makefile.init

RM := rm -rf

# All of the sources participating in the build are defined here
-include sources.mk
-include subdir.mk
-include src/bsp/ae350/subdir.mk
-include src/bsp/driver/ae350/subdir.mk
-include src/bsp/lib/subdir.mk
-include src/demo/cache/subdir.mk
-include src/demo/cache_lock/subdir.mk
-include src/demo/gpio/subdir.mk
-include src/demo/hsp/subdir.mk
-include src/demo/i2c/subdir.mk
-include src/demo/idlm/subdir.mk
-include src/demo/intr/subdir.mk
-include src/demo/led/subdir.mk
-include src/demo/subdir.mk
-include src/demo/mm/subdir.mk
-include src/demo/pfm/subdir.mk
-include src/demo/plic/subdir.mk
-include src/demo/plmt/subdir.mk
-include src/demo/powerbrake/subdir.mk
-include src/demo/printf/subdir.mk
-include src/demo/pwm/subdir.mk
-include src/demo/rtc/subdir.mk
-include src/demo/scanf/subdir.mk
-include src/demo/spi/subdir.mk
-include src/demo/uart/subdir.mk
-include src/demo/wdt_pit/subdir.mk
-include src/demo/wfi/subdir.mk
-include objects.mk

ifneq ($(MAKECMDGOALS),clean)
ifneq ($(strip $(S_UPPER_DEPS)),)
-include $(S_UPPER_DEPS)
endif
ifneq ($(strip $(C_DEPS)),)
-include $(C_DEPS)
endif
endif

-include ../makefile.defs

# Add inputs and outputs from these tool invocations to the build variables 
BUILD_ARTIFACT_FILE_BASE_NAME = ae350_test

LINKER_OUTPUTS = ae350_test.adx

GPROF_OUT += \
../gmon.sum ../gmon.out \

GCOV_OUT += \
$(foreach subdir,$(SUBDIRS),$(wildcard $(subdir)/*.gcda) $(wildcard $(subdir)/*.gcno)) \

SYMBOL_OUTPUTS += \
$(SECONDARY_OUTPUT_PATH)/symbol.txt \

READELF_OUTPUTS += \
$(SECONDARY_OUTPUT_PATH)/readelf.txt \

OBJCOPY_OUTPUTS += \
$(SECONDARY_OUTPUT_PATH)/$(BUILD_ARTIFACT_FILE_BASE_NAME).bin \

SIZE_OUTPUTS += \
$(SECONDARY_OUTPUT_PATH)/.PHONY.size \

LDSAG_OUT = $(SECONDARY_OUTPUT_PATH)/ae350-ddr.ld

# All Target
all: ae350_test.adx secondary-outputs

# Tool invocations
ae350_test.adx: $(OBJS) $(USER_OBJS) $(LDSAG_OUT)
	@echo 'Building target: $@'
	@echo 'Invoking: Andes C Linker'
	$(CROSS_COMPILE)gcc -Og -nostartfiles -static -T"$(LDSAG_OUT)" -Wl,--gc-sections -o "ae350_test.adx" $(OBJS) $(USER_OBJS) $(LIBS)
	@echo 'Finished building target: $@'
	@echo ' '

$(foreach subdir,$(SUBDIRS),$(wildcard $(subdir)/*.gcda) $(wildcard $(subdir)/*.gcno)): ae350_test.adx $(OBJS) $(USER_OBJS) $(LDSAG_OUT)
../gmon.sum ../gmon.out: ae350_test.adx $(OBJS) $(USER_OBJS) $(LDSAG_OUT)

$(SECONDARY_OUTPUT_PATH)/symbol.txt: $(LINKER_OUTPUTS)
	@echo 'Invoking: NM (symbol listing)'
	$(CROSS_COMPILE)nm -n -l -C "ae350_test.adx" > $(SECONDARY_OUTPUT_PATH)/symbol.txt
	@echo 'Finished building: $@'
	@echo ' '

$(SECONDARY_OUTPUT_PATH)/readelf.txt: $(LINKER_OUTPUTS)
	@echo 'Invoking: Readelf (ELF info listing)'
	$(CROSS_COMPILE)readelf -a "ae350_test.adx" > $(SECONDARY_OUTPUT_PATH)/readelf.txt
	@echo 'Finished building: $@'
	@echo ' '

: $(LINKER_OUTPUTS)
	@echo 'Invoking: Objdump (disassembly)'
	$(CROSS_COMPILE)objdump -x -d -C "ae350_test.adx" >
	@echo 'Finished building: $@'
	@echo ' '

$(SECONDARY_OUTPUT_PATH)/$(BUILD_ARTIFACT_FILE_BASE_NAME).bin: $(LINKER_OUTPUTS)
	@echo 'Invoking: Objcopy (object content copy)'
	$(CROSS_COMPILE)objcopy -S -O binary "ae350_test.adx" $(SECONDARY_OUTPUT_PATH)/$(BUILD_ARTIFACT_FILE_BASE_NAME).bin
	@echo 'Finished building: $@'
	@echo ' '

$(SECONDARY_OUTPUT_PATH)/.PHONY.size: $(LINKER_OUTPUTS)
	@echo 'Invoking: Size (section size listing)'
	$(CROSS_COMPILE)size  "ae350_test.adx" | tee $(SECONDARY_OUTPUT_PATH)/.PHONY.size
	@echo 'Finished building: $@'
	@echo ' '

$(SECONDARY_OUTPUT_PATH)/ae350-ddr.ld: $(SAG_SRCS)
	@echo 'Invoking: LdSaG Tool'
	nds_ldsag --version=v5 -t "/cygdrive/C/Andestech/AndeSight_RDS_v511/utils/nds32_template_v5.txt" "$(SAG_FILE)" -o $(LDSAG_OUT)
	@echo 'Finished building: $@'
	@echo ' '

# Other Targets
clean:
	-$(RM) $(GPROF_OUT) $(SIZE_OUTPUTS) $(READELF_OUTPUTS) $(LDSAG_OUT) $(EXECUTABLES) $(OBJS) $(SYMBOL_OUTPUTS) $(S_UPPER_DEPS) $(GCOV_OUT) $(C_DEPS) $(OBJCOPY_OUTPUTS) ae350_test.adx
	-@echo ' '

secondary-outputs: $(SYMBOL_OUTPUTS) $(READELF_OUTPUTS) $(OBJCOPY_OUTPUTS) $(SIZE_OUTPUTS)

.PHONY: all clean dependents
.SECONDARY:

-include ../makefile.targets
