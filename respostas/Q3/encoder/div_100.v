module div_100 (
    input wire clk,       // Sinal de clock de entrada
    output wire cycle    // Sinal de saída
);

    reg [6:0] count = 7'b0;  // Registrador de contagem de 7 bits
    reg cycle_aux = 0;

    assign cycle = cycle_aux;

    always @(posedge clk) begin
        begin
            count <= count + 1;  // Incrementa a contage
            
            
            if (count == 100) begin
                
                    count <= 7'b0; // Reinicia a contagem para 0
                    cycle_aux <= !cycle_aux;  
                end
        end
    end
endmodule