`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/05/2024 02:38:36 AM
// Design Name: 
// Module Name: Top_Module
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


module Top_Module(
    input clkin, btnR, btnU, btnC, btnL,
    input [15:0] sw,
    output [15:0] led,
    output [3:0] an,
    output [6:0] seg,
    output dp
    );
    
    wire clk, qsec, digsel;
    wire foursecs, twosecs, lastledL, lastledR;
    wire syncbtnL, syncbtnU, syncbtnC, syncbtnR;
    wire shownum, resettimer, rungame, scoredL, scoredR, fumbleR, fumbleL, Lwon, Rwon, flashboth, flashalt, match, Rlose, Llose; 
    wire [3:0] H, sel, ringcount;
    wire [15:0] selectsplit;
    wire [7:0] rnd;
    wire [4:0] timer;
    wire [4:0] usernum;   
    wire [5:0] currentstate;
    
    wire edgeD, slow;
    wire [4:0] timeout;
    wire cheatbtnL;   
    
    //LED_Shifter_Left Left(.clk(clk), .In(sw[15:10]), .Shift(scoredL), .fumble(fumbleL),  .Off(Lwon & timer[0]), .led(led[15:10]), .lastLED(lastledL));
    //LED_Shifter_Right Right(.clk(clk), .In(sw[5:0]), .Shift(scoredR), .fumble(fumbleR), .Off(Rwon & timer[0]), .led(led[5:0]), .lastLED(lastledR));

    wire [5:0] reversed;
    assign reversed = {led[10], led[11], led[12], led[13], led[14], led[15]};
    LED_Shifter
    
    assign cheatbtnL = (~sw[15] & syncbtnR) | (sw[15] & syncbtnL);
    // State Machine Initialization
    State_Machine oogabooga(.clk(clk),.go(syncbtnC),.stopR(cheatbtnL),.stopL(syncbtnL),.foursecs(foursecs),.twosecs(twosecs),.match(match),.lastledR(lastledR),
                            .lastledL(lastledL),.shownum(shownum),.resettimer(resettimer),.rungame(rungame),.scoredR(scoredR),.scoredL(scoredL), .fumbleR(fumbleR), .fumbleL(fumbleL), 
                            .Rwon(Rwon), .Lwon(Lwon),.flashboth(flashboth),.flashalt(flashalt), .currentstate(currentstate));   

    qsec_clks slowit (.clkin(clkin), .greset(btnU), .clk(clk), .digsel(digsel), .qsec(qsec));
    RingCounter ringcounter(.clk(clk), .Advance(digsel), .Q(ringcount));
    assign selectsplit[15:8] = rnd[4:0];
    assign selectsplit[7:0] = usernum;
    selector select(.N(selectsplit), .sel(ringcount), .H(H));
    hex7seg hex(.n(H), .seg(seg));
    
    countUD5L Game_Counter(.clk(clk), .UD(1'b1), .LD(resettimer), .CE(slow & rungame), .Din({5{1'b1}}), .Q(usernum));
    countUD5L Time_Counter(.clk(clk), .UD(1'b0), .LD(currentstate[0] | currentstate[2]), .CE(qsec), .Din({5{1'b0}}), .Q(timer)); 

    LFSR LF_Shift (.clk(clk), .run(currentstate[0]), .rnd(rnd)); 

    assign match = ~|(rnd[4:0] ^ usernum);
    assign twosecs = ~|(timer ^ 5'b01000);
    assign foursecs = ~|(timer ^ 5'b10000);
    
    // SyncBTN Logic
    FDRE #(.INIT(1'b0)) syncBTNL (.C(clk), .R(1'b0), .CE(1'b1), .D(btnL), .Q(syncbtnL));
    FDRE #(.INIT(1'b0)) syncBTNU (.C(clk), .R(1'b0), .CE(1'b1), .D(btnU), .Q(syncbtnU));
    FDRE #(.INIT(1'b0)) syncBTNC (.C(clk), .R(1'b0), .CE(1'b1), .D(btnC), .Q(syncbtnC));
    FDRE #(.INIT(1'b0)) syncBTNR (.C(clk), .R(1'b0), .CE(1'b1), .D(btnR), .Q(syncbtnR));

    //Anode Logic
    assign an[0] = (~ringcount[0]) | (flashalt & timer[0] | flashboth & timer[0]);
    assign an[1] = (~ringcount[1]) | (flashalt & timer[0] | flashboth & timer[0]);
    assign an[2] = (~ringcount[2]) | (flashalt & ~timer[0] | flashboth & timer[0]) | (~shownum); 
    assign an[3] = (~ringcount[3]) | (flashalt & ~timer[0] | flashboth & timer[0]) | (~shownum); 
    
    

    Time_Counter_2 timer2 (.clk(clk), .UD(1'b0), .LD(1'b0), .Din({5{1'b0}}), .CE(qsec), .Q(timeout));
 	Edge_Detector edgeDetect(.btnU(timeout[1]), .clk(clk), .Q(edgeD));
 	assign slow = ~sw[14]&qsec | sw[14]&edgeD;
endmodule
