`timescale 1ns / 1ps



module divider_mod(
    input [3:0] dividend,
    input [3:0] divisor,
    output [7:0] quotient
);

    assign quotient = {4'b0, dividend / divisor};
    
endmodule
