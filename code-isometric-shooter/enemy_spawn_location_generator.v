module enemy_spawn_location_generator(
input clock,
output [3:0] output_location,
output reg monster_A,
output reg monster_B,
output reg monster_C

);

reg [15:0] internal_reg = 16'h7891;
reg [1:0] type ;


always@(posedge(clock)) begin

internal_reg <= internal_reg >> 1;
internal_reg[15] <= internal_reg[0] ^ internal_reg[2] ^ internal_reg[3] ^ internal_reg[5];
type <=  internal_reg [1:0]; 

end

assign output_location = internal_reg [15:12];

always@(*) begin

case (type)

'b00: begin
monster_A <= 1;
monster_B <= 0;
monster_C <= 0;

end
'b01: begin
monster_A <= 1;
monster_B <= 0;
monster_C <= 0;

end
'b10: begin
monster_A <= 0;
monster_B <= 1;
monster_C <= 0;
end
'b11: begin
monster_A <= 0;
monster_B <= 0;
monster_C <= 1;
end

endcase

end



endmodule