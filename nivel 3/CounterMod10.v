module CounterMod10(clk, reset, count_out);
  input clk, reset;
  output [3:0] count_out;
  
  reg [3:0] count;

  always @(posedge clk or posedge reset)
  begin
    if (reset)
      count <= 4'b0000;
    else if (count == 4'b1001)
      count <= 4'b0000;
    else
      count <= count + 1;
  end

  assign count_out = count;
endmodule