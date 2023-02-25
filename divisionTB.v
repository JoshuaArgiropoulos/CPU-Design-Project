`timescale 1ns/10ps
module divisionTB;

reg [31:0] dividend, divisor;

wire [31:0] quotient;
wire [32:0] remainder;

division division_instance(dividend, divisor, quotient, remainder);

initial begin

dividend <= 32'b1010110;//00000000001011000011000000000011
divisor <= 32'b10010;
end

endmodule
