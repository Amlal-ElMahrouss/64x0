##################################################
# (C) Mahrouss Logic, 2024, all rights reserved.
# This is the RTL makefile.
##################################################

VHDL_FLAG=-a --work=RTL --std=08 --ieee=synopsys
VCD_FLAG=-r --std=08

ifeq ($(shell uname), Darwin)
VHDL_CC=$(GHDL_PATH)
else
VHDL_CC=ghdl
endif 

.PHONY: all
all:
	$(VHDL_CC) $(VHDL_FLAG) InstructionDecode.vhdl
	$(VHDL_CC) $(VHDL_FLAG) FPRegister.vhdl
	$(VHDL_CC) $(VHDL_FLAG) GPRegister.vhdl
	$(VHDL_CC) $(VHDL_FLAG) GPRegisterBank.vhdl
	$(VHDL_CC) $(VHDL_FLAG) FPRegisterBank.vhdl
	$(VHDL_CC) $(VHDL_FLAG) InterruptRegister.vhdl
	$(VHDL_CC) $(VHDL_FLAG) ThreadRegister.vhdl
	$(VHDL_CC) $(VHDL_FLAG) ClockCircuit.vhdl
	$(VHDL_CC) $(VHDL_FLAG) InstructionFetch.vhdl
	$(VHDL_CC) $(VCD_FLAG) RTL.InstructionFetch --vcd=InstructionFetch.vcd

.PHONY: help
help:
	@echo "all: Build CPU for simulation."
