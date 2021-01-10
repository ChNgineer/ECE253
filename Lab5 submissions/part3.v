module part3(
	input [9:0]SW, 
	input [3:0]KEY, 
	output [9:0]LEDR, 
	input CLOCK_50
);
	reg q;
	reg [4:0]n;
	reg [15:0]r;
	reg [15:0]LUT;
	reg [31:0]RateDivider;
	wire Enable;
	assign Enable = (RateDivider == 0)?1:0;
	assign LEDR[0] = q;
	
	always @(*)begin
		case(SW[2:0])
			3'b000: LUT = 16'b1011100000000000;
			3'b001: LUT = 16'b1110101010000000;
			3'b010: LUT = 16'b1110101110100000;
			3'b011: LUT = 16'b1110101000000000;
			3'b100: LUT = 16'b1000000000000000;
			3'b101: LUT = 16'b1010111010000000;
			3'b110: LUT = 16'b1110111010000000;
			3'b111: LUT = 16'b1010101000000000;
			default: LUT = 0;
		endcase
	end
	
	always @(posedge CLOCK_50 or negedge KEY[0]) begin
		if(KEY[0] == 0)
			q <= 0;
		else begin
			RateDivider <= (RateDivider == 0)?249:RateDivider-1;
			if((Enable == 1'b1) & (KEY[1] == 1'b1)) begin
				n <= (n == 15)?0:n + 1;
				r <= LUT << n;
				q <= r[15];
			end
		end
	end
endmodule
