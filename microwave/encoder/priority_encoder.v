module priority_encoder (
  input wire [9:0] keypad,
  input wire enablen,
  output reg [3:0] bcd_output
  
); 

  always @ (keypad) begin
    if (!enablen) begin
      case (keypad)
        10'b0000000001: begin bcd_output = 4'b0000; end
        10'b0000000010: begin bcd_output = 4'b0001; end
        10'b0000000100: begin bcd_output = 4'b0010; end
        10'b0000001000: begin bcd_output = 4'b0011; end
        10'b0000010000: begin bcd_output = 4'b0100; end
        10'b0000100000: begin bcd_output = 4'b0101; end
        10'b0001000000: begin bcd_output = 4'b0110; end
        10'b0010000000: begin bcd_output = 4'b0111; end
        10'b0100000000: begin bcd_output = 4'b1000; end
        10'b1000000000: begin bcd_output = 4'b1001; end
        
      endcase
    end
  end

endmodule