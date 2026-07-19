module alu(input  [3:0] alu_ctrl, 
    input  [31:0] data1, data2, 
    output reg [31:0] alu_out, 
    output Zero );
    always @(*) begin
        case(alu_ctrl)
        0: alu_out<=data1 & data2;
        1: alu_out<=data1 | data2;
        2: alu_out<= data1 + data2;
        6:alu_out<= data1-data2;
        7: alu_out<=(data1<data2)? 0:1;
        8: alu_out<=(data1>data2)?0:1;
        12: alu_out<=~(data1 |  data2);
        'b1111: alu_out <= data1<<data2;
        default: alu_out<=0;
        endcase 
    end
    
    assign Zero=(alu_out==0);



endmodule