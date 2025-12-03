`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/14/2025 02:40:47 PM
// Design Name: 
// Module Name: three_bit_counter
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
module debouncer(
    input wire RAW,
    input wire clk, output reg CLEAN
);
reg RAW_sync;
reg RAW_pipe;
reg[2:0] counter;
wire TC;

always @(posedge clk) begin
    {RAW_sync, RAW_pipe} <= {RAW_pipe, RAW};
    
    if(~RAW_sync) 
        counter <= 3'b000;
    else
        counter <= counter + 3'b001;
        
end

assign TC = (counter == 3'b111);

always @ (posedge clk) begin
    if(~RAW_sync)
        CLEAN <= 1'b0;
    else if (TC)
        CLEAN <= 1'b1;
    end
    
 endmodule


