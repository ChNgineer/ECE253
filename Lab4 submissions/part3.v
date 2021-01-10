module part3(
	input [9:0]SW,
	input [3:0]KEY,
	output [9:0]LEDR);
	
	wire [7:0]rotatedata;
	wire [7:0]data_to_dff;
	wire [7:0]Out_Q;
	assign LEDR[7:0] = Out_Q[7:0];
	
//Substructure 1//////////////////////////////////////////////////////
		
	mux2to1 M1( //instantiates 1st multiplexer
		.x(Out_Q[7]), //rotate left
		.y(Out_Q[1]), //rotate right
		.s(KEY[2]), //inputs new bit to the left
		.m(rotatedata[0]) //outputs to multiplexer
	);
	
	mux2to1 M2( //instantiates 2nd multiplexer
		.y(rotatedata[0]), //output from previous multiplexer
		.x(SW[0]), //data D coming in
		.s(KEY[1]), //selects input D or rotate
		.m(data_to_dff[0]) //outputs to flip flop
	);

	flipflop F0( //instantiates flip flop
		.d(data_to_dff[0]), //input to flip flop
		.q(Out_Q[0]), //output from flip flop
		.clock(KEY[0]), //clock signal
		.reset(SW[9]) //synchronous active high reset
	);
	
//Substructure 2//////////////////////////////////////////////////////
	
	mux2to1 M3( //instantiates 1st multiplexer
		.x(Out_Q[0]), //rotate left
		.y(Out_Q[2]), //rotate right
		.s(KEY[2]), //inputs new bit to the left
		.m(rotatedata[1]) //outputs to multiplexer
	);
	
	mux2to1 M4( //instantiates 2nd multiplexer
		.y(rotatedata[1]), //output from previous multiplexer
		.x(SW[1]), //data D coming in
		.s(KEY[1]), //selects input D or rotate
		.m(data_to_dff[1]) //outputs to flip flop
	);

	flipflop F1( //instantiates flip flop
		.d(data_to_dff[1]), //input to flip flop
		.q(Out_Q[1]), //output from flip flop
		.clock(KEY[0]), //clock signal
		.reset(SW[9]) //synchronous active high reset
	);
	
//Substructure 3//////////////////////////////////////////////////////
	
	mux2to1 M5( //instantiates 1st multiplexer
		.x(Out_Q[1]), //rotate left
		.y(Out_Q[3]), //rotate right
		.s(KEY[2]), //inputs new bit to the left
		.m(rotatedata[2]) //outputs to multiplexer
	);
	
	mux2to1 M6( //instantiates 2nd multiplexer
		.y(rotatedata[2]), //output from previous multiplexer
		.x(SW[2]), //data D coming in
		.s(KEY[1]), //selects input D or rotate
		.m(data_to_dff[2]) //outputs to flip flop
	);

	flipflop F2( //instantiates flip flop
		.d(data_to_dff[2]), //input to flip flop
		.q(Out_Q[2]), //output from flip flop
		.clock(KEY[0]), //clock signal
		.reset(SW[9]) //synchronous active high reset
	);
	
//Substructure 4//////////////////////////////////////////////////////
	
	mux2to1 M7( //instantiates 1st multiplexer
		.x(Out_Q[2]), //rotate left
		.y(Out_Q[4]), //rotate right
		.s(KEY[2]), //inputs new bit to the left
		.m(rotatedata[3]) //outputs to multiplexer
	);
	
	mux2to1 M8( //instantiates 2nd multiplexer
		.y(rotatedata[3]), //output from previous multiplexer
		.x(SW[3]), //data D coming in
		.s(KEY[1]), //selects input D or rotate
		.m(data_to_dff[3]) //outputs to flip flop
	);

	flipflop F3( //instantiates flip flop
		.d(data_to_dff[3]), //input to flip flop
		.q(Out_Q[3]), //output from flip flop
		.clock(KEY[0]), //clock signal
		.reset(SW[9]) //synchronous active high reset
	);
	
