module RevisedR0(input clk, clr, enable, BAout, input [31:0] D, output [31:0] BusMuxOut);

	reg [31:0] ra;
	
	always @(posedge clk) begin
		if(clr)
			ra <= 32'b0;
		else if(enable)
			ra <= D;
	end		
	assign BusMuxOut = (ra & (~BAout));
	
endmodule
