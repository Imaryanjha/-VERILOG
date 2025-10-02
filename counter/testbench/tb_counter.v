module tb_up_down_counter;
    reg clk, reset, up_down;
    wire [3:0] count;
    
    up_down_counter uut (clk, reset, up_down, count);
    
    // Clock generation
    always #5 clk = ~clk;
    
    initial begin
        $dumpfile("waveforms/counter.vcd");
        $dumpvars(0, tb_up_down_counter);
        
        // Initialize signals
        clk = 0;
        reset = 1;
        up_down = 1;
        
        // Apply reset
        #20;
        reset = 0;
        
        // Test counting using for loop
        $display("Testing Up Count:");
        for (integer i = 0; i < 5; i = i + 1) begin
            #10;
            $display("Count = %d", count);
        end
        
        // Change direction
        up_down = 0;
        $display("Testing Down Count:");
        for (integer i = 0; i < 5; i = i + 1) begin
            #10;
            $display("Count = %d", count);
        end
        
        $display("Testbench completed");
        $finish;
    end
endmodule
