`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/13/2024 12:29:11 PM
// Design Name: 
// Module Name: main
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


module main
(
    input clk,
    input [7:0] A, 
    input [7:0] B,
    output  [3:0] Anode, 
    output [6:0] LED_OUT
);

wire [8:0] sum;

RCA rca(A,B,sum);
SSD_opt (clk,{4'b00,sum}, Anode, LED_OUT);
 
endmodule
