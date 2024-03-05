`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/05/2024 03:09:06 AM
// Design Name: 
// Module Name: Game_SM
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


module Game_SM(
    input btnC, btnU, in_mid, no_energy, clk, passed_bus,
    output gameover, crash, flash_yellow, flash_purple, score,
    output [3:0] currentstate
    );
    
    wire idle, playingstate, immortalstate, deathstate;
    wire next_idle, next_playingstate, next_immortalstate, next_deathstate;
    wire [3:0] NS;
    
    assign idle = currentstate[0];
    assign playingstate = currentstate[1];
    assign immortalstate = currentstate[2];
    assign deathstate = currentstate[3];
    
    assign NS[0] = next_idle;
    assign NS[1] = next_playingstate;
    assign NS[2] = next_immortalstate;
    assign NS[3] = next_deathstate;
    
    assign next_idle = ~btnC;
    assign next_playingstate = (idle & btnC) | (~gameover & ~btnU & playingstate) | (no_energy & immortalstate);
    assign next_immortalstate = (immortalstate & ~no_energy) | (playingstate & btnU & in_mid);
    assign next_deathstate = (crash & playingstate) | (gameover & deathstate);
    
    assign gameover = currentstate[3];
    assign flash_yellow = currentstate[3];
    assign flash_purple = currentstate[2];
    assign score = (currentstate[1] | currentstate[2]) & passed_bus;
    
    FDRE #(.INIT(1'b1)) Initial(.C(clk), .CE(1'b1), .D(NS[0]), .Q(currentstate[0]));
    FDRE #(.INIT(1'b0)) FF[3:1](.C({3{clk}}), .CE({3{1'b1}}), .D(NS[3:1]), .Q(currentstate[3:1]));

    
    
endmodule
