module part1 (SW, LEDR);
	input [9:0]SW;
	output [9:0]LEDR;
	
	//reg Input[6:0];
	//reg MuxSelect[2:0];
	reg Out; // declare the output signal for the always block
	
	//assign MuxSelect[2:0] = [9:7]SW;
	//assign Input[6:0] = [6:0]SW;
	assign LEDR[0] = Out;
	
	always @(*) // declare always block
	begin
		case (SW[9:7]) // start case statement
			3'b000: Out = SW[0]; // case 0
			3'b001: Out = SW[1]; // case 1
			3'b010: Out = SW[2]; // case 2
			3'b011: Out = SW[3]; // case 3
			3'b100: Out = SW[4]; // case 4
			3'b101: Out = SW[5]; // case 5
			3'b110: Out = SW[6]; // case 6
			default:Out = 0; // default case
		endcase
	end	
endmodule

