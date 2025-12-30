module Memory_Unit 
#(
    parameter word_size = 8, memory_size = 256
)(
    output [word_size-1: 0] data_out, 
    input [word_size-1: 0] data_in, address, 
    input clk, write
);
    reg [word_size-1: 0] memory [memory_size-1: 0];
    // Read Logic
    assign data_out = memory[address];
    // Write Logic
    always @ (posedge clk) begin
        if (write) 
            memory[address] <= data_in;
		  end
    // Memory Added
    integer i;
    initial begin
		   // Load R1 with value at 80
        memory[0]=8'h51; memory[1]=8'h80;
		  // Load R2 with value at 81
        memory[2]=8'h52; memory[3]=8'h81;
		  // SUB R1, R2
        memory[4]=8'h29;
		  // Store result
        memory[5]=8'h64; memory[6]=8'h82; 
		  // Branch back to 00
        memory[7]=8'h70; memory[8]=8'h00;
        
        // Data
        memory[8'h80]=8'h03; // First number
        memory[8'h81]=8'h02; // Second number
    end

endmodule
