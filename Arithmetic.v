module Arithmetic(
	input [9:0]SW,
	output [8:0] aW); //Stuart McDonald ECEN2350 2018 spring
	wire [8:0] adder,subtractor,multiply,Divide;
	add      u1(SW[3:0],SW[7:4],adder[8:0]);
	subtract u2(SW[3:0],SW[7:4],subtractor[8:0]);
	multiply u3(SW[7:0],multiply[8:0]);
	divide   u4(SW[7:0],Divide[8:0]);
	amux4to1    u5(SW[9:8],adder[8:0],subtractor[8:0],multiply[8:0],Divide[8:0],aW[8:0]);
endmodule
	
	module add(input[3:0]x,input[3:0]y, output wire[9:0] adder);
		parameter n=4;
		assign adder[4]=C[4];
		wire [4:0] C;
		genvar i;
		assign C[0]=0;
		generate
			for(i=0; i<n; i=i+1)
			begin:addbit
			fullAdd stage(x[i], y[i],C[i], adder[i], C[i+1]);
			end
		endgenerate
	endmodule
	module subtract(input [3:0]x, input[3:0]y, output [9:0] subtractor);
		parameter n=4;
		wire [4:0] C;
		genvar i;
		assign C[0]=0;
		generate
			for(i=0; i<n; i=i+1)
			begin:subbit
			fullsubtract stage(x[i], y[i],C[i], subtractor[i], C[i+1]);
			end
		endgenerate
	endmodule
	module multiply(input [7:0]z, output [8:0]multiply);
					assign multiply=z<<1;
				endmodule
	module divide(input [7:0]z, output [8:0]Divide);

		 assign 
		 Divide=z>>1;
		 endmodule
	module fullAdd(input x, y, cIn, output s,carryO);
		assign s=x^y^cIn;
		assign carryO=(x&y)|(x&cIn)|(y&cIn);
	endmodule 
	module fullsubtract(input x, y, cIn, output s,carryO);
		assign s=x^y^cIn;
		assign carryO=(~x&y)|(~x&cIn)|(y&cIn);
	endmodule 

	module amux4to1(input[1:0]s,input[9:0]x,input[9:0]y,input[9:0]z,input[9:0]a, output reg[9:0]f);
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
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	/*










module Multiplexer(input [1:0]aMx,input[9:0]adder,input[9:0]subtractor,input[9:0]multiply, output [9:0] aOut);
			reg [9:0]mO;
			always @(aMx[0],aMx[1])
			begin
			if ((aMx[0]==1'b0)|(aMx[1]==1'b0))
				aOut[0]=adder[0];
				aOut[1]=adder[1];
				aOut[2]=adder[2];
				aOut[3]=adder[3];
				aOut[4]=adder[4];
				aOut[5]=adder[5];
				aOut[6]=adder[6];
				aOut[7]=adder[7];
				aOut[8]=adder[8];
				aOut[9]=adder[9];
			end
			else if ((aMx[0]==1'b0)|(aMx[1]==1'b1));
			begin
				aOut[0]=subtractor[0];
				aOut[1]=subtractor[1];
				aOut[2]=subtractor[2];
				aOut[3]=subtractor[3];
				aOut[4]=subtractor[4];
				aOut[5]=subtractor[5];
				aOut[6]=subtractor[6];
				aOut[7]=subtractor[7];
				aOut[8]=subtractor[8];
				aOut[9]=subtractor[9];
			end
			else if ((aMx[0]==1'b1)|(aMx[1]==1'b0))
			begin
				aOut[0]=multiply[0];
				aOut[1]=multiply[1];
				aOut[2]=multiply[2];
				aOut[3]=multiply[3];
				aOut[4]=multiply[4];
				aOut[5]=multiply[5];
				aOut[6]=multiply[6];
				aOut[7]=multiply[7];
				aOut[8]=multiply[8];
				aOut[9]=multiply[9];
			end
			else ((aMx[0]==1'b1)|(aMx[1]==1'b1))
			begin
				aOut[0]=divide[0];
				aOut[1]=divide[1];
				aOut[2]=divide[2];
				aOut[3]=divide[3];
				aOut[4]=divide[4];
				aOut[5]=divide[5];
				aOut[6]=divide[6];
				aOut[7]=divide[7];
				aOut[8]=divide[8];
				aOut[9]=divide[9];
			end
		endmodule */
