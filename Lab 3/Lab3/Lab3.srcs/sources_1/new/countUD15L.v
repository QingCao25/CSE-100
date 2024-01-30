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
    
//    wire [2:0] UTC_WIRE;
//    wire [2:0] DTC_WIRE;
     
//    countUD5L count1 (.clk(clk), .UD(UD), .CE(CE), .LD(LD), .Din(Din[4:0]), .Q(Q[4:0]), .UTC(UTC_WIRE[2]), .DTC(DTC_WIRE[2]));
//    countUD5L count2 (.clk(clk), .UD(UD), .CE(CE), .LD(LD), .Din(Din[9:5]), .Q(Q[9:5]), .UTC(UTC_WIRE[1]), .DTC(DTC_WIRE[1]));
//    countUD5L count3 (.clk(clk), .UD(UD), .CE(CE), .LD(LD), .Din(Din[14:10]), .Q(Q[14:10]), .UTC(UTC_WIRE[0]), .DTC(DTC_WIRE[0]));

//    assign UTC = UTC_WIRE[2] & UTC_WIRE[1] & UTC_WIRE[0];
//    assign DTC = DTC_WIRE[2] & DTC_WIRE[1] & DTC_WIRE[0];
    
    wire utc1, utc2, utc3, dtc1, dtc2, dtc3;
    countUD5L c1 (.clk(clk), .CE(CE), .UD(UD), .LD(LD), .Din(Din[4:0]), .Q(Q[4:0]), .UTC(utc1), .DTC(dtc1));
    countUD5L c2 (.clk(clk), .CE(CE & utc1), .UD(UD & dtc1), .LD(LD), .Din(Din[9:5]), .Q(Q[9:5]), .UTC(utc2), .DTC(dtc2));
    countUD5L c3 (.clk(clk), .CE(CE & utc2 & utc1), .UD(UD & dtc1 & dtc2), .LD(LD), .Din(Din[14:10]), .Q(Q[14:10]), .UTC(utc3), .DTC(dtc3));

    assign UTC = utc3 & utc2 & utc1;
    assign DTC = dtc3 & dtc2 & dtc1;
    
endmodule
