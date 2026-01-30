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
// CREATED		"Sun Mar 16 18:26:01 2025"

module double_input(
	clk,
	reset,
	clk_en,
	start,
	dataa,
	datab,
	done,
	result
);


input wire	clk;
input wire	reset;
input wire	clk_en;
input wire	start;
input wire	[31:0] dataa;
input wire	[31:0] datab;
output reg	done;
output wire	[31:0] result;

wire	[31:0] SYNTHESIZED_WIRE_0;
wire	[31:0] SYNTHESIZED_WIRE_1;
wire	SYNTHESIZED_WIRE_2;
wire	SYNTHESIZED_WIRE_3;
wire	SYNTHESIZED_WIRE_9;
wire	SYNTHESIZED_WIRE_5;
reg	DFF_inst5;

assign	SYNTHESIZED_WIRE_9 = 1;




inner_function	b2v_inst(
	.clk(clk),
	.reset(reset),
	.clk_en(clk_en),
	.start(start),
	.dataa(dataa),
	.done(SYNTHESIZED_WIRE_2),
	.result(SYNTHESIZED_WIRE_0));


inner_function	b2v_inst1(
	.clk(clk),
	.reset(reset),
	.clk_en(clk_en),
	.start(start),
	.dataa(datab),
	.done(SYNTHESIZED_WIRE_3),
	.result(SYNTHESIZED_WIRE_1));


fp_add	b2v_inst3(
	.clk(clk),
	.areset(reset),
	.a(SYNTHESIZED_WIRE_0),
	.b(SYNTHESIZED_WIRE_1),
	.q(result));

assign	SYNTHESIZED_WIRE_5 = SYNTHESIZED_WIRE_2 & SYNTHESIZED_WIRE_3;


always@(posedge clk or negedge SYNTHESIZED_WIRE_9 or negedge SYNTHESIZED_WIRE_9)
begin
if (!SYNTHESIZED_WIRE_9)
	begin
	DFF_inst5 <= 0;
	end
else
if (!SYNTHESIZED_WIRE_9)
	begin
	DFF_inst5 <= 1;
	end
else
	begin
	DFF_inst5 <= SYNTHESIZED_WIRE_5;
	end
end


always@(posedge clk or negedge SYNTHESIZED_WIRE_9 or negedge SYNTHESIZED_WIRE_9)
begin
if (!SYNTHESIZED_WIRE_9)
	begin
	done <= 0;
	end
else
if (!SYNTHESIZED_WIRE_9)
	begin
	done <= 1;
	end
else
	begin
	done <= DFF_inst5;
	end
end



endmodule
