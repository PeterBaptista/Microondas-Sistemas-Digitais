`timescale 1ms/1ms

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
  initial clk = 0;
   always #5 clk = ~clk;

  // Initialize the VCD file
  initial begin
    $dumpfile("microwave_waveform.vcd"); // Specify the waveform file name
    $dumpvars(0, test_microwave);  // Dump all variables
    // Initialize inputs
    keypad = 9'b000000000;
            door_closed = 0;
            stopn = 1;
            startn = 1;

            // Inicializando o contador
            clearn = 1; #1;
            clearn = 0; #1;
            clearn = 1;

            // Digitando o 2
            #1100;
            keypad = 10'b0000000100;
            #1100;
            keypad = 10'b0000000000;

            // Digitando o 5
            #1100;
            keypad = 10'b0001000000;
            #1100;
            keypad = 10'b0000000000;

            // Digitando o 9
            #1100;
            keypad = 10'b1000000000;
            #1100;
            keypad = 10'b0000000000;

            // Digitando o 9
            #1100;
            keypad = 10'b1000000000;
            #1100;
            keypad = 10'b0000000000;

            // Digitando o 9
            #1100;
            keypad = 10'b1000000000;
            #1100;
            keypad = 10'b0000000000;

            // Tentando abrir
            #1100;
            startn = 0;
            #1100;
            startn = 1;
            #1100;
            // Fechando a porta
            door_closed = 1;
            #1000;
            startn = 0;
            #1000;
            startn = 1;
            #2000;
            // Pausando o timer
            #1000;
            startn = 1;
            #2000;
            // Abrindo porta
            door_closed = 1;
            #3000000;
            $finish();
    end

  // Clock generation
 

endmodule