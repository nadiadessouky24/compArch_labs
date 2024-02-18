module SSD ( 
input clk,
input [12:0] num,
output reg [3:0] Anode, 
output reg [6:0] LED_OUT
);
reg [3:0] LED_BCD;
reg [19:0] refresh_counter = 0; // 20-bit counter
wire [1:0] LED_activating_counter; 

wire [3:0] sign;
wire [3:0] Hundreds;
wire [3:0] Tens;
wire [3:0] Ones;
wire [6:0] newnum;
//assign  sign=10;


assign newnum = (num[7] == 0 ? num[6:0] : ~num[6:0] + 1'b1);
assign sign = (num[7] == 0 ? 10 : 11);
 
BCD inst(newnum,Hundreds,Tens,Ones );

always @(posedge clk)
begin
refresh_counter <= refresh_counter + 1;
end
assign LED_activating_counter = refresh_counter[19:18]; 
always @(*)
begin
case(LED_activating_counter) 
2'b00: begin
Anode = 4'b0111; 
LED_BCD = sign;
end
2'b01: begin
Anode = 4'b1011;
LED_BCD = Hundreds;
end
2'b10: begin
Anode = 4'b1101;
LED_BCD =Tens;
end
2'b11: begin
Anode = 4'b1110;
LED_BCD = Ones ;
end 
endcase 
end
always @(*)
begin
case(LED_BCD)
4'b0000: LED_OUT = 7'b0000001; // "0"
4'b0001: LED_OUT = 7'b1001111; // "1"
4'b0010: LED_OUT = 7'b0010010; // "2"
4'b0011: LED_OUT = 7'b0000110; // "3"
4'b0100: LED_OUT = 7'b1001100; // "4"
4'b0101: LED_OUT = 7'b0100100; // "5"
4'b0110: LED_OUT = 7'b0100000; // "6"
4'b0111: LED_OUT = 7'b0001111; // "7"
4'b1000: LED_OUT = 7'b0000000; // "8"
4'b1001: LED_OUT = 7'b0000100; // "9"
4'b1010: LED_OUT = 7'b1111111; // "10 : off"
4'b1011: LED_OUT = 7'b1111110; // "11 : negative"


default: LED_OUT = 7'b0000001; // "0"

endcase 
end
endmodule