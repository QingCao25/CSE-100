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
    input [14:0] h, v,
    output slug
    );
    
    assign slug = ((h > 360) & (h < 376)) & ((v > 312) & (v < 328));
    
endmodule
