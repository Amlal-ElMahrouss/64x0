# If you don't need to patch ghdl, use export ghdlp=ghdl
# Use ghdl -r module, to simulate.

VHDL_FLAG=-a --work=RTL --std=08
VHDL_CC=$(ghdlp)

.PHONY: all-vhdl
all-vhdl:
	$(VHDL_CC) $(VHDL_FLAG) InstructionDecode.vhdl
	$(VHDL_CC) $(VHDL_FLAG) FPRegister.vhdl
	$(VHDL_CC) $(VHDL_FLAG) GPRegister.vhdl
	$(VHDL_CC) $(VHDL_FLAG) GPRegisterBank.vhdl
	$(VHDL_CC) $(VHDL_FLAG) InterruptRegister.vhdl
	$(VHDL_CC) $(VHDL_FLAG) ThreadRegister.vhdl
	$(VHDL_CC) $(VHDL_FLAG) ClockCircuit.vhdl
	$(VHDL_CC) $(VHDL_FLAG) InstructionFetch.vhdl