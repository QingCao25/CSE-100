`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/05/2024 01:36:48 PM
// Design Name: 
// Module Name: Selector
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

module Selector(
    input [3:0]sel,
    input [15:0]N,
    output [3:0]h
    );
    wire [3:0]selt;
    assign selt[0] = sel[0] & (~sel[1] & ~sel[2] & ~sel[3]);
    assign selt[1] = sel[1] & (~sel[0] & ~sel[2] & ~sel[3]);
    assign selt[2] = sel[2] & (~sel[0] & ~sel[1] & ~sel[3]);
    assign selt[3] = sel[3] & (~sel[0] & ~sel[1] & ~sel[2]);
    
    assign h[0] = selt[0]&N[0] | selt[1]&N[4] | selt[2]&N[8] | selt[3]&N[12];
    assign h[1] = selt[0]&N[1] | selt[1]&N[5] | selt[2]&N[9] | selt[3]&N[13];
    assign h[2] = selt[0]&N[2] | selt[1]&N[6] | selt[2]&N[10] | selt[3]&N[14];
    assign h[3] = selt[0]&N[3] | selt[1]&N[7] | selt[2]&N[11] | selt[3]&N[15];
endmodule

