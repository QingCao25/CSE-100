`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/08/2024 01:02:60 PM
// Design Name: 
// Module Name: TopMod
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


module TopMod(
    input [15:0] sw,
    input btnU,
    input btnC,
    input btnL,
    input btnR,
    input clkin,
    output [15:0] led,
    output [3:0] an,
    output [6:0] seg,
    output dp
    );
	
	wire clk, digsel, qsec, play1, play2;
	wire slowdown, loss, player2;
	wire [6:0] PS;
	wire Go, load, stop, zero, FourSecs, TwoSecs, HalfSecs, Missed, Match, LastLED,
	 ShowNum, ResetTimer, RunGame, Scored, Win, FlashBoth, FlashAlt;
	wire [15:0] SPLIT;
	wire [3:0] segg,H;
 	wire [4:0] timeout,  usernum, timeout2;
 	wire [1:0] slow;
	
	qsec_clks slowit (.clkin(clkin), .greset(btnU), .clk(clk), .digsel(digsel), .qsec(qsec));
	
	//syn btns C,U,L
	FDRE #(.INIT(1'b0) ) GO (.C(clk), .R(1'b0), .CE(1'b1), .D(btnC), .Q(Go));
	FDRE #(.INIT(1'b0) ) P1 (.C(clk), .R(1'b0), .CE(1'b1), .D(btnL), .Q(play1));
	FDRE #(.INIT(1'b0) ) P2 (.C(clk), .R(1'b0), .CE(1'b1), .D(btnR), .Q(play2));
	assign player2 = (~sw[15]&play2) | (sw[15]&play1); 
	
	wire [7:0] rando;
	LFSR test (.clk(clk), .run(PS[0]), .Q(rando));
    
 	assign Match = ~|(rando[4:0] ^ usernum);
 	Time_Counter timer (.clk(clk), .UD(1'b0), .LD(PS[0]|PS[2]), .Din({5{1'b0}}), .CE(qsec), .Q(timeout));
 	assign FourSecs = ~|(timeout ^ 5'b10000);
 	assign TwoSecs = ~|(timeout ^ 5'b01000);
 	timecounter2 timer2 (.clk(clk), .UD(1'b0), .LD(1'b0), .Din({5{1'b0}}), .CE(qsec), .Q(timeout2));
 	wire help;
 	EdgeDetector edgeUP (.btnU(timeout2[1]), .clk(clk), .Q(help));
 	assign slowdown = ~sw[14]&qsec | sw[14]&help;
 	Game_Counter GCD (.clk(clk), .UD(1'b1), .CE(slowdown & RunGame), .Din({5{1'b1}}), .LD(ResetTimer), .Q(usernum));

	StateMachine ST(.clk(clk), .Go(Go), .play1(play1), .play2(player2), .TwoSecs(TwoSecs),
	.FourSecs(FourSecs), .Match(Match), .LastLED(LastLED), .ShowNum(ShowNum),
	.Score(Scored), .Missed(Missed), .ResetTimer(ResetTimer),.RunGame(RunGame), .FlashAlt(FlashAlt), 
	.FlashBoth(FlashBoth), .zero(zero), .loss(loss), .Won(Win),  .PS(PS[6:0]));
    
    
 	assign SPLIT[15:8] = rando[4:0];
 	assign SPLIT[7:0] = usernum;
 	RingCounter ringer (.Advance(digsel), .clk(clk), .Q(segg));
 	Selector sel (.N(SPLIT), .sel(segg), .h(H));
 	hex7seg hex (.n(H), .seg(seg));
 	
 	wire [15:0] shiftcode;
    LED_Shifter LS1( .MisR(Missed & player2), .MisL(Missed & play1), .ShR(Scored & player2), 
    .ShL(Scored & play1),.take_in(led[15:0]),  .code(shiftcode));
 	
 	Flipp_LED flips(.clk(clk), .code(shiftcode), .CE(Scored | Missed), 
 	.Off(Win & timeout[0]), .LastLED(LastLED), .zero(zero), .loss(loss),
 	.play1(play1), .play2(player2), .led(led));

 	assign dp = ~(timeout[0] & PS[6]);
 	assign an[0] = ~segg[0] | (FlashAlt & timeout[0] | FlashBoth & timeout[0]) ;   
 	assign an[1] = ~segg[1] | (FlashAlt & timeout[0] | FlashBoth & timeout[0]) ;  
 	assign an[2] = ~segg[2] | ((FlashAlt & ~timeout[0] | FlashBoth & timeout[0])) | ~ShowNum ;  
 	assign an[3] = ~segg[3] | ((FlashAlt & ~timeout[0] | FlashBoth & timeout[0])) | ~ShowNum ; 
 	 
endmodule
