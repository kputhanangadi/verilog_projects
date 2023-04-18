// The aim of this project is to design and implement Verilog code for a 4-bit ripple carry adder using four FullAdders.

module four_bit_add_sub (SW, LEDG);
    input [8:0] SW; // A=SW[8:5], B=SW[4:1], Add/Sub=SW[0]
    output [3:0] LEDG; // Sum output
    wire [3:0] B_ones, sum;
    assign B_ones[0] = SW[0]^SW[1} ;
    assign B_ones[1] = SW[0]^SW[1} ;
    assign B_ones[2] = SW[0]^SW[1} ;
    assign B_ones[3] = SW[0]^SW[1} ;
    four_bit_adder(sum, {SW[8:5],B_ones,SW[0]});
    assign LEDG = sum;
endmodule
