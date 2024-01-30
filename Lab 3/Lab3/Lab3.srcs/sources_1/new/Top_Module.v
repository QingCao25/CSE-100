`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/22/2024 06:02:31 PM
// Design Name: 
// Module Name: Top_Module
// Project Name: 
// Target Devices: 
// Tool Versions: escription: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Top_Module(
    input clkin,
    input btnR,
    input btnU,
    input btnC,
    input btnL,
    input [15:0] sw,
    
    output [6:0] seg,
    output dp,
    output [3:0] an,
    output [15:0] led
    );
    
    wire edgeOutput, CE_Input;
    wire digsel, clk;
    wire [3:0] sel, H;
    wire UD_Input, LD_Input;
    wire [14:0] counterOut;
    wire range;
    wire [3:0] anOut;
    wire UTCout, DTCout;
    wire up, down;
    assign range = &counterOut[14:2];
    

    
    RingCounter count1(.clk(clk), .Advance(digsel), .Q(anOut));
    FDRE #(.INIT(1'b0)) ff_CE (.C(clk), .CE(1'b1), .D(range & btnC), .Q(CE_Input));
    
    FDRE #(.INIT(1'b0)) ff_UD (.C(clk), .CE(1'b1), .D(sw[0]), .Q(UD_Input));
    FDRE #(.INIT(1'b0)) ff_LD (.C(clk), .CE(1'b1), .D(btnL), .Q(LD_Input));
    
    countUD15L count15(.clk(clk), .UD(UD_Input), .CE(CE_Input | edgeOutput), .LD(LD_Input), .Din(sw[15:1]), .Q(counterOut), .UTC(UTCout), .DTC(DTCout));
    selector select(.N(counterOut), .sel(anOut), .H(H[3:0]));
    hex7seg hex(.n(H[3:0]), .seg(seg[6:0]));
    
    labCnt_clks slowit (.clkin(clkin), .greset(btnR), .clk(clk), .digsel(digsel));

    
    assign dp = 1'b1;
    assign led[15] = UTCout;
    assign led[0] = DTCout;
    assign led[14:1] = {14'b0};
    assign an[3] = ~anOut[3];
    assign an[2] = ~anOut[2];
    assign an[1] = ~anOut[1];
    assign an[0] = ~anOut[0];
endmodule
