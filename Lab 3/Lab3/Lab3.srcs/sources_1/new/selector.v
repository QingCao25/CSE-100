`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/22/2024 06:57:55 PM
// Design Name: 
// Module Name: selector
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


module selector(
    input [15:0] N,
    input [3:0] sel, 
    output [3:0] H
    );
    
    assign H[3] = (sel[3]&N[15]) | (sel[2]&N[11]) | (sel[1]&N[7]) | (sel[0]&N[3]);
    assign H[2] = (sel[3]&N[14]) | (sel[2]&N[10]) | (sel[1]&N[6]) | (sel[0]&N[2]);
    assign H[1] = (sel[3]&N[13]) | (sel[2]&N[9]) | (sel[1]&N[5]) | (sel[0]&N[1]);
    assign H[0] = (sel[3]&N[12]) | (sel[2]&N[8]) | (sel[1]&N[4]) | (sel[0]&N[0]);    
endmodule



//15 14 13 12 
//11 10 9 8 
//7 6 5 4 
//3 2 1 0