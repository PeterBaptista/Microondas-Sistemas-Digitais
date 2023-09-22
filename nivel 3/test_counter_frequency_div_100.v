module test_counter_freq_100;

  reg clk;
  wire out;

  // Instância do contador Freq/100
  counter_freq_100 uut (
    .clk(clk),
    .out(out)
  );

  initial begin
    clk = 0;

    // Simulação do contador
    #50 $finish; // Encerra a simulação após 50 unidades de tempo
  end

  always begin
    #5 clk = ~clk; // Gera uma onda de clock
  end

endmodule