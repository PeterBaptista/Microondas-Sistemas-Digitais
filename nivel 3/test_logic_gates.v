module test_logic_gates;

  reg a, b;
  wire and_out, or_out, not_a;

  // Instância das portas lógicas
  and_gate uut_and (
    .a(a),
    .b(b),
    .out(and_out)
  );

  or_gate uut_or (
    .a(a),
    .b(b),
    .out(or_out)
  );

  not_gate uut_not (
    .a(a),
    .out(not_a)
  );

  initial begin
    a = 0;
    b = 1;

    // Simulação das portas lógicas
    #10 a = 1;
    #10 b = 0;
    #10 a = 0;

    $finish; // Encerra a simulação
  end

endmodule