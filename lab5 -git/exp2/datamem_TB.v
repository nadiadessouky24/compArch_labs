`timescale 1ns / 1ps


module datamem_TB;
 reg clk; 
 reg MemRead;
 reg MemWrite;
 reg [5:0] addr;
 reg [31:0] data_in;
 wire [31:0] data_out;
 
 localparam period = 10;
 
 initial begin
    clk = 1'b0;
    forever  #(period/2) clk = ~clk;
 end
 
 DataMem data(clk, MemRead, MemWrite, addr, data_in, data_out);
 
 always @(*) begin 
    
    MemRead = 1; //load
    addr = 0; 
    #period
        
    if (data_out ==  32'b01100111000000011010110011100110) begin 
         $display("correct");
     end 
     
     else begin 
         $display("incorrect"); 
     end  
   
   
    #period
    MemWrite = 1; //store
    addr = 1; 
    data_in = 10;     
    #period
    if (data.mem[addr] == 10) begin 
         $display("correct");
     end 
     
     else begin 
         $display("incorrect"); 
     end  
   
   
 end

endmodule
