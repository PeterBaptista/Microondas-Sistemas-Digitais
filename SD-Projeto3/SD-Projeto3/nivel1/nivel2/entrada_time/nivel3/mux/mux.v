module mux(input wire sel, saida_contador, Hz,
              output reg Q);
  
  always@*
  if (sel == 0)
    begin
      Q = saida_contador;
    end
  else
      Q = Hz;
  
endmodule