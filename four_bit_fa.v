`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Lehigh University
// Engineer: Takeru Hiura and Shenrui Duan
// 
// Create Date: 09/09/2025 02:22:17 PM
// Design Name: 
// Module Name: four_bit_fa
// Project Name: ECE 128 Lab 4
// Target Devices: 
// Tool Versions: 
// Description: This is the full adder used in the lab. 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module four_bit_fa(A1,B1,S1_f);

input [3:0] A1,B1;

output [7:0] S1_f;


wire Cin1;

wire cout0, cout1, cout2, cout3;


wire [3:0] S1;


assign Cin1=1'b0;

one_bit_fa FA0(.A(A1[0]),.B(B1[0]),.Cin(Cin1),.S(S1[0]),.Cout(cout0));

one_bit_fa FA1(.A(A1[1]),.B(B1[1]),.Cin(cout0),.S(S1[1]),.Cout(cout1));

one_bit_fa FA2(.A(A1[2]),.B(B1[2]),.Cin(cout1),.S(S1[2]),.Cout(cout2));

one_bit_fa FA3(.A(A1[3]),.B(B1[3]),.Cin(cout2),.S(S1[3]),.Cout(cout3));


assign S1_f = {3'b0, cout3, S1};



endmodule
