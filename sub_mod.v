`timescale 1ns / 1ps

module sub_mod(
    input [3:0] a,
    input [3:0] b,
    output [7:0] result
);

    wire [3:0] b_complement;
    wire [7:0] difference; 
    
    assign b_complement = ~b + 1;
    
    four_bit_fa subtractor_adder(
        .A1(a),
        .B1(b_complement),
        .S1_f(difference)  
    );
    
    assign result = difference;  
    
endmodule