//Substructure 5//////////////////////////////////////////////////////
	
	mux2to1 M9( //instantiates 1st multiplexer
		.x(Out_Q[3]), //rotate left
		.y(Out_Q[5]), //rotate right
		.s(KEY[2]), //inputs new bit to the left
		.m(rotatedata[4]) //outputs to multiplexer
	);
	
	mux2to1 M10( //instantiates 2nd multiplexer
		.y(rotatedata[4]), //output from previous multiplexer
		.x(SW[4]), //data D coming in
		.s(KEY[1]), //selects input D or rotate
		.m(data_to_dff[4]) //outputs to flip flop
	);

	flipflop F4( //instantiates flip flop
		.d(data_to_dff[4]), //input to flip flop
		.q(Out_Q[4]), //output from flip flop
		.clock(KEY[0]), //clock signal
		.reset(SW[9]) //synchronous active high reset
	);
	
//Substructure 6//////////////////////////////////////////////////////
	
	mux2to1 M11( //instantiates 1st multiplexer
		.x(Out_Q[4]), //rotate left
		.y(Out_Q[6]), //rotate right
		.s(KEY[2]), //inputs new bit to the left
		.m(rotatedata[5]) //outputs to multiplexer
	);
	
	mux2to1 M12( //instantiates 2nd multiplexer
		.y(rotatedata[5]), //output from previous multiplexer
		.x(SW[5]), //data D coming in
		.s(KEY[1]), //selects input D or rotate
		.m(data_to_dff[5]) //outputs to flip flop
	);

	flipflop F5( //instantiates flip flop
		.d(data_to_dff[5]), //input to flip flop
		.q(Out_Q[5]), //output from flip flop
		.clock(KEY[0]), //clock signal
		.reset(SW[9]) //synchronous active high reset
	);
	
//Substructure 7//////////////////////////////////////////////////////
	
	mux2to1 M13( //instantiates 1st multiplexer
		.x(Out_Q[5]), //rotate left
		.y(Out_Q[7]), //rotate right
		.s(KEY[2]), //inputs new bit to the left
		.m(rotatedata[6]) //outputs to multiplexer
	);
	
	mux2to1 M14( //instantiates 2nd multiplexer
		.y(rotatedata[6]), //output from previous multiplexer
		.x(SW[6]), //data D coming in
		.s(KEY[1]), //selects input D or rotate
		.m(data_to_dff[6]) //outputs to flip flop
	);

	flipflop F6( //instantiates flip flop
		.d(data_to_dff[6]), //input to flip flop
		.q(Out_Q[6]), //output from flip flop
		.clock(KEY[0]), //clock signal
		.reset(SW[9]) //synchronous active high reset
	);
	
//Substructure 8//////////////////////////////////////////////////////
	
	wire ASR;
	
	mux2to1 M17( //instantiates 1st multiplexer
		.y(Out_Q[7]), //rotate right w/ ASR
		.x(Out_Q[0]), //rotate right normally
		.s(KEY[3]), //inputs new bit to the left
		.m(ASR) //outputs to multiplexer 2
	);
	
	mux2to1 M15( //instantiates 2nd multiplexer
		.x(Out_Q[6]), //rotate left
		.y(ASR), //rotate right
		.s(KEY[2]), //inputs new bit to the left
		.m(rotatedata[7]) //outputs to multiplexer 3
	);
	
	mux2to1 M16( //instantiates 3rd multiplexer
		.y(rotatedata[7]), //output from previous multiplexer
		.x(SW[7]), //data D coming in
		.s(KEY[1]), //selects input D or rotate
		.m(data_to_dff[7]) //outputs to flip flop
	);

	flipflop F7( //instantiates flip flop
		.d(data_to_dff[7]), //input to flip flop
		.q(Out_Q[7]), //output from flip flop
		.clock(KEY[0]), //clock signal
		.reset(SW[9]) //synchronous active high reset
	);
	
endmodule

module mux2to1(
	input y,
	input x,
	input s,
	output reg m);
	
	always @(*)begin
		case(s)
			0: m = x;
			1: m = y;
		endcase
	end
endmodule

module flipflop(
	input d,
	output reg q,
	input clock,
	input reset);
	
	always @(posedge clock) begin // triggered every time clock rises
		if (reset == 1'b1) // when Reset b is 1 (note this is tested on every rising clock edge)
			q <= 0; // q is set to 0. Note that the assignment uses <=
		else // when Reset b is not 0
			q <= d; // value of d passes through to output q
	end
endmodule
