`timescale 1ns/1ps

module Address_Register_tb;

    parameter WORD_SIZE = 8;

    // Signals
    reg [WORD_SIZE-1:0] data_in;
    reg load, clk, rst;
    wire [WORD_SIZE-1:0] data_out;

    // Instantiate UUT
    Address_Register #(WORD_SIZE) uut (
        .data_out(data_out),
        .data_in(data_in),
        .load(load),
        .clk(clk),
        .rst(rst)
    );

    // Clock generation (10ns)
    always #5 clk = ~clk;

    initial begin
        // --- 1. Reset ban đầu (Phủ nhánh rst == 0) ---
        clk = 0; rst = 0; load = 0; data_in = 0;
        #12 rst = 1; // Reset lệch pha để kiểm tra tính không đồng bộ

        // --- 2. Nạp giá trị AA (Toggle bit xen kẽ) ---
        #10;
        data_in = 8'hAA;
        load = 1;
        #10;
        load = 0;

        // --- 3. Thay đổi data_in khi load = 0 (Kiểm tra chốt dữ liệu) ---
        #10;
        data_in = 8'h55;
        #10;

        // --- 4. Nạp giá trị 55 (Hoàn tất Toggle bit cho các vị trí còn lại) ---
        #10;
        load = 1;
        #10;
        load = 0;

        // --- 5. Reset cuối cùng ---
        #10 rst = 0;
        #10 $finish;
    end
endmodule
