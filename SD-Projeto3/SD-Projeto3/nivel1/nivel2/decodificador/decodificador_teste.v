`timescale 1ns/1ns
`include "decodificador.v"

module decodificador_teste;

    reg [3:0] Minutos_TB, DezenaSeg_TB, Segundos_TB;
  	wire [6:0] OutMinutos_TB, OutDezena_TB, OutSegundos_TB;

  	decodificador DUT(.Minutos(Minutos_TB), .DezenaSeg(DezenaSeg_TB), .Segundos(Segundos_TB), .OutMinutos(OutMinutos_TB), .OutDezena(OutDezena_TB), .OutSegundos(OutSegundos_TB));

    initial
        begin

            $dumpfile("decodificador_teste.vcd");
            $dumpvars(0, decodificador_teste);

                Minutos_TB=4'b0000; DezenaSeg_TB=4'b0000; Segundos_TB=4'b0000;  
            #5  Minutos_TB=4'b0001; DezenaSeg_TB=4'b0001; Segundos_TB=4'b0001; 
         	  #5  Minutos_TB=4'b0010; DezenaSeg_TB=4'b0010; Segundos_TB=4'b0010;
            #5  Minutos_TB=4'b0011; DezenaSeg_TB=4'b0011; Segundos_TB=4'b0011;
            #5  Minutos_TB=4'b0100; DezenaSeg_TB=4'b0100; Segundos_TB=4'b0100;
            #5  Minutos_TB=4'b0101; DezenaSeg_TB=4'b0101; Segundos_TB=4'b0101;
          	#5  Minutos_TB=4'b0110; DezenaSeg_TB=4'b0110; Segundos_TB=4'b0110;
            #5  Minutos_TB=4'b0111; DezenaSeg_TB=4'b0111; Segundos_TB=4'b0111;
          	#5  Minutos_TB=4'b1000; DezenaSeg_TB=4'b1000; Segundos_TB=4'b1000;
            #5  Minutos_TB=4'b1001; DezenaSeg_TB=4'b1001; Segundos_TB=4'b1001;    
        end
endmodule