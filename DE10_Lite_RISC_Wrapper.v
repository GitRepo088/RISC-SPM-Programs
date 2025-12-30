module DE10_Lite_RISC_Wrapper (
    input         MAX10_CLK1_50, 
    input  [1:0]  KEY,           //KEY[0] is Reset
    input  [9:0]  SW,            //SW[1:0] Selects Register
    output [9:0]  LEDR,          //State LEDs
    output [7:0]  HEX0, HEX1, HEX2, HEX3, HEX4, HEX5
);

    //1. SLOW CLOCK (1 Seconds)
    reg [31:0] count_reg; 
    reg clk_slow;
    always @(posedge MAX10_CLK1_50) begin
        if (count_reg == 25000000) begin 
            count_reg <= 0;
            clk_slow <= ~clk_slow;
        end 
		  else begin
            count_reg <= count_reg + 1;
        end
    end

    //2. WIRES TO CONNECT MODULES
    wire [7:0] R0, R1, R2, R3, PC, IR;
    wire [3:0] State;

    //3. INSTANTIATE CPU (Mapping wires carefully)
    RISC_SPM my_cpu (
        .clk(clk_slow), 
        .rst(KEY[0]), 
        .R0(R0), .R1(R1), .R2(R2), .R3(R3),
        .PC(PC),      // Connects PC wire to PC port
        .IR(IR),      // Connects IR wire to IR port
        .State(State) // Connects State wire to State port
    );

    // --- 4. DEBUG LEDS ---
    assign LEDR[3:0] = State;    // Show State Machine steps
    assign LEDR[9]   = clk_slow; // Heartbeat

    // --- 5. HEX DISPLAY MAPPING ---
    // Leftmost (HEX5-4): Program Counter (The Line Number)
    Hex7Seg h5 (PC[7:4], HEX5); 
    Hex7Seg h4 (PC[3:0], HEX4); 

    // Middle (HEX3-2): Instruction Register (The Opcodes)
    Hex7Seg h3 (IR[7:4], HEX3); 
    Hex7Seg h2 (IR[3:0], HEX2); 

    // Rightmost (HEX1-0): Selected Register Value (The Data/Result)
    // Remember: Set SW[0] UP to see Register 1 (the result)
    reg [7:0] reg_display;
    always @(*) begin
        case(SW[1:0])
            2'b00: reg_display = R0;
            2'b01: reg_display = R1; 
            2'b10: reg_display = R2;
            2'b11: reg_display = R3;
        endcase
    end
    Hex7Seg h1 (reg_display[7:4], HEX1);
    Hex7Seg h0 (reg_display[3:0], HEX0);
endmodule
