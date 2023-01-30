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

BusMuxOut

);
input [31:0] BusMuxInR0,
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


output reg [31:0] BusMuxOut;
                        

always @(posedge clk) 
//Might not be required. if using clk, put into module statement.