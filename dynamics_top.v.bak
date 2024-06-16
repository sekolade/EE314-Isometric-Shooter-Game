module dynamics_top (
input clock_fpga,
input [1:0] shoot_type,
input shoot,
input shift_plus,
input shift_minus,
input reset,
input [3:0] angle,
input [1:0] level,
output [7:0] alien_alive_dead,
output [4:0] alien_1_quantization,
output [4:0] alien_2_quantization,
output [4:0] alien_3_quantization,
output [4:0] alien_4_quantization,
output [4:0] alien_5_quantization,
output [4:0] alien_6_quantization,
output [4:0] alien_7_quantization,
output [4:0] alien_8_quantization,
output [3:0] alien_1_angle_output,
output [3:0] alien_2_angle_output,
output [3:0] alien_3_angle_output,
output [3:0] alien_4_angle_output,
output [3:0] alien_5_angle_output,
output [3:0] alien_6_angle_output,
output [3:0] alien_7_angle_output,
output [3:0] alien_8_angle_output,
output [2:0] alien_1_type_output,
output [2:0] alien_2_type_output,
output [2:0] alien_3_type_output,
output [2:0] alien_4_type_output,
output [2:0] alien_5_type_output,
output [2:0] alien_6_type_output,
output [2:0] alien_7_type_output,
output [2:0] alien_8_type_output,
//output [3:0] rocket_angle,
output reg game_over,
output reg [6:0] score,
output [2:0] alien_1_can_out,
output [2:0] alien_2_can_out,
output [2:0] alien_3_can_out,
output [2:0] alien_4_can_out,
output [2:0] alien_5_can_out,
output [2:0] alien_6_can_out,
output [2:0] alien_7_can_out,
output [2:0] alien_8_can_out,



output [2:0] sample_total
);

assign sample_total = total_alivenumber;





assign alien_alive_dead = {alien_1_dead_alive,alien_2_dead_alive,alien_3_dead_alive,alien_4_dead_alive,alien_5_dead_alive,alien_6_dead_alive,alien_7_dead_alive,alien_8_dead_alive,};
assign alien_1_quantization = alien_1_location;
assign alien_2_quantization = alien_2_location;
assign alien_3_quantization = alien_3_location;
assign alien_4_quantization = alien_4_location;
assign alien_5_quantization = alien_5_location;
assign alien_6_quantization = alien_6_location;
assign alien_7_quantization = alien_7_location;
assign alien_8_quantization = alien_8_location;
assign alien_1_angle_output = alien_1_angle ;
assign alien_2_angle_output = alien_2_angle ;
assign alien_3_angle_output = alien_3_angle ;
assign alien_4_angle_output = alien_4_angle ;
assign alien_5_angle_output = alien_5_angle ;
assign alien_6_angle_output = alien_6_angle ;
assign alien_7_angle_output = alien_7_angle ;
assign alien_8_angle_output = alien_8_angle ;
assign alien_1_type_output = alien_1_type;
assign alien_2_type_output = alien_2_type;
assign alien_3_type_output = alien_3_type;
assign alien_4_type_output = alien_4_type;
assign alien_5_type_output = alien_5_type;
assign alien_6_type_output = alien_6_type;
assign alien_7_type_output = alien_7_type;
assign alien_8_type_output = alien_8_type;
assign rocket_angle = rocket_angle;
assign alien_1_can_out = alien_1_can;
assign alien_2_can_out = alien_2_can;
assign alien_3_can_out = alien_3_can;
assign alien_4_can_out = alien_4_can;
assign alien_5_can_out = alien_5_can;
assign alien_6_can_out = alien_6_can;
assign alien_7_can_out = alien_7_can;
assign alien_8_can_out = alien_8_can;



reg [5:0] total_number;



reg [3:0] alien_1_angle;
reg [4:0] alien_1_location;
reg alien_1_dead_alive;
reg [2:0] alien_1_can;
reg [2:0] alien_1_type;

reg [3:0] alien_2_angle;
reg [4:0] alien_2_location;
reg alien_2_dead_alive;
reg [2:0] alien_2_can;
reg [2:0] alien_2_type;

reg [3:0] alien_3_angle;
reg [4:0] alien_3_location;
reg alien_3_dead_alive;
reg [2:0] alien_3_can;
reg [2:0] alien_3_type;

