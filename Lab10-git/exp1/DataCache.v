`timescale 1ns / 1ps

module DataCache (
input clk,
input update,
input fill,
input [1:0] offset,
input [4:0] index,
input [31:0] data_in,
output [31:0] data_out,
input [127:0] MsData_out); 

reg [31:0] cache [0:31][0:3]; 

integer i,j;

    initial begin // initialise cache memory to 0s
        for(i = 0; i < 128; i = i+1) begin
             for(j= 0; j < 4; j = j+1) begin
                cache[i][j] = 0;
             end
        end
    end
    
    always@(posedge clk) begin
        if (fill) begin //read from memory into cache, all 4 words
            {cache[index][0],cache[index][1],cache[index][2],cache[index][3]} = MsData_out;
        end else if (update) begin // read individual word into mem
            cache[index][offset] = data_in;
        end 
    end
    
    assign data_out = cache[index][offset];

endmodule