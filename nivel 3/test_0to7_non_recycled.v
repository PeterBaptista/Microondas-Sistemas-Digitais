module test_counter_0to7_non_recycled;

  reg clk;
  reg reset;
  wire [2:0] count;

  // Instância do contador 0-7 não reciclado
  counter_0to7_non_recycled uut (
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
    #30 $finish; // Encerra a simulação após 30 unidades de tempo
  end

  always begin
    #5 clk = ~clk; // Gera uma onda de clock
  end

endmodule