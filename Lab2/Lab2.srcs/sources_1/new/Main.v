`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/16/2024 01:03:12 AM
// Design Name: 
// Module Name: Main
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


module Main(
    input [15:0] sw,
    input btnU,
    input btnR,
    input clkin,
    output [6:0] seg,
    output [3:0] an,
    output [15:0] led
    );
    
    assign an[3] = 1;
    assign an[2] = 1;
    assign an[1] = 0;
    assign an[0] = 0;
    
    assign sw[15] = led[15];
    assign sw[14] = led[14];
    assign sw[13] = led[13];
    assign sw[12] = led[12];
    assign sw[11] = led[11];
    assign sw[10] = led[10];
    assign sw[9] = led[9];
    assign sw[8] = led[8];
    assign sw[7] = led[7];
    assign sw[6] = led[6];
    assign sw[5] = led[5];
    assign sw[4] = led[4];
    assign sw[3] = led[3];
    assign sw[2] = led[2];
    assign sw[1] = led[1];
    assign sw[0] = led[0];

    hex7seg butt = AddSub8[3:0];
    hex7seg cheeks = AddSub8[7:4];


    
endmodule
