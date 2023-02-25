`timescale 1ns/10ps
module multiplicationTB;

reg [31:0] multiplicand, multiplier;

wire [31:0] resLo, resHi;

multiplication3bit multiplication_instance(multiplicand, multiplier, resLo, resHi);

initial begin

multiplicand <= 32'b00000000000000000000000000000100;//00000000000000000000000000000000
multiplier <= 32'b00000000000000000000000000000010;
end

endmodule