reg [3:0] alien_4_angle;
reg [4:0] alien_4_location;
reg alien_4_dead_alive;
reg [2:0] alien_4_can;
reg [2:0] alien_4_type;

reg [3:0] alien_5_angle;
reg [4:0] alien_5_location;
reg alien_5_dead_alive;
reg [2:0] alien_5_can;
reg [2:0] alien_5_type;

reg [3:0] alien_6_angle;
reg [4:0] alien_6_location;
reg alien_6_dead_alive;
reg [2:0] alien_6_can;
reg [2:0] alien_6_type;

reg [3:0] alien_7_angle;
reg [4:0] alien_7_location;
reg alien_7_dead_alive;
reg [2:0] alien_7_can;
reg [2:0] alien_7_type;

reg [3:0] alien_8_angle;
reg [4:0] alien_8_location;
reg alien_8_dead_alive;
reg [2:0] alien_8_can;
reg [2:0] alien_8_type;

reg [2:0] shift_reg_previous_1; 
reg [2:0] shift_reg_previous_2; 
reg [2:0] shift_reg_previous_3; 
reg [2:0] shift_reg_previous_4; 
reg [2:0] shift_reg_previous_5; 
reg [2:0] shift_reg_previous_6; 
reg [2:0] shift_reg_previous_7; 
reg [2:0] shift_reg_previous_8; 




wire spawn_signal;
wire game_clock;
wire [3:0] wire_angle_rocket;
wire [3:0] random_angle;
wire [2:0] monster_type;
wire [7:0] shooted_A;
wire [7:0] shooted_B;
wire [7:0] shooted_C;

reg [31:0] counter_limit;
reg [31:0] internal_counter;

	reg [32:0] finito_cokare;

initial begin 
finito_cokare = 0;
score = 0;
game_over = 0;
alien_1_dead_alive = 0;
alien_2_dead_alive = 0;
alien_3_dead_alive = 0;
alien_4_dead_alive = 0;
alien_5_dead_alive = 0;
alien_6_dead_alive = 0;
alien_7_dead_alive = 0;
alien_8_dead_alive = 0;
internal_counter = 0;
end
	

ClockDivider clock_instantiation(.fpga_clock(clock_fpga),.level(level),.game_clock(game_clock));
shoot_mechanism shoot_mechanism_instantiation(.clk(clock_fpga),.shoot(shoot),.shoot_type(shoot_type),.angle_rocket(angle),.angle_enemy1(alien_1_angle),.angle_enemy2(alien_2_angle),.angle_enemy3(alien_3_angle),.angle_enemy4(alien_4_angle),.angle_enemy5(alien_5_angle),.angle_enemy6(alien_6_angle),.angle_enemy7(alien_7_angle),.angle_enemy8(alien_8_angle),.typeA(shooted_A),.typeB(shooted_B),.typeC(shooted_C),.aliveness_of_enemy1(alien_1_dead_alive),.aliveness_of_enemy2(alien_2_dead_alive),.aliveness_of_enemy3(alien_3_dead_alive),.aliveness_of_enemy4(alien_4_dead_alive),.aliveness_of_enemy5(alien_5_dead_alive),.aliveness_of_enemy6(alien_6_dead_alive),.aliveness_of_enemy7(alien_7_dead_alive),.aliveness_of_enemy8(alien_8_dead_alive));
enemy_spawn_signal_generator signal_gen_inst(.clk_fpga(clock_fpga),.spawn(spawn));
rocket_driver rocket_inst(.reset(reset),.shift_minus(shift_minus),.shift_plus(shift_plus),.clock_fpga(clock_fpga),.rocket_angle(wire_angle_rocket));
enemy_spawn_location_generator erg_inst(.clock(clock_fpga),.output_location(random_angle),.monster_A(monster_type[2]),.monster_B(monster_type[1]),.monster_C(monster_type[0]));
reg [3:0] total_alivenumber;
always@(*)begin
total_alivenumber = alien_1_dead_alive +alien_2_dead_alive+alien_3_dead_alive+alien_4_dead_alive+alien_5_dead_alive+alien_6_dead_alive+alien_7_dead_alive +alien_8_dead_alive;
end




always @(posedge(clock_fpga) ) begin

if (finito_cokare < 100000000) begin
	finito_cokare = finito_cokare + 1;

end
else begin



