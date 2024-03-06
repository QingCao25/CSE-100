`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/03/2024 07:03:31 PM
// Design Name: 
// Module Name: Slug
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


module Slug(
    input [14:0] h, v, frame, half_frame,
    input btnR, btnL, clk, gameover, gamestart,
    output slug
    );
    wire [14:0] movementR, currenttrack, movementL;
    wire left_transition, left_track, right_transition, right_track;
    wire in_left, in_mid, in_right;

    // define which pixels to turn high
    assign slug = ((h > (currenttrack)) & (h < (currenttrack + 16))) & ((v > 312) & (v < 328));
    
    // defines the current player's location
    assign currenttrack = 300 - movementL + movementR; 
    
    // Goes 1 if the slug is within these bounds -> if the slug is in the left, mid, or right track
    assign in_left = (currenttrack == 230);
    assign in_mid = (currenttrack == 300);
    assign in_right = (currenttrack == 370);    

    // counters to move player left and right
    countUD15L MovementR(.clk(clk), 
                        .UD(right_transition),                       
                        .CE(right_transition & (frame | half_frame) & ~gameover & gamestart),    
                        .LD(10'b0), .Din(15'd0), .Q(movementR));   
    
    countUD15L MovementL(.clk(clk), 
                        .UD(left_transition), 
                        .CE(left_transition & (frame | half_frame) & ~gameover & gamestart),    
                        .LD(10'b0), .Din(15'd0), .Q(movementL));      
                              
    // when a btn is pressed, flip flops hold the signal until player reaches target location and then releases signal
    FDRE #(.INIT(1'b0)) ff_00 (.C(clk), .CE(btnL & ~right_transition), .R(in_left | (in_mid & left_transition)), .D(1'b1), .Q(left_transition));
    FDRE #(.INIT(1'b0)) ff_01 (.C(clk), .CE(btnR & ~left_transition), .R(in_right | (in_mid & right_transition)), .D(1'b1), .Q(right_transition));

endmodule
