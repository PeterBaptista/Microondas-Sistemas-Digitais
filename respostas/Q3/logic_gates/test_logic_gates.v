module testbench_logic_gates;

    // Declaração dos sinais de entrada e saída
    reg a, b;
    wire and_out, or_out, not_out;

    // Instância do módulo logic_gates
    logic_gates uut (
        .a(a),
        .b(b),
        .and_out(and_out),
        .or_out(or_out),
        .not_out(not_out)
    );

    // Simulação de estímulo
    initial begin
       
       // Start simulation
      $dumpfile("waveform.vcd"); // Specify the waveform file name
      $dumpvars(0, testbench_logic_gates);  // Dump all variables

        // Teste 1: AND
        a = 1;
        b = 1;
        #10;
       

        // Teste 2: OR
        a = 0;
        b = 1;
        #10;
        

        // Teste 3: NOT
        a = 0;
        #10;
      

        // Encerrar a simulação
        $display("Simulação concluída!");
        $finish;
    end

endmodule