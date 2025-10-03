`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.10.2025 16:25:53
// Design Name: 
// Module Name: Ram_TB
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


module Ram_TB(



  
    reg clk;
    reg we;
    reg rst;
    reg [5:0] addr;
    reg [7:0] din;

// Output
wire [7:0] dout;

// Instantiate the RAM module
RAM uut (
    .clk(clk),
    .we(we),
    .rst(rst),
    .addr(addr),
    .din(din),
    .dout(dout)
);

    // Clock Generation: 10 ns period
    always #5 clk = ~clk;

    initial begin
        // Initialize Inputs
        clk = 0;
        we = 0;
        rst = 0;
        addr = 0;
        din = 0;

        // Step 1: Apply Reset
        $display("Applying Reset...");
        rst = 1;
        #10;
        rst = 0;

        // Step 2: Write Data to RAM
        $display("Writing to RAM...");
        we = 1;
        addr = 6'd10; din = 8'hAA; #10;
        addr = 6'd20; din = 8'hBB; #10;
        addr = 6'd30; din = 8'hCC; #10;

        // Step 3: Read Data from RAM
        $display("Reading from RAM...");
        we = 0;
        addr = 6'd10; #10;
        $display("Read from addr 10: %h", dout);

        addr = 6'd20; #10;
        $display("Read from addr 20: %h", dout);

        addr = 6'd30; #10;
        $display("Read from addr 30: %h", dout);

        // Done
        $display("Test completed.");
        $stop;
    end

endmodule
