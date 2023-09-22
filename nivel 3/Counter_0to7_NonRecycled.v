module Counter_0to7_NonRecycled (
    input wire clk,       // Sinal de clock de entrada
    output wire [2:0] out // Sinal de saída de 3 bits
);

    reg [2:0] count = 3'b0;  // Registrador de contagem de 3 bits

    always @(posedge clk) begin
        if (count == 3'b111) // Verifica se a contagem atingiu 7 (binário: 111)
            count <= 3'b000; // Reinicia a contagem para 0 (binário: 000)
        else
            count <= count + 1; // Incrementa a contagem
    end

    assign out = count; // Saída é igual à contagem atual

endmodule