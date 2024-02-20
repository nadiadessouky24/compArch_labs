`timescale 1ns / 1ps



module TB;
wire [31:0] gen_out; reg[31:0] inst;

ImmGen u(inst,gen_out );

initial begin
inst = 32'b11111111111111111111111110100011;
#10 
if (gen_out[6:0] == 0100011)
    $display("SW");
if (gen_out[6:0] == 0000011)
    $display("lW");
if (gen_out[6:0] == 1100011)
    $display("BEQ");
#10 
inst = 32'b00000000000000000000000000100011;
if (gen_out[6:0] == 0100011)
    $display("SW");
if (gen_out[6:0] == 0000011)
    $display("lW");
if (gen_out[6:0] == 1100011)
    $display("BEQ");
#10 
inst = 32'b00000000000000000000000000000011;
#10
if (gen_out[6:0] == 0100011)
    $display("SW");
if (gen_out[6:0] == 0000011)
    $display("lW");
if (gen_out[6:0] == 1100011)
    $display("BEQ");
#10
inst = 32'b11111111111111111111111110000011;   
#10
if (gen_out[6:0] == 0100011)
    $display("SW");
if (gen_out[6:0] == 0000011)
    $display("lW");
if (gen_out[6:0] == 1100011)
    $display("BEQ"); 
end
endmodule
