`timescale 1ns/1ps
`include "latch.v"

module latch_teste();

    reg settb, resettb;
    wire Qtb;

    latch DUT(.set(settb), .reset(resettb), .Q(Qtb));

    initial begin
        $dumpfile("latch_teste.vcd");
        $dumpvars(0,latch_teste);
            #10 settb = 0; resettb = 0;

            #10 settb = 0; resettb = 1;

            #10 settb = 0; resettb = 0;

            #10 settb = 1; resettb = 0;

            #10 settb = 0; resettb = 0;

            #10 settb = 1; resettb = 1;

            #10 settb = 0; resettb = 0;

            #10;
    end
endmodule