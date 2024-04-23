`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/23/2024 01:48:37 PM
// Design Name: 
// Module Name: cache_TB
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


module DataCacheController_tb;
    reg rst, clk, MemRead, MemWrite, MsReady;
    reg [4:0] index;
    reg [2:0] tag;
    wire stall, fill, update, MsRead;
   
    DataCacheController dcc (rst, clk, MemRead, MemWrite, MsReady, index, tag, stall, fill, update, MsRead);
   
    always begin
        clk = 0;
        forever #5 clk = ~clk;
    end
   
    initial begin
        rst = 1;  MemRead = 1'b0; MemWrite = 0; MsReady = 1'b0; index = 0; tag = 2'b0;
        #10
        rst = 0; MemRead = 1'b1; MemWrite = 0; MsReady = 1'b0; index = 0; tag = 2'b1;
        #100;
        rst = 0; MemRead = 1'b0; MemWrite = 0; MsReady = 1'b1; index = 0; tag = 2'b1;
        #40
        rst = 0; MemRead = 1'b1; MemWrite = 0; MsReady = 1'b0; index = 0; tag = 2'b1;
        #40
        rst = 0; MemRead = 1'b0; MemWrite = 1'b1; MsReady = 1'b0; index = 0; tag = 2'b1;
        #100
        rst = 0; MemRead = 1'b0; MemWrite = 1'b0; MsReady = 1'b1; index = 0; tag = 2'b1;
        #20
        rst = 0; MemRead = 1'b0; MemWrite = 1'b1; MsReady = 1'b0; index = 1'b1; tag = 2'b0;
        #100
        rst = 0; MemRead = 1'b0; MemWrite = 1'b1; MsReady = 1'b1; index = 1'b1; tag = 2'b0;
        #20
        rst = 0; MemRead = 1'b0; MemWrite = 1'b0; MsReady = 1'b0; index = 1'b0; tag = 2'b0;
        #20
        $finish;
    end
endmodule