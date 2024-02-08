`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/05/2024 02:38:16 AM
// Design Name: 
// Module Name: State_Machine
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

   
module State_Machine(
    input go, stop, foursecs, twosecs, match, lastled, clk,
    output shownum, resettimer, rungame, scored, won, flashboth, flashalt
    );
    
    
    wire idle, roundstart, decrement, roundwin, roundlose, gamewin;
    wire next_idle, next_roundstart, next_decrement, next_roundwin, next_roundlose, next_gamewin;
    wire [5:0] NS, PS;
    
    assign idle = PS[0];
    assign roundstart = PS[1];
    assign decrement = PS[2];
    assign roundwin = PS[3];
    assign roundlose = PS[4];
    assign gamewin = PS[5];
    
    assign idle = idle;
    
    assign NS[0] = next_idle;
    assign NS[1] = next_roundstart;
    assign NS[2] = next_decrement;
    assign NS[3] = next_roundwin;
    assign NS[4] = next_roundlose;
    assign NS[5] = next_gamewin;
    
    // Haven't done btnL yet don't know how that is implemented
    assign next_idle = (idle & ~go) | (foursecs & roundlose) | ((foursecs ^ lastled) & roundwin) | (gamewin & ~scored); // Round Win is def not right T-T //scored & gamewin to determine someone hit button R
    assign next_roundstart = (roundstart & ~twosecs) | (idle & go);
    assign next_decrement = (decrement & ~stop) | (roundstart & twosecs);
    assign next_roundlose = (decrement & ~match & stop) | (roundlose & ~foursecs);
    assign next_roundwin = (decrement & match & stop) | (roundwin & ~foursecs);
    assign next_gamewin = (roundwin & lastled & foursecs);
    
    assign shownum = roundstart | roundwin | roundlose;
    assign resettimer = (roundstart & twosecs) | (idle & go) | (decrement & stop);
    //assign rungame = // OOGA BOOGA WHAT THE FLIPPITY DOG HORSE VEGETABLE IS RUN GAME
    assign scored = next_roundwin & ~roundwin;
    assign won = lastled & gamewin & foursecs;
    assign flashboth = roundwin & ~foursecs;
    assign flashalt = roundlose & ~foursecs;
    
    FDRE #(.INIT(1'b1)) Initial(.C(clk), .CE(1'b1), .D(NS[0]), .Q(PS[0]));
    FDRE #(.INIT(1'b1)) FF[5:1](.C({5{clk}}), .CE({5{1'b1}}), .D(NS[5:1]), .Q(PS[5:1]));
    
    
    
endmodule
