module angle(clk,btn_right,btn_left,angle);
input wire clk;          
input wire btn_right;    
input wire btn_left;
reg [3:0] angle1 ;
reg [3:0] angle2;
output reg [3:0] angle; 
 //buton active low dedi kumlu ondan negedge değilse posedge olmalı
always @(negedge btn_right) begin
		angle1 <= angle1 + 1;
end
always @(negedge btn_left) begin
		angle2 <= angle2 + 1;
end
always @(*) begin
	angle<= (angle1-angle2);
end
endmodule