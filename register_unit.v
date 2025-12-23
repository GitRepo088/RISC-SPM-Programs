/* 
General purpose registers R0, R1, R2 and R3
ws means word length
*/

module Register_Unit #(
    parameter ws = 8
) (
    output reg [ws-1: 0] data_out,
    // data_in <= Bus_2
    input [ws-1: 0] data_in,
    // load <= load_Ri
    input load,
    input clk, rst
);
    always @ (posedge clk or negedge rst)
        if (rst == 0) 
            data_out <= 0; 
        else if (load) 
            data_out <= data_in;
endmodule

