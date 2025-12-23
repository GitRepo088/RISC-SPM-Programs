/* Address_Register
Stores the address from which memory is accessed
*/

module Address_Register #(
    parameter ws = 8
) (
    // data_out <= address
    output reg[ws-1: 0] data_out,
    // data_in <= Bus_2
    input [ws-1: 0] data_in,
    // load <= Load_Add_R
    input load,
    input clk, rst
);
    always @ (posedge clk or negedge rst)
    if (rst == 0) 
        data_out <= 0; 
    else if (load) 
        data_out <= data_in;
endmodule
