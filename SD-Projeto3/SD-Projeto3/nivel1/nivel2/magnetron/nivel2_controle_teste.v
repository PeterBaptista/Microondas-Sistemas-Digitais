`timescale 1ns/1ns
`include "nivel2_controle.v"

module nivel2_controle_teste;

    reg startn_TB, stopn_TB, clearn_TB, door_closed_TB, timer_done_TB;
  	wire  Q_TB;

  	nivel2_controle DUT(.startn(startn_TB), .stopn(stopn_TB), .clearn(clearn_TB), .door_closed(door_closed_TB), .timer_done(timer_done_TB), .Q2(Q_TB));

    initial
        begin

            $dumpfile("nivel2_controle_teste.vcd");
            $dumpvars(0, nivel2_controle_teste);

                startn_TB=1; stopn_TB=0; clearn_TB=0; door_closed_TB=0; timer_done_TB=0;
            #5  startn_TB=1; stopn_TB=0; clearn_TB=0; door_closed_TB=1; timer_done_TB=0;
         	  #5  startn_TB=1; stopn_TB=1; clearn_TB=0; door_closed_TB=1; timer_done_TB=0;
            #5  startn_TB=1; stopn_TB=0; clearn_TB=0; door_closed_TB=1; timer_done_TB=0;
            #5  startn_TB=1; stopn_TB=0; clearn_TB=0; door_closed_TB=0; timer_done_TB=0;
            #5  startn_TB=1; stopn_TB=0; clearn_TB=0; door_closed_TB=1; timer_done_TB=1;
            #5  startn_TB=1; stopn_TB=0; clearn_TB=0; door_closed_TB=1; timer_done_TB=0;
          	#5  startn_TB=1; stopn_TB=0; clearn_TB=1; door_closed_TB=1; timer_done_TB=1;
            #5  startn_TB=1; stopn_TB=0; clearn_TB=0; door_closed_TB=1; timer_done_TB=0;
          	#5  startn_TB=1; stopn_TB=1; clearn_TB=1; door_closed_TB=1; timer_done_TB=1;
            #5  startn_TB=0; stopn_TB=1; clearn_TB=1; door_closed_TB=1; timer_done_TB=1;
            #5  startn_TB=0; stopn_TB=0; clearn_TB=0; door_closed_TB=0; timer_done_TB=0;
          
        end
endmodule