`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/13/2024 05:00:41 PM
// Design Name: 
// Module Name: Flipp_LED
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


module Flipp_LED(
    input clk,
    input CE,
    input play1,
    input play2,
    input Off,
    input [15:0] code,
    output [15:0] led,
    output LastLED,
    output loss,
    output zero,
    output dp
    );
    wire LastLEDR, LastLEDL, zeroR, zeroL;
    wire [15:0] lightholder;
    assign LastLED = LastLEDR | LastLEDL;
    assign zero = zeroR | zeroL;
    assign loss = zeroR & zeroL;
    //assign led[9]= zero;
    //assign led[7] = LastLED;
    //assign led[8] = Off;
    FDRE # (.INIT(1'b1)) ff_0 (.C(clk), .R(1'b0), .CE(CE & play2), .D(code[0]), .Q(lightholder[0]));
    FDRE # (.INIT(1'b1)) ff_1 (.C(clk), .R(1'b0), .CE(CE & play2), .D(code[1]), .Q(lightholder[1]));
    FDRE # (.INIT(1'b1)) ff_2 (.C(clk), .R(1'b0), .CE(CE & play2), .D(code[2]), .Q(lightholder[2]));
    FDRE # (.INIT(1'b0)) ff_3 (.C(clk), .R(1'b0), .CE(CE & play2), .D(code[3]), .Q(lightholder[3]));
    FDRE # (.INIT(1'b0)) ff_4 (.C(clk), .R(1'b0), .CE(CE & play2), .D(code[4]), .Q(lightholder[4]));
    FDRE # (.INIT(1'b0)) ff_5 (.C(clk), .R(1'b0), .CE(CE & play2), .D(code[5]), .Q(lightholder[5]));

    assign LastLEDR = lightholder[5] ;
    assign zeroR = ~lightholder[15];
    mux M2 (.i0(lightholder[5:0]), .i1({6{1'b0}}), .sel((Off & LastLEDR) | (Off & zeroR)), .j(led[5:0]));

    FDRE # (.INIT(1'b0)) ff_10 (.C(clk), .R(1'b0), .CE(CE & play1), .D(code[10]), .Q(lightholder[10]));
    FDRE # (.INIT(1'b0)) ff_11 (.C(clk), .R(1'b0), .CE(CE & play1), .D(code[11]), .Q(lightholder[11]));
    FDRE # (.INIT(1'b0)) ff_12 (.C(clk), .R(1'b0), .CE(CE & play1), .D(code[12]), .Q(lightholder[12]));
    FDRE # (.INIT(1'b1)) ff_13 (.C(clk), .R(1'b0), .CE(CE & play1), .D(code[13]), .Q(lightholder[13]));
    FDRE # (.INIT(1'b1)) ff_14 (.C(clk), .R(1'b0), .CE(CE & play1), .D(code[14]), .Q(lightholder[14]));
    FDRE # (.INIT(1'b1)) ff_15 (.C(clk), .R(1'b0), .CE(CE & play1), .D(code[15]), .Q(lightholder[15]));

    assign LastLEDL = lightholder[10] ;
    assign zeroL = ~lightholder[0];
    mux M1 (.i0(lightholder[15:10]), .i1({6{1'b0}}), .sel((Off & LastLEDL) | (Off & zeroL)), .j(led[15:10]));
    

endmodule
