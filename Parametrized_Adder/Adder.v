module Parametrized_adder #(
  Parameter WIDTH = 4)

  (
    input [WIDTH-1:0]a,b,
    input cin,
    output [WIDTH-1:0] Sum,
    output Cout
  );

  assign{Cout,Sum}= a+b+cin;
endmodule

    
