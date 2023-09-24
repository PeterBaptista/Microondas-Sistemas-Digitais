module div_100 (
    input wire clk,       // Sinal de clock de entrada
    output reg cycle;       // Sinal de saída
);

    reg [6:0] count = 7'b0;  // Registrador de contagem de 7 bits

    always @(posedge clk) begin
        if (count >= 99)     // Verifica se a contagem atingiu 99
            begin
                count <= 7'b0; // Reinicia a contagem para 0
                cycle <= 1'b1;    // Define a saída como 1
            end
        else
            begin
                count <= count + 1;  // Incrementa a contagem
                cycle <= 1'b0;          // Mantém a saída em 0
            end
    end

endmodule