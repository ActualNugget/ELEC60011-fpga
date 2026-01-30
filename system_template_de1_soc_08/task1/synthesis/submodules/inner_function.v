// Copyright (C) 2023  Intel Corporation. All rights reserved.
// Your use of Intel Corporation's design tools, logic functions 
// and other software and tools, and any partner logic 
// functions, and any output files from any of the foregoing 
// (including device programming or simulation files), and any 
// associated documentation or information are expressly subject 
// to the terms and conditions of the Intel Program License 
// Subscription Agreement, the Intel Quartus Prime License Agreement,
// the Intel FPGA IP License Agreement, or other applicable license
// agreement, including, without limitation, that your use is for
// the sole purpose of programming logic devices manufactured by
// Intel and sold by Intel or its authorized distributors.  Please
// refer to the applicable agreement for further details, at
// https://fpgasoftware.intel.com/eula.

// PROGRAM		"Quartus Prime"
// VERSION		"Version 23.1std.0 Build 991 11/28/2023 SC Lite Edition"
// CREATED		"Sat Mar 15 18:20:41 2025"

module inner_function(
	clk,
	reset,
	clk_en,
	start,
	dataa,
	done,
	result
);


input wire	clk;
input wire	reset;
input wire	clk_en;
input wire	start;
input wire	[31:0] dataa;
output reg	done;
output wire	[31:0] result;

reg	DFF_inst15;
wire	[31:0] SYNTHESIZED_WIRE_0;
wire	[31:0] SYNTHESIZED_WIRE_1;
wire	[31:0] SYNTHESIZED_WIRE_2;
wire	[31:0] SYNTHESIZED_WIRE_3;
wire	[31:0] SYNTHESIZED_WIRE_4;
wire	SYNTHESIZED_WIRE_31;
wire	SYNTHESIZED_WIRE_32;
reg	DFF_inst12;
reg	DFF_inst13;
reg	DFF_inst14;
wire	SYNTHESIZED_WIRE_33;
wire	SYNTHESIZED_WIRE_14;
wire	SYNTHESIZED_WIRE_34;
reg	DFF_inst17;
wire	[31:0] SYNTHESIZED_WIRE_18;
wire	SYNTHESIZED_WIRE_35;
reg	DFF_inst19;
reg	DFF_inst20;
wire	SYNTHESIZED_WIRE_36;
reg	DFF_inst21;
reg	DFF_inst22;
wire	[31:0] SYNTHESIZED_WIRE_27;
wire	[31:0] SYNTHESIZED_WIRE_28;
wire	[31:0] SYNTHESIZED_WIRE_29;
wire	[31:0] SYNTHESIZED_WIRE_30;

assign	SYNTHESIZED_WIRE_31 = 1;
assign	SYNTHESIZED_WIRE_32 = 1;
assign	SYNTHESIZED_WIRE_33 = 1;
assign	SYNTHESIZED_WIRE_34 = 1;
assign	SYNTHESIZED_WIRE_35 = 1;
assign	SYNTHESIZED_WIRE_36 = 1;




cordic_cosine	b2v_inst(
	.clk(clk),
	
	.reset(reset),
	.start(DFF_inst15),
	.dataa(SYNTHESIZED_WIRE_0),
	.done(SYNTHESIZED_WIRE_14),
	.result(SYNTHESIZED_WIRE_29));


fp_mul	b2v_inst10(
	.clk(clk),
	.areset(reset),
	.a(SYNTHESIZED_WIRE_1),
	.b(SYNTHESIZED_WIRE_2),
	.q(SYNTHESIZED_WIRE_4));


fp_add	b2v_inst11(
	.clk(clk),
	.areset(reset),
	.a(SYNTHESIZED_WIRE_3),
	.b(SYNTHESIZED_WIRE_4),
	.q(result));


always@(posedge clk or negedge SYNTHESIZED_WIRE_31 or negedge SYNTHESIZED_WIRE_32)
begin
if (!SYNTHESIZED_WIRE_31)
	begin
	DFF_inst12 <= 0;
	end
else
if (!SYNTHESIZED_WIRE_32)
	begin
	DFF_inst12 <= 1;
	end
else
	begin
	DFF_inst12 <= start;
	end
end


always@(posedge clk or negedge SYNTHESIZED_WIRE_31 or negedge SYNTHESIZED_WIRE_32)
begin
if (!SYNTHESIZED_WIRE_31)
	begin
	DFF_inst13 <= 0;
	end
else
if (!SYNTHESIZED_WIRE_32)
	begin
	DFF_inst13 <= 1;
	end
else
	begin
	DFF_inst13 <= DFF_inst12;
	end
end


