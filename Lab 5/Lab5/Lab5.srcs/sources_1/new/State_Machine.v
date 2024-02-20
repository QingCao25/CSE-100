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
    input go, stopR, stopL, foursecs, twosecs, match, lastledR, lastledL, clk,
    output shownum, resettimer, rungame, scoredR, scoredL, fumbleR, fumbleL, Rwon, Lwon, flashboth, flashalt,
    output [5:0] currentstate 
    ); 
    
    
    wire idle, roundstart, decrement, roundwin, roundlose, gamewin;
    wire next_idle, next_roundstart, next_decrement, next_roundwin, next_roundlose, next_gamewin;
    wire [5:0] NS;
    
    wire lastledRout, lastledLout; 
    FDRE #(.INIT(1'b0)) lastWinR(.C(clk), .CE(currentstate[0]), .D(lastledR), .Q(lastledRout));
    FDRE #(.INIT(1'b0)) lastWinL(.C(clk), .CE(currentstate[0]), .D(lastledL), .Q(lastledLout));   

    
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
    
    
    assign next_idle = (idle & ~go) | (foursecs & roundlose) | (foursecs & roundwin & ~lastledRout & ~lastledLout);//
    assign next_roundstart = (roundstart & ~twosecs) | (idle & go);//
    assign next_decrement = (decrement & ~stopR & ~stopL) | (roundstart & twosecs);//
    assign next_roundlose = (decrement & ~match &( stopR | stopL)) | (roundlose & ~foursecs);//
    assign next_roundwin = (decrement & match & (stopR | stopL)) | (roundwin & ~foursecs);//
    assign next_gamewin = (roundwin & (lastledRout | lastledLout) & foursecs) | (gamewin); //
    
    assign shownum = currentstate[1] | currentstate[2] | currentstate[3] | currentstate[4] | currentstate[5];//
    assign resettimer = ~currentstate[5] & go;//
    assign rungame = currentstate[2];//
    assign scoredR = match & ~lastledR & ~lastledL & currentstate[2] & stopR;//
    assign scoredL = match & ~lastledR & ~lastledL & currentstate[2] & stopL; 
    assign fumbleR = currentstate[3] & stopR;
    assign fumbleL = currentstate[3] & stopL;
    assign Rwon = currentstate[5];//
    assign flashboth = currentstate[4];//
    assign flashalt = currentstate[3];//

    
    FDRE #(.INIT(1'b1)) Initial(.C(clk), .CE(1'b1), .D(NS[0]), .Q(currentstate[0]));
    FDRE #(.INIT(1'b0)) FF[5:1](.C({5{clk}}), .CE({5{1'b1}}), .D(NS[5:1]), .Q(currentstate[5:1]));
endmodule
