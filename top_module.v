`timescale 1ns / 1ps


module top_module(
    input mclk,            
    input [15:0] sw,        
    input rst,               
    input press,               
    output [6:0] seg,           
    output [3:0] an 
);

    wire [3:0] a = sw[3:0];  
    wire [3:0] b = sw[7:4];   
    wire [2:0] op = sw[15:13];     
    
    wire clean;
    reg press_status;
    
    debouncer button_debouncer(
        .RAW(press),
        .clk(mclk),
        .CLEAN(clean)
    );
    
    always @(posedge mclk) begin
        if (rst)
            press_status <= 0;
        else
            press_status <= clean;
    end
    
    
    wire [7:0] calc_result;
    wire calc_done;
    
    reg [3:0] a_val, b_val;
    reg [2:0] op_val;
    
    always @(posedge mclk) begin
        if (rst) begin
            a_val <= 4'b0;
            b_val <= 4'b0;
            op_val <= 3'b0;
        end else if (clean && !press_status) begin
            a_val <= a;
            b_val <= b;
            op_val <= op;
        end 
    end
    
    calculator calculator(
        .clk(mclk),
        .rst(rst),
        .a(a_val),
        .b(b_val),
        .op(op_val),
        .button_press(clean && !press_status),
        .output_val(calc_result),
        .done(calc_done)
    );
    
    wire [15:0] bcd_result;
    wire bcd_ready;
    reg enable;
    reg [15:0] bcd_d_out;
    
    reg [2:0] state;
    parameter IDLE = 3'b000;
    parameter SETUP = 3'b001;
    parameter DONE = 3'b010;
    
    always @(posedge mclk) begin
        if (rst) begin
            enable <= 0;
            state <= IDLE;
            bcd_d_out <= 16'b0;
        end else begin
            case (state)
                IDLE: begin
                    if (calc_done) begin
                        enable <= 1;
                        state <= SETUP;
                    end
                end
                
                SETUP: begin
                    enable <= 0;
                    if (bcd_ready) begin
                        bcd_d_out <= bcd_result;
                        state <= DONE;
                    end
                end
                
                DONE: begin
                    if (clean && !press_status) begin
                        state <= IDLE;
                    end
                end
            endcase
        end
    end
    
    double_dabble dd(
        .clk(mclk),
        .en(enable),
        .bin_d_in({4'b0, calc_result}),
        .bcd_d_out(bcd_result),
        .rdy(bcd_ready)
    );
    
    multiseg_driver ssd(
        .clk(mclk),
        .bcd_in(bcd_d_out),
        .seg_anode(an),
        .seg_cathode(seg)
    );
    
endmodule
