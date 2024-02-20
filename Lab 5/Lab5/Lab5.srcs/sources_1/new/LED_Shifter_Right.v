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
    input fumble,
    input [5:0] Off,
    input clk,
    output [5:0] led,
    output lastLED
    );
    
    wire [5:0] o, b, out;
    wire [5:0] rsplit;
    
//    assign b[0] = Shift;
    assign b[0] = (fumble) ? 1'b0 : (Shift) ? 1'b1 : Shift;
    assign b[4:1] = led[4:0];
    mux_6 mux1(.a(b), .b(In), .sel(LD), .out(o));
    mux_6 mux2(.a(out), .b({6{1'b0}}), .sel(Off), .out(led));  // win condition
    
    FDRE #(.INIT(1'b1)) ff_0 (.C(clk), .R(1'b0), .CE(Shift | fumble), .D(o[0]), .Q(out[0]));
    FDRE #(.INIT(1'b1)) ff_1 (.C(clk), .R(1'b0), .CE(Shift | fumble), .D(o[1]), .Q(out[1]));
    FDRE #(.INIT(1'b1)) ff_2 (.C(clk), .R(1'b0), .CE(Shift | fumble), .D(o[2]), .Q(out[2]));
    FDRE #(.INIT(1'b0)) ff_3 (.C(clk), .R(1'b0), .CE(Shift | fumble), .D(o[3]), .Q(out[3]));
    FDRE #(.INIT(1'b0)) ff_4 (.C(clk), .R(1'b0), .CE(Shift | fumble), .D(o[4]), .Q(out[4]));
    FDRE #(.INIT(1'b0)) ff_5 (.C(clk), .R(1'b0), .CE(Shift | fumble), .D(o[5]), .Q(out[5]));

//    assign rsplit[5] = ~fumble;
//    assign rsplit[4:0] = led[5:1];
    
    
    
    assign lastLED = &out; // if all bits in out are 1 then lastled is 1 else 0

endmodule
