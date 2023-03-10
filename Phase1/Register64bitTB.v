//`include "Register.v"

`timescale 1ns/10ps
module Register64bitTB;

reg clk = 0;
reg enable = 1;
reg clr = 0;
reg  [63:0] D;

wire [31:0] QH, QL;

always #10 clk = !clk;

Register64bit reg_instance(clk, clr, enable, D, QH, QL);

initial begin
    //These events must be in chronological order.
	clr <= 0;
	D <= 64'b1;
	enable <=1;

end
endmodule
