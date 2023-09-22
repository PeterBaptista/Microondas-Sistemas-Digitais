module test_sr_latch;

  reg s, r;
  wire q, q_bar;

  // Instância do Latch SR
  sr_latch uut (
    .s(s),
    .r(r),
    .q(q),
    .q_bar(q_bar)
  );

  initial begin
    s = 0;
    r = 1;

    // Simulação do Latch SR
    #10 s = 1; // Define q para 1
    #10 r = 0; // Define q para 0
    #10 r = 1;

    $finish; // Encerra a simulação
  end

endmodule