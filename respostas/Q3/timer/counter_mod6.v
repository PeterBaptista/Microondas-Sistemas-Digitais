module counter_mod6 (
  input wire clk,
  input wire clear,
  input wire load,
  input wire stop,
  output wire tc,
  output wire zero,
  input wire [3:0] bcd_digit_input,
  output wire [3:0] bcd_digit_output
);


  reg [3:0] bcd_digit_reg; // Register to hold the BCD digit value

  always @(posedge clk) begin
    if (clear) begin
      bcd_digit_reg <= 4'b0000;
    end else if (!stop) begin
      if (load) begin
        bcd_digit_reg <= bcd_digit_input;
      end else begin
        if (bcd_digit_reg == 4'b0000) begin
          bcd_digit_reg <= 4'b0101; // Load 9 when it rolls over from 0
        end else begin
          bcd_digit_reg <= bcd_digit_reg - 1;
        end
      end
    end
  end

  assign bcd_digit_output = bcd_digit_reg;
  assign zero = (bcd_digit_output == 4'b0000);
  assign tc = !zero;

endmodule