`include "nivel2/magnetron/nivel3/latch/latch.v"
`include "nivel2/magnetron/nivel3/circuito_logico/control_mag.v"
// (Mudar o endereço dos arquivos se for fazer teste local)

module nivel2_controle (
    input wire startn, stopn, clearn, door_closed, timer_done,
    output wire mag_on);

wire saida_set;
wire saida_reset;

control_mag control_mag(startn, stopn, clearn, door_closed, timer_done, saida_set, saida_reset);
latch latch(saida_set, saida_reset, mag_on);

endmodule