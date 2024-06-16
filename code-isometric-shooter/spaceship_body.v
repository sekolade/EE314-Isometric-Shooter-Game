	module spaceship_body (
    input wire clk,         
    input wire [9:0] x,     // next_x
    input wire [9:0] y,     // next_y
    output reg [7:0] color,
    input wire [3:0] angle,
    input wire switch_shooting_mode1,
	 input wire switch_shooting_mode2,
	 output reg [2:0] shooting_led,
	 input reset,
	 input gameover
);
    // shooting mode
    reg [7:0] spaceship_color;
	 reg shoot_detected;
	 reg [31:0] led_count;
    initial begin
		shoot_detected <= 0;
        spaceship_color = 8'b11111111; // beyaz;
		  led_count<=0;
    end

    localparam CENTER_X = 320;
    localparam CENTER_Y = 240;
    localparam RADIUS = 20;
    localparam RADIUS_SQ = RADIUS * RADIUS;
    wire signed [10:0] dx;
    wire signed [10:0] dy;
    wire [21:0] dist_sq;
    assign dx = x - CENTER_X;
    assign dy = y - CENTER_Y;
    assign dist_sq = dx * dx + dy * dy;

    reg [10:0] dot_x;
    reg [10:0] dot_y;
    localparam RADIUS_dot = 7;
    localparam RADIUS_SQ_dot = RADIUS_dot * RADIUS_dot;
    wire signed [10:0] d_dotx;
    wire signed [10:0] d_doty;
    wire [21:0] dist_dot_sq;
    
    always @(*) begin
	 
        case(angle)
            0: begin dot_x = CENTER_X; dot_y = CENTER_Y - 20; end
            1: begin dot_x = CENTER_X + 8; dot_y = CENTER_Y - 18; end
            2: begin dot_x = CENTER_X + 14; dot_y = CENTER_Y - 14; end
            3: begin dot_x = CENTER_X + 18; dot_y = CENTER_Y - 8; end
            4: begin dot_x = CENTER_X + 20; dot_y = CENTER_Y; end
            5: begin dot_x = CENTER_X + 18; dot_y = CENTER_Y + 8; end
            6: begin dot_x = CENTER_X + 14; dot_y = CENTER_Y + 14; end
            7: begin dot_x = CENTER_X + 8; dot_y = CENTER_Y + 18; end
            8: begin dot_x = CENTER_X; dot_y = CENTER_Y + 20; end
            9: begin dot_x = CENTER_X - 8; dot_y = CENTER_Y + 18; end
            10: begin dot_x = CENTER_X - 14; dot_y = CENTER_Y + 14; end
            11: begin dot_x = CENTER_X - 18; dot_y = CENTER_Y + 8; end
            12: begin dot_x = CENTER_X - 20; dot_y = CENTER_Y; end
            13: begin dot_x = CENTER_X - 18; dot_y = CENTER_Y - 8; end
            14: begin dot_x = CENTER_X - 14; dot_y = CENTER_Y - 14; end
            15: begin dot_x = CENTER_X - 8; dot_y = CENTER_Y - 18; end
            default: begin dot_x = CENTER_X; dot_y = CENTER_Y; end
        endcase
    end

    assign d_dotx = x - dot_x;
    assign d_doty = y - dot_y;
    assign dist_dot_sq = d_dotx * d_dotx + d_doty * d_doty;

    always @(posedge clk) begin
		  
		  led_count = led_count+1;
		  if(led_count == 25000001) begin
				led_count = 0;
		  end
        if (x < 640 && y < 480) begin
            if (dist_sq <= RADIUS_SQ) begin
                color <= 8'b11100000; // 
            end else begin
                color <= 8'b00000000; // siyah
            end
            if (dist_dot_sq <= RADIUS_SQ_dot) begin
                color <= spaceship_color; // küre rengi
            end
        end else begin
            color <= 8'b00000000; // siyah
        end
		  
		  if (switch_shooting_mode1 ==0 && switch_shooting_mode2 == 0) begin
				spaceship_color <= 8'b11111111; //beyaz
				if (led_count == 5 && (reset == 0) && (gameover ==0)) begin
					shooting_led[2:0] <= 3'b111;
				end
				else if(led_count == 12000000) begin
					shooting_led[2:0] <= 3'b000;
				end
				
		  end
		  else if (switch_shooting_mode1 ==0 && switch_shooting_mode2 == 1) begin
				spaceship_color <= 8'b11111111; // beyaz
				if (led_count == 5 && (reset == 0) && (gameover ==0)) begin
					shooting_led[2:0] <= 3'b111;
				end
				else if(led_count == 12000000) begin
					shooting_led[2:0] <= 3'b000;
				end
		  end
		  else if (switch_shooting_mode1 ==1 && switch_shooting_mode2 == 1) begin
				if (led_count == 5 && (reset == 0) && (gameover ==0)) begin
					shooting_led[2:0] <= 3'b001;
				end
				else if(led_count == 12000000) begin
					shooting_led[2:0] <= 3'b000;
				end
				spaceship_color <= 8'b11110000; // turuncu
		  end
		   else if (switch_shooting_mode1 ==1 && switch_shooting_mode2 == 0) begin
				spaceship_color <=  8'b0011111;//mavi 
				if (led_count == 5 && (reset == 0) && (gameover ==0)) begin
					shooting_led[2:0] <= 3'b011;
				end
				else if(led_count == 12000000) begin
					shooting_led[2:0] <= 3'b000;
				end
				
		  end
    end
endmodule
