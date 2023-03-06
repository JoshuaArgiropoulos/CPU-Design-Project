`timescale 1ns/10ps
module multiplicationTB;

reg [31:0] multiplicand, multiplier;

wire [31:0] resLo, resHi;

multiplication5bit multiplication_instance(multiplicand, multiplier, resLo, resHi);

initial begin

multiplicand <= 32'b111111111111111111111111111111100;//00000000000000000000000000000000
multiplier   <= 32'b000000000000000000000000000000110;
end

endmodule
