module Stuart_Mcdonald_ECEN2350_project2(
input [1:0] PB, input Clock,
output [6:0] SS00, SS01, SS02, SS03, SS04, SS05,
output [9:0] led
);
// Top level module, connects all other modules and instantiates FSM.
wire clear0, count0, load0, idle0, clk1Khz,enable0, enable1, enable2, enable3,enable4, enableU6, enableU7,clkhalfhz,invertPB0;
wire [3:0] milli, deca, centi, sec, hs0, hs1, hs2, hs3,randomW,countD;
assign enableU6=enable2&enable1;
assign enableU7=enable1&enable3&enable2;
	FSM          U1(invertPB0,PB[1], clear0, count0, load0, idle0);
	ClockDivider U2(Clock, clk1Khz, clkhalfhz);
	sevenSeg     U3(milli,centi,deca,sec,randomW, countD, clear0, clkhalfhz,SS00,SS01,SS02,SS03,SS05,SS04);
	BCDcount     U4(clk1Khz, clear0, count0, load0, enable0, hs0, milli, enable1);
	BCDcount     U5(clk1Khz, clear0, count0, load0, enable1, hs1, centi, enable2);
	BCDcount     U6(clk1Khz, clear0, count0, load0, enableU6, hs2, deca, enable3);
	BCDcount     U7(clk1Khz, clear0, count0, load0, enableU7, hs3, sec, enable4);
	HighScore    U8(milli, centi, deca, sec, idle0, hs0, hs1, hs2, hs3);
	randomNumber U9(count0,clear0, clkhalfhz,enable0,randomW, countD);
//Leds assigned to enable user to track what the FSM is doing
assign led[5]=idle0;
assign led[6]=clear0;
assign led[7]=count0;
assign led[8]=load0;
assign led[9]=clk1Khz;
assign led[4]=PB[0];
assign led[3]=PB[1];
//lets user know that test has started.
assign led[2]=enable0;
assign led[1]=enable0;
assign led[0]=enable0;
assign invertPB0=~PB[0];

endmodule
//FSM machine 4 states with asynchronous reset
module FSM(input W, reset, /*clkin,*/ output reg clear, count, load, idle);
	reg [1:0]  Y,y;//Y next state, y current state
	parameter [1:0] RESET=2'b00, START=2'b01, IDLE=2'b10, HighScore=2'b11;//states of FSM
	always @(W,  y) begin
	case(y)//depending on W and y shifts to next state
		RESET:if(W)begin 
						count = 1;
						clear = 0;
						load  = 0;
						idle  = 0;
						Y = START;
					 end	
					 else  
					 begin
					 Y = RESET;
						count = 0;
						clear = 1;
						load  = 0;
						idle  = 0;
					end
		START:if(W)begin
						count = 0;
						clear = 0;
						load  = 0;
						idle  = 1;
						Y = IDLE;
						end
					 else  begin
						Y = START;
						count = 1;
						clear = 0;
						load  = 0;
						idle  = 0;
					end
		IDLE:if(W)begin
					   count = 0;
					   clear = 0;
					   load  = 1;
						idle  = 0;
					 Y =  HighScore;
					 end
					else begin
					Y =  IDLE;
						count = 0;
					   clear = 0;
					   load  = 0;
						idle  = 1;
				end
		HighScore: if(W)begin
						count = 0;
						clear = 1;
					   load  = 0;
						idle  = 0;
						Y = RESET;
						end
						else  begin
						Y = HighScore;
						count = 0;
						clear = 0;
					   load  = 1;
						idle  = 0;
						end
		endcase
	end	
	always @(negedge reset, negedge W)begin/*this always block shifts to the next state
	on the negedge of the input signal or back to reset if reset is depressed.*/
	if (reset==0) y<=RESET;
	else y<=Y;
	end
endmodule
	
	
	
/*module FSM(input W, reset, output reg clear, count, load, idle);
	reg [1:0]  Y,y;
	parameter [1:0] RESET=2'b00, START=2'b01, IDLE=2'b10, HighScore=2'b11;
	always @(posedge W,  negedge reset)
begin
		if(~reset)
		begin
		count = 0;
		clear = 1;
		load  = 0;
		idle  = 0;
		Y=RESET;
		end
		else if(W)
		begin
		case(Y) 
			RESET:begin 
						count <= 0;
						clear <= 1;
						load  <= 0;
						idle  <= 0;
					 if(W) Y <= START;
					 //else if(reset) Y <= RESET;
					 else  Y <= RESET;
					end
					 
			START:begin
						count <= 1;
						clear <= 0;
						load  <= 0;
						idle  <= 0;
					 if(W) Y <= IDLE;
					 //else if(reset) Y <= RESET;
					 else  Y <= START;
					end
					 
			IDLE:begin
					   count <= 0;
					   clear <= 0;
					   load  <= 0;
						idle  <= 1;
					if(W) Y <=  HighScore;
					//else if(reset) Y <= RESET;
					else  Y <=  IDLE;
				end
			HighScore: begin
						count <= 0;
						clear <= 0;
					   load  <= 1;
						idle  <= 0;
						if(W) Y <= RESET;
						//else if(reset) Y<= RESET;
						else  Y <= HighScore;
						end
		endcase
end		
end
always @(negedge reset, posedge clock)
if (reset==0) y<=RESET;
else y<=Y;
endmodule */
	
	
	
	