`timescale 1ns / 1ps

module reg_tb;
    
reg clk;
reg rst;
reg [4:0] read_1;
reg [4:0] read_2;
reg [4:0] write;
reg [31:0] write_data;
reg regWrite;
wire [31:0] data_1;
wire [31:0] data_2;

localparam period = 10;
 initial begin
        clk = 1'b0;
        forever  #(period/2) clk = ~clk;
    end
    
    
 register register(clk,rst,read_1,read_2,write,write_data,regWrite,data_1,data_2);
 
 initial begin
 rst = 1;
 
 #(10)
 
 rst = 0;
 
 regWrite = 1;
 
 read_1 = 5'b10101;
 read_2 = 5'b11111;
 write_data = 15; 
 write = 5'b10111;
 
 
 
 #(10)
 rst = 0;
 regWrite = 0;
 read_1 = 5'b10111;
 read_2 = 5'b11111;
 write_data = 15; 
 write = 5'b10111;
 
 #(10)
 
 $finish;
 end
    
endmodule
