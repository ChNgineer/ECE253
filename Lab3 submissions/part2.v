module part2(input [9:0]SW, output [9:0]LEDR);
	wire c1, c2, c3;
	fulladder U0(SW[4], SW[0], SW[8], LEDR[0], c1);
	fulladder U1(SW[5], SW[1], c1, LEDR[1], c2);
	fulladder U2(SW[6], SW[2], c2, LEDR[2], c3);
	fulladder U3(SW[7], SW[3], c3, LEDR[3], LEDR[9]);
endmodule

module fulladder(input a,b,c_in, output s, c_out);
	assign s = a ^ b ^ c_in;
	assign c_out = (a & b) | (a & c_in) | (b & c_in);
endmodule
