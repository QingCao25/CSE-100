`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/27/2024 11:58:04 AM
// Design Name: 
// Module Name: Syncs
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


module Syncs(
    input clk, 
    output hsync, vsync, frame, half_frame,
    output [14:0] h, v
    );
    
    
    
    assign hsync = ~((h >= 10'd655) & (h <= 10'd750)); 
    assign vsync = ~((v >= 10'd489) & (v <= 10'd490));
    
    assign frame = (h== 639) & (v == 479); // goes 1 everytime 1 frame of the screen is displayed
    assign half_frame = (v == 312) & (h == 232); // goes 1 evertime 1/2 frame of the screen is displayed -> used to increase slug speed 
    
    
    
    countUD15L hcounter (.clk(clk), .UD(1'b1), .CE(1'b1), .LD(h == 15'd799), .Din(15'b0), .Q(h)); //counts from 0-799 and then resets
    countUD15L vcounter (.clk(clk), .UD(h == 15'd799), .CE(h == 15'd799), .LD(v == 15'd524), .Din(15'b0), .Q(v)); //counts from 0-524 and then resets
    
    
endmodule
