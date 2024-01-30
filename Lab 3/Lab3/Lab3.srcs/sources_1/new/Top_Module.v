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
        
    FDRE #(.INIT(1'b0)) ff_CE (.C(clk), .CE(1'b1), .D(range & btnC), .Q(CE_Input));
    FDRE #(.INIT(1'b0)) ff_UD (.C(clk), .CE(1'b1), .D(sw[0]), .Q(UD_Input));
    FDRE #(.INIT(1'b0)) ff_LD (.C(clk), .CE(1'b1), .D(btnL), .Q(LD_Input));
    
    wire btnC_inc, btnU_inc, btnC_dec, btnU_dec;
    assign btnC_inc = ~range & sw[0];
    assign btnU_inc = sw[0] & btnU;
    assign btnC_dec = ~range & btnC & ~sw[0];
    assign btnU_dec = ~sw[0] & btnU;
    
    
//    EdgeDetector edgeUP (.btnU(btnU), .sw(~sw[0] & 1), .clk(clk), .Q(up));
//    EdgeDetector edgeDOWN (.btnU(btnU), .sw(sw[0] & 1), .clk(clk), .Q(down));
    Edge increment (.clk(clk), .in(btnC_inc | btnU_inc), .out(up));
    Edge decrement (.clk(clk),.in(btnC_dec | btnU_dec), .out(down));
        
        
//    countUD15L count15 (.clk(clk), .Up(upin), .Dw(down), .LD(btnL), .Din(sw[15:1]), .Q(Q[14:0]), .UTC(utc), .DTC(dtc));
    countUD15L count15(.clk(clk), .UD(sw[0] ^ ~sw[0]), .CE(CE_Input | edgeOutput), .LD(LD_Input), .Din(sw[15:1]), .Q(counterOut), .UTC(UTCout), .DTC(DTCout));
 
 
    RingCounter count1(.clk(clk), .Advance(digsel), .Q(anOut));
    selector select(.N(counterOut[14:0]), .sel(anOut), .H(H[3:0]));
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
    
//    wire [14:0]Q;
//    wire [3:0]outputans;
//    wire [3:0]h;
//    wire up, down, al_wup, digsel, clk, utc, dtc, upin;

//    assign al_wup = btnC & ~(Q[14]&Q[13]&Q[12]&Q[11]&Q[10]&Q[9]&Q[8]&Q[7]&Q[6]&Q[5]&Q[4]&Q[3]&Q[2]);
//    assign upin = al_wup | up;




endmodule
