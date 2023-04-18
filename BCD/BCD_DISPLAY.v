// The module BCD_DISPLAY displays the bcd value on the specified 7-segment display.

module BCD_DISPLAY (bcd, display);
    input [3:0] bcd;
    output [0:6] display;
    reg [0:6] display;
    always @ (bcd)
    case (bcd)
        4'h0: display = 7'b0000001;
        4'h1: display = 7'b1001111;
        4'h2: display = 7'b0010010;
        4'h3: display = 7'b0000110;
        4'h4: display = 7'b1001100;
        4'h5: display = 7'b0100100;
        4'h6: display = 7'b1100000;
        4'h7: display = 7'b0001111;
        4'h8: display = 7'b0000000;
        4'h9: display = 7'b0001100;
        default: display = 7'b1111111;
    endcase
endmodule
