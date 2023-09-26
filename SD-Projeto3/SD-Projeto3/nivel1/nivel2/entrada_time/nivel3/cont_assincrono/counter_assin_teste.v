`timescale 1ns/1ns
`include "counter_assin.v"

module counter_assin_teste;

    reg clock_TB, clear_TB, contador_TB;
  	wire  Q_TB;

  	counter_assin DUT(.clock(clock_TB), .clear(clear_TB), .Q(Q_TB));

    initial
        begin

            $dumpfile("counter_assin_teste.vcd");
            $dumpvars(0, counter_assin_teste);

                clock_TB = 1; clear_TB=1; contador_TB = 0;
            #5   contador_TB = 3;
            #5   clear_TB = 0; 
          
            repeat(8)
                begin
                    #10 clock_TB = ~clock_TB;
                end

        end
endmodule