XLEN ?=64
UART ?=0 #1

default: all

#GRLIB=
SOURCE=source/safeti_axi
DRIVERS=drivers
BUILD=build

#--------------------------------------------------------------------
# Experiment parameters
#--------------------------------------------------------------------
__FPGA__  ?= 1 # FPGA bitstream test
inj_sel   ?= 0 # 0=SafeTI AXI
inj_type  ?= 2 # 1=READ, 2=WRITE
inj_size  ?= 512 # Number of bytes to access
inj_delay ?= 0 # Number of clock cycles in stand-by before traffic generation
inj_loop  ?= 0 # Loop traffic generation

#--------------------------------------------------------------------
# Build rules
#--------------------------------------------------------------------

RISCV_PREFIX ?= riscv-gaisler-elf-
RISCV_GCC ?= $(RISCV_PREFIX)gcc
RISCV_GCC_FLAGS= -g -O2 -qbsp=2020q4 -march=rv64imafd -mabi=lp64d -fno-inline-small-functions
RISCV_OBJDUMP ?= $(RISCV_PREFIX)objdump --disassemble-all --disassemble-zeroes --section=.text --section=.text.startup --section=.data

# Dependencies paths
incs  += -I$(DRIVERS)/safeti
# Compilation flags/test options
opts  += -D__FPGA__=$(__FPGA__) -D__INJ_SELECTOR__=$(inj_sel) -D__INJ_TYPE__=$(inj_type) -D__INJ_SIZE__=$(inj_size) -D__INJ_DELAY__=$(inj_delay) -D__INJ_LOOP__=$(inj_loop)

elf: drivers_
	$(RISCV_GCC) $(incs) $(RISCV_GCC_FLAGS) $(opts) $(SOURCE)/*.c -o $(BUILD)/main.elf -L. -l:$(BUILD)/lsafeti.a

#------------------------------------------------------------
# Generate srec

srec:
	$(RISCV_PREFIX)objcopy -O srec $(BUILD)/main.elf temp.srec
	tclsh $(GRLIB)/bin/padsrec.tcl <temp.srec >$(BUILD)/hello.srec rm temp.srec

#------------------------------------------------------------
# Generate dump

dump_:
	$(RISCV_OBJDUMP) $(BUILD)/main.elf $(RISCV_OBJDUMP_OPTS) > $(BUILD)/main.dump


#------------------------------------------------------------
# Drivers
drivers_:
	mkdir -p $(BUILD)
	$(RISCV_GCC) $(RISCV_GCC_FLAGS) $(incs) -c $(DRIVERS)/safeti/*.c -o $(BUILD)/lsafeti.a

#------------------------------------------------------------
# Default

all: elf dump_

#------------------------------------------------------------
# Clean up

clean:
	rm -f $(BUILD)/*
