module color_hierarchy(clk,color_spaceship,color_scoreboard,color_enemy,color_gameover,color_yildiz,color_main,gameover,reset,background_switch);
input clk;
input wire background_switch;
input wire [7:0] color_spaceship;
input wire [7:0] color_scoreboard;
input wire [7:0] color_enemy;
input wire [7:0] color_gameover;
input gameover;
input reset;
output reg [7:0] color_main;
input wire [7:0] color_yildiz;
always @(clk) begin
	if (reset) begin
		
		color_main = 8'b01000111;
	end
	else begin
		if (gameover) begin //gameover
			if (color_scoreboard != 8'b00000000) begin
				color_main = color_scoreboard;
			end
			else begin
				color_main = color_gameover;
			end
		end
		else begin
			if(color_spaceship != 8'b00000000) begin
				color_main = color_spaceship;
			end
			else if(color_scoreboard != 8'b00000000) begin
				color_main = color_scoreboard;
			end
			else if(color_enemy != 8'b00000000) begin
				color_main = color_enemy;
			end
			else if (color_yildiz != 8'b00000000) begin
				if (background_switch == 0) begin
					color_main = color_yildiz;
				end
				else begin
					color_main = 8'b00000000;
				end
			end
			else begin
				color_main = 8'b00000000;
			end
		end
	end
end
endmodule