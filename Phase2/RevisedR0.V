module RevisedR0(input clk, clr, enable, BAout, input D[31:0], output BusMuxOut[31:0]);

	reg [31:0] ra;
	
	
	always @(posedge clk) begin
		if(clr)
			ra <= 32'b0;
		else if(enable)
			ra <= D;
	end		
	assign BusMuxOut = (ra & (-BAout));
	
endmodule
