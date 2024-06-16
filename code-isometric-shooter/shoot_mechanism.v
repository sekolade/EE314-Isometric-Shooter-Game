module shoot_mechanism (
    input clk,
    input shoot,
    input [1:0] shoot_type, // 00 doğrusal 3can typea, 01 doğrusal 3can typea, 10 45derece 2can typeb, 11 90derece 1 can typec
    input [3:0] angle_rocket,
    input [3:0] angle_enemy1, angle_enemy2, angle_enemy3, angle_enemy4, angle_enemy5, angle_enemy6, angle_enemy7, angle_enemy8,
    input aliveness_of_enemy1, aliveness_of_enemy2, aliveness_of_enemy3, aliveness_of_enemy4, aliveness_of_enemy5, aliveness_of_enemy6, aliveness_of_enemy7, aliveness_of_enemy8,
    output reg [7:0] typeA, typeB, typeC
);
    reg shoot_detected;

    initial begin 
        typeA <= 8'b00000000;
        typeB <= 8'b00000000;
        typeC <= 8'b00000000;
        shoot_detected <= 0;
    end

    always @(posedge clk) begin
        if (shoot == 1) begin
            shoot_detected <= 0;
            typeA <= 8'b00000000;
            typeB <= 8'b00000000;
            typeC <= 8'b00000000;
        end 
		  
		  
		  
		  else if (shoot == 0 && shoot_detected == 0) begin
            shoot_detected <= 1;
			
            if (shoot_type[1] == 0) begin
					
                if (angle_rocket == angle_enemy1 && aliveness_of_enemy1 == 1) typeA[0] <= 1;
                if (angle_rocket == angle_enemy2 && aliveness_of_enemy2 == 1) typeA[1] <= 1;
                if (angle_rocket == angle_enemy3 && aliveness_of_enemy3 == 1) typeA[2] <= 1;
                if (angle_rocket == angle_enemy4 && aliveness_of_enemy4 == 1) typeA[3] <= 1;
                if (angle_rocket == angle_enemy5 && aliveness_of_enemy5 == 1) typeA[4] <= 1;
                if (angle_rocket == angle_enemy6 && aliveness_of_enemy6 == 1) typeA[5] <= 1;
                if (angle_rocket == angle_enemy7 && aliveness_of_enemy7 == 1) typeA[6] <= 1;
                if (angle_rocket == angle_enemy8 && aliveness_of_enemy8 == 1) typeA[7] <= 1;
            end
				if (shoot_type == 2'b10) begin
					if ((angle_rocket==4'b1111&&angle_enemy1==4'b0000)&& (aliveness_of_enemy1 == 1)) typeB[0] <= 1;
					else if ((angle_rocket==4'b0000&&angle_enemy1==4'b1111)&& (aliveness_of_enemy1 == 1)) typeB[0] <= 1;
					else if ((angle_rocket == angle_enemy1 || angle_rocket - 1 == angle_enemy1 || angle_rocket + 1 == angle_enemy1) && aliveness_of_enemy1 == 1) typeB[0] <= 1;
				   if ((angle_rocket==4'b1111&&angle_enemy2==4'b0000)&& (aliveness_of_enemy2 == 1) )typeB[1] <= 1;
					else if ((angle_rocket==4'b0000&&angle_enemy2==4'b1111)&& (aliveness_of_enemy2 == 1) )typeB[1] <= 1;

					else if ((angle_rocket == angle_enemy2 || angle_rocket - 1 == angle_enemy2 || angle_rocket + 1 == angle_enemy2) && aliveness_of_enemy2 == 1) typeB[1] <= 1;
				   if ((angle_rocket==4'b1111&&angle_enemy3==4'b0000)&& ( aliveness_of_enemy3 == 1)) typeB[2] <= 1;
				   else if ((angle_rocket==4'b0000&&angle_enemy3==4'b1111)&& ( aliveness_of_enemy3 == 1)) typeB[2] <= 1;

					else   if ((angle_rocket == angle_enemy3 || angle_rocket - 1 == angle_enemy3 || angle_rocket + 1 == angle_enemy3) && aliveness_of_enemy3 == 1) typeB[2] <= 1;

					if ((angle_rocket==4'b1111&&angle_enemy4==4'b0000) && (aliveness_of_enemy4 == 1)) typeB[3] <= 1;
					else if ((angle_rocket==4'b0000&&angle_enemy4==4'b1111) && (aliveness_of_enemy4 == 1)) typeB[3] <= 1;

					else if ((angle_rocket == angle_enemy4 || angle_rocket - 1 == angle_enemy4 || angle_rocket + 1 == angle_enemy4) && aliveness_of_enemy4 == 1) typeB[3] <= 1;
				   if ((angle_rocket==4'b1111&&angle_enemy5==4'b0000)&& (aliveness_of_enemy5 == 1)) typeB[4] <= 1;
				   else if ((angle_rocket==4'b0000&&angle_enemy5==4'b1111)&& (aliveness_of_enemy5 == 1)) typeB[4] <= 1;

					else if ((angle_rocket == angle_enemy5 || angle_rocket - 1 == angle_enemy5 || angle_rocket + 1 == angle_enemy5) && aliveness_of_enemy5 == 1) typeB[4] <= 1;
				   if ((angle_rocket==4'b1111&&angle_enemy6==4'b0000) && (aliveness_of_enemy6 == 1)) typeB[5] <= 1;
				   else if ((angle_rocket==4'b0000&&angle_enemy6==4'b1111) && (aliveness_of_enemy6 == 1)) typeB[5] <= 1;

					else if ((angle_rocket == angle_enemy6 || angle_rocket - 1 == angle_enemy6 || angle_rocket + 1 == angle_enemy6) && aliveness_of_enemy6 == 1) typeB[5] <= 1;

				   if ((angle_rocket==4'b1111&&angle_enemy7==4'b0000) && (aliveness_of_enemy7 == 1)) typeB[6] <= 1;
				   else if ((angle_rocket==4'b0000&&angle_enemy7==4'b1111) && (aliveness_of_enemy7 == 1)) typeB[6] <= 1;

					else if ((angle_rocket == angle_enemy7 || angle_rocket - 1 == angle_enemy7 || angle_rocket + 1 == angle_enemy7) && aliveness_of_enemy7 == 1) typeB[6] <= 1;

				   if ((angle_rocket==4'b1111&&angle_enemy8==4'b0000)&&( aliveness_of_enemy8 == 1) )typeB[7] <= 1;
				   else if ((angle_rocket==4'b0000&&angle_enemy8==4'b1111)&&( aliveness_of_enemy8 == 1) )typeB[7] <= 1;
                
               else if ((angle_rocket == angle_enemy8 || angle_rocket - 1 == angle_enemy8 || angle_rocket + 1 == angle_enemy8) && aliveness_of_enemy8 == 1) typeB[7] <= 1;
            end
            if (shoot_type == 2'b11) begin
				
				if ((angle_rocket==4'b1111&&angle_enemy1==4'b0000)&& (aliveness_of_enemy1 == 1) || (angle_rocket==4'b1110&&angle_enemy1==4'b0000)&& (aliveness_of_enemy1 == 1) || (angle_rocket==4'b1111&&angle_enemy1==4'b0001)&& (aliveness_of_enemy1 == 1)) typeC[0] <= 1;
		      else if ((angle_rocket==4'b0000 &&angle_enemy1==4'b1111)&& (aliveness_of_enemy1 == 1) || (angle_rocket==4'b0001&&angle_enemy1==4'b1111)&& (aliveness_of_enemy1 == 1) || (angle_rocket==4'b0000 &&angle_enemy1==4'b1110)&& (aliveness_of_enemy1 == 1)) typeC[0] <= 1;

	
		      else if ((angle_rocket == angle_enemy1 || angle_rocket - 1 == angle_enemy1 || angle_rocket + 1 == angle_enemy1 || angle_rocket - 2 == angle_enemy1 || angle_rocket + 2 == angle_enemy1) && aliveness_of_enemy1 == 1) typeC[0] <= 1;
 	if ((angle_rocket==4'b1111&&angle_enemy2==4'b0000)&& (aliveness_of_enemy2 == 1) || (angle_rocket==4'b1110&&angle_enemy2==4'b0000)&& (aliveness_of_enemy2 == 1) || (angle_rocket==4'b1111&&angle_enemy2==4'b0001)&& (aliveness_of_enemy2 == 1)) typeC[1] <= 1;
		else if ((angle_rocket==4'b0000 &&angle_enemy2==4'b1111)&& (aliveness_of_enemy2 == 1) || (angle_rocket==4'b0001&&angle_enemy2==4'b1111)&& (aliveness_of_enemy2 == 1) || (angle_rocket==4'b0000 &&angle_enemy2==4'b1110)&& (aliveness_of_enemy2 == 1)) typeC[1] <= 1;

		else if ((angle_rocket == angle_enemy2 || angle_rocket - 1 == angle_enemy2 || angle_rocket + 1 == angle_enemy2 || angle_rocket - 2 == angle_enemy2 || angle_rocket + 2 == angle_enemy2) && aliveness_of_enemy2 == 1) typeC[1] <= 1;

 
		if ((angle_rocket==4'b1111&&angle_enemy3==4'b0000)&& (aliveness_of_enemy3 == 1) || (angle_rocket==4'b1110&&angle_enemy3==4'b0000)&& (aliveness_of_enemy3 == 1) || (angle_rocket==4'b1111&&angle_enemy3==4'b0001)&& (aliveness_of_enemy3 == 1)) typeC[2] <= 1;
		else if ((angle_rocket==4'b0000 &&angle_enemy3==4'b1111)&& (aliveness_of_enemy3 == 1) || (angle_rocket==4'b0001&&angle_enemy3==4'b1111)&& (aliveness_of_enemy3 == 1) || (angle_rocket==4'b0000 &&angle_enemy3==4'b1110)&& (aliveness_of_enemy3 == 1)) typeC[2] <= 1;

		else if ((angle_rocket == angle_enemy3 || angle_rocket - 1 == angle_enemy3 || angle_rocket + 1 == angle_enemy3 || angle_rocket - 2 == angle_enemy3 || angle_rocket + 2 == angle_enemy3) && aliveness_of_enemy3 == 1) typeC[2] <= 1;

	if ((angle_rocket==4'b1111&&angle_enemy4==4'b0000)&& (aliveness_of_enemy4 == 1) || (angle_rocket==4'b1110&&angle_enemy4==4'b0000)&& (aliveness_of_enemy4 == 1) || (angle_rocket==4'b1111&&angle_enemy4==4'b0001)&& (aliveness_of_enemy4 == 1)) typeC[3] <= 1;
		else if ((angle_rocket==4'b0000 &&angle_enemy4==4'b1111)&& (aliveness_of_enemy4 == 1) || (angle_rocket==4'b0001&&angle_enemy4==4'b1111)&& (aliveness_of_enemy4 == 1) || (angle_rocket==4'b0000 &&angle_enemy4==4'b1110)&& (aliveness_of_enemy4 == 1)) typeC[3] <= 1;


		else if ((angle_rocket == angle_enemy4 || angle_rocket - 1 == angle_enemy4 || angle_rocket + 1 == angle_enemy4 || angle_rocket - 2 == angle_enemy4 || angle_rocket + 2 == angle_enemy4) && aliveness_of_enemy4 == 1) typeC[3] <= 1;
	
	
		
		if ((angle_rocket==4'b1111&&angle_enemy5==4'b0000)&& (aliveness_of_enemy5 == 1) || (angle_rocket==4'b1110&&angle_enemy5==4'b0000)&& (aliveness_of_enemy1 == 1) || (angle_rocket==4'b1111&&angle_enemy5==4'b0001)&& (aliveness_of_enemy5 == 1)) typeC[4] <= 1;
		else if ((angle_rocket==4'b0000 &&angle_enemy5==4'b1111)&& (aliveness_of_enemy5 == 1) || (angle_rocket==4'b0001&&angle_enemy5==4'b1111)&& (aliveness_of_enemy5 == 1) || (angle_rocket==4'b0000 &&angle_enemy5==4'b1110)&& (aliveness_of_enemy5 == 1)) typeC[4] <= 1;

		else if ((angle_rocket == angle_enemy5 || angle_rocket - 1 == angle_enemy5 || angle_rocket + 1 == angle_enemy5 || angle_rocket - 2 == angle_enemy5 || angle_rocket + 2 == angle_enemy5) && aliveness_of_enemy5 == 1) typeC[4] <= 1;
		
		
		
		if ((angle_rocket==4'b1111&&angle_enemy6==4'b0000)&& (aliveness_of_enemy6 == 1) || (angle_rocket==4'b1110&&angle_enemy6==4'b0000)&& (aliveness_of_enemy6 == 1) || (angle_rocket==4'b1111&&angle_enemy6==4'b0001)&& (aliveness_of_enemy6 == 1)) typeC[5] <= 1;
		else if ((angle_rocket==4'b0000 &&angle_enemy6==4'b1111)&& (aliveness_of_enemy6 == 1) || (angle_rocket==4'b0001&&angle_enemy6==4'b1111)&& (aliveness_of_enemy6 == 1) || (angle_rocket==4'b0000 &&angle_enemy6==4'b1110)&& (aliveness_of_enemy6 == 1)) typeC[5] <= 1;

		else if ((angle_rocket == angle_enemy6 || angle_rocket - 1 == angle_enemy6 || angle_rocket + 1 == angle_enemy6 || angle_rocket - 2 == angle_enemy6 || angle_rocket + 2 == angle_enemy6) && aliveness_of_enemy6 == 1) typeC[5] <= 1;

				if ((angle_rocket==4'b1111&&angle_enemy7==4'b0000)&& (aliveness_of_enemy7 == 1) || (angle_rocket==4'b1110&&angle_enemy7==4'b0000)&& (aliveness_of_enemy7 == 1) || (angle_rocket==4'b1111&&angle_enemy7==4'b0001)&& (aliveness_of_enemy7 == 1)) typeC[6] <= 1;
		else if ((angle_rocket==4'b0000 &&angle_enemy7==4'b1111)&& (aliveness_of_enemy7 == 1) || (angle_rocket==4'b0001&&angle_enemy7==4'b1111)&& (aliveness_of_enemy7 == 1) || (angle_rocket==4'b0000 &&angle_enemy7==4'b1110)&& (aliveness_of_enemy7== 1)) typeC[6] <= 1;

		else if ((angle_rocket == angle_enemy7 || angle_rocket - 1 == angle_enemy7 || angle_rocket + 1 == angle_enemy7 || angle_rocket - 2 == angle_enemy7 || angle_rocket + 2 == angle_enemy7) && aliveness_of_enemy7 == 1) typeC[6] <= 1;
	if ((angle_rocket==4'b1111&&angle_enemy8==4'b0000)&& (aliveness_of_enemy8 == 1) || (angle_rocket==4'b1110&&angle_enemy8==4'b0000)&& (aliveness_of_enemy8 == 1) || (angle_rocket==4'b1111&&angle_enemy8==4'b0001)&& (aliveness_of_enemy8 == 1)) typeC[7] <= 1;
		else if ((angle_rocket==4'b0000 &&angle_enemy8==4'b1111)&& (aliveness_of_enemy8 == 1) || (angle_rocket==4'b0001&&angle_enemy8==4'b1111)&& (aliveness_of_enemy8 == 1) || (angle_rocket==4'b0000 &&angle_enemy8==4'b1110)&& (aliveness_of_enemy8== 1)) typeC[7] <= 1;

		else if ((angle_rocket == angle_enemy8 || angle_rocket - 1 == angle_enemy8 || angle_rocket + 1 == angle_enemy8 || angle_rocket - 2 == angle_enemy8 || angle_rocket + 2 == angle_enemy8) && aliveness_of_enemy8 == 1) typeC[7] <= 1;
	end
	
        
		  
		  
		  
		  end
		  else if (shoot == 0 && shoot_detected == 1) begin
				typeA <= 8'b00000000;
            typeB <= 8'b00000000;
            typeC <= 8'b00000000;
		  end
	end
    
endmodule