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

	output reg [4:0] encodeOut;

	always @(posedge clk) begin

    encodeOut = 5'b00000;
    if (R0out) encodeOut = 5'b00001;
    if (R1out) encodeOut = 5'b00010;
    if (R2out) encodeOut = 5'b00100;
    if (R3out) encodeOut = 5'b01000;
    if (R4out) encodeOut = 5'b10000;
    if (R5out) encodeOut = 5'b00011;
    if (R6out) encodeOut = 5'b00101;
    if (R7out) encodeOut = 5'b01001;
    if (R8out) encodeOut = 5'b10001;
    if (R9out) encodeOut = 5'b00110;
    if (R10out) encodeOut = 5'b01010;
    if (R11out) encodeOut = 5'b10100;
    if (R12out) encodeOut = 5'b01100;
    if (R13out) encodeOut = 5'b11000;
    if (R14out) encodeOut = 5'b01101;
    if (R15out) encodeOut = 5'b10101;
    if (HIout) encodeOut = 5'b10110;
    if (LOout) encodeOut = 5'b01110;
    if (Zhighout) encodeOut = 5'b11010;
    if (Zlowout) encodeOut = 5'b11100;
    if (PCout) encodeOut = 5'b10111;
    if (MDRout) encodeOut = 5'b11001;
    if (In_Portout) encodeOut = 5'b11011;
    if (Cout) encodeOut = 5'b11101;
	end

endmodule

/*always @ * begin
    case ({R0out, R1out, R2out, R3out, R4out, R5out, R6out, R7out, R8out, R9out, R10out, R11out, R12out, R13out, R14out, R15out, HIout, LOout, Zhighout, Zlowout, PCout, MDRout, In_Portout, Cout})
        16'b1_000000000000001: encodeOut = 5'b00001;
        16'b10_00000000000010: encodeOut = 5'b00010;
        16'b100_000000000100: encodeOut = 5'b00100;
        16'b1000_000000001000: encodeOut = 5'b01000;
        16'b10000_000000010000: encodeOut = 5'b10000;
        16'b100000_000000100000: encodeOut = 5'b00011;
        16'b1000000_000001000000: encodeOut = 5'b00101;
        16'b10000000_000010000000: encodeOut = 5'b01001;
        16'b100000000_000100000000: encodeOut = 5'b10001;
        16'b1000000000_001000000000: encodeOut = 5'b00110;
        16'b10000000000_010000000000: encodeOut = 5'b01010;
        16'b100000000000_100000000000: encodeOut = 5'b10100;
        16'b1000000000000_1000000000000: encodeOut = 5'b01100;
        16'b10000000000000_10000000000000: encodeOut = 5'b11000;
        16'b100000000000000_100000000000000: encodeOut = 5'b01101;
        16'b1000000000000000_1000000000000000: encodeOut = 5'b10101;
        16'b10000000000000000_10000000000000000: encodeOut = 5'b10110;
        16'b100000000000000000_100000000000000000: encodeOut = 5'b01110;
        16'b1000000000000000000_1000000000000000000: encodeOut = 5'b11010;
        16'b10000000000000000000_10000000000000000000: encodeOut = 5'b11100;
        16'b100000000000000000000_100000000000000000000: encodeOut = 5'b10111;
        16'b1000000000000000000000_1000000000000000000000: encodeOut = 5'b11001;
        16'b10000000000000000000000_10000000000000000000000: encodeOut = 5'b11011;
        16'b100000000000000000000000_100000000000000000000000: encodeOut = 5'b11101;
        default: encodeOut = 5'b00000;
    endcase
end



*/
