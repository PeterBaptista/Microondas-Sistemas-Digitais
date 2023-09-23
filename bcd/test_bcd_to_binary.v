module test_bcd_to_binary;

  reg [3:0] bcd_in;
  wire [2:0] binary_out;

  bcd_to_binary dut (
    .bcd_in(bcd_in),
    .binary_out(binary_out)
  );

  initial begin

    $dumpfile("waveform.vcd"); // Generate waveform file for visualization
    $dumpvars(0, test_bcd_to_binary);  // Dump all variables
    
    // Teste de conversão
    bcd_in = 4'b0001; // BCD 1
    #10 $display("Binary: %b", binary_out);

    bcd_in = 4'b1010; // BCD 10
    #10 $display("Binary: %b", binary_out);

    $finish; // Encerra a simulação
  end


endmodule