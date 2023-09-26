`timescale 1ns/1ns
`include "codificador_priori.v"

module codificador_priori_teste;

    reg [9:0]teclado_TB;
    reg enablen_TB;
  	//wire dado_valido_TB;
    wire [3:0]BCD_TB;

  	codificador_priori DUT(.teclado(teclado_TB), .enablen(enablen_TB), .BCD(BCD_TB));

    initial
        begin

            $dumpfile("codificador_priori_teste.vcd");
            $dumpvars(0, codificador_priori_teste);

                teclado_TB=10'b1000000000; enablen_TB=0;
            #5  teclado_TB=10'b0100000000; enablen_TB=0; 
           	#5  teclado_TB=10'b0010000000; enablen_TB=0;
          	#5  teclado_TB=10'b0001000000; enablen_TB=0;
          	#5  teclado_TB=10'b0000100000; enablen_TB=0;
          	#5  teclado_TB=10'b0000010000; enablen_TB=0;
          	#5  teclado_TB=10'b0000001000; enablen_TB=0;
            #5  teclado_TB=10'b0000000100; enablen_TB=0;
          	#5  teclado_TB=10'b0000000010; enablen_TB=0;
            #5  teclado_TB=10'b0000000001; enablen_TB=0;

            #5  teclado_TB=10'b1000000000; enablen_TB=1;
            #5  teclado_TB=10'b0100000000; enablen_TB=1; 
           	#5  teclado_TB=10'b0010000000; enablen_TB=1;
          	#5  teclado_TB=10'b0001000000; enablen_TB=1;
          	#5  teclado_TB=10'b0000100000; enablen_TB=1;
          	#5  teclado_TB=10'b0000010000; enablen_TB=1;
          	#5  teclado_TB=10'b0000001000; enablen_TB=1;
            #5  teclado_TB=10'b0000000100; enablen_TB=1;
          	#5  teclado_TB=10'b0000000010; enablen_TB=1;
            #5  teclado_TB=10'b0000000001; enablen_TB=1;

            #5 teclado_TB = 10'b1000000001; enablen_TB=0;
            #5 teclado_TB = 10'b1000001001; enablen_TB=0;
            #5 teclado_TB = 10'b1000000001; enablen_TB=1;
            #5 teclado_TB = 10'b1000001001; enablen_TB=1;

          
        end
endmodule