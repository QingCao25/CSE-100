`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/08/2024 04:08:27 AM
// Design Name: 
// Module Name: StateMachine_Test
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


module StateMachine_Test();
    reg clk, go, stop, foursecs, twosecs, match, lastled;
    wire shownum, resettimer, rungame, scored, won, flashboth, flashalt;
    
    State_Machine UUT(
    .clk(clk),
    .go(go),
    .stop(stop),
    .foursecs(foursecs),
    .twosecs(twosecs),
    .match(match),
    .lastled(lastled),
    .shownum(shownum),
    .resettimer(resettimer),
    .rungame(rungame),
    .scored(scored),
    .won(won),
    .flashboth(flashboth),
    .flashalt(flashalt)
    );
    
    // create an oscillating signal to impersonate the clock provided on the BASYS 3 board
    parameter PERIOD = 10;
    parameter real DUTY_CYCLE = 0.5;
    parameter OFFSET = 2;

    initial    // Clock process for clkin
    begin
        #OFFSET
		  clk = 1'b1;
        forever
        begin
            #(PERIOD-(PERIOD*DUTY_CYCLE)) clk = ~clk;
        end
    end
    
    initial 
    begin
    go=1'b0;
    stop=1'b0;
    foursecs=1'b0;
    twosecs=1'b0;
    match=1'b0;
    lastled=1'b0;
    #2000;
    go=1'b1;
    #2000;
    go=1'b0;
    #2000;
    twosecs=1'b1;
    #500;
    stop=1'b1;

    
    
      
    end
    
    
endmodule
