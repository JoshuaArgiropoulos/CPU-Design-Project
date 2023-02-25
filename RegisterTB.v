//`include "Register.v"

`timescale 1ns/10ps
module RegisterTB;

reg clk = 0;
reg enable = 1;
reg clr = 0;
reg  [31:0] D;

wire [31:0] Q;

always #10 clk = !clk;

Register reg_instance(clk, clr, enable, D, Q);

initial begin
    //These events must be in chronological order.
	clr <= 0;
	D <= 32'b1;
	enable <=1;

end
endmodule