always@(posedge clk or negedge SYNTHESIZED_WIRE_31 or negedge SYNTHESIZED_WIRE_32)
begin
if (!SYNTHESIZED_WIRE_31)
	begin
	DFF_inst14 <= 0;
	end
else
if (!SYNTHESIZED_WIRE_32)
	begin
	DFF_inst14 <= 1;
	end
else
	begin
	DFF_inst14 <= DFF_inst13;
	end
end


always@(posedge clk or negedge SYNTHESIZED_WIRE_31 or negedge SYNTHESIZED_WIRE_32)
begin
if (!SYNTHESIZED_WIRE_31)
	begin
	DFF_inst15 <= 0;
	end
else
if (!SYNTHESIZED_WIRE_32)
	begin
	DFF_inst15 <= 1;
	end
else
	begin
	DFF_inst15 <= DFF_inst14;
	end
end


always@(posedge clk or negedge SYNTHESIZED_WIRE_33 or negedge SYNTHESIZED_WIRE_34)
begin
if (!SYNTHESIZED_WIRE_33)
	begin
	DFF_inst17 <= 0;
	end
else
if (!SYNTHESIZED_WIRE_34)
	begin
	DFF_inst17 <= 1;
	end
else
	begin
	DFF_inst17 <= SYNTHESIZED_WIRE_14;
	end
end



always@(posedge clk or negedge SYNTHESIZED_WIRE_33 or negedge SYNTHESIZED_WIRE_34)
begin
if (!SYNTHESIZED_WIRE_33)
	begin
	DFF_inst19 <= 0;
	end
else
if (!SYNTHESIZED_WIRE_34)
	begin
	DFF_inst19 <= 1;
	end
else
	begin
	DFF_inst19 <= DFF_inst17;
	end
end


fp_div_128	b2v_inst2(
	.dataa(SYNTHESIZED_WIRE_18),
	.result(SYNTHESIZED_WIRE_28));


always@(posedge clk or negedge SYNTHESIZED_WIRE_35 or negedge SYNTHESIZED_WIRE_33)
begin
if (!SYNTHESIZED_WIRE_35)
	begin
	DFF_inst20 <= 0;
	end
else
if (!SYNTHESIZED_WIRE_33)
	begin
	DFF_inst20 <= 1;
	end
else
	begin
	DFF_inst20 <= DFF_inst19;
	end
end


always@(posedge clk or negedge SYNTHESIZED_WIRE_35 or negedge SYNTHESIZED_WIRE_33)
begin
if (!SYNTHESIZED_WIRE_35)
	begin
	DFF_inst21 <= 0;
	end
else
if (!SYNTHESIZED_WIRE_33)
	begin
	DFF_inst21 <= 1;
	end
else
	begin
	DFF_inst21 <= DFF_inst20;
	end
end


always@(posedge clk or negedge SYNTHESIZED_WIRE_36 or negedge SYNTHESIZED_WIRE_35)
begin
if (!SYNTHESIZED_WIRE_36)
	begin
	DFF_inst22 <= 0;
	end
else
if (!SYNTHESIZED_WIRE_35)
	begin
	DFF_inst22 <= 1;
	end
else
	begin
	DFF_inst22 <= DFF_inst21;
	end
end


always@(posedge clk or negedge SYNTHESIZED_WIRE_36 or negedge SYNTHESIZED_WIRE_35)
begin
if (!SYNTHESIZED_WIRE_36)
	begin
	done <= 0;
	end
else
if (!SYNTHESIZED_WIRE_35)
	begin
	done <= 1;
	end
else
	begin
	done <= DFF_inst22;
	end
end







fp_sub	b2v_inst3(
	.clk(clk),
	.areset(reset),
	.a(dataa),
	.b(SYNTHESIZED_WIRE_27),
	.q(SYNTHESIZED_WIRE_18));


fp_to_fix	b2v_inst4(
	.clk(clk),
	.areset(reset),
	.a(SYNTHESIZED_WIRE_28),
	.q(SYNTHESIZED_WIRE_0));


fix_to_fp	b2v_inst5(
	.clk(clk),
	.areset(reset),
	.a(SYNTHESIZED_WIRE_29),
	.q(SYNTHESIZED_WIRE_2));


const_128	b2v_inst6(
	.result(SYNTHESIZED_WIRE_27));


fp_div_2	b2v_inst7(
	.dataa(dataa),
	.result(SYNTHESIZED_WIRE_3));


fp_mul	b2v_inst8(
	.clk(clk),
	.areset(reset),
	.a(dataa),
	.b(dataa),
	.q(SYNTHESIZED_WIRE_30));


fp_mul	b2v_inst9(
	.clk(clk),
	.areset(reset),
	.a(SYNTHESIZED_WIRE_30),
	.b(dataa),
	.q(SYNTHESIZED_WIRE_1));


endmodule
