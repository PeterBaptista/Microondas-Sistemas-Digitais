module LogicGates (
    input wire a,       // Entrada A
    input wire b,       // Entrada B
    output wire and_out, // Saída da porta lógica AND
    output wire or_out,  // Saída da porta lógica OR
    output wire not_out  // Saída da porta lógica NOT
);

    // Implementação das portas lógicas
    assign and_out = a & b;  // Saída AND
    assign or_out = a | b;   // Saída OR
    assign not_out = ~a;     // Saída NOT (inverte a entrada A)

endmodule