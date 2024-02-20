`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/04/2024 011:05:47 AM
// Design Name: 
// Module Name: LSFR
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


module LFSR(
    input clk,
    input run,
    output [7:0] Q
    );
    
    wire [7:0] boss;
     
    assign Q[6:0] = boss[6:0]; 
    FDRE #(.INIT(1'b1) ) ff_0 (.C(clk), .R(1'b0), .CE(run), .D(boss[0]^boss[5]^boss[6]^boss[7]), .Q(boss[0]));
    FDRE #(.INIT(1'b0) ) ff_1 (.C(clk), .R(1'b0), .CE(run), .D(Q[0]), .Q(Q[1]));
    FDRE #(.INIT(1'b0) ) ff_2 (.C(clk), .R(1'b0), .CE(run), .D(Q[1]), .Q(Q[2]));
    FDRE #(.INIT(1'b0) ) ff_3 (.C(clk), .R(1'b0), .CE(run), .D(Q[2]), .Q(Q[3]));
    FDRE #(.INIT(1'b0) ) ff_4 (.C(clk), .R(1'b0), .CE(run), .D(Q[3]), .Q(Q[4]));
    FDRE #(.INIT(1'b0) ) ff_5 (.C(clk), .R(1'b0), .CE(run), .D(Q[4]), .Q(Q[5]));
    FDRE #(.INIT(1'b0) ) ff_6 (.C(clk), .R(1'b0), .CE(run), .D(Q[5]), .Q(Q[6]));
    assign Q[7] = 1'b0;
    FDRE #(.INIT(1'b0) ) ff_7 (.C(clk), .R(1'b0), .CE(run), .D(Q[6]), .Q(Q[7]));


    
endmodule

