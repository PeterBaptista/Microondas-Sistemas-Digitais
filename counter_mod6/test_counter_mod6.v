module test_counter_mod6;

  reg clk;
  reg reset;
  wire [2:0] count_out;

  // Instantiate the module under test
  counter_mod6 dut (
    .clk(clk),
    .reset(reset),
    .count_out(count_out)
  );

  // Clock generation
  always begin
    #5 clk = ~clk; // Toggle the clock every 5 time units (adjust as needed)
  end

  initial begin
    // Initialize signals
    clk = 0;
    reset = 0;

    // Start simulation
    $dumpfile("waveform.vcd"); // Specify the waveform file name
    $dumpvars(0, test_counter_mod6);  // Dump all variables

    // Reset the counter
    reset = 1;
    #10 reset = 0;

    // Simulate for some time
    #500;

    // Stop simulation
    $finish;
  end

endmodule