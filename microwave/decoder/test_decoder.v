module tb_decoder;

  // Define inputs and outputs for the testbench
  reg [3:0] minutes;
  reg [3:0] second_tens;
  reg [3:0] second_units;
  wire [6:0] minutes_display;
  wire [6:0] second_tens_display;
  wire [6:0] second_units_display;

  // Instantiate the decoder module under test
  decoder dut (
    .minutes(minutes),
    .second_tens(second_tens),
    .second_units(second_units),
    .minutes_display(minutes_display),
    .second_tens_display(second_tens_display),
    .second_units_display(second_units_display)
  );

  // Initialize the VCD file
  initial begin
    $dumpfile("decoder_waveform.vcd"); // Specify the waveform file name
    $dumpvars(0, tb_decoder);  // Dump all variables
    // Initialize inputs
    minutes = 4'b0000;
    second_tens = 4'b0000;
    second_units = 4'b0000;

    // Simulation time steps
    #10;
    minutes = 4'b0001;
    #10;
    minutes = 4'b0010;
    #10;
    minutes = 4'b0011;
    #10;
    minutes = 4'b0100;
    #10;
    minutes = 4'b0101;
    #10;
    minutes = 4'b0110;
    #10;
    minutes = 4'b0111;
    #10;
    minutes = 4'b1000;
    #10;
    minutes = 4'b1001;
    #10;
    second_tens = 4'b0001;
    #10;
    second_tens = 4'b0010;
    #10;
    second_tens = 4'b0011;
    #10;
    second_tens = 4'b0100;
    #10;
    second_tens = 4'b0101;
    #10;
    second_tens = 4'b0110;
    #10;
    second_tens = 4'b0111;
    #10;
    second_tens = 4'b1000;
    #10;
    second_tens = 4'b1001;
    #10;
    second_units = 4'b0001;
    #10;
    second_units = 4'b0010;
    #10;
    second_units = 4'b0011;
    #10;
    second_units = 4'b0100;
    #10;
    second_units = 4'b0101;
    #10;
    second_units = 4'b0110;
    #10;
    second_units = 4'b0111;
    #10;
    second_units = 4'b1000;
    #10;
    second_units = 4'b1001;
    #10;

    // Add more test scenarios and stimulus code here

    // Monitor the outputs and display the results
    $display("Minutes Display: %b", minutes_display);
    $display("Second Tens Display: %b", second_tens_display);
    $display("Second Units Display: %b", second_units_display);

    // Add a simulation end condition (e.g., $finish;) when done testing
    $finish;
  end

endmodule