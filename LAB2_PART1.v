module Lab2Part1 (SW, LEDG);
    input [3:0] SW; // Switches.
    output [3:0] LEDG; // Red LEDs.
    assign LEDG[0] = SW[0]& SW[1] & (!SW[2]|!SW[3]); // s = e.r.(m'+l')
endmodule