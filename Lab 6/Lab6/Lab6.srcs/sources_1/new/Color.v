`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/27/2024 09:14:48 PM
// Design Name: 
// Module Name: Color
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


module Color(
    input border, energy, slug, busL, busM, busR, gameover, clk, frame, immortal, no_energy, gamestart, busL_2, busM_2, busR_2,
    input [14:0] h, v,
    output [3:0] vgaRed, vgaGreen, vgaBlue
    ); 
    
    wire [3:0] active;
    wire [14:0] framecounter, purplecounter; 
    wire [3:0] flash_yellow_on, flash_purple_on;    
    
    // Define Active Region
    assign active = {4{((h < 639) & (v < 479))}};
    
    assign vgaRed   = (active & {4{border}})                          | (active & {4{slug}} & ~{4{gameover}} & (~{4{immortal}} | {4{no_energy}})) | (active & {4{slug}} & {4{gameover}} & flash_yellow_on) | (active & {4{slug}} & {4{immortal}} & ~{4{no_energy}} & flash_purple_on  & {4{gamestart}}); 
    assign vgaGreen = (active & {4{border}}) | (active & {4{energy}}) | (active & {4{slug}} & ~{4{gameover}} & (~{4{immortal}} | {4{no_energy}})) | (active & {4{slug}} & {4{gameover}} & flash_yellow_on);
    assign vgaBlue  = (active & {4{border}}) | (active & {4{busL}}) | (active & {4{busM}}) | (active & {4{busR}}) | (active & {4{busL_2}}) | (active & {4{busM_2}}) | (active & {4{busR_2}})                                                                                         | (active & {4{slug}} & {4{immortal}} & ~{4{no_energy}} & flash_purple_on  & {4{gamestart}});
    
    // Flash Mechanic
    
    // Flash Yellow
    countUD15L Flash_yellow(.clk(clk), 
                    .UD(1'b1), 
                    .CE(gameover & frame),    
                    .LD(framecounter == 15'd60), .Din(15'd0), .Q(framecounter));  
    
    FDRE #(.INIT(1'b1)) Yellow_0(.C(clk), .CE(framecounter == 15'd60), .R(framecounter == 15'd30), .D(1'b1), .Q(flash_yellow_on[0]));
    FDRE #(.INIT(1'b1)) Yellow_1(.C(clk), .CE(framecounter == 15'd60), .R(framecounter == 15'd30), .D(1'b1), .Q(flash_yellow_on[1]));
    FDRE #(.INIT(1'b1)) Yellow_2(.C(clk), .CE(framecounter == 15'd60), .R(framecounter == 15'd30), .D(1'b1), .Q(flash_yellow_on[2]));
    FDRE #(.INIT(1'b1)) Yellow_3(.C(clk), .CE(framecounter == 15'd60), .R(framecounter == 15'd30), .D(1'b1), .Q(flash_yellow_on[3]));
    
    // Flash Purple
    countUD15L Flash_purple(.clk(clk), 
                    .UD(1'b1), 
                    .CE(immortal & frame),       
                    .LD(purplecounter == 15'd20), .Din(15'd0), .Q(purplecounter));  
                    
    FDRE #(.INIT(1'b1)) Purple_0(.C(clk), .CE(purplecounter == 15'd20), .R(purplecounter == 15'd10), .D(1'b1), .Q(flash_purple_on[0]));
    FDRE #(.INIT(1'b1)) Purple_1(.C(clk), .CE(purplecounter == 15'd20), .R(purplecounter == 15'd10), .D(1'b1), .Q(flash_purple_on[1]));
    FDRE #(.INIT(1'b1)) Purple_2(.C(clk), .CE(purplecounter == 15'd20), .R(purplecounter == 15'd10), .D(1'b1), .Q(flash_purple_on[2]));
    FDRE #(.INIT(1'b1)) Purple_3(.C(clk), .CE(purplecounter == 15'd20), .R(purplecounter == 15'd10), .D(1'b1), .Q(flash_purple_on[3]));

endmodule
