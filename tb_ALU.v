`timescale 1ns/1ps

module Alu_RISC_tb;
    parameter WORD_SIZE = 8;
    parameter OP_SIZE = 4;

    reg [WORD_SIZE-1:0] data_1, data_2;
    reg [OP_SIZE-1:0] sel;
    wire [WORD_SIZE-1:0] alu_out;
    wire alu_zero_flag;

    // Khởi tạo module ALU
    Alu_RISC #(WORD_SIZE, OP_SIZE) uut (
        .alu_zero_flag(alu_zero_flag),
        .alu_out(alu_out),
        .data_1(data_1),
        .data_2(data_2),
        .sel(sel)
    );

    initial begin
        // Khởi tạo ban đầu
        data_1 = 0; data_2 = 0; sel = 0;

        // 1. Kiểm tra ADD (5 + 10 = 15) -> Flag = 0
        #10;
        data_1 = 8'd5; data_2 = 8'd10; sel = 4'b0001; 

        // 2. Kiểm tra SUB ra 0 (10 - 10 = 0) -> Flag = 1
        #10;
        data_1 = 8'd10; data_2 = 8'd10; sel = 4'b0010; 

        // 3. Kiểm tra AND ra 0 (8'hAA & 8'h55 = 0) -> Flag = 1
        #10;
        data_1 = 8'hAA; data_2 = 8'h55; sel = 4'b0011;

        // 4. Kiểm tra NOT (~8'hFF = 0) -> Flag = 1
        #10;
        data_2 = 8'hFF; sel = 4'b0100;

        // 5. Kiểm tra DEFAULT/NOP -> Flag = 1
        #10;
        sel = 4'b0000;

        // 6. Kiểm tra Toggle các bit (data_1 từ 00 lên FF)
        #10;
        data_1 = 8'hFF; data_2 = 8'h00; sel = 4'b0001;

        #20;
        $display("Kiem tra xong! Vui long mo file HTML de xem Coverage.");
        $finish;
    end
endmodule
