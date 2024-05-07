`timescale 1ns / 1ps

module DataMemSys(
input clk,
input rst,
input MemRead,
input MemWrite,
input [9:0] addr,
input [31:0] data_in,
output [31:0] data_out,
output stall
    );
    

    wire update;
    wire fill;
    wire [2:0] tag;
    wire [1:0] offset;
    wire [4:0] index;
    wire MsRead;
    wire MsReady;
    wire [127:0] MsData_out;
    assign tag = addr[9:7];
    assign index = addr[6:2];
    assign offset = addr[1:0];

    
    
    DataCache DC(clk,update,fill,offset,index,data_in,data_out,MsData_out);
    
    DataCacheController DCC(rst,clk,MemRead,MemWrite,MsReady,index,tag,stall,fill,update,MsRead);
    
    DataMem DM(.clk(clk), .MemRead(MsRead), .MemWrite(MemWrite), .addr(addr), .data_in(data_in), .data_out(MsData_out), .ready(MsReady) );
    
    

    
endmodule
