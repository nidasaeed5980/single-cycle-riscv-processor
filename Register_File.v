`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/13/2026 10:44:18 AM
// Design Name: 
// Module Name: Register_File
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


module Register_File(
    input  [31:0] inst, 
    input  write_en, reset, clk, 
    input  [31:0] data_w, 
    output [31:0] data1, data2 
    );
    wire [4:0] reg1,reg2,reg_d;
    assign reg1=inst[19:15];
    assign reg2=inst[24:20];
    assign reg_d=inst[11:7];
    reg [31:0] regdata [0:31];
    integer i;
    always @(posedge clk) begin
        if (reset) begin
            for(i=0; i<32; i=i+1) begin
                regdata[i]<=0;
            end
        end
    end
            
    always @(negedge clk) begin
        if (write_en==1) begin
            regdata[reg_d]<=data_w;
        end
    end
    assign data1=regdata[reg1];
    assign data2=regdata[reg2];

endmodule
