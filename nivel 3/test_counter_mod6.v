module test_counter_mod6;

  reg clk;
  reg reset;
  wire [2:0] count;

  // Instância do contador mod6
  counter_mod6 uut (
    .clk(clk),
    .reset(reset),
    .count(count)
  );

  initial begin
    clk = 0;
    reset = 0;

    // Simulação do contador
    #10 reset = 1; // Ativa o reset
    #10 reset = 0; // Desativa o reset
    #50 $finish; // Encerra a simulação após 50 unidades de tempo
  end

  always begin
    #5 clk = ~clk; // Gera uma onda de clock
  end

endmodule