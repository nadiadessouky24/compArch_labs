`timescale 1ns / 1ps

module DC_TB;

reg clk;
reg update;
reg fill;
reg [1:0] offset;
reg [4:0] index;
reg [31:0] data_in;
wire [31:0] data_out;
reg [127:0] MsData_out;

DataCache DC(clk,update,fill,offset,index,data_in,data_out,MsData_out);

localparam period = 10;

   initial begin
        clk = 1'b0;
        forever  #(period/2) clk = ~clk;
   end
   
        always begin 
        #period
        fill = 1; 
        update = 0; 
        offset = 1;
        index=1;
        data_in=5;
        MsData_out = 6;
         #period
         #period
        fill = 0; 
        update = 1; 
        offset = 1;
        index=1;
        data_in=5; 
        MsData_out = 6;
        #period
         #period
        fill = 0; 
        update = 0;
        #period;

        
        end 
        
    
    
endmodule
