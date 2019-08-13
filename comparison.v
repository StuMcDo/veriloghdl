module comparison( //Stuart McDonald ECEN2350 2018 spring
	input  [9:0]SW,
	output [8:0]cOut
);
	wire [8:0]eq,gr,lOe,mx;
	equal    u1(SW[3:0],SW[7:4], eq[8:0]);
	greater  u2(SW[3:0],SW[7:4], gr[8:0]);
	lessOreq u3(SW[3:0],SW[7:4], lOe[8:0]);
	cmux4to1 u4(SW[9:8], eq[8:0], gr[8:0], lOe[8:0], mx[8:0], cOut[8:0]);
	max      u5(SW[3:0],SW[7:4], mx[8:0]);
endmodule
	
	module equal(input[3:0]x,input[3:0]y, output reg[8:0]eO);
		always @(x,y)
		begin 
			if((x[0]==y[0])&(x[1]==y[1])&(x[2]==y[2])&(x[3]==y[3]))
			eO[0]=1;
			else
			eO[0]=0;
		end
	endmodule
	module greater(input [3:0]x, input [3:0]y, output reg [8:0]z);
		integer i;
		always @(*)
		begin 
		for(i=0;i<4;i=i+1)
			begin
			z=x[i]&~y[i];
			end
		end
	endmodule 
		module lessOreq(input [3:0]x, input [3:0]y, output reg [9:0]z);
		integer i;
		always @(*)
		begin 
		for(i=0;i<4;i=i+1)
			begin
			z[0]=~(x[i]&~y[i]);
			end
		end
	endmodule
	module max(input [3:0]x, input [3:0]y, output [9:0]z);
		wire[3:0] w;
		assign w[0]=x[0]|y[0];
		assign w[1]=x[1]|y[1];
		assign w[2]=x[2]|y[2];
		assign w[3]=x[3]|y[3];
		assign z[0]=(w[3]&x[3]&x[0])|(w[3]&y[3]&y[0])|(~w[3]&w[2]&y[2]&y[0])|(~w[3]&w[2]&x[2]&x[0])|(~w[2]&~w[3]&w[1])
						|(~w[3]&~w[2]&w[1]&x[1]&x[0])|(~w[3]&~w[2]&w[1]&y[1]&y[0]);
		assign z[1]=(w[3]&x[3]&x[1])|(w[3]&y[3]&y[1])|(~w[3]&w[2]&y[2]&y[1])|(~w[3]&w[2]&x[2]&x[1])|(~w[2]&~w[3]&w[1]);
		assign z[2]=w[3]&x[3]&x[2]|w[3]&y[3]&y[2]|~w[3]&w[2];
		assign z[3]=w[3];
	endmodule
	
	module cmux4to1(input[1:0]s,input[8:0]x,input[8:0]y,input[8:0]z,input[8:0]a, output reg[8:0]f);
	always @(s,x,y,z,a)
	if(s==2'b00)
		f=x;
	else if(s==2'b01)
		f=y;
	else if(s==2'b10)
		f=z;
	else
		f=a;

	endmodule
	
	
	
			
		
			
	

	/*module greater(input[3:0]x,input[3:0]y, output [9:0]gO);
		always @(x[3:0],y[3:0])
		begin
		case(x[3:0],y[3:0])
		begin
			x[0]>y[0]: g0=1;
			x[1]>y[1]: g0=1;
			x[2]>y[2]: g0=1;
			x[3]>y[3]: g0=1;
			default: gOr[0]=0;
		end
	module equal(input[3:0]x,[3:0]y, output reg[9:0]lO);
		reg [9:0] l0r;
		assign lO[0]=lOr[0];
		always @(x[3:0],y[3:0])
		begin 
		case(x[3:0],y[3:0])
		begin
			x[3]>y[3]: l0=0;
			x[2]>y[2]: l0=0;
			x[1]>y[1]: l0=0;
			x[0]>y[0]: l0=0;
			default: lOr[0]=1;
		end
	endmodule

	
	
	module compareMux(input [1:0]lMx,[9:0]lO,[9:0]gO,[9:0]eO, output [9:0]mO);
			always @(lMx[0],lMx[1])
			begin
			if ((lMx[0]==0)&(lMx[1]==0))
				lO[0]=mO[0];
				lO[1]=mO[1];
				lO[2]=mO[2];
				lO[3]=mO[3];
				lO[4]=mO[4];
				lO[5]=mO[5];
				lO[6]=mO[6];
				lO[7]=mO[7];
				lO[8]=mO[8];
				lO[9]=mO[9];
			else if ((lMx[0]==0)&(lMx[1]==1))
				gO[0]=mO[0];
				gO[1]=mO[1];
				gO[2]=mO[2];
				gO[3]=mO[3];
				gO[4]=mO[4];
				gO[5]=mO[5];
				gO[6]=mO[6];
				gO[7]=mO[7];
				gO[8]=mO[8];
				gO[9]=mO[9];
			else if ((lMx[0]==1)&(lMx[1]==0))
				eO[0]=mO[0];
				eO[1]=mO[1];
				eO[2]=mO[2];
				eO[3]=mO[3];
				eO[4]=mO[4];
				eO[5]=mO[5];
				eO[6]=mO[6];
				eO[7]=mO[7];
				eO[8]=mO[8];
				eO[9]=mO[9];
			else ((lMx[0]==1)&(lMx[1]==1))
				MO[0]=mO[0];
				MO[1]=mO[1];
				MO[2]=mO[2];
				MO[3]=mO[3];
				MO[4]=mO[4];
				MO[5]=mO[5];
				MO[6]=mO[6];
				MO[7]=mO[7];
				MO[8]=mO[8];
				MO[9]=mO[9];
			end
	endmodule
		
		
*/
