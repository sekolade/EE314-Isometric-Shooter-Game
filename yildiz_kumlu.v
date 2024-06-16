module yildiz_kumlu (
    input clk,
    input [9:0] next_x,
    input [9:0] next_y,
    output reg [7:0] color
);

    // Define the center and radii of the oval
    localparam [9:0] OVAL_CENTER_X = 320;
    localparam [9:0] OVAL_CENTER_Y = 240;
    localparam [9:0] OVAL_RADIUS_X = 100;
    localparam [9:0] OVAL_RADIUS_Y = 140;
    localparam [9:0] BORDER_THICKNESS = 50;//5

    reg [19:0] dist_to_oval;
    reg [19:0] dist_to_inner_oval;

    // Main logic
    always @(posedge clk) begin
        // Default background color: white (8-bit RGB: 11111111)
        color <= 8'b11111111;

        // Calculate the distance to the oval
        dist_to_oval <= (((next_x - OVAL_CENTER_X) * (next_x - OVAL_CENTER_X)) * OVAL_RADIUS_Y * OVAL_RADIUS_Y) + 
                        (((next_y - OVAL_CENTER_Y) * (next_y - OVAL_CENTER_Y)) * OVAL_RADIUS_X * OVAL_RADIUS_X);

        // Calculate the distance to the inner oval (for border thickness)
        dist_to_inner_oval <= (((next_x - OVAL_CENTER_X) * (next_x - OVAL_CENTER_X)) * (OVAL_RADIUS_Y - BORDER_THICKNESS) * (OVAL_RADIUS_Y - BORDER_THICKNESS)) + 
                              (((next_y - OVAL_CENTER_Y) * (next_y - OVAL_CENTER_Y)) * (OVAL_RADIUS_X - BORDER_THICKNESS) * (OVAL_RADIUS_X - BORDER_THICKNESS));

        // Draw the oval with a border
        if (dist_to_oval <= (OVAL_RADIUS_X * OVAL_RADIUS_X) * (OVAL_RADIUS_Y * OVAL_RADIUS_Y)) begin
            if (dist_to_inner_oval > ((OVAL_RADIUS_X - BORDER_THICKNESS) * (OVAL_RADIUS_X - BORDER_THICKNESS)) * ((OVAL_RADIUS_Y - BORDER_THICKNESS) * (OVAL_RADIUS_Y - BORDER_THICKNESS))) begin
                color <= 8'b01000111; // Grey color for the border
            end else begin
                color <= 8'b01000111; // Cream color for the inner oval
            end
        end
    end

endmodule