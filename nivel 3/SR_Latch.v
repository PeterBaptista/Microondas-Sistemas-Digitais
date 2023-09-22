module SR_Latch (
    input wire S,         // Entrada Set
    input wire R,         // Entrada Reset
    output reg Q,         // Saída Q
    output reg Q_bar      // Saída complementar de Q (Q invertido)
);

    always @(S, R) begin
        if (R == 1'b0) begin
            Q <= 1'b0;   // Se R for 0, o latch é reset (Q = 0)
            Q_bar <= 1'b1;
        end else if (S == 1'b0) begin
            Q <= 1'b1;   // Se S for 0, o latch é set (Q = 1)
            Q_bar <= 1'b0;
        end
    end

endmodule