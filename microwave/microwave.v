`include "magnetron/magnetron_control.v"
`include "timer/timer.v"
`include "encoder/encoder.v"
`include "decoder/decoder.v"

module microwave(
    input wire startn,
    input wire stopn,
    input wire clearn,
    input wire door_closed,
    input wire [9:0] keypad,
    input wire clk,
    output wire mag_on,
    output wire [6:0] second_units_display,
    output wire [6:0] second_tens_display,
    output wire [6:0] minutes_display
);
// fio intermediario (output magnetron)
wire mag_on_aux;

// fios intermediarios (outputs encoder)
wire [3:0] bcd_output_aux;
wire pgt_1hz_aux;
wire loadn_aux;

//fios intermediarios (outputs timer)
wire zero_aux;
wire [3:0] bcd_output_usec_aux;
wire [3:0] bcd_output_dsec_aux;
wire [3:0] bcd_output_min_aux;

//fios intermediarios (outputs decoder)
wire [6:0] minutes_display_aux;
wire [6:0] second_tens_display_aux;
wire [6:0] second_units_display_aux;



timer timer_inst(
    .clk(pgt_1hz_aux),
    .clearn(clearn),
    .loadn(loadn_aux),
    .enable(mag_on_aux),
    .bcd_input(bcd_output_aux),
    .zero(zero_aux),
    .bcd_output_usec(bcd_output_usec_aux),
    .bcd_output_dsec(bcd_output_dsec_aux),
    .bcd_output_min(bcd_output_min_aux)
);

magnetron_control magnetron_control_inst(
    .startn(startn),
    .stopn(stopn),
    .clearn(clearn),
    .door_closed(door_closed),
    .timer_done(zero_aux),
    .mag_on(mag_on_aux)
);

encoder encoder_inst(
    .keypad(keypad),
    .enablen(mag_on_aux),
    .clk(clk),
    .bcd_output(bcd_output_aux),
    .loadn(loadn_aux),
    .pgt_1hz(pgt_1hz_aux)
);

decoder decoder_inst(
    .minutes(bcd_output_min_aux),
    .second_tens(bcd_output_dsec_aux),
    .second_units(bcd_output_usec_aux),
    .minutes_display(minutes_display_aux),
    .second_tens_display(second_tens_display_aux),
    .second_units_display(second_units_display_aux)
);

assign second_units_display = second_units_display_aux;
assign second_tens_display = second_tens_display_aux;
assign minutes_display = minutes_display_aux;

assign mag_on = mag_on_aux;

endmodule