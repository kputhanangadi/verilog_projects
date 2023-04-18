module HA(LEDR, SW);
    input [1:0] SW;
    output [1:0] LEDR;
    assign LEDR[0]= ((!SW[0] && SW[1]) || ((!SW[1])&&SW[0]); // sum
    assign LEDR[1]= SW[0] && SW[1]; // carry
endmodule
---
module FA(LEDR, SW);
    input [2:0] SW; // x=SW[0], y=SW[1], cin = SW[2]
    output [1:0] LEDR; // S= LEDR[0], C=LEDR[1]
    wire [1:0]h2, h1;;
    halfAdder_P1 H1 (h1, SW);
    halfAdder_P1 H2 (h2, {SW[2],h1[0]});
    assign LEDR[1] = h1[1] || h2[1];
    assign LEDR[0] = h2[0];
endmodule
---
module four_bit_adder(LEDR, SW);
    input [8:0] SW; // A=SW[8:5], B=SW[4:1], Cin=SW[0]
    output [4:0] LEDR; // Cout= LEDR[4], S=LEDR[3:0]
    wire C1, C2, C3;
    FA F1({C1, LEDR[0]}, {SW[0], SW[5], SW[1]});
    FA F2({C2, LEDR[1]}, {C1, SW[6], SW[2]});
    FA F3({C3, LEDR[0]}, {C2, SW[7], SW[3]});
    FA F4({LEDR[4], LEDR[3]}, {C3, SW[8], SW[4]});
endmodule
