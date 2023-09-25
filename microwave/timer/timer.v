`include "timer/counter_mod10.v"
`include "timer/counter_mod6.v"

//mudar o load para loadn
//mudar o stop para enable
//mudar clear para clearn

module timer (
  input wire clk,
  input wire clearn,
  input wire loadn,
  input wire enable,
  input wire [3:0] bcd_input,
  output wire zero,
  output wire [3:0] bcd_output_usec,
  output wire [3:0] bcd_output_dsec,
  output wire [3:0] bcd_output_min
);

  wire tc_counter_mod10_usec;
  wire tc_counter_mod6_dsec;
  wire tc_counter_mod10_min_aux;
  wire tc_counter_mod10_min;

  wire zero_counter_mod10_usec;
  wire zero_counter_mod6_dsec;
  wire zero_counter_mod10_min;

  wire [3:0] bcd_digit_output_counter_mod10_usec;
  wire [3:0] bcd_digit_output_counter_mod6_dsec;
  wire [3:0] bcd_digit_output_counter_mod10_min;

  // Instantiate the counter_mod10 module
  counter_mod10 counter_mod10_usec (
    .clk(clk),
    .clearn(clearn),
    .loadn(loadn),
    .enable(enable),
    .tc(tc_counter_mod10_usec),
    .zero(zero_counter_mod10_usec),
    .bcd_digit_input(bcd_input),
    .bcd_digit_output(bcd_digit_output_counter_mod10_usec)
  );

  assign tc_counter_mod10_min_aux = tc_counter_mod10_usec || tc_counter_mod6_dsec;

  counter_mod6 counter_mod6_dsec (
    .clk(clk),
    .clearn(clearn),
    .loadn(loadn),
    .enable(tc_counter_mod10_usec),
    .tc(tc_counter_mod6_dsec),
    .zero(zero_counter_mod6_dsec),
    .bcd_digit_input(bcd_digit_output_counter_mod10_usec),
    .bcd_digit_output(bcd_digit_output_counter_mod6_dsec)
  );

  counter_mod10 counter_mod10_min (
    .clk(clk),
    .clearn(clearn),
    .loadn(loadn),
    .enable(tc_counter_mod10_min_aux),
    .tc(tc_counter_mod10_min),
    .zero(zero_counter_mod10_min),
    .bcd_digit_input(bcd_digit_output_counter_mod6_dsec),
    .bcd_digit_output(bcd_digit_output_counter_mod10_min)
  );


  assign zero =  (zero_counter_mod10_min & zero_counter_mod6_dsec) & zero_counter_mod10_usec;

  assign bcd_output_usec = bcd_digit_output_counter_mod10_usec;
  assign bcd_output_dsec = bcd_digit_output_counter_mod6_dsec;
  assign bcd_output_min = bcd_digit_output_counter_mod10_min;


endmodule