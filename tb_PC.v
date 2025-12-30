`timescale 1ns/1ps

module Program_Counter_tb;

    parameter WORD_SIZE = 8;

    // Inputs
    reg [WORD_SIZE-1:0] data_in;
    reg Load_PC, Inc_PC, clk, rst;

    // Outputs
    wire [WORD_SIZE-1:0] count;

    // Instantiate UUT
    Program_Counter #(WORD_SIZE) uut (
        .count(count),
        .data_in(data_in),
        .Load_PC(Load_PC),
        .Inc_PC(Inc_PC),
        .clk(clk),
        .rst(rst)
    );

    // Clock 10ns
    always #5 clk = ~clk;

    initial begin
        // Khởi tạo
        clk = 0; rst = 1; Load_PC = 0; Inc_PC = 0; data_in = 0;

        // 1. Reset hệ thống (Phủ sóng nhánh rst == 0)
        #10 rst = 0;
        #10 rst = 1;

        // 2. Load dữ liệu ban đầu (Phủ sóng nhánh Load_PC)
        #10;
        data_in = 8'h10;
        Load_PC = 1;
        #10;
        Load_PC = 0;

        // 3. Tăng giá trị (Phủ sóng nhánh Inc_PC)
        #10;
        Inc_PC = 1;
        #30; // Tăng 3 lần (11, 12, 13)
        Inc_PC = 0;

        // 4. Ưu tiên: Vừa Load vừa Inc (Kiểm tra xem Load có được ưu tiên trước không)
        #10;
        data_in = 8'hFF;
        Load_PC = 1;
        Inc_PC = 1;
        #10;
        Load_PC = 0;
        Inc_PC = 0;

        // 5. Trạng thái nghỉ (Không load, không inc)
        #20;

        $finish;
    end
endmodule
