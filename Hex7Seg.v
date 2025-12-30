module Hex7Seg (input [3:0] hex_digit, output reg [7:0] display_out);
    always @(*) begin
        case (hex_digit)
            4'h0: display_out = 7'b100_0000; 4'h1: display_out = 7'b111_1001; 
            4'h2: display_out = 7'b010_0100; 4'h3: display_out = 7'b011_0000; 
            4'h4: display_out = 7'b001_1001; 4'h5: display_out = 7'b001_0010; 
            4'h6: display_out = 7'b000_0010; 4'h7: display_out = 7'b111_1000; 
            4'h8: display_out = 7'b000_0000; 4'h9: display_out = 7'b001_0000; 
            4'hA: display_out = 7'b000_1000; 4'hB: display_out = 7'b000_0011; 
            4'hC: display_out = 7'b100_0110; 4'hD: display_out = 7'b010_0001; 
            4'hE: display_out = 7'b000_0110; 4'hF: display_out = 7'b000_1110; 
            default: display_out = 7'b111_1111; 
        endcase
    end
endmodule
