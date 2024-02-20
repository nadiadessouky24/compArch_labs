`timescale 1ns / 1ps

module mux_TB;
    
    reg S;
    reg [31:0] A;
    reg [31:0] B;
    wire [31:0] C;
    
    
    n_bit_Mux #(32) MUX(A,B,S,C );
    
    initial begin
    
    A = 32'b10100010100110110111110011100100;
    B = 32'b00101100110001000111111010000001;
    S = 1'b0;
    #10
    if(C == A) $display("Correct Output");
    else $display("Wrong Output");
    #10
    S = 1'b1;
    #10
    if(C == B) $display("Correct Output");
    else $display("Wrong Output");
    
    end
    
    
    
    
    
endmodule
