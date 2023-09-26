`timescale 1ns/1ps
`include "divi.v"

module divi_teste();
   reg clk_tb;
   wire clk100_tb;

   divi dut(.clk(clk_tb),.clk100(clk100_tb));
  
  initial
    begin

        $dumpfile("divi_teste.vcd");
        $dumpvars(0, divi_teste);
            #1 clk_tb = 1'b0;

            repeat(200)
                #1 clk_tb = ~clk_tb;
    end


endmodule