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
    input border,
    input [14:0] h, v,
    output [3:0] vgaRed, vgaGreen, vgaBlue
    );
    
    wire [3:0] active; 
    
    assign active = {4{((h < 639) & (v < 479))}};
    
    assign vgaRed = 4'b1111 & active & {4{border}};
    assign vgaGreen = 4'b1111 & active & {4{border}};
    assign vgaBlue= 4'b1111 & active & {4{border}};
    

endmodule
