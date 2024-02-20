`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/15/2024 04:33:15 PM
// Design Name: 
// Module Name: EdgeDetector
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


module EdgeDetector(
    input btnU,
    //input sw,
    input clk,
    output Q
    );
    wire out1, out2;
    FDRE #(.INIT(1'b0)) FF_0 (.C(clk), .CE(1'b1), .D(btnU), .Q(out1));
    FDRE #(.INIT(1'b0)) FF_1 (.C(clk), .CE(1'b1), .D(out1), .Q(out2));
    
    //assign Q = ~out1 & btnU & sw;
    assign Q = ~out1 & out2;
endmodule
