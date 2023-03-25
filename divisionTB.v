`timescale 1ns/10ps
module divisionTB;

reg [31:0] dividend, divisor;

wire [31:0] quotient;
wire [32:0] remainder;

division division_instance(dividend, divisor, quotient, remainder);

initial begin

dividend <= 32'b00000000000000000000000000001110;//00000000000000000000000000000000
divisor <=  32'b00000000000000000000000000000100;
end

endmodule
