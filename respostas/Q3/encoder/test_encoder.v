
module test_encoder;

  // Define inputs and outputs for the testbench
  reg [9:0] keypad;
  reg enablen;
  reg clk;
  wire [3:0] bcd_output;
  wire loadn;
  wire pgt_1hz;

  // Instantiate the encoder module under test
  encoder dut (
    .keypad(keypad),
    .enablen(enablen),
    .clk(clk),
    .bcd_output(bcd_output),
    .loadn(loadn),
    .pgt_1hz(pgt_1hz)
  );

  // Define signals for the clock generation

    initial begin
        clk = 0;
        forever #1 clk = ~clk;
    end
  // Initialize the VCD file
  initial begin
    $dumpfile("encoder_waveform.vcd"); // Specify the waveform file name
    $dumpvars(0, test_encoder);  // Dump all variables
    // Initialize inputs
    keypad = 10'b0000000100;
    enablen = 0;


    // Simulation time steps

    #1000

    // Add more test scenarios and stimulus code here

    // Monitor the outputs and add assertions or checks

    // Add a simulation end condition (e.g., $finish;) when done testing
    $finish;
  end

endmodule