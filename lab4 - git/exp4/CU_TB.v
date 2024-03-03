`timescale 1ns / 1ps

module CU_TB();
   
reg [1:0] ALUOp; reg [31:0] Inst; wire [3:0] ALU_Selection;
    ALU_CU ALUCU(ALUOp, Inst,ALU_Selection);
    initial
        begin
           ALUOp = 2'b00;
           Inst = 32'b00000000000000000000000000000000;
           #10
           ALUOp = 2'b01;
           Inst = 32'b00000000000000000000000000000000;
           #10
           ALUOp = 2'b10;
           Inst = 32'b00000000000000000000000000000000;
           #10
           ALUOp = 2'b10;
           Inst = 32'b01000000000000000000000000000000;
           #10
           ALUOp = 2'b10;
           Inst = 32'b00000000000000000111000000000000;
           #10
           ALUOp = 2'b10;
           Inst = 32'b00000000000000000110000000000000;
           #10
           ALUOp = 2'b11;
           Inst = 32'b00000000000000000111000000000000;
        end
endmodule