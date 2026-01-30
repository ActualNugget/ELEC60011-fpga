module cordic_cosine (
    input wire [31:0] dataa,      // 32-bit fixed-point input (-1 to 1)
    output reg [31:0] result,     // 32-bit fixed-point output (cosine value)
	 input wire clk,
    input wire clk_en,
    input wire reset,
	 input wire start,
    output reg done
);

    // Constants
    localparam ITERATIONS = 18;
    localparam SCALE = 32'h26dd3b6a; // K value for n iterations
	 
	 // Lookup table for precomputed arctans
    reg signed [31:0] arctan[ITERATIONS];
	initial begin
		arctan[0] = 32'h3243f6a8;
		arctan[1] = 32'h1dac6705;
		arctan[2] = 32'hfadbafc;
		arctan[3] = 32'h7f56ea6;
		arctan[4] = 32'h3feab76;
		arctan[5] = 32'h1ffd55b;
		arctan[6] = 32'hfffaaa;
		arctan[7] = 32'h7fff55;
		arctan[8] = 32'h3fffea;
		arctan[9] = 32'h1ffffd;
		arctan[10] = 32'hfffff;
		arctan[11] = 32'h7ffff;
		arctan[12] = 32'h3ffff;
		arctan[13] = 32'h1ffff;
		arctan[14] = 32'hffff;
		arctan[15] = 32'h7fff;
		arctan[16] = 32'h3fff;
		arctan[17] = 32'h1fff;
	end
   
    // Internal registers
    reg signed [31:0] x;
    reg signed [31:0] y;
    reg signed [31:0] z;
	reg signed [31:0] x_shifted, y_shifted;
	reg signed [31:0] x_new, y_new, z_new;
	integer i;

    // CORDIC algorithm
    always @(posedge clk or posedge reset) begin
		if (reset) begin
			x = 32'h26dd3b6a; // Initialize x to K
			y = 32'h0; // Initialize y to 0		  
			z = 32'h0;
			x_new = 32'h26dd3b6a; // Initialize x to K
			y_new = 32'h0; // Initialize y to 0		  
			z_new = 32'h0;
			result = 32'h0;	
			done = 1'b0;
		end
		else if (start) begin
			done = 1'b0;
			x = 32'h26dd3b6a; // Initialize x to K
			y = 32'h0; // Initialize y to 0		  
			z = dataa; // Initialize z with input data
			  
			for (i = 0; i < ITERATIONS; i = i + 1) begin
				x_shifted = x >>> i; // Shift x right by i
				y_shifted = y >>> i; // Shift y right by i

				if (~z[31]) begin // z is positive
					 x_new = x - y_shifted;
					 y_new = y + x_shifted;
					 z_new = z - arctan[i];
				end else begin // z is negative
					 x_new = x + y_shifted;
					 y_new = y - x_shifted;
					 z_new = z + arctan[i];
				end

				x = x_new;
				y = y_new;
				z = z_new;
			end
			result = x;
			done = 1'b1;
		end
    end
endmodule