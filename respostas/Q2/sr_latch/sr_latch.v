module sr_latch (
    input wire S,         // Entrada Set
    input wire R,         // Entrada Reset
    output reg Q,         // Saída Q
    output reg Q_bar      // Saída complementar de Q (Q invertido)
);

    always @(S, R) begin
        case ({S, R})
            2'b00: begin
                Q <= Q;       // Se S e R forem ambos 0, mantenha o estado atual
                Q_bar <= Q_bar;
            end
            2'b01: begin
                Q <= 1'b0;    // Se S for 0 e R for 1, o latch é reset (Q = 0)
                Q_bar <= 1'b1;
            end
            2'b10: begin
                Q <= 1'b1;    // Se S for 1 e R for 0, o latch é set (Q = 1)
                Q_bar <= 1'b0;
            end
            2'b11: begin
                Q <= Q;       // Se S e R forem ambos 1, mantenha o estado atual
                Q_bar <= Q_bar;
            end
        endcase
    end

endmodule





