`timescale 1ns / 1ps

module Multiplexer_3ch_tb;

    // Parameters
    parameter WIDTH = 8;

    // Inputs to the DUT (Device Under Test) are regs
    reg [WIDTH-1:0] data_a_tb;
    reg [WIDTH-1:0] data_b_tb;
    reg [WIDTH-1:0] data_c_tb;
    reg [1:0] sel_tb;

    // Outputs from the DUT are wires
    wire [WIDTH-1:0] mux_out_tb;

    // Instantiate the Device Under Test (DUT)
    Multiplexer_3ch #(.word_size(WIDTH)) dut (
        .mux_out(mux_out_tb),
        .data_a(data_a_tb),
        .data_b(data_b_tb),
        .data_c(data_c_tb),
        .sel(sel_tb)
    );

    // Initial block for stimulus generation
    initial begin
        // Set up monitoring to display changes automatically
        $monitor("Time = %0dns | sel = %b | data_a = %h, data_b = %h, data_c = %h | mux_out = %h", 
                 $time, sel_tb, data_a_tb, data_b_tb, data_c_tb, mux_out_tb);

        // 1. Initialize inputs with distinct patterns
        data_a_tb = 8'hAA;
        data_b_tb = 8'hBB;
        data_c_tb = 8'hCC;
        sel_tb = 2'b00; // Select data_a initially

        // Wait for 10 ns
        #10;

        // 2. Test Selection 1 (should output data_b)
        sel_tb = 2'b01;
        #10;

        // 3. Test Selection 2 (should output data_c)
        sel_tb = 2'b10;
        #10;

        // 4. Test Invalid Selection 3 (should output unknown 'x')
        sel_tb = 2'b11;
        #10;

        // 5. Change inputs and verify selection 0 again
        data_a_tb = 8'h12;
        data_b_tb = 8'h34;
        data_c_tb = 8'h56;
        sel_tb = 2'b00;
        #10;

        // End the simulation
        $display("Testbench completed.");
        $finish;
    end

endmodule
