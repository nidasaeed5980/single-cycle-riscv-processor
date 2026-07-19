`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/13/2026 02:53:29 PM
// Design Name: 
// Module Name: alu_ctrl
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module alu_ctrl(input  [1:0] alu_op, 
    input  [31:0] inst, 
    output reg [3:0] alu_ctrl);
    wire [2:0]f3;
  wire f7;
  assign f3= inst[14:12];
  assign f7= inst[30];
  always @ (*)
  begin
    if (alu_op==2'b00) 
        alu_ctrl=4'b0010;
    else if (alu_op==2'b11) 
        alu_ctrl=4'b1111;
    else if (alu_op==2'b01)
        alu_ctrl=4'b0110;
    else if (alu_op==2'b10 && f7==0 && f3==3'b000)
        alu_ctrl=4'b0010;
    else if (alu_op==2'b10  && f7==1 && f3==3'b000)
        alu_ctrl=4'b0110;
    else if (alu_op==2'b10 && f7==0 && f3==3'b111)
        alu_ctrl=4'b0000;
    else if (alu_op==2'b10 && f7==0 && f3==3'b110)
        alu_ctrl=4'b0001;
   end
    
endmodule

