`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/05/2024 01:29:51 AM
// Design Name: 
// Module Name: LFSR
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
    output [7:0] rnd
    );
    FDRE #(.INIT(1'b1)) sh_00 (.C(clk), .CE(run), .D(rnd[0] ^ rnd[5] ^ rnd[6] ^ rnd[7]), .Q(rnd[0]));
    FDRE #(.INIT(1'b0)) sh_17[7:1] (.C({7{clk}}), .CE(run), .D(rnd[6:0]), .Q(rnd[7:1]));
    assign rnd[7] = 1'b0;
endmodule
