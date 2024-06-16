	module main(fpgaclk,
	hsync,
	vsync,
	red,
	green,
	blue,
	sync,
	clk,
	blank,
	btn_right,
	btn_left, 
	sw_shooting_mode1,
	sw_shooting_mode2,
	alien1_wire,
	alien2_wire,
	alien3_wire,
	alien4_wire,
	alien5_wire,
	alien6_wire,
	alien7_wire,
	alien8_wire,
	sample_total,
	btn_fire,
	level2,
	reset_game,
	segments1,
	segments2,
	shooting_led,
	background_switch
	);
	input background_switch;
		output [2:0] shooting_led;
	output  [6:0] segments1;
	output  [6:0] segments2;
	input reset_game;
	input [1:0] level2;
	input btn_fire;
	input btn_left;
	input btn_right;
	input fpgaclk;
	input sw_shooting_mode1;
	input sw_shooting_mode2;
	wire [9:0]  next_x;
	wire [9:0]  next_y;
	/////////
	output  hsync;
	output  vsync;
	output [7:0] red;
	output [7:0] green;
	output [7:0] blue;
	output sync;
	output clk;
	output blank;
	output [15:0]alien1_wire;
	output [15:0]alien2_wire;
	output [15:0]alien3_wire;
	output [15:0]alien4_wire;
	output [15:0]alien5_wire;
	output [15:0]alien6_wire;
	output [15:0]alien7_wire;
	output [15:0]alien8_wire;
	output [2:0] sample_total;
	//////////
	wire [3:0] current_angle;
	wire [7:0] color_spaceship;
	wire [7:0] color_yildiz;
	wire [7:0] color_scoreboard;
	wire [7:0] color_main;
	wire [7:0] color_gameover;
	wire [7:0] color_enemy;
	reg [7:0] score; 
	//wire [15:0] alien1_wire; 
	//wire [15:0] alien2_wire; 
	//wire [15:0] alien3_wire; 
	//wire [15:0] alien4_wire;
	//wire [15:0] alien5_wire; 
	//wire [15:0] alien6_wire; 
	//wire [15:0] alien7_wire; 
	//wire [15:0] alien8_wire;
	wire gameover;
	//wire [3:0] rocketangle;
	wire [6:0] score_number;
	reg [3:0] digit1;
	reg [3:0] digit2;
	////////
	reg clk_25mhz;
	reg reset;

	initial begin
	clk_25mhz =0;
	reset =0;
	score = 8'd12;
	end
	always @(posedge fpgaclk) begin
		clk_25mhz <= !(clk_25mhz);
		score <= 8'd12;
		digit1 = score_number / 10;
		digit2 = score_number % 10;
	end


	vga_driver u1(clk_25mhz,reset,color_main,next_x,next_y,hsync,vsync,red,green,blue,sync,clk,blank);
	spaceship_body u2(clk_25mhz,next_x,next_y,color_spaceship,current_angle,sw_shooting_mode1,sw_shooting_mode2,shooting_led,reset_game,gameover);
	angle u3(clk_25mhz,btn_right,btn_left,current_angle);
	//rocket_driver(.reset(1),.shift_minus(btn_left),.shift_plus(btn_right),clock_fpga(fpgaclk));
	scoreboard u4(clk_25mhz,next_x,next_y,score_number,color_scoreboard);
	color_hierarchy u5(clk_25mhz,color_spaceship,color_scoreboard,color_enemy,color_gameover,color_yildiz,color_main,gameover,reset_game,background_switch);
	enemy_movement u6(clk_25mhz,alien1_wire,alien2_wire,alien3_wire,alien4_wire,alien5_wire,alien6_wire,alien7_wire,alien8_wire,next_x,next_y,color_enemy);
	dynamics_top u7(.game_over(gameover),.sample_total(sample_total),.clock_fpga(clk),.shoot_type({sw_shooting_mode1,sw_shooting_mode2}),.shoot(btn_fire),.shift_plus(btn_right),.shift_minus(btn_left),.reset(reset_game),.level(level2),.alien_alive_dead({alien1_wire[3],alien2_wire[3],alien3_wire[3],alien4_wire[3],alien5_wire[3],alien6_wire[3],alien7_wire[3],alien8_wire[3]}),.alien_1_quantization(alien1_wire[8:4]),.alien_2_quantization(alien2_wire[8:4]),.alien_3_quantization(alien3_wire[8:4]),.alien_4_quantization(alien4_wire[8:4]),.alien_5_quantization(alien5_wire[8:4]),.alien_6_quantization(alien6_wire[8:4]),.alien_7_quantization(alien7_wire[8:4]),.alien_8_quantization(alien8_wire[8:4]),.alien_1_angle_output(alien1_wire[12:9]),.alien_2_angle_output(alien2_wire[12:9]),.alien_3_angle_output(alien3_wire[12:9]),.alien_4_angle_output(alien4_wire[12:9]),.alien_5_angle_output(alien5_wire[12:9]),.alien_6_angle_output(alien6_wire[12:9]),.alien_7_angle_output(alien7_wire[12:9]),.alien_8_angle_output(alien8_wire[12:9]),.alien_1_type_output(alien1_wire[2:0]),.alien_2_type_output(alien2_wire[2:0]),.alien_3_type_output(alien3_wire[2:0]),.alien_4_type_output(alien4_wire[2:0]),.alien_5_type_output(alien5_wire[2:0]),.alien_6_type_output(alien6_wire[2:0]),.alien_7_type_output(alien7_wire[2:0]),.alien_8_type_output(alien8_wire[2:0]),.alien_1_can_out(alien1_wire[15:13]),.alien_2_can_out(alien2_wire[15:13]),.alien_3_can_out(alien3_wire[15:13]),.alien_4_can_out(alien4_wire[15:13]),.alien_5_can_out(alien5_wire[15:13]),.alien_6_can_out(alien6_wire[15:13]),.alien_7_can_out(alien7_wire[15:13]),.alien_8_can_out(alien8_wire[15:13]),.score(score_number),.angle(current_angle));
	yildiz_kumlu u8(clk_25mhz,next_x,next_y,color_yildiz);
	game_over_display u9(clk_25mhz,gameover,next_x,next_y,color_gameover);
	seven_segment_display u10(digit1,segments2);
	seven_segment_display u11(digit2,segments1);
	
	//	enemy_movement u12(clk_25mhz,alien1_wire,alien2_wire,alien3_wire,alien4_wire,alien5_wire,alien6_wire,alien7_wire,alien8_wire,next_x,next_y,color_effect);

	endmodule


