`include "encoder/priority_encoder.v"
`include "encoder/div_100.v"
`include "encoder/mux_2to1.v"
`include "encoder/counter_0to7.v"

module encoder( input wire [9:0] keypad,
                input wire enablen,
                input wire clk,
                output wire [3:0] bcd_output,
                output wire loadn,
                output wire pgt_1hz
                );

    
    wire delay_aux;
    wire cycle_aux;

    priority_encoder priority_encoder_inst (
        .keypad(keypad),
        .enablen(enablen),
        .bcd_output(bcd_output),
        .valid(loadn)
    );

    div_100 div_100_inst (
        .clk(clk),
        .cycle(cycle_aux)
    );

   

    counter_0to7 counter_0to7_inst (
        .clear(loadn),
        .clk(clk),
        .delay(delay_aux)
    );



    mux_2to1 mux_2to1_inst(
        .enablen(enablen),
        .delay(delay_aux),
        .cycle(cycle_aux),
        .pgt_1hz(pgt_1hz)
    );
    



endmodule