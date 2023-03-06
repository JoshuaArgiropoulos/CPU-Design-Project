module Multiplexer(
BusMuxInR0,
BusMuxInR1,
BusMuxInR2,
BusMuxInR3,
BusMuxInR4,
BusMuxInR5,
BusMuxInR6,
BusMuxInR7,
BusMuxInR8,
BusMuxInR9,
BusMuxInR10,
BusMuxInR11,
BusMuxInR12,
BusMuxInR13,
BusMuxInR14,
BusMuxInR15,

BusMuxInHI,
BusMuxInLO,
BusMuxInZHI,
BusMuxInZLO,
BusMuxInPc,
BusMuxInMDR,
BusMuxInInPort,
CSignExtended,

BusMuxOut,

EncodeOut

);
input [31:0] 	 BusMuxInR0,
                BusMuxInR1,
                BusMuxInR2,
                BusMuxInR3,
                BusMuxInR4,
                BusMuxInR5,
                BusMuxInR6,
                BusMuxInR7,
                BusMuxInR8,
                BusMuxInR9,
                BusMuxInR10,
                BusMuxInR11,
                BusMuxInR12,
                BusMuxInR13,
                BusMuxInR14,
                BusMuxInR15,

                BusMuxInHI,
					 BusMuxInLO,
                BusMuxInZHI,
					 BusMuxInZLO,
                BusMuxInPc,
                BusMuxInMDR,
                BusMuxInInPort,
                CSignExtended;
input wire [4:0] 	 EncodeOut;

output reg [31:0] BusMuxOut;
                        

always @(*) begin
	
	case (EncodeOut)
	5'b00001 : BusMuxOut <= BusMuxInR0;
	5'b00010 : BusMuxOut <= BusMuxInR1;
	5'b00100 : BusMuxOut <= BusMuxInR2;
	5'b01000 : BusMuxOut <= BusMuxInR3;
	5'b10000 : BusMuxOut <= BusMuxInR4;
	5'b00011 : BusMuxOut <= BusMuxInR5;
	5'b00101 : BusMuxOut <= BusMuxInR6;
	5'b01001 : BusMuxOut <= BusMuxInR7;
	5'b10001 : BusMuxOut <= BusMuxInR8;
	5'b00110 : BusMuxOut <= BusMuxInR9;
	5'b01010 : BusMuxOut <= BusMuxInR10;
	5'b10100 : BusMuxOut <= BusMuxInR1;
	5'b01100 : BusMuxOut <= BusMuxInR12;
	5'b11000 : BusMuxOut <= BusMuxInR13;
	5'b01101 : BusMuxOut <= BusMuxInR14;
	5'b10101 : BusMuxOut <= BusMuxInR15;
	5'b10110 : BusMuxOut <= BusMuxInHI;
	5'b01110 : BusMuxOut <= BusMuxInLO;
	5'b11010 : BusMuxOut <= BusMuxInZHI;
	5'b11100 : BusMuxOut <= BusMuxInZLO;//19
	5'b10111 : BusMuxOut <= BusMuxInPc;//20    
	5'b11001 : BusMuxOut <= BusMuxInMDR;//21    19
	5'b11011 : BusMuxOut <= BusMuxInInPort;
	5'b11101 : BusMuxOut <= CSignExtended;
	default : BusMuxOut <= 0;
endcase
end
endmodule
//Might not be required. if using clk, put into module statement.