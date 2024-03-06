`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/04/2024 01:36:18 AM
// Design Name: 
// Module Name: Bus
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


module Bus(
    input [14:0] h, v, shift, v_offset, 
    input frame,
    input clk,
    output bus,
    output [14:0] currentV
    
    );
    
    assign bus = ((h > (208 + shift)) & (h < (268 + shift))) & ((v > bustop) & (v < busbot));
    
    wire [14:0] bustop, busbot, top_lengthcounter, bot_lengthcounter;
    wire [7:0] rnd, rnd_out, bus_length;
    
    assign bustop = top_lengthcounter;
    assign busbot = bot_lengthcounter;
    
    countUD15L Movement_bot(.clk(clk), 
                    .UD(1'b1),                       
                    .CE(1'b1 & frame & (v_offset >= bot_lengthcounter)),    
                    .LD(bustop == 479), .Din(15'd0), .Q(bot_lengthcounter)); 
                    
    countUD15L Movement_top(.clk(clk), 
                    .UD(1'b1),                       
                    .CE(1'b1 & frame & (bot_lengthcounter >= bus_length)),    
                    .LD(bustop == 479), .Din(15'd0), .Q(top_lengthcounter));       
                    
    assign bus_length = 60 + rnd_out[5:0];
    assign currentV = busbot;
    
    LFSR Random(.clk(clk), .run(15'd1), .rnd(rnd));
    
    FDRE #(.INIT(1'b0)) ff_01 (.C(clk), .CE(bustop == 479), .D(rnd[0]), .Q(rnd_out[0]));
    FDRE #(.INIT(1'b0)) ff_02 (.C(clk), .CE(bustop == 479), .D(rnd[1]), .Q(rnd_out[1]));
    FDRE #(.INIT(1'b0)) ff_03 (.C(clk), .CE(bustop == 479), .D(rnd[2]), .Q(rnd_out[2]));
    FDRE #(.INIT(1'b0)) ff_04 (.C(clk), .CE(bustop == 479), .D(rnd[3]), .Q(rnd_out[3]));
    FDRE #(.INIT(1'b0)) ff_05 (.C(clk), .CE(bustop == 479), .D(rnd[4]), .Q(rnd_out[4]));
    FDRE #(.INIT(1'b0)) ff_06 (.C(clk), .CE(bustop == 479), .D(rnd[5]), .Q(rnd_out[5]));

endmodule
