module test_counter_frequency_div_100;

  reg clk;
  wire out;

  // Instantiate the counter_frequency_div_100 module under test
  counter_frequency_div_100 dut (
    .clk(clk),
    .out(out)
  );

  // Clock generation
  always begin
    #5 clk = ~clk; // Toggle the clock every 5 time units (adjust as needed)
  end

  initial begin
    // Initialize signals
    clk = 0;

    // Start simulation
    $dumpfile("waveform.vcd"); // Specify the waveform file name
    $dumpvars(0, test_counter_frequency_div_100);  // Dump all variables

    // Simulate for some time
    #50000; // Adjust the simulation time as needed

    // Stop simulation
    $finish;
  end

endmodule