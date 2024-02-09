`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/06/2024 12:42:22 PM
// Design Name: 
// Module Name: inv_tb
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


module inv_tb ();

parameter period =10;
    wire Y_out;
    reg A_in;
    
    initial begin
    
        A_in=1'b0;
        #(period);
        if(Y_out ==~A_in)
             $display("correct");
        else
         $display ("Wrong");
      
        A_in=1'b1;
        #(period);
        if(Y_out ==~A_in)
             $display("correct");
        else $display ("Wrong");
        
        A_in=1'b0;
        #(period);
        if(Y_out ==~A_in)
             $display("correct");
        else $display ("Wrong");
        $finish;
     end
     
     
    inverter inst(
    .A(A_in),
    .Y(Y_out)
    );
    
    endmodule