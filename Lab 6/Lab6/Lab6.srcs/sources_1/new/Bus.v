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
    input frame, gameover, gamestart, 
    input clk, bus,
    output [14:0] currentV,
    output [14:0] score 
    );
    wire [14:0] bustop, busbot, top_lengthcounter, bot_lengthcounter;
    wire [7:0] rnd, rnd_out, bus_length;
    
    wire [14:0] frame_descent_count;
    wire [7:0] Descent_Delay;
    wire go;
    
    // determine where the bus exists
    assign bus = ((h > (208 + shift)) & (h < (268 + shift))) & ((v > bustop) & (v < busbot));
    

    // redundant -> top_length counter can just equal bustop ie. get rid of top_lengthcounter and replace all instances with bustop
    assign bustop = top_lengthcounter;
    assign busbot = bot_lengthcounter;
    
    // Controls bottom bounds of bus, loads in after game start and all conditions met. Will disappear when counter reaches edge of frame
    countUD15L Movement_bot(.clk(clk), 
                    .UD(1'b1),                       
                    .CE(1'b1 & frame & ~gameover & gamestart & (busbot >= v_offset) & go),    
                    .LD(bustop == 479), .Din(15'd0), .Q(bot_lengthcounter)); 
                    
    // Controls top bounds of bus, loads in based on output of random length of bus
    countUD15L Movement_top(.clk(clk), 
                    .UD(1'b1),                       
                    .CE(1'b1 & frame & (bot_lengthcounter >= bus_length) & ~gameover & gamestart),    
                    .LD(bustop == 479), .Din(15'd0), .Q(top_lengthcounter));       
                    
    // Determine Random Length of Busses                
    assign bus_length = 60 + rnd_out[5:0]; 
    assign currentV = busbot;
    
    LFSR Random(.clk(clk), .run(15'd1), .rnd(rnd));
    
    FDRE #(.INIT(1'b0)) ff_01 (.C(clk), .CE(bustop == 479), .D(rnd[0]), .Q(rnd_out[0]));
    FDRE #(.INIT(1'b0)) ff_02 (.C(clk), .CE(bustop == 479), .D(rnd[1]), .Q(rnd_out[1]));
    FDRE #(.INIT(1'b0)) ff_03 (.C(clk), .CE(bustop == 479), .D(rnd[2]), .Q(rnd_out[2]));
    FDRE #(.INIT(1'b0)) ff_04 (.C(clk), .CE(bustop == 479), .D(rnd[3]), .Q(rnd_out[3]));
    FDRE #(.INIT(1'b0)) ff_05 (.C(clk), .CE(bustop == 479), .D(rnd[4]), .Q(rnd_out[4]));
    FDRE #(.INIT(1'b0)) ff_06 (.C(clk), .CE(bustop == 479), .D(rnd[5]), .Q(rnd_out[5]));
    
    
    // Descent Delay Logic
    countUD15L Delayed_Start(.clk(clk), 
                .UD(1'b1),                       
                .CE(frame & gamestart),    
                .LD(bustop == 400), .Din(15'd0), .Q(frame_descent_count));
                
    LFSR Descent_RND(.clk(clk), .run(15'd1), .rnd(Descent_Delay));
    
    wire [7:0] rnddelayhold;
    FDRE #(.INIT(1'b0)) FF[7:0](.C({8{clk}}), .CE({8{bustop == 400}}), .D(Descent_Delay[7:0]), .Q(rnddelayhold[7:0]));   
    FDRE #(.INIT(1'b0)) FF_Descent (.C(clk), .CE(frame_descent_count[6:0] == rnddelayhold[6:0]), .R(bustop == 400), .D(1'b1), .Q(go));
    

    // Detects scoring based on when bustop passes the first row of the slug
    countUD15L Scoring(.clk(clk), 
                .UD(1'b1),                       
                .CE(bustop == 312 & frame),       
                .LD(10'd0), .Din(15'd0), .Q(score));  

endmodule
