//=======================================================
//  This code is generated by Terasic System Builder
//=======================================================

module Sintese(

	//////////// CLOCK //////////
	input 		          		CLOCK_50,
	input 		          		CLOCK2_50,
	input 		          		CLOCK3_50,

	//////////// LED //////////
	output		     [8:0]		LEDG,
	output		    [17:0]		LEDR,

	//////////// SW //////////
	input 		    [17:0]		SW,

	//////////// SEG7 //////////
	output		     [6:0]		HEX0,
	output		     [6:0]		HEX1,
	output		     [6:0]		HEX2,
	output		     [6:0]		HEX3,
	output		     [6:0]		HEX4,
	output		     [6:0]		HEX5,
	output		     [6:0]		HEX6,
	output		     [6:0]		HEX7
);



//=======================================================
//  REG/WIRE declarations
//=======================================================


//=======================================================
//  Structural coding
//=======================================================

Identificador instancia(.clk(CLOCK_50), .reset(SW[12]), .ok(SW[13]), .nota(SW[17:14]), .fim(LEDG[8]), .tipo(LEDG[6:5]),.estados(LEDR[3:0]));
Circuito sim_instancia(.D(SW[17]), .N1(SW[16]), .N2(SW[15]), .N3(SW[14]), .s0(HEX0[0]), .s1(HEX0[1]), .s2(HEX0[2]), .s3(HEX0[3]), .s4(HEX0[4]), .s5(HEX0[5]), .s6(HEX0[6]));

endmodule
