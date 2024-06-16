module enemy_movement(
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
reg [2:0] type;
reg alive_dead;
reg [4:0] location_;
reg [3:0] angle;
reg [2:0] health;
reg [7:0] enemy_color;

location loc1(enemy_matrix1[12:9], enemy_matrix1[8:4],x1, y1);
location loc2(enemy_matrix2[12:9], enemy_matrix2[8:4],x2, y2);
location loc3(enemy_matrix3[12:9], enemy_matrix3[8:4],x3, y3);
location loc4(enemy_matrix4[12:9], enemy_matrix4[8:4],x4, y4);
location loc5(enemy_matrix5[12:9], enemy_matrix5[8:4],x5, y5);
location loc6(enemy_matrix6[12:9], enemy_matrix6[8:4],x6, y6);
location loc7(enemy_matrix7[12:9], enemy_matrix7[8:4],x7, y7);
location loc8(enemy_matrix8[12:9], enemy_matrix8[8:4],x8, y8);

always @(posedge clk) begin
    color = 8'b00000000; 
    type = enemy_matrix1[2:0];
    alive_dead = enemy_matrix1[3];
    health = enemy_matrix1[15:13];
    if (alive_dead) begin
        case (health)
            5: enemy_color = 8'b11111111;
            4: enemy_color = 8'b00000011;
            3: enemy_color = 8'b00011100;
            2: enemy_color = 8'b11100011;
            1: enemy_color = 8'b11100000;
            default: enemy_color = 8'b00000000;
        endcase
        if (type == 3'b100 && (x1 > (next_x - 10)) && (x1 < (next_x + 10)) && (y1 > (next_y - 5)) && (y1 < (next_y + 5))) begin
            color = enemy_color;
        end else if (type == 3'b010 && (x1 > (next_x - 5)) && (x1 < (next_x + 5)) && (y1 > (next_y - 10)) && (y1 < (next_y + 10))) begin
            color = enemy_color;
        end else if (type == 3'b001 && (((x1 > (next_x - 5)) && (x1 < (next_x + 5)) && (y1 > (next_y - 10)) && (y1 < (next_y + 10))) || ((x1 > (next_x - 10)) && (x1 < (next_x + 10)) && (y1 > (next_y - 5)) && (y1 < (next_y + 5))))) begin
            color = enemy_color;
        end
    end

    type = enemy_matrix2[2:0];
    alive_dead = enemy_matrix2[3];
    health = enemy_matrix2[15:13];
    if (alive_dead) begin
        case (health)
            5: enemy_color = 8'b11111111;
            4: enemy_color = 8'b00000011;
            3: enemy_color = 8'b00011100;
            2: enemy_color = 8'b11100011;
            1: enemy_color = 8'b11100000;
            default: enemy_color = 8'b00000000;
        endcase
        if (type == 3'b100 && (x2 > (next_x - 10)) && (x2 < (next_x + 10)) && (y2 > (next_y - 5)) && (y2 < (next_y + 5))) begin
            color = enemy_color;
        end else if (type == 3'b010 && (x2 > (next_x - 5)) && (x2 < (next_x + 5)) && (y2 > (next_y - 10)) && (y2 < (next_y + 10))) begin
            color = enemy_color;
        end else if (type == 3'b001 && (((x2 > (next_x - 5)) && (x2 < (next_x + 5)) && (y2 > (next_y - 10)) && (y2 < (next_y + 10))) || ((x2 > (next_x - 10)) && (x2 < (next_x + 10)) && (y2 > (next_y - 5)) && (y2 < (next_y + 5))))) begin
            color = enemy_color;
        end
    end

    type = enemy_matrix3[2:0];
    alive_dead = enemy_matrix3[3];
    health = enemy_matrix3[15:13];
    if (alive_dead) begin
        case (health)
            5: enemy_color = 8'b11111111;
            4: enemy_color = 8'b00000011;
            3: enemy_color = 8'b00011100;
            2: enemy_color = 8'b11100011;
            1: enemy_color = 8'b11100000;
            default: enemy_color = 8'b00000000;
        endcase
        if (type == 3'b100 && (x3 > (next_x - 10)) && (x3 < (next_x + 10)) && (y3 > (next_y - 5)) && (y3 < (next_y + 5))) begin
            color = enemy_color;
        end else if (type == 3'b010 && (x3 > (next_x - 5)) && (x3 < (next_x + 5)) && (y3 > (next_y - 10)) && (y3 < (next_y + 10))) begin
            color = enemy_color;
        end else if (type == 3'b001 && (((x3 > (next_x - 5)) && (x3 < (next_x + 5)) && (y3 > (next_y - 10)) && (y3 < (next_y + 10))) || ((x3 > (next_x - 10)) && (x3 < (next_x + 10)) && (y3 > (next_y - 5)) && (y3 < (next_y + 5))))) begin
            color = enemy_color;
        end
    end

    type = enemy_matrix4[2:0];
    alive_dead = enemy_matrix4[3];
    health = enemy_matrix4[15:13];
    if (alive_dead) begin
        case (health)
            5: enemy_color = 8'b11111111;
            4: enemy_color = 8'b00000011;
            3: enemy_color = 8'b00011100;
            2: enemy_color = 8'b11100011;
            1: enemy_color = 8'b11100000;
            default: enemy_color = 8'b00000000;
        endcase
        if (type == 3'b100 && (x4 > (next_x - 10)) && (x4 < (next_x + 10)) && (y4 > (next_y - 5)) && (y4 < (next_y + 5))) begin
            color = enemy_color;
        end else if (type == 3'b010 && (x4 > (next_x - 5)) && (x4 < (next_x + 5)) && (y4 > (next_y - 10)) && (y4 < (next_y + 10))) begin
            color = enemy_color;
        end else if (type == 3'b001 && (((x4  > (next_x - 5)) && (x4 < (next_x + 5)) && (y4 > (next_y - 10)) && (y4 < (next_y + 10))) || ((x4 > (next_x - 10)) && (x4 < (next_x + 10)) && (y4 > (next_y - 5)) && (y4 < (next_y + 5))))) begin
            color = enemy_color;
        end
    end

    type = enemy_matrix5[2:0];
    alive_dead = enemy_matrix5[3];
    health = enemy_matrix5[15:13];
    if (alive_dead) begin
        case (health)
            5: enemy_color = 8'b11111111;
            4: enemy_color = 8'b00000011;
            3: enemy_color = 8'b00011100;
            2: enemy_color = 8'b11100011;
            1: enemy_color = 8'b11100000;
            default: enemy_color = 8'b00000000;
        endcase
        if (type == 3'b100 && (x5 > (next_x - 10)) && (x5 < (next_x + 10)) && (y5 > (next_y - 5)) && (y5 < (next_y + 5))) begin
            color = enemy_color;
        end else if (type == 3'b010 && (x5 > (next_x - 5)) && (x5 < (next_x + 5)) && (y5 > (next_y - 10)) && (y5 < (next_y + 10))) begin
            color = enemy_color;
        end else if (type == 3'b001 && (((x5 > (next_x - 5)) && (x5 < (next_x + 5)) && (y5 > (next_y - 10)) && (y5 < (next_y + 10))) || ((x5 > (next_x - 10)) && (x5 < (next_x + 10)) && (y5 > (next_y - 5)) && (y5 < (next_y + 5))))) begin
            color = enemy_color;
        end
    end

    type = enemy_matrix6[2:0];
    alive_dead = enemy_matrix6[3];
    health = enemy_matrix6[15:13];
    if (alive_dead) begin
        case (health)
            5: enemy_color = 8'b11111111;
            4: enemy_color = 8'b00000011;
            3: enemy_color = 8'b00011100;
            2: enemy_color = 8'b11100011;
            1: enemy_color = 8'b11100000;
            default: enemy_color = 8'b00000000;
        endcase
        if (type == 3'b100 && (x6 > (next_x - 10)) && (x6 < (next_x + 10)) && (y6 > (next_y - 5)) && (y6 < (next_y + 5))) begin
            color = enemy_color;
        end else if (type == 3'b010 && (x6 > (next_x - 5)) && (x6 < (next_x + 5)) && (y6 > (next_y - 10)) && (y6 < (next_y + 10))) begin
            color = enemy_color;
        end else if (type == 3'b001 && (((x6 > (next_x - 5)) && (x6 < (next_x + 5)) && (y6 > (next_y - 10)) && (y6 < (next_y + 10))) || ((x6 > (next_x - 10)) && (x6 < (next_x + 10)) && (y6 > (next_y - 5)) && (y6 < (next_y + 5))))) begin
            color = enemy_color;
        end
    end

    type = enemy_matrix7[2:0];
    alive_dead = enemy_matrix7[3];
    health = enemy_matrix7[15:13];
    if (alive_dead) begin
        case (health)
            5: enemy_color = 8'b11111111;
            4: enemy_color = 8'b00000011;
            3: enemy_color = 8'b00011100;
            2: enemy_color = 8'b11100011;
            1: enemy_color = 8'b11100000;
            default: enemy_color = 8'b00000000;
        endcase
        if (type == 3'b100 && (x7 > (next_x - 10)) && (x7 < (next_x + 10)) && (y7 > (next_y - 5)) && (y7 < (next_y + 5))) begin
            color = enemy_color;
        end else if (type == 3'b010 && (x7 > (next_x - 5)) && (x7 < (next_x + 5)) && (y7 > (next_y - 10)) && (y7 < (next_y + 10))) begin
            color = enemy_color;
        end else if (type == 3'b001 && (((x7 > (next_x - 5)) && (x7 < (next_x + 5)) && (y7 > (next_y - 10)) && (y7 < (next_y + 10))) || ((x7 > (next_x - 10)) && (x7 < (next_x + 10)) && (y7 > (next_y - 5)) && (y7 < (next_y + 5))))) begin
            color = enemy_color;
        end
    end

    type = enemy_matrix8[2:0];
    alive_dead = enemy_matrix8[3];
    health = enemy_matrix8[15:13];
    if (alive_dead) begin
        case (health)
            5: enemy_color = 8'b11111111;
            4: enemy_color = 8'b00000011;
            3: enemy_color = 8'b00011100;
            2: enemy_color = 8'b11100011;
            1: enemy_color = 8'b11100000;
            default: enemy_color = 8'b00000000;
        endcase
        if (type == 3'b100 && (x8 > (next_x - 10)) && (x8 < (next_x + 10)) && (y8 > (next_y - 5)) && (y8 < (next_y + 5))) begin
            color = enemy_color;
        end else if (type == 3'b010 && (x8 > (next_x - 5)) && (x8 < (next_x + 5)) && (y8 > (next_y - 10)) && (y8 < (next_y + 10))) begin
            color = enemy_color;
        end else if (type == 3'b001 && (((x8 > (next_x - 5)) && (x8 < (next_x + 5)) && (y8 > (next_y - 10)) && (y8 < (next_y + 10))) || ((x8 > (next_x - 10)) && (x8 < (next_x + 10)) && (y8 > (next_y - 5)) && (y8 < (next_y + 5))))) begin
            color = enemy_color;
        end
    end
end

endmodule

