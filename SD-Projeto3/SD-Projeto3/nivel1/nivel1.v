`include "nivel2/contador/contador_nivel2.v"
`include "nivel2/decodificador/decodificador.v"
`include "nivel2/entrada_time/entrada_time_nivel2.v"
`include "nivel2/magnetron/nivel2_controle.v"

// v O que escrever no terminal:
//iverilog -o nivel1_tb.vvp nivel1_tb.v
//vvp nivel1_tb.vvp
//gtkwave nivel1.vcd

// v Problema no nome do módulo (tava como nivel2_controle)
module nivel1(
    input wire [9:0]keypad,
    input wire clock, startn, stopn, clearn, door_closed,
    output wire [6:0] minutos, 
    output wire [6:0] dezenas, 
    output wire [6:0] segundos,
    output wire mag_on);

wire saida_controle;
wire [3:0] D;
wire loadn;
wire pgt_1Hz;
wire zero;

assign mag_on = saida_controle;

wire [3:0] count_us, count_ds, count_m; 
// us = unidade de segundo
// ds = dezena de segundo
// m = minuto

// codificador
entrada_time_nivel2 entrada_time_nivel2(keypad, saida_controle, clock, D, loadn, pgt_1Hz);

// timer
contador_nivel2 contador_nivel2(D, pgt_1Hz, saida_controle, loadn, clearn, count_us, count_ds, count_m, zero);

// controle do magnetron
nivel2_controle nivel2_controle(startn, stopn, clearn, door_closed, zero, saida_controle);

// decodificador / drivers de 7 segmentos
decodificador decodificador(count_m, count_ds, count_us, minutos, dezenas, segundos);

endmodule