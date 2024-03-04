`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/21/2024 02:17:52 AM
// Design Name: 
// Module Name: FLIP_FLOPS
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


module FLIP_FLOPS(
    input clk,
    input CE,
    input stopL,
    input stopR,
    input Off,
    input [15:0] Out,
    output [15:0] led,
    output lastled,
    output loss,
    output zero,
    output dp
    );
    wire lastledR, lastledL, zeroR, zeroL;
    wire [15:0] lightholder;
    assign lastled = lastledR | lastledL;
    assign zero = zeroR | zeroL;
    assign loss = zeroR & zeroL;
    assign lastledR = lightholder[5];
    assign zeroR = ~lightholder[15];
    assign lastledL = lightholder[10];
    assign zeroL = ~lightholder[0];  
   
    mux_6 M2 (.a(lightholder[5:0]), .b({6{1'b0}}), .sel((Off & lastledR) | (Off & zeroR)), .out(led[5:0]));
    mux_6 M1 (.a(lightholder[15:10]), .b({6{1'b0}}), .sel((Off & lastledL) | (Off & zeroL)), .out(led[15:10]));

    FDRE # (.INIT(1'b1)) ff_0 (.C(clk), .R(1'b0), .CE(CE & stopR), .D(Out[0]), .Q(lightholder[0]));
    FDRE # (.INIT(1'b1)) ff_1 (.C(clk), .R(1'b0), .CE(CE & stopR), .D(Out[1]), .Q(lightholder[1]));
    FDRE # (.INIT(1'b1)) ff_2 (.C(clk), .R(1'b0), .CE(CE & stopR), .D(Out[2]), .Q(lightholder[2]));
    FDRE # (.INIT(1'b0)) ff_3 (.C(clk), .R(1'b0), .CE(CE & stopR), .D(Out[3]), .Q(lightholder[3]));
    FDRE # (.INIT(1'b0)) ff_4 (.C(clk), .R(1'b0), .CE(CE & stopR), .D(Out[4]), .Q(lightholder[4]));
    FDRE # (.INIT(1'b0)) ff_5 (.C(clk), .R(1'b0), .CE(CE & stopR), .D(Out[5]), .Q(lightholder[5]));
    FDRE # (.INIT(1'b0)) ff_10 (.C(clk), .R(1'b0), .CE(CE & stopL), .D(Out[10]), .Q(lightholder[10]));
    FDRE # (.INIT(1'b0)) ff_11 (.C(clk), .R(1'b0), .CE(CE & stopL), .D(Out[11]), .Q(lightholder[11]));
    FDRE # (.INIT(1'b0)) ff_12 (.C(clk), .R(1'b0), .CE(CE & stopL), .D(Out[12]), .Q(lightholder[12]));
    FDRE # (.INIT(1'b1)) ff_13 (.C(clk), .R(1'b0), .CE(CE & stopL), .D(Out[13]), .Q(lightholder[13]));
    FDRE # (.INIT(1'b1)) ff_14 (.C(clk), .R(1'b0), .CE(CE & stopL), .D(Out[14]), .Q(lightholder[14]));
    FDRE # (.INIT(1'b1)) ff_15 (.C(clk), .R(1'b0), .CE(CE & stopL), .D(Out[15]), .Q(lightholder[15]));
endmodule
