/*Instruction Register
Stores the instruction to be executed
Format
	inst[7:4] <= opcode
	inst[3:2] <= source
	inst[1:0] <= destionation
*/

module Instruction_Register #(
  parameter ws = 8
) (
    // data_out <= instruction
    output reg [ws-1: 0] data_out,
    // data_in <= Bus_2
    input [ws-1: 0] data_in,
    // load <= Load_IR
    input load,
    input clk, rst
);
    always @ (posedge clk or negedge rst)
    if (rst == 0) 
        data_out <= 0; 
    else if (load) 
        data_out <= data_in; 
endmodule
