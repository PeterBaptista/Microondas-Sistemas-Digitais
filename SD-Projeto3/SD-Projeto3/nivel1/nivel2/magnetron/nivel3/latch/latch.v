module latch(input wire set, reset,
            output reg Q);
  
  always@*
    if (set == 0 && reset == 0)
      begin
      Q <= Q;
      end
  	else if (set == 0 && reset == 1)
      begin
      Q <= 0;
      end
    else if (set == 1 && reset == 0)
      begin
      Q <= 1;
      end
    else if (set == 1 && reset == 1)
      begin
      Q <= 0;
      end
  
endmodule