`timescale 1ns / 1ps


module not_mod(
    input [3:0] a,
    output [7:0] result
);

    assign result = {4'b0, ~a};
    
endmodule

