`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/15/2018 12:08:53 PM
// Design Name: 
// Module Name: Glue
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


module Glue(ClkIn, Rst, E, L, R, L1, L2, L3, R1, R2, R3);
    input ClkIn, Rst, E, L, R;
    output L1, L2, L3, R1, R2, R3;
    wire Clk;
    
    ClkDiv ClockGen(ClkIn, 0, Clk);
    TurnSignals TS(Clk, Rst, E, L, R, L1, L2, L3, R1, R2, R3);
endmodule
