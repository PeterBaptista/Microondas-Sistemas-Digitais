module counter_frequency_div_100 (
    input wire clk,       // Sinal de clock de entrada
    output wire clk_div100       // Sinal de saída
);
    reg out;
    reg [6:0] count = 7'b0;  // Registrador de contagem de 7 bits
    
    assign clk_div100 = out;

    always @(posedge clk) begin
        if (count >= 99)     // Verifica se a contagem atingiu 99
            begin
                count <= 7'b0; // Reinicia a contagem para 0
                out <= 1'b1;    // Define a saída como 1
            end
        else
            begin
                count <= count + 1;  // Incrementa a contagem
                out <= 1'b0;          // Mantém a saída em 0
            end
    end

endmodule