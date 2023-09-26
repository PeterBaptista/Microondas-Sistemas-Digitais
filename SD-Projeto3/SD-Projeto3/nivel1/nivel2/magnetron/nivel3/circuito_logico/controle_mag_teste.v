`timescale 1ns/1ns
`include "control_mag.v"

module control_mag_teste;

    reg startn_TB, stopn_TB, clearn_TB, door_closed_TB, timer_done_TB;
  	wire  set_TB, reset_TB;

  	control_mag DUT(.startn(startn_TB), .stopn(stopn_TB), .clearn(clearn_TB), .door_closed(door_closed_TB), .timer_done(timer_done_TB), .set(set_TB), .reset(reset_TB));

    initial
        begin

            $dumpfile("control_mag_teste.vcd");
            $dumpvars(0, control_mag_teste);

                startn_TB=1; stopn_TB=0; clearn_TB=0; door_closed_TB=0; timer_done_TB=0;
            #5  startn_TB=1; stopn_TB=0; clearn_TB=0; door_closed_TB=1; timer_done_TB=0;
         	  #5  startn_TB=1; stopn_TB=1; clearn_TB=0; door_closed_TB=1; timer_done_TB=0;
            #5  startn_TB=1; stopn_TB=0; clearn_TB=0; door_closed_TB=1; timer_done_TB=0;
            #5  startn_TB=1; stopn_TB=0; clearn_TB=0; door_closed_TB=1; timer_done_TB=1;
            #5  startn_TB=1; stopn_TB=0; clearn_TB=0; door_closed_TB=0; timer_done_TB=0;
          	#5  startn_TB=1; stopn_TB=0; clearn_TB=1; door_closed_TB=1; timer_done_TB=1;
            #5  startn_TB=1; stopn_TB=0; clearn_TB=0; door_closed_TB=1; timer_done_TB=0;
          	#5  startn_TB=1; stopn_TB=1; clearn_TB=1; door_closed_TB=1; timer_done_TB=1;
            #5  startn_TB=0; stopn_TB=1; clearn_TB=1; door_closed_TB=1; timer_done_TB=1;
            #5  startn_TB=0; stopn_TB=0; clearn_TB=0; door_closed_TB=0; timer_done_TB=0;
          
        end
endmodule