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
    output shownum, resettimer, rungame, scored, won, flashboth, flashalt, 
    output [5:0] currentstate
    );
    
    
    wire idle, roundstart, decrement, roundwin, roundlose, gamewin;
    wire next_idle, next_roundstart, next_decrement, next_roundwin, next_roundlose, next_gamewin;
    wire [5:0] NS;
    
    assign idle = currentstate[0];
    assign roundstart = currentstate[1];
    assign decrement = currentstate[2];
    assign roundlose = currentstate[3];
    assign roundwin = currentstate[4];
    assign gamewin = currentstate[5];
        
    assign NS[0] = next_idle;
    assign NS[1] = next_roundstart;
    assign NS[2] = next_decrement;
    assign NS[3] = next_roundlose;
    assign NS[4] = next_roundwin;
    assign NS[5] = next_gamewin;
    
    
    assign next_idle = (idle & ~go) | (foursecs & roundlose) | (foursecs & roundwin & ~lastled);//
    assign next_roundstart = (roundstart & ~twosecs) | (idle & go);//
    assign next_decrement = (decrement & ~stop) | (roundstart & twosecs);//
    assign next_roundlose = (decrement & ~match & stop) | (roundlose & ~foursecs);//
    assign next_roundwin = (decrement & match & stop) | (roundwin & ~foursecs);//
    assign next_gamewin = (roundwin & lastled & foursecs) | (gamewin); //
    
    assign shownum = currentstate[1] | currentstate[2] | currentstate[3] | currentstate[4] | currentstate[5];//
    assign resettimer = ~currentstate[5] & go;//
    assign rungame = currentstate[2];//
    assign scored = match & ~lastled & currentstate[2] & stop;//
    assign won = currentstate[5];//
    assign flashboth = currentstate[4];//
    assign flashalt = currentstate[3];//
    
    FDRE #(.INIT(1'b1)) Initial(.C(clk), .CE(1'b1), .D(NS[0]), .Q(currentstate[0]));
    FDRE #(.INIT(1'b0)) FF[5:1](.C({5{clk}}), .CE({5{1'b1}}), .D(NS[5:1]), .Q(currentstate[5:1]));
endmodule
