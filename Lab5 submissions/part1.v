module part1 (
	input [9:0]SW, 
	input [3:0]KEY,
	output [6:0]HEX0, 
	output [6:0]HEX1);
	
	wire enable[7:0];
	wire Q_out[7:0];
	
	assign enable[0] = SW[1];
	assign enable[1] = enable[0] & Q_out[0];
	assign enable[2] = enable[1] & Q_out[1];
	assign enable[3] = enable[2] & Q_out[2];
	assign enable[4] = enable[3] & Q_out[3];
	assign enable[5] = enable[4] & Q_out[4];
	assign enable[6] = enable[5] & Q_out[5];
	assign enable[7] = enable[6] & Q_out[6];
	
	TFlipFlop U0(enable[0],KEY[0],SW[0],Q_out[0]);
	TFlipFlop U1(enable[1],KEY[0],SW[0],Q_out[1]);
	TFlipFlop U2(enable[2],KEY[0],SW[0],Q_out[2]);
	TFlipFlop U3(enable[3],KEY[0],SW[0],Q_out[3]);
	TFlipFlop U4(enable[4],KEY[0],SW[0],Q_out[4]);
	TFlipFlop U5(enable[5],KEY[0],SW[0],Q_out[5]);
	TFlipFlop U6(enable[6],KEY[0],SW[0],Q_out[6]);
	TFlipFlop U7(enable[7],KEY[0],SW[0],Q_out[7]);
	
	hexDecoder V0(Q_out[0],Q_out[1],Q_out[2],Q_out[3],HEX0[0],HEX0[1],HEX0[2],HEX0[3],HEX0[4],HEX0[5],HEX0[6]);
	hexDecoder V1(Q_out[4],Q_out[5],Q_out[6],Q_out[7],HEX1[0],HEX1[1],HEX1[2],HEX1[3],HEX1[4],HEX1[5],HEX1[6]);
	
endmodule

module TFlipFlop(
	input T, 
	input Clock, 
	input Clear_b, 
	output reg Q);
	
	always @ (posedge Clock or negedge Clear_b) begin
		if (!Clear_b)
			Q <= 0;
		else
			if(T)
				Q <= ~Q;
			else
				Q <= Q;
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
