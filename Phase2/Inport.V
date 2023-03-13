module Inport(input clr, clk, input [31:0] InportIn, output [31:0] BusMuxIn);

	reg [31:0] ra;
	
	always @(posedge clk) begin
		if(clr)
			ra <= 32'b0;
		else 
			ra <= InportIn;
	end		
	assign BusMuxOut = ra;
	
endmodule
