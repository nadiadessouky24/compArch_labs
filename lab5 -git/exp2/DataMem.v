module DataMem
(input clk,
input MemRead,
input MemWrite,
input [5:0] addr,
input [31:0] data_in,
output reg [31:0] data_out); 
 
 reg [31:0] mem [0:63];
 
 initial begin
    
    mem[0] = 32'b01100111000000011010110011100110;
    mem[1] = 32'b01011001010100100010001101011001;
    mem[2] = 32'b00010100001000011000011001110000;
    mem[3] = 32'b01011110000000000011110100101110;
    mem[4] = 32'b11010101110011100101001100101000;

  end
 
  always @(posedge clk)begin
 
    if (MemWrite == 1) begin 
        mem[addr] = data_in; 
    end

  end 
  
  always @(*) begin 
      if (MemRead == 1) begin //load word
        data_out = mem[addr]; 
    end 
  end

endmodule 