
module InstMem (input [5:0] addr, output [31:0] data_out);
    reg [31:0] mem [0:63];
    assign data_out = mem[addr];
    
    initial begin
    
        mem[0] = 32'b01100111000000011010110011100110;
        mem[1] = 32'b01011001010100100010001101011001;
        mem[2] = 32'b00010100001000011000011001110000;
        mem[3] = 32'b01011110000000000011110100101110;
        mem[4] = 32'b11010101110011100101001100101000;

    end
endmodule