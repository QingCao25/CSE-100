`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/13/2024 02:01:15 AM
// Design Name: 
// Module Name: Miss_LED
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


module Miss_LED(
    input MisR,
    input MisL,
    input Off,
    input [15:0] take_in,
    output [15:0] code
    );
    //Removing a led for player 1 (LEFT)
    wire [5:0]  split, vOut;
    assign split[0] = ~MisL;
    assign split[5:1] = take_in[14:10];
    assign split = code[15:10];
        
    //REMOVING a led for player 2 (RIGHT)
    wire [5:0] lsplit, lOut;
    assign lsplit[5] = ~MisR;
    assign lsplit[4:0] = take_in[5:1];
    assign lsplit = code[6:0];
       
   
endmodule
