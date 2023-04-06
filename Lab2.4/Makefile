GHDL=ghdl
FLAGS="--std=08"
filename5=ALU_32
filename6=register_file
filename7=data_memory
filename9=processor
filename10=flags
filename11=Condition_Checker
testbench=testbench

all:
	$(GHDL) -s $(filename5).vhdl
	$(GHDL) -s $(filename6).vhdl
	$(GHDL) -s $(filename7).vhdl
	$(GHDL) -s $(filename9).vhdl
	$(GHDL) -s $(filename10).vhdl
	$(GHDL) -s $(filename11).vhdl
	$(GHDL) -a $(filename5).vhdl
	$(GHDL) -a $(filename6).vhdl
	$(GHDL) -a $(filename7).vhdl
	$(GHDL) -a $(filename9).vhdl
	$(GHDL) -a $(filename10).vhdl
	$(GHDL) -a $(filename11).vhdl
	$(GHDL) -s $(testbench).vhdl
	$(GHDL) -a $(testbench).vhdl
	$(GHDL) -e $(testbench)
	$(GHDL) -r $(testbench)
	$(GHDL) -r $(testbench) --vcd=Output.vcd
	
plot:
	gtkwave Output.vcd
	
clean:
	rm -rf *vcd *cf
