`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/20/2024 01:36:44 AM
// Design Name: 
// Module Name: Edge_Detector
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


module Edge_Detector(
    input btnU, 
    input clk,
    output Q
    );
    wire o1, o2;
    FDRE #(.INIT(1'b0)) FF_0 (.C(clk), .CE(1'b1), .D(btnU), .Q(o1));
    FDRE #(.INIT(1'b0)) FF_1 (.C(clk), .CE(1'b1), .D(o1), .Q(o2));
    
    assign Q = ~o1 & o2;
endmodule
