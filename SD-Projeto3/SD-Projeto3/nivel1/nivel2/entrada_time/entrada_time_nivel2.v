`include "nivel2/entrada_time/nivel3/codificador_priori/codificador_priori.v"
`include "nivel2/entrada_time/nivel3/cont_assincrono/counter_assin.v"
`include "nivel2/entrada_time/nivel3/divisor_freq/divi.v"
`include "nivel2/entrada_time/nivel3/mux/mux.v"
// (Mudar o endereço dos arquivos se for fazer teste local)

module entrada_time_nivel2(input [9:0] keypad,
    input enablen,
    input clk,
    output [3:0] D,
    output loadn,
    output pgt_1Hz);

    wire clk100, Q;
    
    // Ao invés do codificador de prioridade ter o loadn como saída,
    // ele já é decidido por fora, ou seja, no nível 2,
    // quando é detectado se uma tecla foi pressionada ou não.
    reg keypad_pressed;
    
    initial keypad_pressed = 0;

    always @(keypad) begin
        if(keypad == 10'b00000_00000)
            keypad_pressed <= 0;
        else
            keypad_pressed <= 1;
    end

    assign loadn = ~keypad_pressed;

    codificador_priori codificador_priori(keypad, enablen, D);
    divi divi(clk, clk100);
    counter counter(clk, loadn, Q);
    mux mux(enablen, Q, clk100, pgt_1Hz);


endmodule