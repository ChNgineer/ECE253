module part2 (
	input [9:0]SW, 
	input [3:0]KEY,
	output [9:0]LEDR,
	output [6:0]HEX0,
	output [6:0]HEX1,
	output [6:0]HEX2,
	output [6:0]HEX3,
	output [6:0]HEX4,
	output [6:0]HEX5);
	
	reg [7:0]ALU;
	reg [7:0]Out;
	reg [3:0]A;
	reg [3:0]B;
	assign LEDR[7:0] = Out[7:0];
	assign HEX1[6] = 1;
	assign HEX2[6] = 1;
	assign HEX3[6] = 1;
	hexDecoder U0(A[0],A[1],A[2],A[3],HEX0[0],HEX0[1],HEX0[2],HEX0[3],HEX0[4],HEX0[5],HEX0[6]);
	hexDecoder U2(Out[0],Out[1],Out[2],Out[3],HEX4[0],HEX4[1],HEX4[2],HEX4[3],HEX4[4],HEX4[5],HEX4[6]);
	hexDecoder U3(Out[4],Out[5],Out[6],Out[7],HEX5[0],HEX5[1],HEX5[2],HEX5[3],HEX5[4],HEX5[5],HEX5[6]);
	
	wire c1, c2, c3, c4;
	wire [3:0]sum;
	fulladder V0(A[0], B[0], SW[8], sum[0], c1);
	fulladder V1(A[1], B[1], c1, sum[1], c2);
	fulladder V2(A[2], B[2], c2, sum[2], c3);
	fulladder V3(A[3], B[3], c3, sum[3], c4);
		
	reg Reset_b;
	wire Clock;
	
	assign Clock = KEY[0];
		
	always @(posedge Clock) // triggered every time clock rises
	begin
		Reset_b <= SW[9];
		if (Reset_b == 1'b0)// when Reset b is 0 (note this is tested on every	rising clock edge)
			Out <= 0;
		else // when Reset b is not 0
			Out <= ALU;
	end
	
	always @(*) // declare always block
	begin	
		A[3:0] = SW[3:0];
		B[3:0] = Out[3:0];
		case(KEY[3:1])// start case statement A + B using the adder from Part II of this Lab
			3'b000:
				ALU = { 4'b0000, sum[3:0] };
				
			3'b001:
				ALU = A + B;//A + B using the Verilog `+' operator
			
			3'b010:
				ALU = { {4{B[3]}}, B[3:0] };//Sign extension of B to 8 bits
			
			3'b011:
				ALU = |A || |B;//Output 8'b00000001 if at least 1 of the 8 bits in the two inputs is 1 using a single OR operation
			
			3'b100:
				ALU = &A && &B;//Output 8'b00000001 if all of the 8 bits in the two inputs are 1 using a single AND operation

			3'b101:
				ALU = A << B; //Shift A left by B bits
				
			3'b110:
				ALU = A * B; //Multiply via * operator
				
			3'b111:
				ALU = Out;
				
			default:
				ALU = 0;// default case
		endcase
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

module fulladder(input a,b,c_in, output s, c_out);
	assign s = a ^ b ^ c_in;
	assign c_out = (a & b) | (a & c_in) | (b & c_in);
endmodule

