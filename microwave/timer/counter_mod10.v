module counter_mod10 (
  input wire clk,
  input wire clearn,
  input wire loadn,
  input wire enable,
  output wire tc,
  output wire zero,
  input wire [3:0] bcd_digit_input,
  output wire [3:0] bcd_digit_output
);

always @ (negedge clearn)
  begin
    bcd_digit_reg <= 4'b0000;
  end

  reg [3:0] bcd_digit_reg; // Register to hold the BCD digit value

  always @(posedge clk) begin
    
     if (enable) begin
        if (bcd_digit_reg == 4'b0000) begin
          bcd_digit_reg <= 4'b1001; // loadn 9 when it rolls over from 0
        end else begin
          bcd_digit_reg <= bcd_digit_reg - 1;
        end
      end


    if(!loadn)begin 
        bcd_digit_reg <= bcd_digit_input;
    end
end 

  assign bcd_digit_output = bcd_digit_reg;
  assign zero = (bcd_digit_reg == 4'b0000);
  assign tc = enable & zero;

endmodule