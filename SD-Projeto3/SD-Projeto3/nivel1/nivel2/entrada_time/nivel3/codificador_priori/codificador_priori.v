module codificador_priori(teclado, enablen, BCD);
  // Mudei o valor dos números binários para o normal
  input wire [9:0]teclado;
  input wire enablen;
  output reg [3:0]BCD;
  //output reg dado_valido;

  //initial dado_valido = 1'b0;

  always@(teclado)
    if (enablen == 1'b0)
      begin
        if (teclado[9:0] == 10'b1000000000)
          begin
        	  BCD = 4'b1001;
        	  //dado_valido = 1'b1;
          end
        else if (teclado[9:0] == 10'b0100000000)
          begin
        	  BCD = 4'b1000;
            //dado_valido = 1'b1;
          end
        else if (teclado[9:0] == 10'b0010000000)
          begin
			      BCD = 4'b0111;
        	  //dado_valido = 1'b1;
          end
        else if (teclado[9:0] == 10'b0001000000)
          begin
            BCD = 4'b0110;
            //dado_valido = 1'b1;
          end 
        else if (teclado[9:0] == 10'b0000100000)
          begin 
			      BCD = 4'b0101;
            //dado_valido = 1'b1;
          end 
        else if (teclado[9:0] == 10'b0000010000)
          begin
			      BCD = 4'b0100;
            //dado_valido = 1'b1;
          end 
        else if (teclado[9:0] == 10'b0000001000)
          begin
			      BCD = 4'b0011;
            //dado_valido = 1'b1;
          end 
        else if (teclado[9:0] == 10'b0000000100)
          begin 
			      BCD = 4'b0010;
            //dado_valido = 1'b1;
          end 
        else if (teclado[9:0] == 10'b0000000010)
          begin 
			      BCD = 4'b0001;
            //dado_valido = 1'b1;
          end 
        else if (teclado[9:0] == 10'b0000000001)
          begin
			      BCD = 4'b0000;
            //dado_valido = 1'b1;
          end

  	end
endmodule