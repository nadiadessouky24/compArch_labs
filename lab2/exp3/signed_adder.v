module signed_adder(
    input clk,
    input [12:0] num,
    input [7:0] A, 
    input [7:0] B,
    output  [3:0] Anode, 
    output [6:0] LED_OUT

    );
    
reg [3:0] LED_BCD;
reg [19:0] refresh_counter = 0; // 20-bit counter
wire [1:0] LED_activating_counter; 

wire [3:0] sign;
wire [3:0] Hundreds;
wire [3:0] Tens;
wire [3:0] Ones;
wire [6:0] newnum;

RCA adder(

endmodule
