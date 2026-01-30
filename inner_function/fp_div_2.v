module fp_div_2 ( 
	input [31:0] dataa,
	output [31:0] result
);

	wire [7:0] new_exp;
	assign new_exp = dataa[30:23] - 1;
	assign result = (dataa[30:23] == 0) ? 0 : {dataa[31], new_exp, dataa[22:0]};
	
endmodule