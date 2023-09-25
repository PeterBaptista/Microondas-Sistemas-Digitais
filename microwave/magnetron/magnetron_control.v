`include "magnetron/logic_circuits.v"
`include "magnetron/sr_latch.v"

module magnetron_control(
    input wire startn,
    input wire stopn,
    input wire clearn,
    input wire door_closed,
    input wire timer_done,
    output wire mag_on
);

    wire set_aux;
    wire reset_aux;

    logic_circuits logic_circuits_inst(
        .startn(startn),
        .stopn(stopn),
        .clearn(clearn),
        .door_closed(door_closed),
        .timer_done(timer_done),
        .set(set_aux),
        .reset(reset_aux)

    );

    sr_latch sr_latch_inst(
        .set(set_aux),
        .reset(reset_aux),
        .mag_on(mag_on)
    );



endmodule

