module test_counter_0to7;

  // Define inputs and outputs for the testbench
  reg clear;
  reg clk;
  wire delay;

  // Instantiate the counter_0to7 module under test
  counter_0to7 dut (
    .clear(clear),
    .clk(clk),
    .delay(delay)
  );

  // Clock generation
  always begin
    #5 clk = ~clk;
  end

  // Initialize the VCD file
  initial begin
    $dumpfile("counter_0to7_waveform.vcd"); // Specify the waveform file name
    $dumpvars(0, test_counter_0to7);  // Dump all variables
    // Initialize inputs
    clear = 0;
    clk = 0;

    // Simulate the counter operation
    // Add more test scenarios and stimulus code here

    // Example: Clear the counter
    clear = 1;
    #10 clear = 0;

    // Example: Clock the counter
    repeat (8) begin
      #5 clk = ~clk;
    end

    // Monitor the outputs and display the results
    // Add assertions or checks as needed

    // Add a simulation end condition (e.g., $finish;) when done testing
    $finish;
  end

endmodule