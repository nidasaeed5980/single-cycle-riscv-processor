`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/14/2026 10:39:27 AM
// Design Name: 
// Module Name: single_cycle_top
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


module single_cycle_top(input clk,reset);
    wire [31:0] pc_in, out,instmemout,data1,data2,data_w,immout,aluin,alu_out,readdata,add_out,mux_out,add_shiftout;
    //reg clk,reset;
    wire [1:0] alu_op;
    wire [3:0] alu_ctrl;
    wire branch, mem_rd, mem2reg, mem_write, alu_scr, reg_write,zero,and_out;
    pc dut (.mux_out(pc_in),.clk(clk),.reset(reset),.pc_out(out)); 
    instructionMemory  dut1(.pc_out(out),.inst(instmemout));
    Register_File dut2 (.inst(instmemout),.write_en(reg_write),.clk(clk),.reset(reset),.data1(data1),.data2(data2),.data_w(data_w));
    control_unit dut3(.inst(instmemout),.branch(branch),.mem_rd(mem_rd),.mem2reg(mem2reg),.mem_write(mem_write),.alu_scr(alu_scr),.reg_write(reg_write),.alu_op(alu_op));
    imm_generator dut4(.inst(instmemout),.immout(immout));
    mux dut5(.a(data2),.b(immout),.sel(alu_scr),.y(aluin)); 
    alu_ctrl dut6(.alu_op(alu_op),.inst(instmemout),.alu_ctrl(alu_ctrl));
    alu dut7(.alu_ctrl(alu_ctrl),.data1(data1),.data2(aluin),.Zero(zero),.alu_out(alu_out));
    andGate dut8(.a(zero),.b(branch),.c(and_out));
    data_mem dut9 (.alu_out(alu_out),.data2(data2),.clk(clk),.reset(reset),.mem_write(mem_write),.mem_read(mem_rd),.dmem_out(readdata));
    mux dut10(.a(alu_out),.b(readdata),.sel(mem2reg),.y(data_w));
    adder pc_add(.a(out),.b(4),.sum(add_out));
    adder add_shift (.a(out),.b(immout),.sum(add_shiftout));
    mux dut11(.a(add_out),.b(add_shiftout),.sel(and_out),.y(pc_in));
endmodule
