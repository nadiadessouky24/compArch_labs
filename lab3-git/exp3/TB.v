`timescale 1ns / 1ps



module TB;
reg [5:0] A;
wire [5:0] B;

nl_shift inst(A,B);

initial begin

 A = 6'b110011;

#5;
if(B == 6'b100110)
$display("Correct");
else $display("Wrong");

$finish;

end
endmodule
