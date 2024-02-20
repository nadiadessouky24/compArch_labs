`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/20/2024 12:07:51 PM
// Design Name: 
// Module Name: n_bit_Mux
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


module n_bit_Mux #(parameter n = 8)
(
    input [n-1:0] A,
    input [n-1:0] B,
    input S,
    output [n-1:0] C
    
);


genvar i;

generate
    for (i = 0; i<n; i = i+1) begin
        mux  m (A[i], B[i], S, C[i]);
     end 
endgenerate


endmodule
