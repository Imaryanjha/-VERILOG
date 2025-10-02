module up_down_counter(
    input clk,
    input reset,
    input up_down, // 1=up, 0=down
    output reg [3:0] count
);

always @(posedge clk or posedge reset) begin
    if (reset) begin
        count <= 4'b0000;
    end else begin
        if (up_down) begin
            count <= count + 1; // Count up
        end else begin
            count <= count - 1; // Count down
        end
    end
end

endmodule
