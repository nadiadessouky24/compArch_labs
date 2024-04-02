`timescale 1ns / 1ps


module forward(
input EX_MEM_RegWrite,
input [4:0] EX_MEM_Rd,
input [31:0]ID_EX_Rs1,
input [31:0] ID_EX_Rs2,
input MEM_WB_RegWrite,
input [31:0] MEM_WB_RD,
output [1:0]forwardA,
output [1:0] forwardB
    );
    
    always @(*) begin
    
    
        if ( EX_MEM_RegWrite && (EX_MEM_Rd != 0)  && (EX_MEM_Rd == ID_EX_Rs1) ) begin
            forwardA = 2'b10; 
        end else if ( MEM_WB_RegWrite && (MEM_WB_RD != 0) && (MEM_WB_RD == ID_EX_Rs1) 
            &&  ~( MEM_WB_RegWrite && (MEM_WB_RD != 0))
            && (EX_MEM_Rd == ID_EX_Rs1) )
            
                forwardA = 2'b01; else forwardA =2'b00;
                
                
        if ( EX_MEM_RegWrite && (EX_MEM_Rd != 0)  && (EX_MEM_Rd == ID_EX_Rs2) ) begin
            forwardB = 2'b10;
            end else  if ( MEM_WB_RegWrite && (MEM_WB_RD != 0) && (MEM_WB_RD == ID_EX_Rs2) 
            &&  ~( MEM_WB_RegWrite && (MEM_WB_RD != 0))
            && (EX_MEM_Rd == ID_EX_Rs2) )
            
                forwardB = 2'b01; else forwardB =2'b00;
    end
    



endmodule
