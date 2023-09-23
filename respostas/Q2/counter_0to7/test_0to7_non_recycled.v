module test_counter_0to7_non_recycled;

  reg clk;
  wire [2:0] out;

  // Instantiate the counter_0to7_non_recycled module under test
  counter_0to7_non_recycled dut (
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
    $dumpvars(0, test_counter_0to7_non_recycled);  // Dump all variables

    // Simulate for some time
    #200; // Adjust the simulation time as needed

    // Stop simulation
    $finish;
  end

endmodule