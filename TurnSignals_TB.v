`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/15/2018 11:18:34 AM
// Design Name: 
// Module Name: TurnSignals_TB
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


module TurnSignals_TB();
    reg Clk_tb, Rst_tb, L_tb, R_tb, E_tb;
    wire OFF_tb, LA_tb, LB_tb, LC_tb, RA_tb, RB_tb, RC_tb;
    
    TurnSignals a1(Clk_tb, Rst_tb, E_tb, L_tb, R_tb, LA_tb, LB_tb, LC_tb, RA_tb, RB_tb, RC_tb);
    
    always begin
        Clk_tb <= 0;
        #10;
        Clk_tb <= 1;
        #10;
    end
    
    initial begin
        Rst_tb <= 1;
        @(posedge Clk_tb);
        Rst_tb <= 0;
        L_tb <= 1;
        R_tb <= 0;
        E_tb <= 0;
        @(posedge Clk_tb);
        @(posedge Clk_tb);
        @(posedge Clk_tb);
        @(posedge Clk_tb);
        @(posedge Clk_tb);
        L_tb <= 0;
        R_tb <= 1;
        E_tb <= 0;
        @(posedge Clk_tb);
        @(posedge Clk_tb);
        @(posedge Clk_tb);
        @(posedge Clk_tb);
        @(posedge Clk_tb);
        @(posedge Clk_tb);
        @(posedge Clk_tb);
        @(posedge Clk_tb);
        @(posedge Clk_tb);
        L_tb <= 1;
        R_tb <= 1;
        E_tb <= 0;
        @(posedge Clk_tb);
        @(posedge Clk_tb);
        @(posedge Clk_tb);
        @(posedge Clk_tb);
        @(posedge Clk_tb);
        L_tb <= 1;
        R_tb <= 1;
        E_tb <= 1;
        @(posedge Clk_tb);
        @(posedge Clk_tb);
        @(posedge Clk_tb);
        @(posedge Clk_tb);
        @(posedge Clk_tb);
        L_tb <= 0;
        R_tb <= 0;
        E_tb <= 1;
        @(posedge Clk_tb);
        @(posedge Clk_tb);
        @(posedge Clk_tb);
        @(posedge Clk_tb);
        @(posedge Clk_tb);
        L_tb <= 0;
        R_tb <= 0;
        E_tb <= 0;
        
                @(posedge Clk_tb);
        @(posedge Clk_tb);
        @(posedge Clk_tb);
        @(posedge Clk_tb);
        @(posedge Clk_tb);
        L_tb <= 0;
        R_tb <= 0;
        E_tb <= 0;
        end
        
        
endmodule
