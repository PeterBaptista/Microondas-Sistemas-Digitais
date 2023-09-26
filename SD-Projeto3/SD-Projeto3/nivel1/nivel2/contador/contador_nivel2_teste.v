`timescale 1ns/1ps
`include "contador_nivel2.v"

module contador_nivel2_teste();
    wire[3:0] minutes_tb, tens_secs_tb, secs_tb;
    wire timer_done_tb;
    reg [3:0]  data_tb;
    reg clearn_tb, enable_tb, loadn_tb, CLK_tb;

    contador_nivel2 DUT(data_tb, CLK_tb, enable_tb, loadn_tb, clearn_tb,
                  secs_tb, tens_secs_tb, minutes_tb, timer_done_tb);

    initial begin
        $dumpfile("contador_nivel2_teste.vcd");
        $dumpvars(0,contador_nivel2_teste);
        CLK_tb  = 1'b0;
        enable_tb = 1'b0; 
        loadn_tb  = 1'b0;
    end

    always begin
        #1 CLK_tb = loadn_tb? ~CLK_tb : CLK_tb;
    end

    initial begin    

        clearn_tb = 1'b1; #0.5
        clearn_tb = 1'b0; #0.5
        clearn_tb = 1'b1; #0.5

        data_tb =  2;   #0.04;
        CLK_tb = 1'b1;   #0.01;
        CLK_tb = 1'b0;   #0.95;

        data_tb =  1;   #0.04;
        CLK_tb = 1'b1;   #0.01;
        CLK_tb = 1'b0;   #0.95;

        data_tb =  7;   #0.04;
        CLK_tb = 1'b1;   #0.01;
        CLK_tb = 1'b0;   #0.95;

        data_tb =  9;   #0.04;
        CLK_tb = 1'b1;   #0.01;
        CLK_tb = 1'b0;   #0.95;

        enable_tb = 1; loadn_tb = 1; #1000;

        $finish();
    end
endmodule