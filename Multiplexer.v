module Multiplexer(input[1:0]laW, input[8:0]aW,cOut,lOut,output [8:0]mOut); //Stuart McDonald ECEN2350 2018 spring
	mux4to1 u1(laW[1:0],aW[8:0],cOut[8:0],lOut[8:0],mOut[8:0]);
 endmodule
 
module mux4to1(input[1:0]s,input[8:0]x,input[8:0]y,input[8:0]z,output reg[8:0]f);
	always @(*)
	if(s==2'b00)
		f=x;
	else if(s==2'b01)
		f=y;
	else if(s==2'b10)
		f=z;
	else
		f=2'b000000000;

endmodule




/*




module Multiplexer(input [1:0]Mx,input[9:0]aO,input[9:0]cO,input[9:0]lO, output [9:0]mWO);
			assign mWO[0]=mO[0];
			assign mWO[1]=mO[1];
			assign mWO[2]=mO[2];
			assign mWO[3]=mO[3];
			assign mWO[4]=mO[4];
			assign mWO[5]=mO[5];
			assign mWO[6]=mO[6];
			assign mWO[7]=mO[7];
			assign mWO[8]=mO[8];
			assign mWO[9]=mO[9];
			always @(Mx[0],Mx[1])
			begin
			if ((Mx[0]==0)&(Mx[1]==0))
			begin
				mO[0]=aO[0];
				mO[1]=aO[1];
				mO[2]=aO[2];
				mO[3]=aO[3];
				mO[4]=aO[4];
				mO[5]=aO[5];
				mO[6]=aO[6];
				mO[7]=aO[7];
				mO[8]=aO[8];
				mO[9]=aO[9];
			end
			else if ((Mx[0]==0)&(Mx[1]==1))
			begin
				mO[0]=lO[0];
				mO[1]=lO[1];
				mO[2]=lO[2];
				mO[3]=lO[3];
				mO[4]=lO[4];
				mO[5]=lO[5];
				mO[6]=lO[6];
				mO[7]=lO[7];
				mO[8]=lO[8];
				mO[9]=lO[9];
			end
			else if ((Mx[0]==1)&(Mx[1]==0))
			begin
				mO[0]=cO[0];
				mO[1]=cO[1];
				mO[2]=cO[2];
				mO[3]=cO[3];
				mO[4]=cO[4];
				mO[5]=cO[5];
				mO[6]=cO[6];
				mO[7]=cO[7];
				mO[8]=cO[8];
				eO[9]=cO[9];
			end
			else ((Mx[0]==1)&(Mx[1]==1))
			begin
				mO[0]=0;
				mO[1]=0;
				mO[2]=0;
				mO[3]=0;
				mO[4]=0;
				mO[5]=0;
				mO[6]=0;
				mO[7]=0;
				mO[8]=0;
				mO[9]=0;
			end
		endmodule*/