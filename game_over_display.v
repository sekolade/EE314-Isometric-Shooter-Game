module game_over_display (
    input wire clk,
    input wire gameover,
    input wire [9:0] next_x,
    input wire [9:0] next_y,
    output reg [7:0] vga_color
);

    always @(posedge clk) begin
        if (gameover) begin
            if (next_x >= 70 && next_x < 570 && next_y >= 99 && next_y < 400) begin
                if (
                    // G
                    (next_x >= 120 && next_x < 140 && next_y >= 100 && next_y < 200) || 
                    (next_x >= 140 && next_x < 200 && next_y >= 100 && next_y < 120) || 
                    (next_x >= 180 && next_x < 200 && next_y >= 160 && next_y < 200) || 
                    (next_x >= 160 && next_x < 200 && next_y >= 140 && next_y < 160) ||
                    (next_x >= 140 && next_x < 200 && next_y >= 180 && next_y < 200) ||
                    // A
                    (next_x >= 220 && next_x < 240 && next_y >= 100 && next_y < 200) || 
                    (next_x >= 240 && next_x < 300 && next_y >= 100 && next_y < 120) || 
                    (next_x >= 280 && next_x < 300 && next_y >= 100 && next_y < 200) || 
                    (next_x >= 240 && next_x < 280 && next_y >= 140 && next_y < 160) ||
                    // M
						  (next_x >= 320 && next_x < 340 && next_y >= 100 && next_y < 200) ||
						  (next_x >= 340 && next_x < 350 && next_y >= 100 && next_y < 120) ||
						  (next_x >= 350 && next_x < 370 && next_y >= 120 && next_y < 160) ||
						  (next_x >= 370 && next_x < 380 && next_y >= 100 && next_y < 120) ||		  
                    (next_x >= 380 && next_x < 400 && next_y >= 100 && next_y < 200) || 
                    // E
                    (next_x >= 420 && next_x < 480 && next_y >= 100 && next_y < 120) || 
                    (next_x >= 420 && next_x < 440 && next_y >= 100 && next_y < 200) || 
                    (next_x >= 420 && next_x < 480 && next_y >= 180 && next_y < 200) ||
                    (next_x >= 420 && next_x < 460 && next_y >= 140 && next_y < 160) ||
						  
						  
                    // O
                    (next_x >= 120 && next_x < 140 && next_y >= 240 && next_y < 340) || 
                    (next_x >= 140 && next_x < 200 && next_y >= 240 && next_y < 260) || 
                    (next_x >= 200 && next_x < 220 && next_y >= 240 && next_y < 340) || 
                    (next_x >= 140 && next_x < 200 && next_y >= 320 && next_y < 340) ||
                    // V
                    (next_x >= 240 && next_x < 260 && next_y >= 240 && next_y < 340) || 
                    (next_x >= 300 && next_x < 320 && next_y >= 240 && next_y < 340) || 
                    (next_x >= 260 && next_x < 300 && next_y >= 320 && next_y < 340) ||
                    // E
						  (next_x >= 340 && next_x < 400 && next_y >= 320 && next_y < 340) || 
                    (next_x >= 340 && next_x < 360 && next_y >= 240 && next_y < 320) || 
                    (next_x >= 340 && next_x < 400 && next_y >= 240 && next_y < 260) ||
                    (next_x >= 340 && next_x < 380 && next_y >= 280 && next_y < 300) ||
                    // R
                    (next_x >= 420 && next_x < 440 && next_y >= 240 && next_y < 340) || 
						  (next_x >= 440 && next_x < 500 && next_y >= 240 && next_y < 260) ||
						  (next_x >= 480 && next_x < 500 && next_y >= 240 && next_y < 280) ||
						  (next_x >= 460 && next_x < 500 && next_y >= 260 && next_y < 280) ||
						  (next_x >= 440 && next_x < 480 && next_y >= 280 && next_y < 310) ||
						  (next_x >= 460 && next_x < 500 && next_y >= 310 && next_y < 340))
                 begin
                    vga_color = 8'b11111111; // White
                end else begin
                    vga_color = 8'b00000000; // Black
                end
            end else begin
                vga_color = 8'b00000000; // Black
            end
        end else begin
            vga_color = 8'b00000000; // Black
        end
    end
endmodule
