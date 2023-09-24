module sr_latch (
    input wire set,         
    input wire reset,         
    output reg mag_on        
);

    always @(set, reset) begin
        case ({set, reset})
            2'b00: begin
                mag_on <= mag_on;       // Se set e R forem ambos 0, mantenha o estado atual
                
            end
            2'b01: begin
                mag_on <= 0;    // Se set for 0 e R for 1, o latch é reset (Q = 0)
                
            end
            2'b10: begin
                mag_on <= 1;    // Se set for 1 e R for 0, o latch é set (Q = 1)
                
            end
            2'b11: begin
                mag_on <= 0;       // Se set e R forem ambos 1, mantenha o estado atual
                
            end
        endcase
    end

endmodule





