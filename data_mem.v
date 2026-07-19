`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/14/2026 09:21:38 AM
// Design Name: 
// Module Name: data_mem
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
module data_mem( 
    input  [31:0] alu_out, data2, 
    input  mem_write, mem_read, clk, reset, 
    output reg [31:0] dmem_out 
    );
    reg [31:0]memory [0:1024];
    integer i;
    always @(posedge clk) begin
        if (reset) begin
            for(i=0; i<32; i=i+1) begin
                memory[i]<=0;
            end
        end
    end
    always @ (negedge clk)
    begin
       if (mem_write==1)
        memory[alu_out]=data2;
    end
    always @(*) begin
        if (mem_read==1)
             dmem_out= memory[alu_out];
    end
endmodule
