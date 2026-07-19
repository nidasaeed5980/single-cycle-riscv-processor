`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/10/2026 03:08:34 PM
// Design Name: 
// Module Name: pc
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


module pc( input wire [31:0] mux_out,
           input wire clk,reset,output [31:0]  pc_out
           

    );
    reg [31:0] out;
    always @(posedge clk ) begin
        if(reset==1) begin
            out<=32'b0;
        end
        else begin
            out<=mux_out;
        end
    end
    assign pc_out=out;
endmodule
