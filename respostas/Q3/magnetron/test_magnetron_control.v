module test_magnetron_control;

  // Define inputs and outputs for the testbench
  reg startn;
  reg stopn;
  reg clearn;
  reg door_closed;
  reg timer_done;
  wire mag_on;

  // Instantiate the magnetron_control module under test
  magnetron_control dut (
    .startn(startn),
    .stopn(stopn),
    .clearn(clearn),
    .door_closed(door_closed),
    .timer_done(timer_done),
    .mag_on(mag_on)
  );

  // Initialize inputs
  initial begin

    $dumpfile("magnetron_control.vcd"); // Especifique o nome do arquivo de forma de onda
    $dumpvars(0, test_magnetron_control);  // Dump de todas as variáveis
    startn = 0;
    stopn = 0;
    clearn = 0;
    door_closed = 1;
    timer_done = 0;

    #100
    // Add test scenarios and stimulus code here
    // For example:
    startn = 1;
    #10 stopn = 1;
    #10 clearn = 1;
    #10 door_closed = 0;
    #100 timer_done = 1;


    #100

    // Monitor the outputs and add assertions or checks here
    // For example:
    // if (mag_on == 1'b1) begin
    //   $display("Magnetron is ON.");
    //   // Add more checks or assertions here
    // end

    // Add a simulation end condition (e.g., $finish;) when done testing
    $finish;
  end

endmodule