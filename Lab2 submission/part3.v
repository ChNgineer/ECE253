module part3(SW, HEX0, HEX1);
	input [9:0]SW;
	output [6:0]HEX0;
	output [6:0]HEX1;
	hexDecoder U1(SW[0], SW[1], SW[2], SW[3], HEX0[0], HEX0[1], HEX0[2], HEX0[3], HEX0[4], HEX0[5], HEX0[6]);
	hexDecoder U2(SW[4], SW[5], SW[6], SW[7], HEX1[0], HEX1[1], HEX1[2], HEX1[3], HEX1[4], HEX1[5], HEX1[6]);
endmodule

module hexDecoder(input d,c,b,a, output s0, s1, s2, s3, s4, s5, s6);
	assign s0 = (a & b & ~c & d) || (a & ~b & c & d) || (~a & b & ~c & ~d) || (~a & ~b & ~c & d);
	assign s1 = (a & b & ~d) || (a & c & d) || (~a & b & ~c & d) || (b & c & ~d);
	assign s2 = (a & b & c) || (a & b & ~d) || (~a & ~b & c & ~d);
	assign s3 = (a & ~b & c & ~d) || (~a & b & ~c & ~d) || (b & c & d) || (~b & ~c & d);
	assign s4 = (~a & b & ~c) || (~a & d) || (~b & ~c & d);
	assign s5 = (a & b & ~c & d) || (~a & ~b & c) || (~a & ~b & d) || (~a & c & d);
	assign s6 = (a & b & ~c & ~d) || (~a & b & c & d) || (~a & ~b & ~c);
endmodule
