`timescale 1ns / 1ps


module calculator(
    input clk,
    input rst,
    input [3:0] a,
    input [3:0] b,
    input [2:0] op,
    input button_press,              
    output reg [7:0] output_val,
    output reg done
);

    wire [7:0] add_val, sub_val, mult_val, div_val, and_val, or_val, xor_val, not_val;
    
    four_bit_fa add(.A1(a), .B1(b),.S1_f(add_val));
    
    sub_mod sub(.a(a), .b(b),.result(sub_val));
    
    combinational_mult mult(.a(a), .b(b),.p(mult_val));
    
    divider_mod div(.dividend(a), .divisor(b), .quotient(div_val));
    
    and_mod and_op(.a(a), .b(b), .result(and_val));

    or_mod or_op(.a(a), .b(b), .result(or_val));
    
    xor_mod xor_op(.a(a), .b(b), .result(xor_val));
    
    not_mod not_op(.a(a), .result(not_val));
    
    reg [2:0] state;
    parameter IDLE = 3'b000;
    parameter SETUP = 3'b001;
    parameter DONE = 3'b010;
    
    always @(posedge clk) begin
        if (rst) begin
            state <= IDLE;
            output_val <= 8'b0;
            done <= 0;
        end else begin
            case (state)
                IDLE: begin
                    done <= 0;
                    
                    if (button_press) begin
                        state <= SETUP;
                    end
                end
                
                SETUP: begin

                    case (op)
                        3'b000: output_val <= add_val;      
                        3'b001: output_val <= sub_val;     
                        3'b010: output_val <= mult_val;    
                        3'b011: output_val <= div_val;  
                        3'b100: output_val <= and_val;
                        3'b101: output_val <= or_val;     
                        3'b110: output_val <= xor_val;   
                        3'b111: output_val <= not_val;    
                    endcase
                    
                    done <= 1;
                    state <= DONE;
                end
                
                DONE: begin
                    if (!button_press) begin
                        state <= IDLE;
                        done <= 0;
                    end
                end
            endcase
        end
    end
    
endmodule
