module fixed_priority_arbiter (
  input  [3:0] req,      // Request inputs from 4 modules
  output reg [3:0] grant // One-hot grant output
);

  always @(*) begin
    // Default: no grant
    grant = 4'b0000;

    // Check highest to lowest priority
    if (req[3])      grant = 4'b1000;  // Highest priority
    else if (req[2]) grant = 4'b0100;
    else if (req[1]) grant = 4'b0010;
    else if (req[0]) grant = 4'b0001;  // Lowest priority
  end

endmodule
