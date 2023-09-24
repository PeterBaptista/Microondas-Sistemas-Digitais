timescale 1ns/1ps
`include "Microondas-Sistemas-Digitais\respostas\Q3\bcd\bcd_to_binary.v"
`include "Microondas-Sistemas-Digitais\respostas\Q3\counter_mod6\counter_mod6.v"
`include "Microondas-Sistemas-Digitais\respostas\Q3\counter_mod10\counter_mod10.v"

module timer(
  input wire [3:0] min_in, sec_tens_in, sec_ones_in,
  input wire clk,
  input wire load_n,
  input wire clear_n,
  input wire enable,
  output wire tc_min, tc_sec_tens, tc_sec_ones,
  output reg [3:0] min_out, sec_tens_out, sec_ones_out
);

  // Declaração dos módulos timer_mod10 e timer_mod6
  timer_mod10 min_counter(min_in, clk, load_n, clear_n, enable, tc_min, min_out);
  timer_mod10 sec_tens_counter(sec_tens_in, clk, load_n, clear_n, enable, tc_sec_tens, sec_tens_out);
  timer_mod6 sec_ones_counter(sec_ones_in, clk, load_n, clear_n, enable, tc_sec_ones, sec_ones_out);

endmodule