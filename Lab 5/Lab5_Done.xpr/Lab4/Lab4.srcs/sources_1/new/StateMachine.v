`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/07/2024 08:28:01 PM
// Design Name: 
// Module Name: StateMachine
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


module StateMachine(
    input Go,//btnC
    input play1,//btnL
    input play2,//btnR
    input FourSecs,
    input TwoSecs,
    input HalfSecs,
    input Match,
    input LastLED,//NEEED
    input zero,
    input loss,
    input clk,
    output ShowNum,
    output ResetTimer,
    output RunGame,
    output Score,
    output Missed,
    output Won,
    output Lost,
    output FlashBoth,
    output FlashAlt,
    output [6:0] PS 
    );
    wire [6:0] NS;
    wire Cout;
    wire INIT, G, D,M, NM, W, L,NEXT_INIT, NEXT_G, NEXT_D, NEXT_NM, NEXT_M, NEXT_W, NEXT_L;
    assign INIT = PS[0];
    assign G = PS[1];
    assign D = PS[2];
    assign NM = PS[3];
    assign M = PS[4];
    assign W = PS[5];
    assign L = PS[6];
    
    
    assign NS[0] = NEXT_INIT;
    assign NS[1] = NEXT_G;
    assign NS[2] = NEXT_D;
    assign NS[3] = NEXT_NM;
    assign NS[4] = NEXT_M;
    assign NS[5] = NEXT_W;
    assign NS[6] = NEXT_L;
    
    assign NEXT_INIT = ~Go&INIT | M&FourSecs&~LastLED | NM&FourSecs&~zero&~loss;//lastled
    assign NEXT_G = (Go & INIT) | (~TwoSecs & G);
    assign NEXT_D = (G&TwoSecs) | (~(play1 | play2)&D);
    assign NEXT_NM = (~FourSecs & NM) | (~Match & (play1 | play2) & D);
    assign NEXT_M = (~FourSecs & M) | (Match & (play1 | play2) & D);
    assign NEXT_W = (LastLED & M & FourSecs) | W | (zero & NM);
    assign NEXT_L = (loss & NM) | L;
    
    FDRE #(.INIT(1'b1)) Q0_FF (.C(clk), .CE(1'b1), .D(NS[0]), .Q(PS[0]));
    FDRE #(.INIT(1'b0)) Q2_FF[6:1] (.C({6{clk}}), .CE({6{1'b1}}), .D(NS[6:1]), .Q(PS[6:1]));
    
    assign ShowNum =  PS[5] | PS[4] | (PS[3]) | (PS[2])  | PS[1]; //Go&PS[0]
    assign RunGame = PS[2];
    assign ResetTimer =  Go & ~PS[5];
    assign Score = (play1 | play2)&Match&~LastLED&PS[2];
    assign Missed = (play1 | play2)&~Match&~LastLED&PS[2];
    assign FlashBoth =  PS[4];
    assign FlashAlt =  PS[3];
    assign Won = PS[5];
    assign Lost = PS[6];
     
endmodule

