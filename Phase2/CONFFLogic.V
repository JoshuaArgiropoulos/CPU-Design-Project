module CONFFLogic(input enable, input [31:0] IRIn, input [31:0] BusMuxIn, output [31:0] ControlUnitOut);

	reg [3:0] Ra;
	reg Bit0;
	reg Bit1;
	reg Bit2;
	reg Bit3;
	
	reg busOr;
	reg busNor;
	
	reg D;
	
	reg Q;
	
	always @(*)
		begin
		
		case(IRIn[20:19])
			2'b00: Ra = 4'b0001;
			2'b01: Ra = 4'b0010;
			2'b10: Ra = 4'b0100;
			2'b11: Ra = 4'b1000;
			default: Ra = 4'b0000;
			
		endcase

		
		busOr = BusMuxIn[0] | BusMuxIn[1] | BusMuxIn[2] | BusMuxIn[3] | BusMuxIn[4] | BusMuxIn[5] | BusMuxIn[6] 
		| BusMuxIn[7] | BusMuxIn[8] | BusMuxIn[9] | BusMuxIn[10] | BusMuxIn[11] | BusMuxIn[12] | BusMuxIn[13] | BusMuxIn[14] | BusMuxIn[15] | 
		BusMuxIn[16] | BusMuxIn[17] | BusMuxIn[18] | BusMuxIn[19] | BusMuxIn[20] | BusMuxIn[21] | BusMuxIn[22] | BusMuxIn[23] | BusMuxIn[24] | 
		BusMuxIn[25] | BusMuxIn[26] | BusMuxIn[27] | BusMuxIn[28] | BusMuxIn[29] | BusMuxIn[30] | BusMuxIn[31];
		
		busNor = ~busOr;
		
		//Used to calc the logic with the decoder and the Bus
		Bit0 = Ra[0] & busNor;	
		Bit1 = Ra[1] & ~busNor;
		Bit2 = Ra[2] & ~IRIn[31];
		Bit3 = Ra[3] & IRIn[31];
		//Ors the 4 AND gates to find what D is 
		D = Bit0 | Bit1 | Bit2 | Bit3;
		//IF CONIn is high, D = Q
		if (enable)
			Q = D;
		
	
	end
	assign ControlUnitOut = Q;
	
endmodule
