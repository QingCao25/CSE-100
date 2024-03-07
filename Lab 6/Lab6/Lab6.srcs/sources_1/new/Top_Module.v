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
    
    wire digsel, ringcount;
    wire [14:0] h, v;
    wire clk;
    wire border, energy, player, frame, half_frame;
    
    wire busL, busM, busR;
    wire busL_2, busM_2, busR_2; 
    wire Start_L_2, Start_M_2, Start_R_2; // Determines start time of 2nd set of busses


    wire no_energy, gameover, crash, died, immortal, gamestart; // Sudo States
    wire [14:0] scoreR, scoreM, scoreL, scoreR_2, scoreM_2, scoreL_2, totalscore, Bus_Start;
    wire [14:0] currentV_R, currentV_M, currentV_L;
    wire [3:0] anOut, H;
    wire Bus_Right_Begin, Bus_Mid_Begin;
    wire in_mid_check;
    
    assign dp = 1;
    assign crash = player & (busM | busR | busL | busM_2 | busR_2 | busL_2) & ~immortal & ~sw[3]; // detects if player crashed into bus if immortal isn't on
    assign immortal = btnU & ~no_energy & in_mid_check; // detects if player is immortal based on if there's still energy, if player is in the mid lane, and if btnU is pressed
    
   
    Syncs sync (.clk(clk), .hsync(Hsync), .vsync(Vsync), .h(h), .v(v), .frame(frame), .half_frame(half_frame)); // hsync and vsync
    labVGA_clks not_so_slow (.clkin(clkin), .greset(btnD), .clk(clk), .digsel(digsel)); // wtf is this
    
    // Let there be color
    Color color (.h(h), .v(v), .vgaRed(vgaRed), .vgaBlue(vgaBlue),.vgaGreen(vgaGreen), 
                .border(border), .energy(energy), .slug(player), 
                .busL(busL), .busM(busM), .busR(busR), .gameover(gameover),
                .clk(clk), .frame(frame), .immortal(immortal), .no_energy(no_energy), .gamestart(gamestart),
                .busL_2(busL_2), .busM_2(busM_2), .busR_2(busR_2));
    
    // Instatiate modules for frame, energybar, and slug
    Frame Border(.h(h), .v(v), .border(border));
    Energy engry (.h(h), .v(v), .clk(clk), .btnU(btnU), .energy(energy), .no_energy(no_energy), .frame(frame), .gameover(gameover), .gamestart(gamestart), .immortal(immortal));
    Slug SLUGS(.h(h), .v(v), .clk(clk), .btnR(btnR), .btnL(btnL), .slug(player), .frame(frame), .half_frame(half_frame), .gameover(gameover), .gamestart(gamestart), .in_mid_check(in_mid_check), .immortal(immortal));
    
     
    // Instantiate 1st set of busses 
    Bus BUS_Left(.h(h), .v(v), .clk(clk), .v_offset(15'd0), .gameover(gameover), .gamestart(gamestart), .bus(busR), .frame(frame), .shift(15'd0), .score(scoreL), .currentV(currentV_L)); // Generates the far left bus with a shift of 0 to the right
    Bus BUS_Mid(.h(h), .v(v), .clk(clk), .v_offset(15'd0), .gameover(gameover), .gamestart(Bus_Mid_Begin), .bus(busM), .frame(frame), .shift(15'd70), .score(scoreM), .currentV(currentV_M)); // Generates the mid bus with a shift of 70 to the right
    Bus BUS_Right(.h(h), .v(v), .clk(clk), .v_offset(15'd0), .gameover(gameover), .gamestart(Bus_Right_Begin), .bus(busL), .frame(frame), .shift(15'd140), .score(scoreR), .currentV(currentV_R)); // Generates the left bus with a shift of 140 to the right 

    //flip flop determine when the 2nd set of busses start based on when first set reach row 400
    FDRE #(.INIT(1'b0))Bus_L_2(.C(clk), .CE(currentV_L == 400), .D(1'b1), .Q(Start_L_2));
    FDRE #(.INIT(1'b0))Bus_M_2(.C(clk), .CE(currentV_M == 400), .D(1'b1), .Q(Start_M_2));
    FDRE #(.INIT(1'b0))Bus_R_2(.C(clk), .CE(currentV_R == 400), .D(1'b1), .Q(Start_R_2));

    //Instantiate 2nd set of busses
    Bus BUS_Left_2(.h(h), .v(v), .clk(clk), .gameover(gameover), .gamestart(Start_L_2), .bus(busL_2), .frame(frame), .shift(15'd0), .score(scoreL_2)); // Generates the far left bus with a shift of 0 to the right
    Bus BUS_Mid_2(.h(h), .v(v), .clk(clk), .gameover(gameover), .gamestart(Start_M_2), .bus(busM_2), .frame(frame), .shift(15'd70), .score(scoreM_2)); // Generates the mid bus with a shift of 70 to the right
    Bus BUS_Right_2(.h(h), .v(v), .clk(clk), .gameover(gameover), .gamestart(Start_R_2), .bus(busR_2), .frame(frame), .shift(15'd140), .score(scoreR_2)); // Generates the left bus with a shift of 140 to the right 


    // Bus Delayed Start Logic
    countUD15L Delayed_Start(.clk(clk), 
                .UD(1'b1),                       
                .CE(frame & gamestart),    
                .LD(10'b0), .Din(15'd0), .Q(Bus_Start));
                
    FDRE #(.INIT(1'b0)) Bus_Right(.C(clk), .CE(Bus_Start == 120), .D(1'b1), .Q(Bus_Right_Begin)); // bus in right lane start 120 frames after game start ie 2s in
    FDRE #(.INIT(1'b0)) Bus_Mid(.C(clk), .CE(Bus_Start == 360), .D(1'b1), .Q(Bus_Mid_Begin));  // bus in mid lane starts 360 frames after game start ie 6s in

    
    assign totalscore = scoreL + scoreM + scoreR + scoreL_2 + scoreM_2 + scoreR_2; // add all score outputs from all 6 busses
    RingCounter ringcounter(.clk(clk), .Advance(digsel), .Q(anOut));
    selector select(.N({8'b0, totalscore[7:0]}), .sel(anOut), .H(H[3:0]));
    hex7seg hex(.n(H[3:0]), .seg(seg[6:0]));
    
    FDRE #(.INIT(1'b0)) gameover_state(.C(clk), .CE(crash), .D(1'b1), .Q(gameover)); // When crash = 1, set gameover = 1
    FDRE #(.INIT(1'b0)) gamestart_state(.C(clk), .CE(btnC), .D(1'b1), .Q(gamestart)); // when btnC = 1, set gamestart = 1
    
    assign an[3] = 1;
    assign an[2] = 1;
    assign an[1] = ~anOut[1];
    assign an[0] = ~anOut[0];
endmodule
