module test_counter_mod10;

  reg clk;
  reg reset;
  wire [3:0] count;

  // Instância do contador mod10
  counter_mod10 uut (
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
    #100 $finish; // Encerra a simulação após 100 unidades de tempo
  end

  always begin
    #5 clk = ~clk; // Gera uma onda de clock
  end

endmodule