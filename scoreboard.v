module scoreboard (
    input clk,
    input [9:0] next_x,
    input [9:0] next_y,
    input [7:0] number,
    output reg [7:0] vga_color
);
localparam centerx = 500;
localparam centery = 50;
localparam FONT_WIDTH = 11; // 10 bits for the digit + 1 bit for the space
localparam FONT_HEIGHT = 10;
localparam TOTAL_WIDTH = 2 * FONT_WIDTH;
localparam START_X = centerx - (TOTAL_WIDTH) / 2;
localparam START_Y = centery - (FONT_HEIGHT) / 2;
reg [10:0] font [0:9] [0:9];

initial begin
    // 0
    font[0][0] = 11'b00111111000;
    font[0][1] = 11'b01100001100;
    font[0][2] = 11'b11000000110;
    font[0][3] = 11'b11000000110;
    font[0][4] = 11'b11000000110;
    font[0][5] = 11'b11000000110;
    font[0][6] = 11'b11000000110;
    font[0][7] = 11'b11000000110;
    font[0][8] = 11'b01100001100;
    font[0][9] = 11'b00111111000;
    // 1
    font[1][0] = 11'b00011100000;
    font[1][1] = 11'b00111100000;
    font[1][2] = 11'b01111100000;
    font[1][3] = 11'b00011100000;
    font[1][4] = 11'b00011100000;
    font[1][5] = 11'b00011100000;
    font[1][6] = 11'b00011100000;
    font[1][7] = 11'b00011100000;
    font[1][8] = 11'b00011100000;
    font[1][9] = 11'b01111111110;
    // 2
    font[2][0] = 11'b00111111000;
    font[2][1] = 11'b01100001100;
    font[2][2] = 11'b11000000110;
    font[2][3] = 11'b00000000110;
    font[2][4] = 11'b00000001100;
    font[2][5] = 11'b00000011000;
    font[2][6] = 11'b00000110000;
    font[2][7] = 11'b00001100000;
    font[2][8] = 11'b00011000000;
    font[2][9] = 11'b01111111110;
    // 3
    font[3][0] = 11'b00111111000;
    font[3][1] = 11'b01100001100;
    font[3][2] = 11'b11000000110;
    font[3][3] = 11'b00000000110;
    font[3][4] = 11'b00000111100;
    font[3][5] = 11'b00000111100;
    font[3][6] = 11'b00000000110;
    font[3][7] = 11'b00000000110;
    font[3][8] = 11'b01100001100;
    font[3][9] = 11'b00111111000;
    // 4
    font[4][0] = 11'b00000011000;
    font[4][1] = 11'b00000111000;
    font[4][2] = 11'b00001111000;
    font[4][3] = 11'b00011111000;
    font[4][4] = 11'b00110111000;
    font[4][5] = 11'b01100111000;
    font[4][6] = 11'b11111111110;
    font[4][7] = 11'b00000111000;
    font[4][8] = 11'b00000111000;
    font[4][9] = 11'b00000111000;
    // 5
    font[5][0] = 11'b01111111110;
    font[5][1] = 11'b01100000000;
    font[5][2] = 11'b01100000000;
    font[5][3] = 11'b01111111000;
    font[5][4] = 11'b00000001100;
    font[5][5] = 11'b00000000110;
    font[5][6] = 11'b00000000110;
    font[5][7] = 11'b00000000110;
    font[5][8] = 11'b01100001100;
    font[5][9] = 11'b00111111000;
    // 6
    font[6][0] = 11'b00111111000;
    font[6][1] = 11'b01100001100;
    font[6][2] = 11'b11000000110;
    font[6][3] = 11'b11000000000;
    font[6][4] = 11'b11111111000;
    font[6][5] = 11'b11000001100;
    font[6][6] = 11'b11000000110;
    font[6][7] = 11'b11000000110;
    font[6][8] = 11'b01100001100;
    font[6][9] = 11'b00111111000;
    // 7
    font[7][0] = 11'b01111111110;
    font[7][1] = 11'b00000001100;
    font[7][2] = 11'b00000001100;
    font[7][3] = 11'b00000011000;
    font[7][4] = 11'b00000011000;
    font[7][5] = 11'b00000110000;
    font[7][6] = 11'b00000110000;
    font[7][7] = 11'b00001100000;
    font[7][8] = 11'b00001100000;
    font[7][9] = 11'b00001100000;
    // 8
    font[8][0] = 11'b00111111000;
    font[8][1] = 11'b01100001100;
    font[8][2] = 11'b11000000110;
    font[8][3] = 11'b11000000110;
    font[8][4] = 11'b01100001100;
    font[8][5] = 11'b00111111000;
    font[8][6] = 11'b01100001100;
    font[8][7] = 11'b11000000110;
    font[8][8] = 11'b11000000110;
    font[8][9] = 11'b01111111100;
    // 9
    font[9][0] = 11'b00111111000;
    font[9][1] = 11'b01100001100;
    font[9][2] = 11'b11000000110;
    font[9][3] = 11'b11000000110;
    font[9][4] = 11'b01111111110;
    font[9][5] = 11'b00000000110;
    font[9][6] = 11'b00000000110;
    font[9][7] = 11'b00000000110;
    font[9][8] = 11'b01100001100;
    font[9][9] = 11'b00111111000;
end

always @(posedge clk) begin
    reg [3:0] digit1;
    reg [3:0] digit2;
    reg [3:0] digit;
    reg [3:0] row;
    reg [3:0] col;
    
    digit1 = number / 10;
    digit2 = number % 10;

    if (next_x >= START_X && next_x < (START_X + TOTAL_WIDTH) &&
        next_y >= START_Y && next_y < (START_Y + FONT_HEIGHT)) begin

        if (next_x < (START_X + FONT_WIDTH)) begin
            digit = digit1;
            col = next_x - START_X;
        end else begin
            digit = digit2;
            col = next_x - START_X - FONT_WIDTH;
        end
        
        row = next_y - START_Y;

        if (font[digit][row][10 - col]) begin
            vga_color = 8'b00011100; // beyaz
        end else begin
            vga_color = 8'b00000000; // siyah
        end
    end else begin
        vga_color = 8'b00000000; // siyah
    end
end
endmodule
