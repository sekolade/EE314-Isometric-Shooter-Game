module ClockDivider(
    input wire fpga_clock,   // 50 MHz giriş saati
    input wire [1:0] level,  // 2-bit seviye girişi
    output reg game_clock    // Çıkış saati
);

    reg [25:0] counter = 0;
    reg [25:0] DIVISOR;

    always @(*) begin
        case(level)
            2'b00: DIVISOR = 50000000 / 1;  // 0.5 Hz için
            2'b01: DIVISOR = 50000000 / 2;  // 1 Hz için
            2'b10: DIVISOR = 50000000 / 4;  // 2 Hz için
            2'b11: DIVISOR = 50000000 / 8;  // 4 Hz için
            default: DIVISOR=50000000 / 2; // Varsayılan olarak 1 Hz
        endcase
    end

    always @(posedge fpga_clock) begin
        if (counter < (DIVISOR / 2) - 1) begin
            counter <= counter + 1;
        end else begin
            counter <= 0;
            game_clock <= ~game_clock;  // Çıkış saatini toggle et
        end
    end

endmodule