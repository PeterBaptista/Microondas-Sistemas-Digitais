module bcd_to_binary(bcd_in, binary_out);
  input [3:0] bcd_in;
  output [2:0] binary_out;

  assign binary_out = (bcd_in == 4'b0000) ? 3'b000 :
                     (bcd_in == 4'b0001) ? 3'b001 :
                     (bcd_in == 4'b0010) ? 3'b010 :
                     (bcd_in == 4'b0011) ? 3'b011 :
                     (bcd_in == 4'b0100) ? 3'b100 :
                     (bcd_in == 4'b0101) ? 3'b101 :
                     (bcd_in == 4'b0110) ? 3'b110 :
                     3'b111;
endmodule