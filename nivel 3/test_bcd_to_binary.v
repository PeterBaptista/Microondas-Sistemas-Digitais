module test_bcd_to_binary;

  reg [3:0] bcd_input;
  wire [2:0] binary_output;

  // Instância do codificador BCD para binário
  bcd_to_binary uut (
    .bcd_input(bcd_input),
    .binary_output(binary_output)
  );

  initial begin
    // Teste de conversão
    bcd_input = 4'b0001; // BCD 1
    #10 $display("Binary: %b", binary_output);

    bcd_input = 4'b1010; // BCD 10
    #10 $display("Binary: %b", binary_output);

    $finish; // Encerra a simulação
  end

endmodule