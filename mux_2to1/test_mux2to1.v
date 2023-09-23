module test_mux_2to1;

  reg sel;
  reg in0;
  reg in1;
  wire out;

  // Instantiate the mux_2to1 module under test
  mux_2to1 dut (
    .sel(sel),
    .in0(in0),
    .in1(in1),
    .out(out)
  );

  initial begin
    $dumpfile("waveform.vcd"); // Specify the waveform file name
    $dumpvars(0, test_mux_2to1);  // Dump all variables

    // Test case 1: sel = 0, in0 = 1, in1 = 0
    sel = 0;
    in0 = 1;
    in1 = 0;
    #10;
    
    // Test case 2: sel = 1, in0 = 0, in1 = 1
    sel = 1;
    in0 = 0;
    in1 = 1;
    #10;
    
    // Test case 3: sel = 0, in0 = 0, in1 = 1
    sel = 0;
    in0 = 0;
    in1 = 1;
    #10;
    
    // Test case 4: sel = 1, in0 = 1, in1 = 0
    sel = 1;
    in0 = 1;
    in1 = 0;
    #10;

    // Stop simulation
    $finish;
  end

endmodule