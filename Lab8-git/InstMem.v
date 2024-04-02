
module InstMem (input [5:0] addr, output [31:0] data_out);
    reg [31:0] mem [0:63];
    assign data_out = mem[addr];

    initial begin
          mem[0]=32'b0000000_00000_00000_000_00000_0110011 ; //add x0, x0, x0
          //added to be skipped since PC starts with 4 after reset
          mem[1]=32'b000000000000_00000_010_00001_0000011 ; //lw x1, 0(x0) 
          mem[2]=32'b0000000_00000_00000_000_00000_0110011 ; //add x0, x0, x0 
          mem[3]=32'b0000000_00000_00000_000_00000_0110011 ; //add x0, x0, x0 
          mem[4]=32'b0000000_00000_00000_000_00000_0110011 ; //add x0, x0, x0 
          mem[5]=32'b000000000100_00000_010_00010_0000011 ; //lw x2, 4(x0) 
          mem[6]=32'b0000000_00000_00000_000_00000_0110011 ; //add x0, x0, x0 
          mem[7]=32'b0000000_00000_00000_000_00000_0110011 ; //add x0, x0, x0 
          mem[8]=32'b0000000_00000_00000_000_00000_0110011 ; //add x0, x0, x0 
          mem[9]=32'b000000001000_00000_010_00011_0000011 ; //lw x3, 8(x0) 
          mem[10]=32'b0000000_00000_00000_000_00000_0110011 ; //add x0, x0, x0 
          mem[11]=32'b0000000_00000_00000_000_00000_0110011 ; //add x0, x0, x0 
          mem[12]=32'b0000000_00000_00000_000_00000_0110011 ; //add x0, x0, x0 
          mem[13]=32'b0000000_00010_00001_110_00100_0110011 ; //or x4, x1, x2 
          mem[14]=32'b0000000_00000_00000_000_00000_0110011 ; //add x0, x0, x0 
          mem[15]=32'b0000000_00000_00000_000_00000_0110011 ; //add x0, x0, x0 
          mem[16]=32'b0000000_00000_00000_000_00000_0110011 ; //add x0, x0, x0 
          mem[17]=32'b0_000001_00011_00100_000_0000_0_1100011; //beq x4, x3, 16
mem[18]=32'b0000000_00000_00000_000_00000_0110011 ; //add x0, x0, x0
 mem[19]=32'b0000000_00000_00000_000_00000_0110011 ; //add x0, x0, x0 
 mem[20]=32'b0000000_00000_00000_000_00000_0110011 ; //add x0, x0, x0
  mem[21]=32'b0000000_00010_00001_000_00011_0110011 ; //add x3, x1, x2 
  mem[22]=32'b0000000_00000_00000_000_00000_0110011 ; //add x0, x0, x0
   mem[23]=32'b0000000_00000_00000_000_00000_0110011 ; //add x0, x0, x0 
   mem[24]=32'b0000000_00000_00000_000_00000_0110011 ; //add x0, x0, x0
    mem[25]=32'b0000000_00010_00011_000_00101_0110011 ; //add x5, x3, x2 
    mem[26]=32'b0000000_00000_00000_000_00000_0110011 ; //add x0, x0, x0 
    mem[27]=32'b0000000_00000_00000_000_00000_0110011 ; //add x0, x0, x0 
    mem[28]=32'b0000000_00000_00000_000_00000_0110011 ; //add x0, x0, x0  
    mem[29]=32'b0000000_00101_00000_010_01100_0100011; //sw x5, 12(x0) 
    mem[30]=32'b0000000_00000_00000_000_00000_0110011 ; //add x0, x0, x0 
    mem[31]=32'b0000000_00000_00000_000_00000_0110011 ; //add x0, x0, x0 
    mem[32]=32'b0000000_00000_00000_000_00000_0110011 ; //add x0, x0, x0 
    mem[33]=32'b000000001100_00000_010_00110_0000011 ; //lw x6, 12(x0)
    mem[34]=32'b0000000_00000_00000_000_00000_0110011 ; //add x0, x0, x0 
    mem[35]=32'b0000000_00000_00000_000_00000_0110011 ; //add x0, x0, x0 
    mem[36]=32'b0000000_00000_00000_000_00000_0110011 ; //add x0, x0, x0 
    mem[37]=32'b0000000_00001_00110_111_00111_0110011 ; //and x7, x6, x1 
    mem[38]=32'b0000000_00000_00000_000_00000_0110011 ; //add x0, x0, x0 
    mem[39]=32'b0000000_00000_00000_000_00000_0110011 ; //add x0, x0, x0 
    mem[40]=32'b0000000_00000_00000_000_00000_0110011 ; //add x0, x0, x0 
    mem[41]=32'b0100000_00010_00001_000_01000_0110011 ; //sub x8, x1, x2 
    mem[42]=32'b0000000_00000_00000_000_00000_0110011 ; //add x0, x0, x0 
    mem[43]=32'b0000000_00000_00000_000_00000_0110011 ; //add x0, x0, x0 
    mem[44]=32'b0000000_00000_00000_000_00000_0110011 ; //add x0, x0, x0 
    mem[45]=32'b0000000_00010_00001_000_00000_0110011 ; //add x0, x1, x2 
    mem[46]=32'b0000000_00000_00000_000_00000_0110011 ; //add x0, x0, x0 
    mem[47]=32'b0000000_00000_00000_000_00000_0110011 ; //add x0, x0, x0 
    mem[48]=32'b0000000_00000_00000_000_00000_0110011 ; //add x0, x0, x0 
    mem[49]=32'b0000000_00001_00000_000_01001_0110011 ; //add x9, x0, x1      
         
    end
endmodule