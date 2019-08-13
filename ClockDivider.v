module ClockDivider(input Mhz50, output Khz1, hzhalf);

	Mhz50toKhz1 U1(Mhz50, Khz1);
	Khz1tohzhalf U2(Khz1, hzhalf);

endmodule

module Khz1tohzhalf(input clockin, output reg clockout);/*same as 1khz clock just different inputs*/
	reg [7:0]divideC;

	parameter resetCount=8'b00000000, fullcount=8'b11111010;
	always @(posedge clockin) 
	begin
		divideC <= divideC + 1;
		if(divideC == fullcount)
		begin
			divideC<=resetCount;
			clockout <= ~clockout;
		end
end
endmodule


module Mhz50toKhz1(input clockin, output reg clockout);/*50mhz/1000=50k  
duty cycle is 50% for a clock therefore count goes to 25k then alternates the output signal*/
	reg [14:0]divideC;

	parameter resetCount=15'b0000000000000000, fullcount=15'b110000110101000;
	always @(posedge clockin) 
	begin
		divideC <= divideC + 1;
		if(divideC == fullcount)
		begin
			divideC<=resetCount;
			clockout <= ~clockout;
		end
	end
endmodule
/*module Mhz50toKhz1(input clockin, output reg clockout);
	reg [20:0]divide2;

	parameter resetCount=20'b00000000000000000000, fullcount=20'b10000000000000000000;
always @(posedge clockin) 
begin
   divide2 <= divide2 + 1;
   if(divide2 == fullcount)
   begin
      divide2<=resetCount;
      clockout <= !clockout;
   end
end
endmodule*/


/*if(divide2 == fullcount)
	begin
		divide2<=resetCount;
		clockout<=divide2[14];
	end

	else
	begin
		divide2=divide2+1;
		clockout<=divide2[14];
	end*/