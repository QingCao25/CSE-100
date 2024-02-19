`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/15/2024 04:13:46 PM
// Design Name: 
// Module Name: LED_Shifter_Right
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


module LED_Shifter_Right(
    input [5:0] In,
    input LD,
    input Shift,
    input [5:0] Off,
    input clk,
    output [5:0] led,
    output lastLED
    );
    
    wire [5:0] o, b, out;
    
    assign b[0] = Shift;
    assign b[5:1] = led[4:0];
    mux_6 mux1(.a(b), .b(In), .sel(LD), .out(o));
    mux_6 mux2(.a(out), .b({6{1'b0}}), .sel(Off), .out(led));  
    
    FDRE #(.INIT(1'b1)) ff_0 (.C(clk), .R(1'b0), .CE(Shift | LD), .D(o[0]), .Q(out[0]));
    FDRE #(.INIT(1'b1)) ff_1 (.C(clk), .R(1'b0), .CE(Shift | LD), .D(o[1]), .Q(out[1]));
    FDRE #(.INIT(1'b1)) ff_2 (.C(clk), .R(1'b0), .CE(Shift | LD), .D(o[2]), .Q(out[2]));
    FDRE #(.INIT(1'b0)) ff_3 (.C(clk), .R(1'b0), .CE(Shift | LD), .D(o[3]), .Q(out[3]));
    FDRE #(.INIT(1'b0)) ff_4 (.C(clk), .R(1'b0), .CE(Shift | LD), .D(o[4]), .Q(out[4]));
    FDRE #(.INIT(1'b0)) ff_5 (.C(clk), .R(1'b0), .CE(Shift | LD), .D(o[5]), .Q(out[5]));
//    FDRE #(.INIT(1'b0)) ff_6 (.C(clk), .R(1'b0), .CE(Shift | LD), .D(o[6]), .Q(out[6]));
//    FDRE #(.INIT(1'b0)) ff_7 (.C(clk), .R(1'b0), .CE(Shift | LD), .D(o[7]), .Q(out[7]));
//    FDRE #(.INIT(1'b0)) ff_8 (.C(clk), .R(1'b0), .CE(Shift | LD), .D(o[8]), .Q(out[8]));
//    FDRE #(.INIT(1'b0)) ff_9 (.C(clk), .R(1'b0), .CE(Shift | LD), .D(o[9]), .Q(out[9]));
//    FDRE #(.INIT(1'b0)) ff_10 (.C(clk), .R(1'b0), .CE(Shift | LD), .D(o[10]), .Q(out[10]));
//    FDRE #(.INIT(1'b0)) ff_11 (.C(clk), .R(1'b0), .CE(Shift | LD), .D(o[11]), .Q(out[11]));
//    FDRE #(.INIT(1'b0)) ff_12 (.C(clk), .R(1'b0), .CE(Shift | LD), .D(o[12]), .Q(out[12]));
//    FDRE #(.INIT(1'b1)) ff_13 (.C(clk), .R(1'b0), .CE(Shift | LD), .D(o[13]), .Q(out[13]));
//    FDRE #(.INIT(1'b1)) ff_14 (.C(clk), .R(1'b0), .CE(Shift | LD), .D(o[14]), .Q(out[14]));
//    FDRE #(.INIT(1'b1)) ff_15 (.C(clk), .R(1'b0), .CE(Shift | LD), .D(o[15]), .Q(out[15]));

    assign lastLED = &out;    

endmodule
