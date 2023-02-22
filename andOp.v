module andOp(value1, value2, result);

input [31:0] value1;
input [31:0] value2;
output [31:0] result;

assign result = value1 & value2;

endmodule
