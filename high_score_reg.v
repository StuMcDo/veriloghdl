module HighScore(input [3:0] digit0, digit1, digit2, digit3, input idle, output reg[3:0] hs0, hs1, hs2, hs3);
parameter z0=4'b0000;
	always @(*)
	if(idle)
	begin
		if(hs0 ==z0 && hs1 == z0 && hs2 == z0 && hs3 == z0)
		begin 
			hs0=digit0;
			hs1=digit1;
			hs2=digit2;
			hs3=digit3;
		end
		else if (digit3<hs3 | (hs3==digit3 && digit2<hs2) | (digit3==hs3 && digit2==hs2 && digit1<hs1) | 
				  (digit3==hs3 && digit2==hs2 && digit1==hs1 && digit0<hs0))
		begin 
			hs0=digit0;
			hs1=digit1;
			hs2=digit2;
			hs3=digit3;
		end
		
   end
endmodule 