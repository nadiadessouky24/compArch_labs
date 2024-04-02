`timescale 1ns / 1ps



module PipelinedCPU(
input clk,
input rst
//input [1:0]ledSel,
//input [3:0]SSd,
//output reg [15:0]port1,
//output reg [12:0]port2
    );

// wires declarations
    wire Branch;
    wire MemRead;
    wire MemtoReg;
    wire [1:0] ALUOp; //only supports 4 instructions. edit when adding more
    wire MemWrite;
    wire ALUSrc;
    wire RegWrite;
    wire [31:0] Instruction;
    wire [31:0] PCin;
    wire [31:0] PCout;
    wire [4:0] ALU_Selection;
    wire Zflag;
    wire [31:0] WriteData;
    wire BranchSel;
    wire [31:0] ReadData1;
    wire [31:0] ReadData2;
    wire [31:0] ImmGen;
    wire [31:0] ALUoutput;
    wire [31:0] ReadData_mem;
    wire [31:0] shift_left_out;
    wire PC_Enable;
    wire [31:0] ALU_in;
    wire [31:0] mux1out;
    wire [31:0] mux2out;
    wire [31:0] mux3out;
    wire PCsrc;
    wire [31:0] PC_4; //pc +4 adder
    wire  forwardA,forwardB;


// the module "Nbit_reg" is an n-bit register module with n as a parameter
// and with I/O's (clk, rst, load, data_in, data_out) in sequence
wire [31:0] IF_ID_PC, IF_ID_Inst;
Nbit_reg #(64) IF_ID (clk,rst,1'b1, {PCout,Instruction}, {IF_ID_PC,IF_ID_Inst} );


wire [31:0] ID_EX_PC, ID_EX_RegR1, ID_EX_RegR2, ID_EX_Imm;
wire [7:0] ID_EX_Ctrl;
wire [3:0] ID_EX_Func;
wire [4:0] ID_EX_Rs1, ID_EX_Rs2, ID_EX_Rd;

Nbit_reg #(155) ID_EX (clk,rst,1'b1, {branch, MemRead, MemtoReg, MemWrite ,ALUSrc, RegWrite, ALUOp , IF_ID_PC, ReadData1 , ReadData2 , ImmGen , IF_ID_Inst[30] , IF_ID_Inst[14:12],IF_ID_Inst[19:15],IF_ID_Inst[24:20] , IF_ID_Inst[11:7] },
                                     {ID_EX_Ctrl,ID_EX_PC,ID_EX_RegR1,ID_EX_RegR2, ID_EX_Imm, ID_EX_Func,ID_EX_Rs1,ID_EX_Rs2,ID_EX_Rd} );
// Rs1 and Rs2 are needed later for the forwarding unit
wire [31:0] EX_MEM_BranchAddOut, EX_MEM_ALU_out, EX_MEM_RegR2; 
wire [4:0] EX_MEM_Ctrl;
wire [4:0] EX_MEM_Rd;
wire EX_MEM_Zero;
wire [31:0] sum;
wire [31:0] mux4out;
assign sum = ID_EX_PC + shift_left_out;
Nbit_reg #(107) EX_MEM (clk,rst,1'b1, {ID_EX_Ctrl[7:4] , ID_EX_Ctrl[2] , sum, Zflag , ALUoutput ,ID_EX_RegR2, ID_EX_Rd }, {EX_MEM_Ctrl, EX_MEM_BranchAddOut, EX_MEM_Zero, EX_MEM_ALU_out, EX_MEM_RegR2, EX_MEM_Rd} );

wire [31:0] MEM_WB_Mem_out, MEM_WB_ALU_out;
wire [1:0] MEM_WB_Ctrl;
wire [4:0] MEM_WB_Rd;
Nbit_reg #(71) MEM_WB (clk,rst,1'b1, {EX_MEM_Ctrl[2] , EX_MEM_Ctrl[0], ReadData_mem , EX_MEM_ALU_out , EX_MEM_Rd }, {MEM_WB_Ctrl,MEM_WB_Mem_out, MEM_WB_ALU_out, MEM_WB_Rd} );


// all modules instantiations
assign mux4out = (forwardA )? mux1out : EX_MEM_ALU_out ; //add condition
InstMem im(PCout[7:2] , Instruction);
assign mux1out = (MEM_WB_Ctrl[1]) ? MEM_WB_Mem_out : MEM_WB_ALU_out;
register regi(clk,rst,IF_ID_Inst [19:15] , IF_ID_Inst[24:20], IF_ID_Inst [11:7]  ,mux1out,  MEM_WB_Ctrl[0],ReadData1,ReadData2 ) ;
ImmGen immgen(IF_ID_Inst , ImmGen);
ControlUnit cu(IF_ID_Inst[6:2], branch, MemRead, MemtoReg,ALUOp, MemWrite ,ALUSrc, RegWrite );
ALU_CU aluCu(ID_EX_Ctrl[1:0] , ID_EX_Func , ALU_Selection);
nl_shift shift ( ID_EX_Imm , shift_left_out );
assign mux2out = (ID_EX_Ctrl[3])? ID_EX_Imm : ID_EX_RegR2; //add condition, alter based on forwarding

n_bit_ALU alu(ID_EX_RegR1 , mux2out, ALU_Selection , ALUoutput , Zflag);
DataMem dm(clk,EX_MEM_Ctrl[3],EX_MEM_Ctrl[4],EX_MEM_ALU_out[7:2], EX_MEM_RegR2,ReadData_mem);

assign PCsrc = EX_MEM_Zero & EX_MEM_Ctrl[4] ;

forward h(EX_MEM_Ctrl[0] ,EX_MEM_Rd, ID_EX_RegR1, ID_EX_RegR2,MEM_WB_Ctrl[0],MEM_WB_Rd, forwardA,forwardB ); 
 
assign PCin = (PCsrc)? sum : PC_4;
assign PC_4 = PCout + 4;
Nbit_reg #(32) pc(clk, 1'b1, rst, PCin, PCout);


always @(*) begin //conditions for forwarding on lower mux
    case(forwardB)
    
    
    
    endcase
end




// LED and SSD outputs case statements
endmodule