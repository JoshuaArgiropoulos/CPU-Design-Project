`timescale 1ns/10ps
module RevisedR0TB;

reg clk = 0;
reg enable = 1;
reg clr = 0;
reg BAout = 0;
reg  [31:0] D;

wire [31:0] BusMuxOut;

always #10 clk = !clk;

RevisedR0 reg_instance(clk, clr, enable, BAout, D, BusMuxOut);
initial begin
 
	clr <= 0;
	BAout <= 0;
	D <= 32'b1;
	enable <=1;
	
	

end
endmodule
