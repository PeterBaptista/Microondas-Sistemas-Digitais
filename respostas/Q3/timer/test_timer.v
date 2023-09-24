module test_timer;

  reg clk;
  reg clear;
  reg load;
  reg stop;
  wire zero;
  wire [3:0] bcd_output_usec;
  wire [3:0] bcd_output_dsec;
  wire [3:0] bcd_output_min;
  reg [3:0] bcd_input;

  // Instantiate the timer module under test
  timer dut (
    .clk(clk),
    .clear(clear),
    .load(load),
    .stop(stop),
    .bcd_input(bcd_input),
    .zero(zero),
    .bcd_output_usec(bcd_output_usec),
    .bcd_output_dsec(bcd_output_dsec),
    .bcd_output_min(bcd_output_min)
  );

  // Instantiate the clock generator
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // Generate clock signal (adjust delay as needed)
  end

  initial begin
    // Initialize signals
    clear = 1;
    load = 0;
    stop = 0;
    bcd_input = 4'b0000;


    // Start simulation
    $dumpfile("timer.vcd"); // Specify the waveform file name
    $dumpvars(0, test_timer);  // Dump all variables

    // Clear the timer initially
    #10 clear = 0;

    // Simulate for some time
    #3000; // Adjust the simulation time as needed

    // Load a new value into the timer

    // Allow the timer to run
    #200; // Adjust the simulation time as needed
    stop = 1;
    #200
    // Stop simulation
    $finish;
  end

endmodule