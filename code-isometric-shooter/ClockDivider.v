module ClockDivider(
    input wire fpga_clock,   
    input wire [1:0] level,  
    output reg game_clock    
);
    reg [25:0] counter = 0;
    reg [25:0] DIVISOR;
    always @(*) begin
        case(level)
            2'b00: DIVISOR = 50000000 / 1; 
            2'b01: DIVISOR = 50000000 / 2;  
            2'b10: DIVISOR = 50000000 / 4;  
            2'b11: DIVISOR = 50000000 / 8;  
            default: DIVISOR=50000000 / 2; 
        endcase
    end
    always @(posedge fpga_clock) begin
        if (counter < (DIVISOR / 2) - 1) begin
            counter <= counter + 1;
        end else begin
            counter <= 0;
            game_clock <= ~game_clock; 
        end
    end
endmodule
