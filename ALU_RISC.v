/*ALU
Instruction         Action
ADD         Adds the datapaths to form data_1 + data_2.
SUB			Subtracts the datapaths to form data_1 - data_2.
AND			Takes the bitwise-and of the datapaths, data_1 & data_2.
NOT			Takes the bitwise Boolean complement of data_1.
*/
//carries are ignored in this model.
module Alu_RISC(alu_zero_flag, alu_out, data_1, data_2, sel);
 parameter word_size = 8;
 parameter op_size = 4;
 // Opcodes
 parameter NOP = 4'b0000;
 parameter ADD = 4'b0001;
 parameter SUB = 4'b0010;
 parameter AND = 4'b0011;
 parameter NOT = 4'b0100;
 parameter RD  = 4'b0101;
 parameter WR  = 4'b0110;
 parameter BR  = 4'b0111;
 parameter BRZ = 4'b1000;
 output alu_zero_flag;
 output [word_size-1:0] alu_out;
 input  [word_size-1:0] data_1, data_2;
 input  [op_size-1:0] sel;
 reg alu_out;

 assign alu_zero_flag = ~|alu_out;
 always @(sel or data_1 or data_2)
   case(sel)
    NOP: alu_out = 0;
    ADD: alu_out = data_1 + data_2; // Reg_Y + Bus_1
    SUB: alu_out = data_2 - data_1;
    AND: alu_out = data_1 & data_2; 
    NOT: alu_out = ~data_2;// Gets data from Bus_1
    default: alu_out = 0;
   endcase
endmodule