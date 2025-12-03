`timescale 1ns / 1ps


module combinational_mult(
    input [3:0] a,
    input [3:0] b,
    output [7:0] p
);
    
    wire [3:0] m0;
    wire [3:0] m1;
    wire [3:0] m2;
    wire [3:0] m3;
    wire [7:0] s1, s2, s3;
    
    assign m0 = {4{b[0]}} & a;
    assign m1 = {4{b[1]}} & a;
    assign m2 = {4{b[2]}} & a;
    assign m3 = {4{b[3]}} & a;
    
    assign s1 = m0 + (m1 << 1);
    assign s2 = s1 + (m2 << 2);
    assign s3 = s2 + (m3 << 3);
    assign p = s3;
    
endmodule
