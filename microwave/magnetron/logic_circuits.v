module logic_circuits(
    input wire startn,
    input wire stopn,
    input wire clearn,
    input wire door_closed,
    input wire timer_done,
    output wire set,
    output wire reset
);

    assign set = (~startn) & door_closed & (~timer_done);
    assign reset = (~door_closed) | (~clearn) | (~stopn) | timer_done;

endmodule