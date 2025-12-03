`timescale 1ns / 1ps

module or_mod(
    input [3:0] a,
    input [3:0] b,
    output [7:0] result
);

    assign result = {4'b0, a | b};
    
endmodule

