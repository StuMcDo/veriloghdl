module sevenSegment( //Stuart McDonald ECEN2350 2018 spring
	input [8:0]ssW,
	output[7:0]hx0,
	output[7:0]hx1
	
);
	b4toseg7   u1(ssW[3:0],hx0[6:0]);
	b4toseg7   u2(ssW[7:4],hx1[6:0]);

	
endmodule

module b4toseg7(input [3:0]x,output reg[7:0]s);
	always @(x)
		case(x)
			4'b0000: s=~7'b0111111;
			4'b0001: s=~7'b0000110;
			4'b0010: s=~7'b1011011;
			4'b0011: s=~7'b1001111;
			4'b0100: s=~7'b1100110;
			4'b0101: s=~7'b1101101;
			4'b0110: s=~7'b1111101;
			4'b0111: s=~7'b0000111;
			4'b1000: s=~7'b1111111;
			4'b1001: s=~7'b1101111;
			4'b1010: s=~7'b1110111;
			4'b1011: s=~7'b1111100;
			4'b1100: s=~7'b0111001;
			4'b1101: s=~7'b1011110;
			4'b1110: s=~7'b1111001;
			4'b1111: s=~7'b1110001;
		endcase
endmodule

/*
module b2tosegdp(input [1:0]x,output reg[1:0]s);
	always @(x)
		case(x)
			2'b10: s=2'b10;
			2'b10: s=2'b10;
		endcase
endmodule
			




































	assign a0=(x[3]&~x[0])|(~x[2]&~x[0])|(x[2]&x[1])|(x[3]&~x[2]&~x[1])|(~x[3]&x[2]&x[0]);
	assign b0=(~x[3]&~x[2])|(~x[3]&x[1]&x[0])|(~x[2]&x[0])|(~x[3]&~x[1]&~x[0])|(x[3]&~x[1]&x[0]);
	assign c0=(~x[3]&x[0])|(~x[1]&x[0])|(~x[3]&~x[1])|(~x[3]&x[2])|(x[3]&~x[2]);
	assign d0=(x[2]&x[1]&~x[0])|(~x[2]&x[1]&x[0])|(x[3]&~x[1])|(x[2]&~x[1]&x[0])|(~x[3]&~x[2]&~x[0]);
	assign e0=(~x[2]&~x[0])|(x[1]&~x[0])|(x[3]&x[1])|(x[3]&x[2]);
	assign f0=(x[3]&~x[2])|(x[3]&x[1])|(~x[1]&~x[0])|(x[2]&~x[0])|(~x[3]&x[2]&~x[1]);
	assign g0=(~x[3]&~x[2]&x[1])|(x[1]&~x[0])|(x[3]&x[0])|(x[3]&~x[2]&x[1])|(~x[3]&x[2]&~x[1]);
	assign a1=(x[7]&~x[4])|(~x[6]&~x[4])|(x[6]&x[5])|(x[7]&~x[6]&~x[5])|(~x[7]&x[6]&x[4]);
	assign b1=(~x[7]&~x[6])|(~x[7]&x[5]&x[4])|(~x[6]&x[4])|(~x[7]&~x[5]&~x[4])|(x[7]&~x[5]&x[4]);
	assign c1=(~x[7]&x[4])|(~x[5]&x[4])|(~x[7]&~x[5])|(~x[7]&x[6])|(x[7]&~x[6]);
	assign d1=(x[6]&x[5]&~x[4])|(~x[6]&x[5]&x[4])|(x[7]&~x[5])|(x[6]&~x[5]&x[4])|(~x[7]&~x[6]&~x[4]);
	assign e1=(~x[6]&~x[4])|(x[5]&~x[4])|(x[7]&x[5])|(x[7]&x[6]);
	assign f1=(x[7]&~x[6])|(x[7]&x[5])|(~x[5]&~x[4])|(x[6]&~x[4])|(~x[7]&x[6]&~x[5]);
	assign g1=(~x[7]&~x[6]&x[5])|(x[5]&~x[4])|(x[7]&x[4])|(x[7]&~x[6]&x[5])|(~x[7]&x[6]&~x[5]);
*/