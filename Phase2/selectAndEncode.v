module selectAndEncode(
	input Gra, Grb, Grc, Rin, Rout, BAout, 
	input [31:0] IRout,
	output reg [15:0] regsIn, regsOut,
	output [31:0] CSE
);

	reg [3:0] RaGra, RbGrb, RcGrc, DecodeIn;
	reg [15:0] DecodeOut;
	
	initial begin
	regsIn <= 16'b0;
	regsOut <= 16'b0;
	end

always @(*) begin

	RaGra = IRout[26:23] & Gra;
	RbGrb = IRout[22:19] & Grb;
	RcGrc = IRout[18:15] & Grc;
	DecodeIn = RaGra | RbGrb | RcGrc;
	
	case(DecodeIn)
		4'b0000 : begin
					regsIn[0] <= Rin;
					regsOut[0] <= Rout & BAout;
		end
		4'b0001 : begin
					regsIn[1] <= Rin;
					regsOut[1] <= Rout & BAout;
		end
		4'b0010 : begin
					regsIn[2] <= Rin;
					regsOut[2] <= Rout & BAout;
		end
		4'b0011 : begin
					regsIn[3] <= Rin;
					regsOut[3] <= Rout & BAout;
		end
		4'b0100 : begin
					regsIn[4] <= Rin;
					regsOut[4] <= Rout & BAout;
		end
		4'b0101 : begin
					regsIn[5] <= Rin;
					regsOut[5] <= Rout & BAout;
		end
		4'b0110 : begin
					regsIn[6] <= Rin;
					regsOut[6] <= Rout & BAout;
		end
		4'b0111 : begin
					regsIn[7] <= Rin;
					regsOut[7] <= Rout & BAout;
		end
		4'b1000 : begin
					regsIn[8] <= Rin;
					regsOut[8] <= Rout & BAout;
		end
		4'b1001 : begin
					regsIn[9] <= Rin;
					regsOut[9] <= Rout & BAout;
		end
		4'b1010 : begin
					regsIn[10] <= Rin;
					regsOut[10] <= Rout & BAout;
		end
		4'b1011 : begin
					regsIn[11] <= Rin;
					regsOut[11] <= Rout & BAout;
		end
		4'b1100 : begin
					regsIn[12] <= Rin;
					regsOut[12] <= Rout & BAout;
		end
		4'b1101 : begin
					regsIn[13] <= Rin;
					regsOut[13] <= Rout & BAout;
		end
		4'b1110 : begin
					regsIn[14] <= Rin;
					regsOut[14] <= Rout & BAout;
		end
		4'b1111 : begin
					regsIn[15] <= Rin;
					regsOut[15] <= Rout & BAout;
		end
	endcase
end

	assign CSE = $signed({IRout[17], IRout[17:0]}); //this might need to be 18, not 100% sure

endmodule
