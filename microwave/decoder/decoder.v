module decoder(
  input wire [3:0] minutes, second_tens, second_units,
  output reg [6:0] minutes_display, second_tens_display, second_units_display
);

    always @(*) begin
    case (minutes)
        4'b0000: minutes_display = 7'b0000001;
        4'b0001: minutes_display = 7'b1001111;
        4'b0010: minutes_display = 7'b0010010;
        4'b0011: minutes_display = 7'b0000110;
        4'b0100: minutes_display = 7'b1001100;
        4'b0101: minutes_display = 7'b0100100;
        4'b0110: minutes_display = 7'b0100000;
        4'b0111: minutes_display = 7'b0001101;
        4'b1000: minutes_display = 7'b0000000;
        4'b1001: minutes_display = 7'b0000100;
        default: minutes_display = 7'b0000000; // Off
    endcase

    case (second_tens)
        4'b0000: second_tens_display = 7'b0000001;
        4'b0001: second_tens_display = 7'b1001111;
        4'b0010: second_tens_display = 7'b0010010;
        4'b0011: second_tens_display = 7'b0000110;
        4'b0100: second_tens_display = 7'b1001100;
        4'b0101: second_tens_display = 7'b0100100;
        4'b0110: second_tens_display = 7'b0100000;
        4'b0111: second_tens_display = 7'b0001101;
        4'b1000: second_tens_display = 7'b0000000;
        4'b1001: second_tens_display = 7'b0000100;
        default: second_tens_display = 7'b0000000; // Off
    endcase

    case (second_units)
        4'b0000: second_units_display = 7'b0000001;
        4'b0001: second_units_display = 7'b1001111;
        4'b0010: second_units_display = 7'b0010010;
        4'b0011: second_units_display = 7'b0000110;
        4'b0100: second_units_display = 7'b1001100;
        4'b0101: second_units_display = 7'b0100100;
        4'b0110: second_units_display = 7'b0100000;
        4'b0111: second_units_display = 7'b0001101;
        4'b1000: second_units_display = 7'b0000000;
        4'b1001: second_units_display = 7'b0000100;
        default: second_units_display = 7'b0000000; // Off
    endcase
    end

endmodule