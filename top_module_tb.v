`timescale 1ns / 1ps

module top_module_tb;


    reg mclk;
    reg [15:0] sw;
    reg rst;
    reg press;
    
    wire [6:0] seg;
    wire [3:0] an;
    
    top_module uut (
        .mclk(mclk),
        .sw(sw),
        .rst(rst),
        .press(press),
        .seg(seg),
        .an(an)
    );
    
    initial begin
        mclk = 0;
        forever #5 mclk = ~mclk;
    end
    
    initial begin
        rst = 1;
        press = 0;
        sw = 16'b0;
        
        #100;
        rst = 0;
        #10;
        
        sw[3:0] = 4'd5;  
        sw[7:4] = 4'd3;  
        sw[15:13] = 3'b000;  
        #10;
        press = 1;
        #100;
        press = 0;
        #42000;
        
        sw[3:0] = 4'd9;     
        sw[7:4] = 4'd4;    
        sw[15:13] = 3'b001;  
        #50;
        press = 1;
        #100;
        press = 0;
        #42000;
        
        sw[3:0] = 4'd7;     
        sw[7:4] = 4'd6;    
        sw[15:13] = 3'b010; 
        #50;
        press = 1;
        #100;
        press = 0;
        #42000;
        
        sw[3:0] = 4'd15;    
        sw[7:4] = 4'd3;    
        sw[15:13] = 3'b011;  
        #10;
        press = 1;
        #100;
        press = 0;
        #42000;
        
        sw[3:0] = 4'd12;    
        sw[7:4] = 4'd10;     
        sw[15:13] = 3'b100; 
        #10;
        press = 1;
        #100;
        press = 0;
        #42000;
        
        sw[3:0] = 4'd5;      
        sw[7:4] = 4'd3;     
        sw[15:13] = 3'b101;  
        #10;
        press = 1;
        #100;
        press = 0;
        #42000;
        
        sw[3:0] = 4'd15;    
        sw[7:4] = 4'd9;    
        sw[15:13] = 3'b110;
        #10;
        press = 1;
        #100;
        press = 0;
        #42000;
        
        sw[3:0] = 4'd10;    
        sw[15:13] = 3'b111; 
        #10;
        press = 1;
        #100;
        press = 0;
        #42000;
        
        $finish;
    end

endmodule
