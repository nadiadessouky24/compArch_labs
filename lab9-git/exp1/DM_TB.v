`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/23/2024 12:08:07 PM
// Design Name: 
// Module Name: DM_TB
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


module DM_TB;


reg clk;
reg MemRead;
reg MemWrite;
reg [9:0] addr;
reg [31:0] data_in; 
wire [127:0]  data_out;
wire ready;


DataMem DM(clk,MemRead,MemWrite,addr,data_in,data_out,ready);

localparam period = 10;
 
     initial begin
        clk = 1'b0;
       forever  #(period/2) clk = ~clk;
       end
initial begin
    
    #period;
    MemRead=0;
    MemWrite = 1;
    addr = 5;
    data_in = 8;
    #period;
    #period;
    #period;
    #period;
    MemRead=1;
    MemWrite = 0;
    addr = 3;
    data_in = 0;
    #period;
    #period;
    #period;
    #period;
    MemRead=1;
    MemWrite = 0;
    addr = 5;
    data_in = 0;
    #period;
    #period;
    #period;
    #period;
    
end


endmodule
