`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/29/2024 12:42:47 AM
// Design Name: 
// Module Name: countUD15L
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


module countUD15L(
    input clk,
    input UD,
    input CE,
    input LD,
    input [14:0] Din,
    
    output [14:0] Q,
    output UTC,
    output DTC
    );
    
    wire utc1, utc2, utc3, dtc1, dtc2, dtc3;
    countUD5L c1 (.clk(clk), .CE(CE), .UD(UD), .LD(LD), .Din(Din[4:0]), .Q(Q[4:0]), .UTC(utc1), .DTC(dtc1));
    countUD5L c2 (.clk(clk), .CE((CE & ~UD & utc1) | (CE & UD & dtc1)), .UD(UD), .LD(LD), .Din(Din[9:5]), .Q(Q[9:5]), .UTC(utc2), .DTC(dtc2));
    countUD5L c3 (.clk(clk), .CE((CE & ~UD & utc2 & utc1) | (CE & UD & dtc1 & dtc2)), .UD(UD), .LD(LD), .Din(Din[14:10]), .Q(Q[14:10]), .UTC(utc3), .DTC(dtc3));

    assign UTC = utc3 & utc2 & utc1;
    assign DTC = dtc3 & dtc2 & dtc1;
    
endmodule
