`timescale 1ns/1ps

module D_flop_tb;

    reg data_in, load, clk, rst;
    wire data_out;

    // Instantiate UUT
    D_flop uut (
        .data_out(data_out),
        .data_in(data_in),
        .load(load),
        .clk(clk),
        .rst(rst)
    );

    // Clock generation (10ns)
    always #5 clk = ~clk;

    initial begin
        // --- 1. Khởi tạo & Reset (Phủ nhánh rst == 0) ---
        clk = 0; rst = 0; load = 0; data_in = 0;
        #10 rst = 1;

        // --- 2. Load bit 1 (Phủ nhánh load == 1 và kiểm tra Toggle 0->1) ---
        #10;
        data_in = 1;
        load = 1;
        #10;
        load = 0; // Chốt giá trị 1

        // --- 3. Thay đổi data_in khi load = 0 (Kiểm tra tính ổn định) ---
        #10;
        data_in = 0;
        #10;

        // --- 4. Load bit 0 (Kiểm tra Toggle 1->0) ---
        #10;
        load = 1;
        #10;
        load = 0;

        // --- 5. Reset bất ngờ (Kiểm tra tính bất đồng bộ của rst) ---
        #5 rst = 0;
        #10 rst = 1;

        #20 $finish;
    end
endmodule
