`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/13/2026 02:32:35 PM
// Design Name: 
// Module Name: control_unit
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


module control_unit(input  [31:0] inst, 
    output reg branch, mem_rd, mem2reg, mem_write, alu_scr, reg_write,
    output reg [1:0] alu_op
    );
    wire [6:0] opcode;
    wire [2:0] f3;
    assign opcode=inst[6:0];
    assign f3= inst[14:12];
    always @(inst) begin
            mem_rd=0;
            branch=0;
            mem2reg=0;
            mem_write=0;
            alu_scr=0;
            reg_write=0;
            alu_op=2'b00;
        case(opcode)
            7'b0110011: begin //r
            mem_rd=0;
            branch=0;
            mem2reg=0;
            mem_write=0;
            alu_scr=0;
            reg_write=1;
            alu_op=2'b10;
//            aluop1=1;
//            aluop0=0;
            
            end
            7'b0010011:     //opcode for addi  instructions
            begin
            if (f3=='b001)
            begin
                  alu_scr=1;
                  mem2reg=0;
                  reg_write=1;
                  mem_rd=0;
                  mem_write=0;
                  branch=0;
                  alu_op=2'b11;
                  
            end
           else 
           begin
                  alu_scr=1;
                  mem2reg=0;
                  reg_write=1;
                  mem_rd=0;
                  mem_write=0;
                  branch=0;
                  alu_op=2'b10;
                  
            end
            end
            7'b0000011: begin //lw
                mem_rd=1;
                branch=0;
                mem2reg=1;
                mem_write=0;
                alu_scr=1;
                reg_write=1;
                alu_op=2'b00;
                
            end
            7'b0100011: begin //sw
                mem_rd= 0;
                branch=0;
                mem2reg=1'bx;
                mem_write=1;
                alu_scr=1;
                reg_write=0;
                alu_op=2'b00;
                
            end
            7'b1100011: begin //beq
                mem_rd=0;
                branch=1;
                mem2reg=1'bx;
                mem_write=0;
                alu_scr=0;
                reg_write=0;
                alu_op=2'b01;
//                aluop1=0;
//                aluop0=1;
            end
         endcase    
    end    
endmodule
