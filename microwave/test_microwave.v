module test_microwave;

  // Define inputs and outputs for the testbench
  reg startn;
  reg stopn;
  reg clearn;
  reg door_closed;
  reg [9:0] keypad;
  reg clk;
  wire mag_on;
  wire [6:0] second_units_display;
  wire [6:0] second_tens_display;
  wire [6:0] minutes_display;

  // Instantiate the microwave module under test
  microwave dut (
    .startn(startn),
    .stopn(stopn),
    .clearn(clearn),
    .door_closed(door_closed),
    .keypad(keypad),
    .clk(clk),
    .mag_on(mag_on),
    .second_units_display(second_units_display),
    .second_tens_display(second_tens_display),
    .minutes_display(minutes_display)
  );

  // Initialize the VCD file
  initial begin
    $dumpfile("microwave_waveform.vcd"); // Specify the waveform file name
    $dumpvars(0, test_microwave);  // Dump all variables
    // Initialize inputs
    keypad = 10'b0010000000;
    clk = 1;

    door_closed = 1;
    stopn = 0;
    clearn = 0;
    startn = 0;

    // Simulate the microwave operation
    // Add more test scenarios and stimulus code here

    // Example: Start the microwave
    

    // Example: Stop the microwave
    #100;
    //stopn = 1;
    #100;
    //stopn = 0;
    keypad = 10'b0000000000;

    // Monitor the outputs and display the results
    // Add assertions or checks as needed
    #1000000
    // Add a simulation end condition (e.g., $finish;) when done testing
    $finish;
  end

  // Clock generation
  always begin
    #1 clk = ~clk;
  end

endmodule