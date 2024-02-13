

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
SSD (clk,{5'b0,sum[7:0]}, Anode, LED_OUT);
 
endmodule
