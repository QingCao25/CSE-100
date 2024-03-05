`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/04/2024 01:36:18 AM
// Design Name: 
// Module Name: Bus
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


module Bus(
    input [14:0] h, v, shift,
    output bus
    );
    
    assign bus = ((h > (208 + shift)) & (h < (268 + shift))) & (v < 50);
    
    wire [14:0] bustop, busbot;
    
    assign bustop = 0;
    assign busbot = 60;
    
endmodule
