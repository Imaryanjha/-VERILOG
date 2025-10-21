`timescale 1ns / 1ps
///////////////////////////////////////////////////////////


module FSM_M_SD(
// Asynchronous Reset D Flip-Flop

    input wire clk,
    input wire async_rstn,  // Active-low asynchronous reset
    input wire d,
    output reg q
);

always @(posedge clk or negedge async_rstn) begin
    if (!async_rstn) 
        q <= 1'b0;  // Reset immediately when async_rstn is low
    else 
        q <= d;     // Normal operation on clock edge
end

endmodule
