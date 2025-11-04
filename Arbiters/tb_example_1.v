
`timescale 1ns/1ps

module tb_fixed_priority_arbiter;
  reg  [3:0] req;
  wire [3:0] grant;

  // Instantiate the arbiter
  fixed_priority_arbiter uut (
    .req(req),
    .grant(grant)
  );

  initial begin
    $monitor("Time=%0t | req=%b | grant=%b", $time, req, grant);

    // Test sequence
    req = 4'b0000; #10;
    req = 4'b0001; #10;   // Request 0 active
    req = 4'b0011; #10;   // Request 1,0 active — grant to req[1]
    req = 4'b0110; #10;   // Request 2,1 active — grant to req[2]
    req = 4'b1111; #10;   // All active — grant to req[3]
    req = 4'b0000; #10;   // Idle state

    $finish;
  end
endmodule
