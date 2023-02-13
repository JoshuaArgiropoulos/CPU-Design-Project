//`include "OR.V"

`timescale 1ns/10ps

module ORtb;

  reg  [31:0] R1;
  reg  [31:0] R2;
  wire [31:0] R3;

always #10 clk = !clk;

  OR OR_instance(R1, R2, R3);

initial begin
    
 
	R1 <= 32'b1;
  R2 <= 32'b0;
  //Testing 32'b0 || 32'b1. Should be 32'b1
  

end
endmodule
