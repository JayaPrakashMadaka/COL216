GHDL=ghdl
FLAGS="--std=08"
filename1=Full_Adder
filename2=MUL_2
filename3=MUL_4
filename4=ALU
filename5=ALU_32
filename6=register_file
filename7=data_memory
filename8=program_memory
testbench1=testbench_ALU
testbench2=testbench_rf
testbench3=testbench_dm
testbench4=testbench_pm

all:
	$(GHDL) -s $(filename1).vhdl
	$(GHDL) -s $(filename2).vhdl
	$(GHDL) -s $(filename3).vhdl
	$(GHDL) -s $(filename4).vhdl
	$(GHDL) -s $(filename5).vhdl
	$(GHDL) -s $(testbench1).vhdl
	$(GHDL) -a $(filename1).vhdl
	$(GHDL) -a $(filename2).vhdl
	$(GHDL) -a $(filename3).vhdl
	$(GHDL) -a $(filename4).vhdl
	$(GHDL) -a $(filename5).vhdl
	$(GHDL) -a $(testbench1).vhdl
	$(GHDL) -e $(testbench1)
	$(GHDL) -r $(testbench1)
	$(GHDL) -r $(testbench1) --vcd=Output1.vcd
	$(GHDL) -s $(filename6).vhdl
	$(GHDL) -s $(testbench2).vhdl
	$(GHDL) -a $(filename6).vhdl
	$(GHDL) -a $(testbench2).vhdl
	$(GHDL) -e $(testbench2)
	$(GHDL) -r $(testbench2)
	$(GHDL) -r $(testbench2) --vcd=Output2.vcd
	$(GHDL) -s $(filename7).vhdl
	$(GHDL) -s $(testbench3).vhdl
	$(GHDL) -a $(filename7).vhdl
	$(GHDL) -a $(testbench3).vhdl
	$(GHDL) -e $(testbench3)
	$(GHDL) -r $(testbench3)
	$(GHDL) -r $(testbench3) --vcd=Output3.vcd
	$(GHDL) -s $(filename8).vhdl
	$(GHDL) -s $(testbench4).vhdl
	$(GHDL) -a $(filename8).vhdl
	$(GHDL) -a $(testbench4).vhdl
	$(GHDL) -e $(testbench4)
	$(GHDL) -r $(testbench4)
	$(GHDL) -r $(testbench4) --vcd=Output4.vcd
	
	
	
plotALU:
	gtkwave Output1.vcd
	
plotregfile:

	gtkwave Output2.vcd
	
plotdatamem:
	
	gtkwave Output3.vcd
	
plotprogmem:
	
	gtkwave Output4.vcd
	
clean:
	rm -rf *vcd *cf
