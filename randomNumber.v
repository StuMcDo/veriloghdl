module randomNumber(input cDelay, reset, clk, output enableCount ,output [3:0]dSS00, CDSS01);

//wire [2:0] a;
//assign a = {dSS00[2],dSS00[1],dSS00[0]};
assign dSS00[3]=0;
lfsr U1(cDelay,dSS00[2:0]);
downcount U2(dSS00[2:0], clk, cDelay, reset, enableCount,CDSS01);

endmodule
module downcount(input [2:0]RN, input clock, E, reset, output reg finale, output reg [2:0]Q);

	always @(posedge clock)
		if(reset)
		begin
			Q<=RN;
		finale<=0;
		end
		else if(E&&~finale)
		begin
			Q<=Q-1;
			if(Q==3'b000)
				finale<=1;
		end
endmodule


module lfsr( L, Q);
parameter R=3'b001;
input L;
output reg [3:0] Q;
	always @(posedge L)
		if (Q==3'b000)
		Q <= R;
	else
		Q <={Q[1], Q[0]^Q[2], Q[2]};
endmodule 