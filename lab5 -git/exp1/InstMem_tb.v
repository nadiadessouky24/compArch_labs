
module InstMem_tb;

reg [5:0] addr;
wire [31:0] data_out;


 InstMem inst ( addr, data_out );
 
    initial begin
        
        addr = 0; 
        #10
        if (data_out == 32'b01100111000000011010110011100110) begin 
         $display("correct"); 
         end 
         else begin 
          $display ("incorrect"); 
          end

        addr = 1; 
        #10
          if (data_out == 32'b01011001010100100010001101011001) begin 
         $display("correct"); 
         end 
         else begin 
          $display ("incorrect"); 
          end
        #10 
        
        addr = 2; 
        #10
          if (data_out == 32'b00010100001000011000011001110000) begin 
         $display("correct"); 
         end 
         else begin 
          $display ("incorrect"); 
          end
          
        #10 
        addr = 3; 
        #10
          if (data_out == 32'b01011110000000000011110100101110) begin 
         $display("correct"); 
         end 
         else begin 
          $display ("incorrect"); 
          end
          
        
        addr = 4; 
        #10
          if (data_out == 32'b11010101110011100101001100101000) begin 
         $display("correct"); 
         end 
         else begin 
          $display ("incorrect"); 
          end
       $finish; 

    end

endmodule
