`timescale 1ns/1ps

module Memory_Unit_tb;
    parameter WORD_SIZE = 8;
    parameter MEM_SIZE = 256;

    reg [WORD_SIZE-1:0] data_in, address;
    reg clk, write;
    wire [WORD_SIZE-1:0] data_out;

    // Khởi tạo Module
    Memory_Unit #(WORD_SIZE, MEM_SIZE) uut (
        .data_out(data_out),
        .data_in(data_in),
        .address(address),
        .clk(clk),
        .write(write)
    );

    // Tạo xung Clock
    always #5 clk = ~clk;

    initial begin
        // Khởi tạo tín hiệu
        clk = 0; write = 0; data_in = 0; address = 0;

        // 1. Kiểm tra đọc dữ liệu mặc định tại địa chỉ 0
        #10 address = 8'h00;
        
        // 2. Ghi dữ liệu vào địa chỉ 10 (8'h0A)
        #10;
        address = 8'h0A;
        data_in = 8'h55;
        write = 1;
        #10 write = 0; // Kết thúc chu kỳ ghi

        // 3. Đọc lại dữ liệu vừa ghi để kiểm chứng
        #10;
        address = 8'h0A;
        
        // 4. Ghi đè dữ liệu khác (Kiểm tra Toggle bit)
        #10;
        address = 8'h0A;
        data_in = 8'hAA;
        write = 1;
        #10 write = 0;

        #20 $finish;
    end
endmodule
