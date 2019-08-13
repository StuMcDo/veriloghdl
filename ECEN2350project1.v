module ECEN2350project1( //Stuart McDonald ECEN2350 2018 spring
	input [9:0]SW,
	input [1:0]PB,
	output [7:0]hx00, output[7:0]hx01,output[9:0]led
);
	wire [8:0] aW,lOut,cOut,ssW,mOut;
	wire [1:0]  laW;
		Arithmetic 	   U1(SW[9:0],aW[8:0]);
		logical 	      U2(SW[9:0],lOut[8:0]);
		comparison 	   U3(SW[9:0],cOut[8:0]);
		Multiplexer    U4(laW[1:0],aW[8:0],cOut[8:0],lOut[8:0],mOut[8:0]);
		sevenSegment 	U5(mOut[8:0],hx00[7:0],hx01[7:0]);
		latching 		U6(PB[0],laW[0]);
		latching 		U7(PB[1],laW[1]);
		lit            U8(SW[9:0],led[9:0]);

endmodule 
	module latching(input PB, output reg latch);
	assign laW=latch;
	always @(posedge PB)
		begin
		latch=~latch;
	end
	endmodule
	
	module lit(input [9:0]x, output [9:0]y);
		assign y=x;
	endmodule 