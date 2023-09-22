module test_mux;

  reg [1:0] sel;
  wire in0, in1;
  wire out;

  // Instância do MUX
  mux_2to1 uut (
    .sel(sel),
    .in0(in0),
    .in1(in1),
    .out(out)
  );

  initial begin
    sel = 0;
    in0 = 0;
    in1 = 1;

    // Simulação do MUX
    #10 sel = 1; // Seleciona a entrada in1
    #10 sel = 0; // Seleciona a entrada in0
    #10 sel = 1; // Seleciona a entrada in1

    $finish; // Encerra a simulação
  end

endmodule