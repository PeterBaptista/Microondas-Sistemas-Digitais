`include "nivel2/contador/nivel3/contador_mod10/contador_mod10.v"
`include "nivel2/contador/nivel3/contador_mod6/contador_mod6.v"
// (Mudar o endereço dos arquivos se for fazer teste local)
`timescale 1ns/1ps

module contador_nivel2(data, clk, enable, load, clear, count_us, count_ds, count_m, zero);

  input [3:0] data;
  input wire clk, enable, load, clear; // Lembrar q aq tudo menos o clk tá invertido (load equivale a loadn...)
  output wire [3:0] count_us, count_ds, count_m;
  output wire zero;
  
  wire tc1;
  wire tc2;
  wire tc3;
  wire zero1;
  wire zero2;
  wire zero3;

  // Quando a contagem chegar em 0, o controle do magnetron vai
  // ordenar a parada dele, e esse output do controle do magnetron
  // Vai ser também o enable desse contador, logo, o enable = 0 e
  // o contador irá parar automaticamente.

  // v Problema no nome dos módulos referenciados (consertado)
  contador_mod10 us(data, clk, load, enable, clear, count_us, tc1, zero1);
  contador_mod6 ds(count_us, clk, load, tc1, clear, count_ds, tc2, zero2);
  
  // v Problema no nome do módulo referenciado (consertado)
  contador_mod10 ms(count_ds, clk, load, tc2, clear, count_m, tc3, zero3);

  assign zero = zero1 & zero2 & zero3;
endmodule