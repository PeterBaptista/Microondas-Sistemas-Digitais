module mux_2to1 (
  input wire enablen,      // Selection input
  input wire delay,    // Input data 0
  input wire cycle,    // Input data 1
  output wire pgt_1hz    // Output
);

  assign pgt_1hz = (enablen == 1'b0) ? delay : cycle;
  

endmodule