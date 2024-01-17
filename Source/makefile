# If you don't need to patch ghdl, use export ghdlp=ghdl
# Use ghdl -r module, to simulate.

VHDL_SRC=FPRegister.vhdl GPRegister.vhdl InterruptRegister.vhdl ThreadRegister.vhdl
VHDL_FLAG=-a --std=08
VHDL_CC=$(ghdlp)

.PHONY: all-vhdl
all-vhdl:
	$(VHDL_CC) $(VHDL_FLAG) $(VHDL_SRC)