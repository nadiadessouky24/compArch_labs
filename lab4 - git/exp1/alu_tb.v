

module alu_tb;

wire [31:0] A; 
wire [31:0] B;
reg [3:0] s; 
wire [31:0] ALUoutput;
wire Zflag;
assign A = 16; 
assign B = 12;

 
n_bit_ALU alu(A,B,s,ALUoutput,Zflag);

initial begin 


 s = 4'b0000;
 #(10)
 if (ALUoutput == 0) begin
 $display("correct"); 
 end 
 else $display("incorrect");

#(10)

s = 4'b0110; 
#(10)
 if (ALUoutput == 4) begin
 $display("correct"); 
 end 
 else $display("incorrect");
#(10)

s = 4'b0010;
#(10) 
if (ALUoutput == 28) begin
 $display("correct"); 
 end 
 else $display("incorrect");
#(10) 

s = 4'b0001; 
#(10)
if (ALUoutput == 28) begin
 $display("correct"); 
 end 
 else $display("incorrect");
#(10)

s = 4'b1100; 
#(10)
 if (ALUoutput == 0) begin
 $display("correct"); 
 end 
 else $display("incorrect");

end  

endmodule
