module location(
input [3:0] angle,
input [4:0] location_input,
output reg [9:0] x,
output reg [9:0] y 
);

reg radius = 170; 

always @(*) begin
	radius = 170;
	case (angle) 
		4'd0: begin
			x = 320+((location_input*15'd0)/32);
			y = 240-((location_input*15'd170)/32);
		end
		4'd1: begin
			x = 320+((location_input*15'd65)/32);
			y = 240-((location_input*15'd157)/32);
		end
		4'd2: begin
			x = 320+((location_input*15'd120)/32);
			y = 240-((location_input*15'd120)/32);
		end
		4'd3: begin
			x = 320+((location_input*15'd157)/32);
			y = 240-((location_input*15'd65)/32);			
		end
		4'd4: begin
			x = 320+((location_input*15'd170)/32);
			y = 240-((location_input*15'd0)/32);		
		end
		4'd5: begin
			x = 320+((location_input*15'd157)/32);
			y = 240+((location_input*15'd65)/32);			
		end
		4'd6: begin
			x = 320+((location_input*15'd120)/32);
			y = 240+((location_input*15'd120)/32);		
		end 		
		4'd7: begin
			x = 320+((location_input*15'd65)/32);
			y = 240+((location_input*15'd157)/32);		
		end	
		4'd8: begin
			x = 320+((location_input*15'd0)/32);
			y = 240+((location_input*15'd170)/32);		
		end	
		4'd9: begin
			x = 320-((location_input*15'd65)/32);
			y = 240+((location_input*15'd157)/32);		
		end	
		4'd10: begin
			x = 320-((location_input*15'd120)/32);
			y = 240+((location_input*15'd120)/32);		
		end
		4'd11: begin
			x = 320-((location_input*15'd157)/32);
			y = 240+((location_input*15'd65)/32);		
		end
		4'd12: begin
			x = 320-((location_input*15'd170)/32);
			y = 240+((location_input*15'd0)/32);		
		end
		4'd13: begin
			x = 320-((location_input*15'd157)/32);
			y = 240-((location_input*15'd65)/32);		
		end
		4'd14: begin
			x = 320-((location_input*15'd120)/32);
			y = 240-((location_input*15'd120)/32);		
		end
		4'd15: begin
			x = 320-((location_input*15'd65)/32);
			y = 240-((location_input*15'd157)/32);		
		end
	endcase
end 
endmodule
