module part2(SW,LEDR);
	input[9:0]SW;
	output[9:0]LEDR;
	wire x,x1,y,y1,s,s1,f;
	assign x = SW[0];
	assign y = SW[1];
	assign s = SW[9];
	assign LEDR[0] = f;
	v7404 u0(.pin1(s),.pin2(s1));
	v7408 u1(.pin1(x),.pin2(s1),.pin3(x1),.pin4(y),.pin5(s),.pin6(y1));
	v7432 u2(.pin1(x1),.pin2(y1),.pin3(f));
endmodule

module v7404(input pin1, pin3, pin5, pin9, pin11, pin13,
output pin2, pin4, pin6, pin8, pin10, pin12);

	assign pin2 = ~pin1;
	assign pin4 = ~pin3;
	assign pin6 = ~pin5;
	assign pin8 = ~pin9;
	assign pin10 = ~pin11;
	assign pin12 = ~pin13;
	
endmodule

module v7408(input pin1, pin2, pin4, pin5, pin9, pin10, pin12, pin13,
output pin3, pin6, pin8, pin11);

	assign pin3 = pin1 & pin2;
	assign pin6 = pin4 & pin5;
	assign pin8 = pin9 & pin10;
	assign pin11 = pin12 & pin13;

endmodule

module v7432(input pin1, pin2, pin4, pin5, pin9, pin10, pin12, pin13,
output pin3, pin6, pin8, pin11);

	assign pin3 = pin1 || pin2;
	assign pin6 = pin4 || pin5;
	assign pin8 = pin9 || pin10;
	assign pin11 = pin12 || pin13;

endmodule
