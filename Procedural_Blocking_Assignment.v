`timescale 1ns / 1ps


module Day_15(
input [3:0]in,

output reg[1:0]y,
output reg valid
 );
 
 always@(*)begin
 valid = 1'b1;
 if(in[3])
 y = 2'b11;
 
 else if(in[2])
 y = 2'b10;
 
 else if(in[1])
 y = 2'b01;
 
  else if(in[0])
 y = 2'b00;
 
 else begin
 valid = 1'b0;
 y = 2'b00;
 
 end
 
 
 
 end
endmodule
