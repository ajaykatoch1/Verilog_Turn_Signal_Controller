`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/15/2018 11:18:34 AM
// Design Name: 
// Module Name: TurnSignals
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


module TurnSignals(Clk, Rst, E, L, R, L1, L2, L3, R1, R2, R3);
    
    input Clk, Rst, E, L, R;
    output reg L1, L2, L3, R1, R2, R3;
    
    reg [2:0] state, newState;
    parameter OFF = 0, EMER = 1, LA = 2, LB = 3, LC = 4, RA = 5, RB = 6, RC = 7;
    
    always @(posedge Clk) begin
        if (Rst) begin
            state <= OFF;
        end
        else begin
            state <= newState;
        end
    end
    
    always @(state, E, L, R) begin
        case (state)
            OFF: begin
                L1 <= 0; L2 <= 0; L3 <= 0; R1 <= 0; R2 <= 0; R3 <= 0;
                if (E | (L&R)) begin
                    newState <= EMER;
                end
                else if (L&~R&~E) begin
                    newState <= LA;
                end
                else if (~L&R&~E) begin
                    newState <= RA;
                end
                else begin
                    newState <= OFF;
                end
            end
            EMER: begin
                L1 <= 1; L2 <= 1; L3 <= 1; R1 <= 1; R2 <= 1; R3 <= 1;
                newState <= OFF;
            end
            LA: begin
                L1 <= 1; L2 <= 0; L3 <= 0; R1 <= 0; R2 <= 0; R3 <= 0;
                if (E | (L&R)) begin
                    newState <= EMER;
                end
                else if (L) begin
                    newState <= LB;
                end
                else if (R) begin
                    newState <= OFF;
                end
            end
            LB: begin
                L1 <= 1; L2 <= 1; L3 <= 0; R1 <= 0; R2 <= 0; R3 <= 0;
                if (E | (L&R)) begin
                    newState <= EMER;
                end
                else if (L) begin
                    newState <= LC;
                end
                else if (R) begin
                    newState <= OFF;
                end
            end
            LC: begin
                L1 <= 1; L2 <= 1; L3 <= 1; R1 <= 0; R2 <= 0; R3 <= 0;
                if (E | (L&R)) begin
                    newState <= EMER;
                end
                else begin
                    newState <= OFF;
                end
            end
            RA: begin
                L1 <= 0; L2 <= 0; L3 <= 0; R1 <= 1; R2 <= 0; R3 <= 0;
                if (E | (L&R)) begin
                    newState <= EMER;
                end
                else if (R) begin
                    newState <= RB;
                end
                else if (L) begin
                    newState <= OFF;
                end
            end
            RB: begin
                L1 <= 0; L2 <= 0; L3 <= 0; R1 <= 1; R2 <= 1; R3 <= 0;
                if (E | (L&R)) begin
                    newState <= EMER;
                end
                else if (R) begin
                    newState <= RC;
                end
                else if (L) begin
                    newState <= OFF;
                end
            end
            RC: begin
                L1 <= 0; L2 <= 0; L3 <= 0; R1 <= 1; R2 <= 1; R3 <= 1;
                if (E | (L&R)) begin
                    newState <= EMER;
                end
                else begin
                    newState <= OFF;
                end
            end
            default: begin
                L1 <= 0; L2 <= 0; L3 <= 0; R1 <= 0; R2 <= 0; R3 <= 0;
                newState <= OFF;
            end
        endcase
    end
    
endmodule
