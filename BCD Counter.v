// This project involves designing and implementing a Verilog module for a Binary-Coded Decimal (BCD) counter. 
// The module uses a 50 MHz clock to increment the counter every 0.671 seconds and displays the rightmost eight bits of the count on LED outputs for testing purposes. 
// The counter can be reset to zero using a pushbutton input. 
// The BCD counting must have three decimal digits, with each counting from 0 to 9, represented by three signals - bcd2, bcd1, and bcd0 - which correspond to the 100-, 10-, and 1-second columns respectively. 
// The three signals are 4-bit representations of hexadecimal numbers. 
// The task is to modify the module to use a 25-bit count and represent the bcd2, bcd1, and bcd0 signals as respective 100-, 10-, and 1-second columns on the HEX2, HEX1, and HEX0 displays. 
// The accuracy issue with the counting will be addressed in the subsequent part of the lab.

module BCD_Counter (CLOCK_50, KEY, HEX3, HEX2, HEX1, HEX0, LEDG);
    input CLOCK_50;
    input [3:0] KEY;
    output [0:6] HEX3, HEX2, HEX1, HEX0;
    output reg [7:0] LEDG;
    reg [24:0] count;
    reg [3:0] bcd0, bcd1, bcd2;
    always @(posedge CLOCK_50)
    begin
        LEDG <= count[7:0];
        count <= count + 1'b1;
    end
    always @(posedge CLOCK_50)
    if (KEY[0] == 0)
        begin
            bcd0 <= 4'h0;
            bcd1 <= 4'h0;
            bcd2 <= 4'h0;
        end
    else if (count == 0)
        begin
            if (bcd0 == 4'h9)
                begin
                    bcd0 <= 4'h0;
                    if (bcd1 == 4'h9)
                        begin
                            bcd1 <= 4'h0;
                            if (bcd2 == 4'h9)
                                begin
                                    bcd2 <= 4'h0;
                                    if (bcd1 == 4'h9)
                                        begin
                                            bcd1 <= 4'h0;
                                            if (bcd0 == 4'h9)
                                                begin
                                                    bcd0 <= 4'h0;
                                                end
    else
        begin
            bcd0 <= bcd0 + 1'b1;
        end
                                        end
    else
        begin
            bcd1 <= bcd1 + 1'b1;
        end
                                end
    else
        begin
            bcd2 <= bcd2 + 1'b1;
        end
                        end
    else
        begin
            bcd1 <= bcd1 + 1'b1;
        end
                end
    else
        begin
            bcd0 <= bcd0 + 1'b1;
        end
        end
    bcd7seg digit3 (4'hF, HEX3); // HEX3 displays a blank value.
    bcd7seg digit2 (bcd2, HEX2); // HEX2 displays the value of bcd2.
    bcd7seg digit1 (bcd1, HEX1); // HEX1 displays the value of bcd1.
    bcd7seg digit0 (bcd0, HEX0); // HEX0 displays the value of bcd0.
endmodule
