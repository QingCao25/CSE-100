`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/05/2024 02:53:43 AM
// Design Name: 
// Module Name: LED_Shifter
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


module LED_Shifter(
    input [15:0] sw,
    input LD,
    input Shift,
    input Off,
    input clk,
    output [15:0] led,
    output lastLED
    );
    
    assign led = ~(Off & 1'b1);
     
endmodule
