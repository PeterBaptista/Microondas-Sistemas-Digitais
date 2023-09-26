module counter(input wire clock, clear, 
                output reg Q);
	
  reg [2:0] contador;
  always @(posedge clock or posedge clear) 
    begin 
      if (clear)
        begin
          contador = 3'b000;
          Q = 0;
        end
      else
        if (contador == 3)
          begin
           Q = 1;
           contador = contador + 1'b1;
          end
        else if(contador < 7)
          begin
            contador = contador + 1'b1;
          end
    end 
endmodule