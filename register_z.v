/* D flip-flop for register Z
*/

module Register_Z (
    output reg  data_out,
    // data_out <= all_zero_flag
    input   data_in, load, clk, rst
);
    always @ (posedge clk or negedge rst)
        if (rst == 0) 
            data_out <= 0; 
        else if (load == 1)
            data_out <= data_in;
endmodule
