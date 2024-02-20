`timescale 1ns / 1ps

module Nbit_reg_TB;

reg rst;
reg clk;
reg load;
reg [31:0] D;
wire [31:0] Q;

localparam period = 10;
main #(32) mod(clk,load,rst,D,Q);

    initial begin
        clk = 1'b0;
        forever  #(period/2) clk = ~clk;
    end
    
    initial begin
    
    rst = 1'b1;
    
    #period 
    if( Q == 0)
        $display("correct");
    else 
        $display("incorrect");
        
    rst = 1'b0;
    load = 1'b1;
    D = 32'b00101100110001000111111010000001;
    
     #period 
    if( Q == D)
        $display("correct");
    else 
        $display("incorrect");
    
    load = 1'b0; 
    D = 32'b11000110001101100010001000111110;
    
     #period 
    if( Q == 32'b00101100110001000111111010000001)
        $display("correct");
    else 
        $display("incorrect");

 
 $finish;
end
endmodule
