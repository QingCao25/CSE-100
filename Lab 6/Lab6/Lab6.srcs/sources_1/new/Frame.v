`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/27/2024 09:32:08 PM
// Design Name: 
// Module Name: Frame
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


module Frame(
    input [14:0] h, v,
    output border
    ); 
    
    assign border = ((h < 8) | (h > 631)) | ((v < 8) | (v > 471));
endmodule
