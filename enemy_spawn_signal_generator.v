module enemy_spawn_signal_generator (
input clk_fpga,
output reg spawn

);


reg [31:0] counter;

always@(posedge(clk_fpga)) begin


if (counter == 'd100000000) begin
 counter <= 'd0;
 spawn <= 'd1;
 
 end
 
 else begin
 
 spawn <= 'd0;
 counter <= counter + 1;
 
 end
 end
 endmodule