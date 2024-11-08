XLEN ?=64
UART ?=0 #1

cores_number=6

default: all

src_dir=source
grlib=../../../../../grlib
output_srec=$(grlib)/../selene-soc/selene-xilinx-vcu118/hello.srec
bsc_lib=$(grlib)/software/noelv/BSC_tests/BSC_libraries
common=common

#--------------------------------------------------------------------
# Experiment parameters
#--------------------------------------------------------------------
ncores ?= 1 # Enable N-1 cores
inj_sel   ?= 0 # 0=SafeTI AXI
inj_type  ?= 2 # 1=READ, 2=WRITE, 9=READ_SEQ, 10=WRITE_SEQ
inj_size  ?= 512 #524288 max on non-SEQ, 16384 on SEQ operations
inj_delay ?= 0
inj_count ?= 0 # Repeats of the same traffic
inj_loop  ?= 0 # Loop traffic generation

#--------------------------------------------------------------------
# Sources
#--------------------------------------------------------------------

bmarks := safeti_axi
bmarks_riscv=$(addsuffix .riscv,  $(bmarks))

#--------------------------------------------------------------------
# Build rules
#--------------------------------------------------------------------

RISCV_PREFIX ?= riscv-gaisler-elf-
#RISCV_PREFIX ?= riscv$(XLEN)-unknown-elf-
RISCV_GCC ?= $(RISCV_PREFIX)gcc
RISCV_GCC_OPTS ?= -DPREALLOCATE=1 -mcmodel=medany -static -std=gnu99 -O2 -fno-inline-small-functions -ffast-math -fno-common -fno-builtin-printf -march=rv64ima -mabi=lp64 -DNO_UART_WAIT=$(UART) -DNOSTAT
#RISCV_GCC_OPTS ?= -g -O2 -qbsp=2020q4  -march=rv64imafd -mabi=lp64d
#RISCV_LINK ?= $(RISCV_GCC) -T $(common)/test.ld $(incs)
RISCV_LINK_OPTS ?= -static -nostdlib -nostartfiles -lm -lgcc
RISCV_OBJDUMP ?= $(RISCV_PREFIX)objdump --disassemble-all --disassemble-zeroes --section=.text --section=.text.startup --section=.data

# Dependencies paths
incs  += -I$(bsc_lib)/../uart -I$(bsc_lib)/../env -I$(common) -I$(bsc_lib)/safeSU/6-core -I$(bsc_lib)/safeTI $(foreach bmark, $(bmarks), -I$(src_dir)/$bmark)
# Dependencies files
incs  += $(wildcard $(src_dir)/$(1)/*.c) $(wildcard $(common)/*.c) $(wildcard $(common)/*.S) $(wildcard $(bsc_lib)/../uart/*.c) $(wildcard $(bsc_lib)/safeTI/*.c)
# Compilation flags/test options
opts  += -D__INJ_SELECTOR__=$(inj_sel) -D__INJ_TYPE__=$(inj_type) -D__INJ_SIZE__=$(inj_size) -D__INJ_DELAY__=$(inj_delay) -D__INJ_COUNT__=$(inj_count) -D__INJ_LOOP__=$(inj_loop)

define compile_template
$(1).riscv: $(wildcard $(1).riscv/*) $(wildcard $(common)/*) $(wildcard $(bsc_lib)/../uart/*)
	mkdir -p $$@
	if [ "$(cores_number)" -ge "1" ]; then \
	$$(RISCV_GCC) $$(incs) $$(RISCV_GCC_OPTS) -D__CORE__=1 $$(opts) $$(EXTRA_GCC_OPTS) -o $$@/$(1)-1.riscv  $(wildcard $(src_dir)/$(1)/*.c) $$(RISCV_LINK_OPTS) -T $(common)/noelv1.ld; \
	fi
endef

$(foreach bmark,$(bmarks),$(eval $(call compile_template,$(bmark))))

#------------------------------------------------------------
# Generate srec

define compile_template
$(1).srec: $(wildcard $(1).riscv/*)
	riscv-gaisler-elf-objcopy -O srec $(1).riscv/$(1)-1.riscv temp.srec
	tclsh $(grlib)/bin/padsrec.tcl <temp.srec >$(output_srec) rm temp.srec
endef

$(foreach bmark,$(bmarks),$(eval $(call compile_template,$(bmark))))

#------------------------------------------------------------
# Generate dump

define compile_template
$(1).dump: $(wildcard $(1).riscv/*)
	$(RISCV_OBJDUMP) $(1).riscv/$(1)-1.riscv $(RISCV_OBJDUMP_OPTS) > $(1).riscv/$(1).dump
endef

$(foreach bmark,$(bmarks),$(eval $(call compile_template,$(bmark))))

#------------------------------------------------------------
# Generate riscv+srec

define compile_template
$(1).: $(wildcard $(1).riscv/*)
	make clean
	make $(1).riscv
	make $(1).srec
	make $(1).dump
endef

$(foreach bmark,$(bmarks),$(eval $(call compile_template,$(bmark))))

#------------------------------------------------------------
# Default

all: $(bmarks_riscv)

#------------------------------------------------------------
# Clean up

clean:
	rm -rf *.riscv vivado* *.srec
