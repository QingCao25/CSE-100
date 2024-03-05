`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/27/2024 09:14:48 PM
// Design Name: 
// Module Name: Color
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


module Color(
    input border, energy, slug, busL, busM, busR,
    input [14:0] h, v,
    output [3:0] vgaRed, vgaGreen, vgaBlue
    );
    
    wire [3:0] active; 
    
    assign active = {4{((h < 639) & (v < 479))}};
    
    assign vgaRed = (active & {4{border}}) | (active & {4{slug}});
    assign vgaGreen = (active & {4{border}}) | (active & {4{energy}}) | (active & {4{slug}});
    assign vgaBlue= active & {4{border}} | (active & {4{busL}}) | (active & {4{busM}}) | (active & {4{busR}});
    

endmodule
