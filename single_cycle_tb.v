`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/14/2026 11:33:26 AM
// Design Name: 
// Module Name: single_cycle_tb
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


module single_cycle_tb;
    reg clk,reset;
    single_cycle_top single(.clk(clk),.reset(reset));
    initial begin
        clk=0;
        forever #10 clk=~clk;
    end 
    initial begin
        reset=0;
        #90
        reset=1;
        #100
        reset=0;
    end
    initial begin
    //    #2000 $finish;
    end
endmodule
