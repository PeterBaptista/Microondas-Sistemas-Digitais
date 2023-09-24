module test_counter_mod6;

  reg clk;
  reg clear;
  reg load;
  reg stop;
  wire tc;
  wire zero;
  reg [3:0] bcd_digit_input;
  wire [3:0] bcd_digit_output;

  // Instantiate the counter_mod6 module under test
  counter_mod6 dut (
    .clk(clk),
    .clear(clear),
    .load(load),
    .stop(stop),
    .tc(tc),
    .zero(zero),
    .bcd_digit_input(bcd_digit_input),
    .bcd_digit_output(bcd_digit_output)
  );

  // Clock generation
  always begin
    #5 clk = ~clk; // Toggle the clock every 5 time units (adjust as needed)
  end

  initial begin
    $dumpfile("counter_mod6.vcd"); // Specify the waveform file name
    $dumpvars(0, test_counter_mod6);  // Dump all variables
    // Initialize signals
    clk = 0;
    clear = 0;
    load = 0;
    stop = 0;
    bcd_digit_input = 4'b0000;

    // Start simulation
  

    // Clear the counter initially
    clear = 1;
    #10 clear = 0;

    // Simulate for some time
    #100; // Adjust the simulation time as needed

    // Load a new value into the counter
    load = 1;
    bcd_digit_input = 4'b0101; // Load BCD 5
    #10 load = 0;

    // Allow the counter to run
    #200; // Adjust the simulation time as needed

    // Stop simulation
    $finish;
  end

endmodule
