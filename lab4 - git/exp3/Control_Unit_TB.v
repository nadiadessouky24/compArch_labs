`timescale 1ns / 1ps

module Control_Unit_TB();
reg [31:0] Inst;
wire Branch, MemRead, MemtoReg, MemWrite, ALUSrc, RegWrite;
wire [1:0] ALUOp;

ControlUnit CU(Inst, Branch, MemRead, MemtoReg, ALUOp , MemWrite, ALUSrc, RegWrite);

initial
    begin
       Inst = 5'b01100;
       #10
       Inst = 5'b00000;
       #10
       Inst = 5'b01000;
       #10
       Inst = 5'b11000;
    end

endmodule
