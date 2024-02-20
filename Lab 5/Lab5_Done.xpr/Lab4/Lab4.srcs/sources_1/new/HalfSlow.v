`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/14/2024 08:03:14 PM
// Design Name: 
// Module Name: HalfSlow
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


module HalfSlow(
    input advance,
    output [1:0] code
    
    );
    //Adding a led for player 2 (RIGHT)
    wire [1:0]  split; 
    assign split[0] = advance;
    assign split[1] = code[0];
    assign code = split;
    
    assign code[0] = ~((&code)&1'b1);
endmodule
