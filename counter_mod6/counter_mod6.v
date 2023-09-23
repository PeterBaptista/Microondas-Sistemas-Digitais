module counter_mod6(clk, reset, count_out);
  input clk, reset;
  output [2:0] count_out;
  
  reg [2:0] count;

  always @(posedge clk or posedge reset)
  begin
    if (reset)
      count <= 3'b000;
    else if (count == 3'b110)
      count <= 3'b000;
    else
      count <= count + 1;
  end

  assign count_out = count;
endmodule