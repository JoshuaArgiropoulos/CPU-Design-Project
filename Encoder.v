module Encoder(
	R0out,
	R1out,
	R2out,
	R3out,
	R4out,
	R5out,
	R6out,
	R7out,
	R8out,
	R9out,
	R10out,
	R11out,
	R12out,
	R13out,
	R14out,
	R15out,

	HIout,
	LOout,
	Zhighout,
	Zlowout,
	PCout,
	MDRout,
	In.Portout,
	Cout,

	S0,
	S1,
	S2,
	S3,
	S4
	);
	input [31:0] 	 R0out,
						 R1out,
						 R2out,
						 R3out,
						 R4out,
						 R5out,
						 R6out,
						 R7out,
						 R8out,
						 R9out,
						 R10out,
						 R11out,
						 R12out,
						 R13out,
						 R14out,
						 R15out,
						 HIout,
						 LOout,
						 Zhighout,
						 Zlowout,
						 PCout,
						 MDRout,
						 In.Portout,
						 Cout;

	output reg [31:0] S0,
							S1,
							S2,
							S3,
							S4;

	always @(posedge clk) begin
		
	end

endmodule