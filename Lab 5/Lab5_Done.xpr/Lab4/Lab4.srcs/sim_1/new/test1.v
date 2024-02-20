`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/08/2024 10:25:32 PM
// Design Name: 
// Module Name: test1
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////



module SM_test();

	reg clk, Go, stop, FourSecs, TwoSecs, Match, LastLED;
	wire ShowNum, ResetTimer, RunGame, Score, Won, FlashBoth, FlashAlt;
	wire [5:0] PS;

	ST UUT (
	.clk(clk),
	.Go(Go),
	.stop(stop),
	.four(FourSecs),
	.two(TwoSecs),
	.Match(Match),
	.LastLED(LastLED),
	.PS(PS),
	.ShowNum(ShowNum),
	.ResetTimer(ResetTimer),
	.RunGame(RunGame),
	.Score(Score),
	.Won(Won),
	.FlashBoth(FlashBoth),
	.FlashAlt(FlashAlt)
	);
    
   
	// create an oscillating signal to impersonate the clock provided on the BASYS 3 board
	parameter PERIOD = 10;
	parameter real DUTY_CYCLE = 0.5;
	parameter OFFSET = 2;

	initial	// Clock process for clkin
	begin
    	#OFFSET
   	   clk = 1'b1;
    	forever
    	begin
        	#(PERIOD-(PERIOD*DUTY_CYCLE)) clk = ~clk;
    	end
	end
    
// here is where the values for the registers are provided
// time must be advanced after every change
   initial
   begin
     // add your test vectors here
     // to set the signal foo (declared as a register above) to a value use
     // foo = constant;
     	// example:   foo = 1'b0;
     // always advance time by multiples of 100ns
     //start by setting initial values
     Go = 1'b0;
     stop = 1'b0;
     FourSecs =1'b0;
     TwoSecs = 1'b0;
     Match = 1'b0;
     LastLED = 1'b0;
    
     	// and advance time by 2000 to begin
     #100;
 	Go = 1'b1;
 	TwoSecs = 1'b1;
 	stop = 1'b1;
 	Match = 1'b1;
 	#100
 	stop = 1'b1;
 	LastLED = 1'b1;
 	Match = 1'b1;
 	Go = 1'b1;
 	FourSecs = 1'b0 ;
 	#100
 	FourSecs = 1'b1 ;
    #100
    FourSecs = 1'b0;
	
	end

endmodule


