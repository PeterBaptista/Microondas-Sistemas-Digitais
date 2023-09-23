Compile and create an executable object file from your Verilog design and testbench

	iverilog -o output_object_file.vvp your_module.v testbench.v

run testbench and generate output files:

	vvp output_object_file.vvp

run gtkwave to visualize the waves:
	
	gtkwave waveform.vcd

