module notOp(value, result);

input [31:0] value;
output [31:0] result;

assign result = -value - 1;

endmodule
