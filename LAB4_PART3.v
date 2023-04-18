module four_bit_add_sub_ovrflw (SW, LEDG, LEDR);
    input [8:0] SW; // A=SW[8:5], B=SW[4:1], Add/Sub=SW[0]
    output [3:0] LEDG; // Output
    output [1:0] LEDR; // Overflow flag
    wire [3:0] sum, B_ones;
    assign B_ones[0] = SW[0]^SW[1] ;
    assign B_ones[1] = SW[0]^SW[2] ;
    assign B_ones[2] = SW[0]^SW[3] ;
    assign B_ones[3] = SW[0]^SW[4] ;
    four_bit_adder(sum, {SW[8:5],B_ones,SW[0]}); // Same as Part II
    assign LEDG = sum;
    assign LEDR = LEDR[0] ; // Put your overflow detection logic on this line.
endmodule
