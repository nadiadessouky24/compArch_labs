`timescale 1ns / 1ps

module DMS_TB;



reg clk;
reg rst;
reg MemRead;
reg MemWrite;
reg [9:0] addr;
reg [31:0] data_in;
wire [31:0] data_out;
wire stall;

DataMemSys DMS (clk,rst,MemRead,MemWrite,addr,data_in,data_out,stall);

localparam period = 10;

   initial begin
        clk = 1'b0;
        forever  #(period/2) clk = ~clk;
   end
   
   initial begin
        rst = 1;
        
        #(period*4)
        
        rst=0;
        MemRead = 1;
        MemWrite =0;
        addr = 3;
        data_in = 5;
        #(period*4)
        
        rst=0;
        MemRead = 0;
        MemWrite =1;
        addr = 3;
        data_in = 5;
   end
   
endmodule