if (reset == 1) begin
score <= 0;
game_over <= 0;
alien_1_dead_alive <= 0;
alien_2_dead_alive <= 0;
alien_3_dead_alive <= 0;
alien_4_dead_alive <= 0;
alien_5_dead_alive <= 0;
alien_6_dead_alive <= 0;
alien_7_dead_alive <= 0;
alien_8_dead_alive <= 0;
internal_counter <= 0;
end



else begin
	if (internal_counter == counter_limit) begin
		if (alien_1_location>5) begin
		alien_1_location = alien_1_location -1;
		end
		if (alien_2_location>5) begin
		alien_2_location = alien_2_location -1;
		end
		if (alien_3_location>5) begin
		alien_3_location = alien_3_location -1;
		end
		if (alien_4_location>5) begin
		alien_4_location = alien_4_location -1;
		end
		if (alien_5_location>5) begin
		alien_5_location = alien_5_location -1;
		end
		if (alien_6_location>5) begin
		alien_6_location = alien_6_location -1;
		end
		if (alien_7_location>5) begin
		alien_7_location = alien_7_location -1;
		end
		if (alien_8_location>5) begin
		alien_8_location = alien_8_location -1;
		
		end
		internal_counter <= 0;
	end
		else begin
		internal_counter <= internal_counter + 1;
		end



	
	if (((spawn==1) && (total_alivenumber != 6'd8)) || (total_alivenumber < 6'd2)) begin
		if (alien_1_dead_alive == 0) begin
			case(monster_type)
				3'b100:begin 
					alien_1_dead_alive=1;
					alien_1_can=2;
					alien_1_angle=random_angle;
					alien_1_type=3'b100;
					alien_1_location = 31;
				end
				3'b010:begin
					alien_1_dead_alive=1;
					alien_1_can=3;
					alien_1_angle=random_angle;
					alien_1_type=3'b010;
					alien_1_location = 31;
				
				end
				3'b001:begin
					alien_1_dead_alive=1;
					alien_1_can=5;
					alien_1_angle=random_angle;
					alien_1_type=3'b001;
					alien_1_location = 31;
				end
			endcase		
		end
		else if (alien_2_dead_alive==0) begin
			case(monster_type)
				3'b100:begin 
					alien_2_dead_alive=1;
					alien_2_can=2;
					alien_2_angle=random_angle;
					alien_2_type=3'b100;
					alien_2_location = 31;
				end
				3'b010:begin
					alien_2_dead_alive=1;
					alien_2_can=3;
					alien_2_angle=random_angle;
					alien_2_type=3'b010;
					alien_2_location = 31;
				
				end
				3'b001:begin
					alien_2_dead_alive=1;
					alien_2_can=5;
					alien_2_angle=random_angle;
					alien_2_type=3'b001;
					alien_2_location = 31;
				end
			endcase
		end
		else if (alien_3_dead_alive==0) begin
			case(monster_type)
				3'b100:begin 
					alien_3_dead_alive=1;
					alien_3_can=2;
					alien_3_angle=random_angle;
					alien_3_type=3'b100;
					alien_3_location = 31;
				end
				3'b010:begin
					alien_3_dead_alive=1;
					alien_3_can=3;
					alien_3_angle=random_angle;
					alien_3_type=3'b010;
					alien_3_location = 31;
				
				end
				3'b001:begin
					alien_3_dead_alive=1;
					alien_3_can=5;
					alien_3_angle=random_angle;
					alien_3_type=3'b001;
					alien_3_location = 31;
				end
			endcase
		end
		else if (alien_4_dead_alive==0) begin
			case(monster_type)
				3'b100:begin 
					alien_4_dead_alive=1;
					alien_4_can=2;
					alien_4_angle=random_angle;
					alien_4_type=3'b100;
					alien_4_location = 31;
				end
				3'b010:begin
					alien_4_dead_alive=1;
					alien_4_can=3;
					alien_4_angle=random_angle;
					alien_4_type=3'b010;
					alien_4_location = 31;
				
				end
				3'b001:begin
					alien_4_dead_alive=1;
					alien_4_can=5;
					alien_4_angle=random_angle;
					alien_4_type=3'b001;
					alien_4_location = 31;
				end
			endcase
		end
		else if (alien_5_dead_alive==0) begin
			case(monster_type)
				3'b100:begin 
					alien_5_dead_alive=1;
					alien_5_can=2;
					alien_5_angle=random_angle;
					alien_5_type=3'b100;
					alien_5_location = 31;
				end
				3'b010:begin
					alien_5_dead_alive=1;
					alien_5_can=3;
					alien_5_angle=random_angle;
					alien_5_type=3'b010;
					alien_5_location = 31;
				
				end
				3'b001:begin
					alien_5_dead_alive=1;
					alien_5_can=5;
					alien_5_angle=random_angle;
					alien_5_type=3'b001;
					alien_5_location = 31;
				end
			endcase
		end
		else if (alien_6_dead_alive==0) begin
			case(monster_type)
				3'b100:begin 
					alien_6_dead_alive=1;
					alien_6_can=2;
					alien_6_angle=random_angle;
					alien_6_type=3'b100;
					alien_6_location = 31;
				end
				3'b010:begin
					alien_6_dead_alive=1;
					alien_6_can=3;
					alien_6_angle=random_angle;
					alien_6_type=3'b010;
					alien_6_location = 31;
				
				end
				3'b001:begin
					alien_6_dead_alive=1;
					alien_6_can=5;
					alien_6_angle=random_angle;
					alien_6_type=3'b001;
					alien_6_location = 31;
				end
			endcase
		end
		else if (alien_7_dead_alive==0) begin
			case(monster_type)
				3'b100:begin 
					alien_7_dead_alive=1;
					alien_7_can=2;
					alien_7_angle=random_angle;
					alien_7_type=3'b100;
					alien_7_location = 31;
				end
				3'b010:begin
					alien_7_dead_alive=1;
					alien_7_can=3;
					alien_7_angle=random_angle;
					alien_7_type=3'b010;
					alien_7_location = 31;
				
				end
				3'b001:begin
					alien_7_dead_alive=1;
					alien_7_can=5;
					alien_7_angle=random_angle;
					alien_7_type=3'b001;
					alien_7_location = 31;
				end
			endcase
		end
		else if (alien_8_dead_alive==0) begin
			case(monster_type)
				3'b100:begin 
					alien_8_dead_alive=1;
					alien_8_can=2;
					alien_8_angle=random_angle;
					alien_8_type=3'b100;
					alien_8_location = 31;
				end
				3'b010:begin
					alien_8_dead_alive=1;
					alien_8_can=3;
					alien_8_angle=random_angle;
					alien_8_type=3'b010;
					alien_8_location = 31;
				
				end
				3'b001:begin
					alien_8_dead_alive=1;
					alien_8_can=5;
					alien_8_angle=random_angle;
					alien_8_type=3'b001;
					alien_8_location = 31;
				end
			endcase
		end
		
	end
		
		
		
		
		
		
		
		
		if ((alien_1_location == 5) && (alien_1_dead_alive == 1)) begin
		game_over <= 1;
		end
		
		if ((alien_2_location == 5 )&& (alien_2_dead_alive == 1)) begin
		game_over <= 1;
		end
		
		if ((alien_3_location == 5) && (alien_3_dead_alive == 1)) begin
		game_over <= 1;
		end
		
		if ((alien_4_location == 5 )&& (alien_4_dead_alive == 1)) begin
		game_over <= 1;
		end
		
		if ((alien_5_location == 5 )&&(alien_5_dead_alive == 1)) begin
		game_over <= 1;
		end
		
		if ((alien_6_location == 5) &&(alien_6_dead_alive == 1)) begin
		game_over <= 1;
		end
		
		if ((alien_7_location == 5 )&&(alien_7_dead_alive == 1)) begin
		game_over <= 1;
		end
		
		if ((alien_8_location == 5) &&( alien_8_dead_alive == 1)) begin
		game_over <= 1;
		end
		
		
		alien_1_can = alien_1_can - 3*shooted_A[0] - 2*shooted_B [0] - shooted_C [0];
		alien_2_can = alien_2_can - 3*shooted_A[1] - 2*shooted_B [1] - shooted_C [1];
		alien_3_can = alien_3_can - 3*shooted_A[2] - 2*shooted_B [2] - shooted_C [2];
		alien_4_can = alien_4_can - 3*shooted_A[3] - 2*shooted_B [3] - shooted_C [3];
		alien_5_can = alien_5_can - 3*shooted_A[4] - 2*shooted_B [4] - shooted_C [4];
		alien_6_can = alien_6_can - 3*shooted_A[5] - 2*shooted_B [5] - shooted_C [5];
		alien_7_can = alien_7_can - 3*shooted_A[6] - 2*shooted_B [6] - shooted_C [6];
		alien_8_can = alien_8_can - 3*shooted_A[7] - 2*shooted_B [7] - shooted_C [7];
		
		
		
		shift_reg_previous_1 <= alien_1_can;
		shift_reg_previous_2 <= alien_2_can;
		shift_reg_previous_3 <= alien_3_can;
		shift_reg_previous_4 <= alien_4_can;
		shift_reg_previous_5 <= alien_5_can;
		shift_reg_previous_6 <= alien_6_can;
		shift_reg_previous_7 <= alien_7_can;
		shift_reg_previous_8 <= alien_8_can;
		
		
		if ((shift_reg_previous_1 > 0) && (shift_reg_previous_1 < 6 ) && (alien_1_can == 0 || alien_1_can == 7 || alien_1_can == 6 )) begin
		
			score <= score + 1;
		end	
		
		if (shift_reg_previous_2 > 0 && shift_reg_previous_2 < 6  && (alien_2_can == 0 || alien_2_can == 7 || alien_2_can == 6 )) begin
		
		score <= score + 1;
	end	
		
	if (shift_reg_previous_3 > 0 && shift_reg_previous_3 < 6  && (alien_3_can == 0 || alien_3_can == 7 || alien_3_can == 6 )) begin
		
		score<= score + 1;
	end	
		
	if (shift_reg_previous_4 > 0 && shift_reg_previous_4 < 6  && (alien_4_can == 0 || alien_4_can == 7 || alien_4_can == 6 )) begin
		
		score <= score + 1;
	end	
		
	if (shift_reg_previous_5 > 0 && shift_reg_previous_5 < 6  && (alien_5_can == 0 || alien_5_can == 7 || alien_5_can == 6 )) begin
		
		score<= score + 1;
	end	
		
	if (shift_reg_previous_6 > 0 && shift_reg_previous_6 < 6  && (alien_6_can == 0 || alien_6_can == 7 || alien_6_can == 6 )) begin
		
		score <= score + 1;
	end	
		
	if (shift_reg_previous_7 > 0 && shift_reg_previous_7 < 6  && (alien_7_can == 0 || alien_7_can == 7 || alien_7_can == 6 )) begin
		
		score <= score + 1;
	end	
		
	if (shift_reg_previous_8 > 0 && shift_reg_previous_8 < 6  && (alien_8_can == 0 || alien_8_can == 7 || alien_8_can == 6 )) begin
		
		score <= score + 1;
	end	
		
		
	if ((alien_1_can == 0) || (alien_1_can == 7) || (alien_1_can == 6)) begin
		alien_1_dead_alive <= 0;
	end
	if ((alien_2_can == 0) || (alien_2_can == 7) || (alien_2_can == 6)) begin
		alien_2_dead_alive <= 0;
	end
	if ((alien_3_can == 0) || (alien_3_can == 7) || (alien_3_can == 6)) begin
		alien_3_dead_alive<= 0;
	end
	if ((alien_4_can == 0) || (alien_4_can == 7) || (alien_4_can == 6)) begin
		alien_4_dead_alive <= 0;
	end
	if ((alien_5_can == 0) || (alien_5_can == 7) || (alien_5_can == 6)) begin
		alien_5_dead_alive <= 0;
	end
	if ((alien_6_can == 0) || (alien_6_can == 7) || (alien_6_can == 6)) begin
		alien_6_dead_alive<= 0;
	end
	if ((alien_7_can == 0) || (alien_7_can == 7) || (alien_7_can == 6)) begin
		alien_7_dead_alive <= 0;
	end
	if ((alien_8_can == 0) || (alien_8_can == 7) || (alien_8_can == 6)) begin
		alien_8_dead_alive <= 0;
	end
	
	

		
		

		
		
		
		
end






end
end
always@(*) begin
if (reset == 1) begin
	case(level)
	'b00: counter_limit = 25000000;
	'b01: counter_limit = 25000000/2;
	'b10: counter_limit = 25000000/4;
	'b11: counter_limit = 25000000/8;
	endcase
end

end
endmodule