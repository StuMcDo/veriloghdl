module logical( //Stuart McDonald ECEN2350 2018 spring
	input  [9:0]SW,
	output [8:0]lOut
);
	wire [8:0] aW,oW,eW,nW;
	ANDed      u1(SW[3:0],SW[7:4],aW[8:0]);
	ORed       u2(SW[3:0],SW[7:4],oW[8:0]);
	exor     u3(SW[3:0],SW[7:4],eW[8:0]);
	nOted      u4(SW[7:0],nW[8:0]);
	lmux4to1 u5(SW[9:8],aW[8:0],oW[8:0],eW[8:0],nW[8:0],lOut[8:0]);
				 
endmodule 

module ANDed(input [3:0]x,input [3:0]y,output [8:0]z);
	assign z[0]=x[0]&y[0];
	assign z[1]=x[1]&y[1];
	assign z[2]=x[2]&y[2];
	assign z[3]=x[3]&y[3];
endmodule 
module ORed(input [3:0]x,input [3:0]y,output [8:0]z);
	assign z[0]=x[0]|y[0];
	assign z[1]=x[1]|y[1];
	assign z[2]=x[2]|y[2];
	assign z[3]=x[3]|y[3];
endmodule 
module exor(input [3:0]x,input [3:0]y,output [8:0]z);
	assign z[0]=x[0]^y[0];
	assign z[1]=x[1]^y[1];
	assign z[2]=x[2]^y[2];
	assign z[3]=x[3]^y[3];
endmodule 
module nOted(input [7:0]x,output [8:0]z);
	assign z[0]=~x[0];
	assign z[1]=~x[1];
	assign z[2]=~x[2];
	assign z[3]=~x[3];
	assign z[4]=~x[4];
	assign z[5]=~x[5];
	assign z[6]=~x[6];
	assign z[7]=~x[7];
endmodule
module lmux4to1(input[1:0]s,input[9:0]x,input[9:0]y,input[9:0]z,input[9:0]l,output reg[9:0]f);
	always @(s,x,y,z)
	if(s==2'b00)
		f=x;
	else if(s==2'b01)
		f=y;
	else if(s==2'b10)
		f=z;
	else
		f=l;
endmodule 