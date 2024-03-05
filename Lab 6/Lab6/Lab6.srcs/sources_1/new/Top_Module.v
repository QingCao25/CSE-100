`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/27/2024 11:54:08 AM
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
    input btnC, btnR, btnL, btnU, btnD, clkin,
    input [15:0] sw, led,
    output [3:0] vgaRed, vgaGreen, vgaBlue, 
    output [3:0] an,
    output [6:0] seg,
    output dp,
    output Hsync, Vsync
    );
    
    wire digsel, ringcount, H;
    wire [14:0] h, v;
    wire clk;
    wire border, energy, player, frame, half_frame, busL, busM, busR;
    
    
        
    assign seg[6:0] = 0;
    assign dp = 0;
   
//   Game_SM StateMachine 
   
        
    Syncs sync (.clk(clk), .hsync(Hsync), .vsync(Vsync), .h(h), .v(v), .frame(frame), .half_frame(half_frame));
    labVGA_clks not_so_slow (.clkin(clkin), .greset(btnD), .clk(clk), .digsel(digsel));
    Color color (.h(h), .v(v), .vgaRed(vgaRed), .vgaBlue(vgaBlue),.vgaGreen(vgaGreen), 
                .border(border), .energy(energy), .slug(player), 
                .busL(busL), .busM(busM), .busR(busR));
    
    Frame Border(.h(h), .v(v), .border(border));
    Energy engry (.h(h), .v(v), .clk(clk), .btnU(btnU), .energy(energy), .frame(frame));
    Slug SLUGS(.h(h), .v(v), .clk(clk), .btnR(btnR), .btnL(btnL), .slug(player), .frame(frame), .half_frame(half_frame));
    
    
    Bus BUS_Left(.h(h), .v(v), .bus(busR), .shift(15'd0)); // Generates the far left bus with a shift of 0 to the right
    Bus BUS_Mid(.h(h), .v(v), .bus(busM), .shift(15'd70)); // Generates the mid bus with a shift of XX to the right
    Bus BUS_Right(.h(h), .v(v), .bus(busL), .shift(15'd140)); // Generates the left bus with a shift of XX to the right 

    
//    RingCounter ringcounter(.clk(clk), .Advance(digsel), .Q(ringcount));
//    selector select(.N(), .sel(ringcount), .H(H));
//    hex7seg hex(.n(H), .seg(seg));

    assign an[3] = 1;
    assign an[2] = 1;
    assign an[1] = 0;
    assign an[0] = 0;
endmodule
