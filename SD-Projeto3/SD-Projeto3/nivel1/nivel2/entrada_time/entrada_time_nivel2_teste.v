`timescale 1ns/1ps
`include "entrada_time_nivel2.v"

module entrada_time_nivel2_teste();

    reg [9:0] keypad;
    reg enablen;
    reg clk;
    wire [3:0] D;
    wire loadn;
    wire pgt_1Hz;

    entrada_time_nivel2 DUT(
        .keypad(keypad),
        .enablen(enablen),
        .clk(clk),
        .D(D),
        .loadn(loadn),
        .pgt_1Hz(pgt_1Hz)
    );

    initial begin
        $dumpfile("entrada_time_nivel2_teste.vcd");
        $dumpvars(0, entrada_time_nivel2_teste);

            #1 keypad = 10'b1000000000;
            clk = 1;
            enablen = 0;
            repeat(201)
                #1 clk = ~clk;
            
            #1 keypad = 10'b0100000000;
            clk = 1;
            repeat(201)
                #1 clk = ~clk;

            #1 keypad = 10'b100000000;
            clk = 1;
            enablen = 1;
            repeat(201)
                #1 clk = ~clk;

            enablen = 0;
            repeat(201)
                #1 clk = ~clk;
            
    end
endmodule