`timescale 1ns/1ps

module Multiplexer_5ch_tb;
    parameter WORD_SIZE = 8;

    reg [WORD_SIZE-1:0] data_a, data_b, data_c, data_d, data_e;
    reg [2:0] sel;
    wire [WORD_SIZE-1:0] mux_out;

    Multiplexer_5ch #(WORD_SIZE) uut (.*); // Dùng .* để nối nhanh các chân trùng tên

    initial begin
        // Khởi tạo giá trị
        data_a = 8'hAA; data_b = 8'hBB; data_c = 8'hCC; 
        data_d = 8'hDD; data_e = 8'hEE;
        sel = 0;

        // --- Bước 1: Quét tất cả các nhánh của CASE (Branch Coverage) ---
        for (integer i = 0; i < 8; i = i + 1) begin
            sel = i;
            #10;
        end

        // --- Bước 2: Kích hoạt Toggle Coverage (Đảo bit toàn bộ đầu vào) ---
        data_a = 8'h55; data_b = 8'h44; data_c = 8'h33;
        data_d = 8'h22; data_e = 8'h11;
        #10;
        
        // Quay lại giá trị ban đầu để đảm bảo bit 0->1 và 1->0
        data_a = 8'h00; data_b = 8'hFF;
        sel = 0; #10;
        sel = 1; #10;

        $display("Simulation finished. Check HTML report for coverage.");
        $finish;
    end
endmodule
