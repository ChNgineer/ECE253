module part2(
	input [9:0]SW,
	input CLOCK_50,
	output [6:0]HEX0
);

	reg [3:0] q; // declare q
	reg [31:0]RateDivider;
	wire Enable;
	wire Clear_b;
	assign Clear_b = SW[9];
	assign Enable = (RateDivider == 0)?1:0;
	
	hexDecoder U0(q[0],q[1],q[2],q[3],HEX0[0],HEX0[1],HEX0[2],HEX0[3],HEX0[4],HEX0[5],HEX0[6]);
	
	always @(posedge CLOCK_50) begin// triggered every time clock rises
		RateDivider <= RateDivider - 1;
		if(SW[1:0] == 2'b00)
			RateDivider <= 0;
		else if((SW[1:0] == 2'b01) & ((RateDivider == 0) | (RateDivider > 499)))
			RateDivider <= 499;
		else if((SW[1:0] == 2'b10) & ((RateDivider == 0) | (RateDivider > 999)))
			RateDivider <= 999;
		else if((SW[1:0] == 2'b11) & ((RateDivider == 0) | (RateDivider > 1999)))
			RateDivider <= 1999;
		if (Clear_b == 1'b1) // when Clear b is 1
			q <= 0; // q is set to 0
		else if (q == 4'b1111) // when q is the maximum value for the counter
			q <= 0; // q reset to 0
		else if (Enable == 1'b1) // increment q only when Enable is 1
			q <= q + 1; // increment q
	end

endmodule

module hexDecoder(input d,c,b,a, output s0, s1, s2, s3, s4, s5, s6);
	assign s0 = (a & b & ~c & d) || (a & ~b & c & d) || (~a & b & ~c & ~d) || (~a & ~b & ~c & d);
	assign s1 = (a & b & ~d) || (a & c & d) || (~a & b & ~c & d) || (b & c & ~d);
	assign s2 = (a & b & c) || (a & b & ~d) || (~a & ~b & c & ~d);
	assign s3 = (a & ~b & c & ~d) || (~a & b & ~c & ~d) || (b & c & d) || (~a & ~b & ~c & d);
	assign s4 = (~a & b & ~c) || (~a & d) || (~b & ~c & d);
	assign s5 = (a & b & ~c & d) || (~a & ~b & c) || (~a & ~b & d) || (~a & c & d);
	assign s6 = (a & b & ~c & ~d) || (~a & b & c & d) || (~a & ~b & ~c);
endmodule