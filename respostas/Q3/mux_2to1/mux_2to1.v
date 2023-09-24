module mux_2to1 (
  input wire sel,      // Selection input
  input wire in0,    // Input data 0
  input wire in1,    // Input data 1
  output wire out      // Output
);

  assign out = (sel == 1'b0) ? in0 : in1;

endmodule