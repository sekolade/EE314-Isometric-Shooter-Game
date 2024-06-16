module enemy_effect(
    input clk,
    input [15:0] enemy_matrix1,
    input [15:0] enemy_matrix2,
    input [15:0] enemy_matrix3,
    input [15:0] enemy_matrix4,
    input [15:0] enemy_matrix5,
    input [15:0] enemy_matrix6,
    input [15:0] enemy_matrix7,
    input [15:0] enemy_matrix8,
    input [9:0] next_x,
    input [9:0] next_y,
    output reg [7:0] color
);

    wire [9:0] x1, y1, x2, y2, x3, y3, x4, y4, x5, y5, x6, y6, x7, y7, x8, y8;

    // Instantiating the location modules for each enemy
    location loc1(enemy_matrix1[12:9], enemy_matrix1[8:4], x1, y1);
    location loc2(enemy_matrix2[12:9], enemy_matrix2[8:4], x2, y2);
    location loc3(enemy_matrix3[12:9], enemy_matrix3[8:4], x3, y3);
    location loc4(enemy_matrix4[12:9], enemy_matrix4[8:4], x4, y4);
    location loc5(enemy_matrix5[12:9], enemy_matrix5[8:4], x5, y5);
    location loc6(enemy_matrix6[12:9], enemy_matrix6[8:4], x6, y6);
    location loc7(enemy_matrix7[12:9], enemy_matrix7[8:4], x7, y7);
    location loc8(enemy_matrix8[12:9], enemy_matrix8[8:4], x8, y8);

    reg [7:0] explosion_color1;
	 reg [7:0] explosion_color2;
	 reg [7:0] explosion_color3;
	 reg [7:0] explosion_color4;
	 reg [7:0] explosion_color5;
	 reg [7:0] explosion_color6;
	 reg [7:0] explosion_color7;
	 reg [7:0] explosion_color8;
    reg [4:0] location_;
    reg [19:0] distance_sq;
    reg [19:0] radius_sq = 100;
    reg [2:0] type;
    reg alive_dead;
    integer i;

    always @(posedge clk) begin
        color = 8'b00000000; // Default color
        // Iterate over each enemy
        for (i = 0; i < 8; i = i + 1) begin
            // Determine location and distance for each enemy
            case (i)
                0: begin
                    location_ = enemy_matrix1[8:4];
                    type = enemy_matrix1[2:0];
                    alive_dead = enemy_matrix1[3];
                    distance_sq = (x1 - next_x) * (x1 - next_x) + (y1 - next_y) * (y1 - next_y);
						  if (location_ >= 29) begin
                explosion_color1 = 8'b11111111; // Bright blue
            end else if (location_ >= 23) begin
                explosion_color1 = 8'b11111111; // Fading effect
            end else if (location_ >= 17) begin
                explosion_color1 = 8'b11111111; // Fading effect
            end else if (location_ >= 7) begin
                explosion_color1 = 8'b11111111; // Fading effect
            end else if (location_ >= 3) begin
                explosion_color1 = 8'b11111111; // Fading effect
            end else if (location_ >= 1) begin
                explosion_color1 = 8'b11111111; // Fading effect
            end else if (location_ >= 23) begin
                explosion_color1 = 8'b11111111; // Fading effect
            end else if (location_ >= 22) begin
                explosion_color1 = 8'b11111111; // Fading effect
            end else begin
                explosion_color1 = 8'b11111111; // No explosion
            end
                
					 					if (distance_sq < radius_sq && location_ <= 31 && location_ >= 22) begin
						color = explosion_color1;
					end
					else begin
						color = 8'b00000000;
					end
					end
                1: begin
                    location_ = enemy_matrix2[8:4];
                    type = enemy_matrix2[2:0];
                    alive_dead = enemy_matrix2[3];
                    distance_sq = (x2 - next_x) * (x2 - next_x) + (y2 - next_y) * (y2 - next_y);
						  if (location_ >= 29) begin
                explosion_color1 = 8'b11111111; // Bright blue
            end else if (location_ >= 23) begin
                explosion_color1 = 8'b11111111; // Fading effect
            end else if (location_ >= 17) begin
                explosion_color1 = 8'b11111111; // Fading effect
            end else if (location_ >= 7) begin
                explosion_color1 = 8'b11111111; // Fading effect
            end else if (location_ >= 3) begin
                explosion_color1 = 8'b11111111; // Fading effect
            end else if (location_ >= 1) begin
                explosion_color1 = 8'b11111111; // Fading effect
            end else if (location_ >= 23) begin
                explosion_color1 = 8'b11111111; // Fading effect
            end else if (location_ >= 22) begin
                explosion_color1 = 8'b11111111; // Fading effect
            end else begin
                explosion_color1 = 8'b11111111; // No explosion
            end
                
					 					if (distance_sq < radius_sq && location_ <= 31 && location_ >= 22) begin
						color = explosion_color2;
					end
					else begin
						color = 8'b00000000;
					end
					end
                2: begin
                    location_ = enemy_matrix3[8:4];
                    type = enemy_matrix3[2:0];
                    alive_dead = enemy_matrix3[3];
                    distance_sq = (x3 - next_x) * (x3 - next_x) + (y3 - next_y) * (y3 - next_y);
						  if (location_ >= 29) begin
                explosion_color1 = 8'b11111111; // Bright blue
            end else if (location_ >= 23) begin
                explosion_color1 = 8'b11111111; // Fading effect
            end else if (location_ >= 17) begin
                explosion_color1 = 8'b11111111; // Fading effect
            end else if (location_ >= 7) begin
                explosion_color1 = 8'b11111111; // Fading effect
            end else if (location_ >= 3) begin
                explosion_color1 = 8'b11111111; // Fading effect
            end else if (location_ >= 1) begin
                explosion_color1 = 8'b11111111; // Fading effect
            end else if (location_ >= 23) begin
                explosion_color1 = 8'b11111111; // Fading effect
            end else if (location_ >= 22) begin
                explosion_color1 = 8'b11111111; // Fading effect
            end else begin
                explosion_color1 = 8'b11111111; // No explosion
            end
                
					 					if (distance_sq < radius_sq && location_ <= 31 && location_ >= 22) begin
						color = explosion_color3;
					end
					else begin
						color = 8'b00000000;
					end
					end
                3: begin
                    location_ = enemy_matrix4[8:4];
                    type = enemy_matrix4[2:0];
                    alive_dead = enemy_matrix4[3];
                    distance_sq = (x4 - next_x) * (x4 - next_x) + (y4 - next_y) * (y4 - next_y);
						  if (location_ >= 29) begin
                explosion_color1 = 8'b11111111; // Bright blue
            end else if (location_ >= 23) begin
                explosion_color1 = 8'b11111111; // Fading effect
            end else if (location_ >= 17) begin
                explosion_color1 = 8'b11111111; // Fading effect
            end else if (location_ >= 7) begin
                explosion_color1 = 8'b11111111; // Fading effect
            end else if (location_ >= 3) begin
                explosion_color1 = 8'b11111111; // Fading effect
            end else if (location_ >= 1) begin
                explosion_color1 = 8'b11111111; // Fading effect
            end else if (location_ >= 23) begin
                explosion_color1 = 8'b11111111; // Fading effect
            end else if (location_ >= 22) begin
                explosion_color1 = 8'b11111111; // Fading effect
            end else begin
                explosion_color1 = 8'b11111111; // No explosion
            end
                
					 					if (distance_sq < radius_sq && location_ <= 31 && location_ >= 22) begin
						color = explosion_color4;
					end
					else begin
						color = 8'b00000000;
					end
					end
                4: begin
                    location_ = enemy_matrix5[8:4];
                    type = enemy_matrix5[2:0];
                    alive_dead = enemy_matrix5[3];
                    distance_sq = (x5 - next_x) * (x5 - next_x) + (y5 - next_y) * (y5 - next_y);
						  if (location_ >= 29) begin
                explosion_color1 = 8'b11111111; // Bright blue
            end else if (location_ >= 23) begin
                explosion_color1 = 8'b11111111; // Fading effect
            end else if (location_ >= 17) begin
                explosion_color1 = 8'b11111111; // Fading effect
            end else if (location_ >= 7) begin
                explosion_color1 = 8'b11111111; // Fading effect
            end else if (location_ >= 3) begin
                explosion_color1 = 8'b11111111; // Fading effect
            end else if (location_ >= 1) begin
                explosion_color1 = 8'b11111111; // Fading effect
            end else if (location_ >= 23) begin
                explosion_color1 = 8'b11111111; // Fading effect
            end else if (location_ >= 22) begin
                explosion_color1 = 8'b11111111; // Fading effect
            end else begin
                explosion_color1 = 8'b11111111; // No explosion
            end
                
					 					if (distance_sq < radius_sq && location_ <= 31 && location_ >= 22) begin
						color = explosion_color5;
					end
					else begin
						color = 8'b00000000;
					end
					end
                5: begin
                    location_ = enemy_matrix6[8:4];
                    type = enemy_matrix6[2:0];
                    alive_dead = enemy_matrix6[3];
                    distance_sq = (x6 - next_x) * (x6 - next_x) + (y6 - next_y) * (y6 - next_y);
						  if (location_ >= 29) begin
                explosion_color1 = 8'b11111111; // Bright blue
            end else if (location_ >= 23) begin
                explosion_color1 = 8'b11111111; // Fading effect
            end else if (location_ >= 17) begin
                explosion_color1 = 8'b11111111; // Fading effect
            end else if (location_ >= 7) begin
                explosion_color1 = 8'b11111111; // Fading effect
            end else if (location_ >= 3) begin
                explosion_color1 = 8'b11111111; // Fading effect
            end else if (location_ >= 1) begin
                explosion_color1 = 8'b11111111; // Fading effect
            end else if (location_ >= 23) begin
                explosion_color1 = 8'b11111111; // Fading effect
            end else if (location_ >= 22) begin
                explosion_color1 = 8'b11111111; // Fading effect
            end else begin
                explosion_color1 = 8'b11111111; // No explosion
            end
                
					 					if (distance_sq < radius_sq && location_ <= 31 && location_ >= 22) begin
						color = explosion_color6;
					end
					else begin
						color = 8'b00000000;
					end
					end
                6: begin
                    location_ = enemy_matrix7[8:4];
                    type = enemy_matrix7[2:0];
                    alive_dead = enemy_matrix7[3];
                    distance_sq = (x7 - next_x) * (x7 - next_x) + (y7 - next_y) * (y7 - next_y);
						  if (location_ >= 29) begin
                explosion_color1 = 8'b11111111; // Bright blue
            end else if (location_ >= 23) begin
                explosion_color1 = 8'b11111111; // Fading effect
            end else if (location_ >= 17) begin
                explosion_color1 = 8'b11111111; // Fading effect
            end else if (location_ >= 7) begin
                explosion_color1 = 8'b11111111; // Fading effect
            end else if (location_ >= 3) begin
                explosion_color1 = 8'b11111111; // Fading effect
            end else if (location_ >= 1) begin
                explosion_color1 = 8'b11111111; // Fading effect
            end else if (location_ >= 23) begin
                explosion_color1 = 8'b11111111; // Fading effect
            end else if (location_ >= 22) begin
                explosion_color1 = 8'b11111111; // Fading effect
            end else begin
                explosion_color1 = 8'b11111111; // No explosion
            end
                
					 					if (distance_sq < radius_sq && location_ <= 31 && location_ >= 22) begin
						color = explosion_color7;
					end
					else begin
						color = 8'b00000000;
					end
					end
                7: begin
                    location_ = enemy_matrix8[8:4];
                    type = enemy_matrix8[2:0];
                    alive_dead = enemy_matrix8[3];
                    distance_sq = (x8 - next_x) * (x8 - next_x) + (y8 - next_y) * (y8 - next_y);
						  if (location_ >= 29) begin
                explosion_color1 = 8'b11111111; // Bright blue
            end else if (location_ >= 23) begin
                explosion_color1 = 8'b11111111; // Fading effect
            end else if (location_ >= 17) begin
                explosion_color1 = 8'b11111111; // Fading effect
            end else if (location_ >= 7) begin
                explosion_color1 = 8'b11111111; // Fading effect
            end else if (location_ >= 3) begin
                explosion_color1 = 8'b11111111; // Fading effect
            end else if (location_ >= 1) begin
                explosion_color1 = 8'b11111111; // Fading effect
            end else if (location_ >= 23) begin
                explosion_color1 = 8'b11111111; // Fading effect
            end else if (location_ >= 22) begin
                explosion_color1 = 8'b11111111; // Fading effect
            end else begin
                explosion_color1 = 8'b11111111; // No explosion
            end
                
					if (distance_sq < radius_sq && location_ <= 31 && location_ >= 22) begin
						color = explosion_color8;
					end
					else begin
						color = 8'b00000000;
					end
					end
            endcase


        end
    end
endmodule