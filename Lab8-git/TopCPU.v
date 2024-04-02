`timescale 1ns / 1ps

module TopCPU(
    input clk, 
    input rst, 
    input [1:0] ledsel, 
    input [3:0] ssdsel, 
    input ssd_clk, 
    output [15:0] LED, 
    output [6:0] ssd_led_out,
    output [3:0] Anode
);

   wire [12:0] cpu_out; 
  
  CPU cpu (clk,rst,ssdsel,ledsel, LED, cpu_out); 

  SSD ssd (ssd_clk, cpu_out, Anode,ssd_led_out);
  
endmodule
