`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/05/2024 02:38:36 AM
// Design Name: 
// Module Name: Top_Module
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


module Top_Module(
    input clkin, btnR, btnU, btnC, btnL,
    input [15:0] sw,
    output [15:0] led,
    output [3:0] an,
    output [6:0] seg,
    output dp
    );
    
    wire clk;
    wire [3:0] anOut, H, sel;
    wire [15:0] GameCounterOut;
    
    
    
    qsec_clks slowit (.clkin(clkin), .greset(btnR), .clk(clk), .digsel(digsel), .qsec(qsec));
    RingCounter count1(.clk(clk), .Advance(digsel), .Q(anOut));
    selector select(.N({1'b0, GameCounterOut[15:0]}), .sel(anOut), .H(H[3:0]));
    hex7seg hex(.n(H[3:0]), .seg(seg[6:0]));
    
    assign an[3] = ~anOut[3];
    assign an[2] = ~anOut[2];
    assign an[1] = ~anOut[1];
    assign an[0] = ~anOut[0];
endmodule
