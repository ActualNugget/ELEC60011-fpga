module cordic_cosine (
    input wire [31:0] dataa,      // 32-bit fixed-point input (-1 to 1)
    output [31:0] result,     // 32-bit fixed-point output (cosine value)
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
	 reg signed [31:0] x[ITERATIONS];
	 reg signed [31:0] y[ITERATIONS];
	 reg signed [31:0] z[ITERATIONS];
//	reg signed [31:0] x_shifted, y_shifted;
//	reg signed [31:0] x_new, y_new, z_new;
    integer i;
    assign result = x[17];

    // CORDIC algorithm
    always @(posedge clk or posedge reset) begin
		if (reset) begin
			for(i = 0 ;i < ITERATIONS; i = i + 1) begin
				x[i] <= 0;
				y[i] <= 0;
				z[i] <= 0;
			end
			done = 1'b0;
		end
		else if (start) begin
			done = 1'b0;
			x[0] <= 32'h26dd3b6a; // Initialize x to K
			y[0] <= 32'h0; // Initialize y to 0		  
			z[0] <= dataa; // Initialize z with input data
			  
			for (i = 0; i < ITERATIONS-1; i = i + 1) begin
				if (~z[i][31]) begin // z is positive
					 x[i+1] <= x[i] - (y[i] >>> i);
					 y[i+1] <= y[i] + (x[i] >>> i);
					 z[i+1] <= z[i] - arctan[i];
				end else begin // z is negative
					 x[i+1] <= x[i] + (y[i] >>> i);
					 y[i+1] <= y[i] - (x[i] >>> i);
					 z[i+1] <= z[i] + arctan[i];
				end
			end
			done = 1'b1;
		end
    end
endmodule