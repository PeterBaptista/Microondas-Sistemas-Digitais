module test_sr_Latch;

  reg S;
  reg R;
  wire Q;
  wire Q_bar;

  // Instantiate the SR_Latch module under test
  sr_latch dut (
    .S(S),
    .R(R),
    .Q(Q),
    .Q_bar(Q_bar)
  );

  initial begin
    $dumpfile("waveform.vcd"); // Especifique o nome do arquivo de forma de onda
    $dumpvars(0, test_sr_Latch);  // Dump de todas as variáveis

    // Inicialize os sinais
    S = 0;
    R = 0;

    // Teste o comportamento do SR Latch
    #10 S = 1; // Defina o latch
    #10 R = 1; // Redefina o latch
    #10 S = 0; // Defina o latch novamente
    #10 R = 0; // Redefina o latch novamente
    #10 S = 1; // Defina o latch
    #10 R = 1; // Redefina o latch
    #10 S = 0; // Defina o latch novamente
    #10 R = 0;
    #10;      // Mantenha no estado atual

    // Encerre a simulação
    $finish;
  end

endmodule