`include "counter_mod10.v"
`include "counter_mod6.v"

module timer (
  input wire clk,
  input wire clear,
  input wire load,
  input wire stop,
  input wire [3:0] bcd_input,
  output wire zero,
  output wire [3:0] bcd_output_usec,
  output wire [3:0] bcd_output_dsec,
  output wire [3:0] bcd_output_min
);

  wire tc_counter_mod10_usec;
  wire tc_counter_mod6_dsec;

  wire zero_counter_mod10_usec;
  wire zero_counter_mod6_dsec;
  wire zero_counter_mod10_min;

  wire [3:0] bcd_digit_output_counter_mod10_usec;
  wire [3:0] bcd_digit_output_counter_mod6_dsec;
  wire [3:0] bcd_digit_output_counter_mod10_min;

  // Instantiate the counter_mod10 module
  counter_mod10 counter_mod10_usec (
    .clk(clk),
    .clear(clear),
    .load(load),
    .stop(stop),
    .tc(tc_counter_mod10_usec),
    .zero(zero_counter_mod10),
    .bcd_digit_input(bcd_input),
    .bcd_digit_output(bcd_digit_output_counter_mod10_usec)
  );

  counter_mod6 counter_mod6_dsec (
    .clk(clk),
    .clear(clear),
    .load(load),
    .stop(tc_counter_mod10_usec),
    .tc(tc_counter_mod6_dsec),
    .zero(zero_counter_mod6_dsec),
    .bcd_digit_input(bcd_digit_output_counter_mod10_usec),
    .bcd_digit_output(bcd_digit_output_counter_mod6_dsec)
  );

  counter_mod10 counter_mod10_min (
    .clk(clk),
    .clear(clear),
    .load(load),
    .stop(tc_counter_mod6_dsec),
    .tc(tc_counter_mod10_min),
    .zero(zero_counter_mod10_min),
    .bcd_digit_input(bcd_digit_output_counter_mod6_dsec),
    .bcd_digit_output(bcd_digit_output_counter_mod10_min)
  );


  assign zero =  zero_counter_mod10_min & zero_counter_mod6_dsec & zero_counter_mod10_usec;

  assign bcd_output_usec = bcd_digit_output_counter_mod10_usec;
  assign bcd_output_dsec = bcd_digit_output_counter_mod6_dsec;
  assign bcd_output_min = bcd_digit_output_counter_mod10_min;


endmodule