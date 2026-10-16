`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/13/2026 11:39:39 AM
// Design Name: 
// Module Name: imm_generator
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


module imm_generator(input  [31:0] inst, 
        output reg [31:0] immout 
    );
    wire [6:0] opcode;
    assign opcode=inst[6:0];
    always @(inst) begin
        case(opcode)
            7'b0010011: begin // itype(addi ,subi etc)
                immout[11:0]=inst[31:20];
                immout[31:12]=$signed (inst[31]);
            end
            
            7'b0000011: begin //i type(lb,lh,lw,lbu,lhu)
                immout[11:0]=inst[31:20];
                immout[31:12]=$signed (inst[31]);
            end
            7'b0100011:begin // s type
                immout[4:0]=inst[11:7];
                immout[11:5]=inst[31:25];
                immout[31:12]=$signed (inst[31]);
            end 
            7'b0010111:begin // U type
                immout[19:0]=inst[31:12];
                immout[31:20]=$signed (inst[31]);
            end
            7'b1101111: begin
                immout[19:0]=inst[31:12];
                immout[31:20]=$signed (inst[31]);
            end
            7'b1100011: begin // b type
//                immout[4:1]=inst[11:8];
//                immout[11]=inst[7];
//                immout[10:5]=inst[30:25];
//                immout[12]=inst[31];
//                immout[31:13]=$signed (inst[31]);
                  immout[3:0]=inst[11:8];
                  immout[9:4]=inst[30:25];
                  immout[10]=inst[7];
                  immout[11]=inst[31];
                  immout[31:12]=$signed (inst[31]); 
                  immout=immout<<1;
            end
            7'b1101111: begin //j type 
                immout[19:12]=inst[19:12];
                immout[11]=inst[20];
                immout[10:1]=inst[30:20];
                immout[12]=inst[31];
                immout[31:20]=$signed (inst[31]);
            end
        endcase
   end
    
endmodule
