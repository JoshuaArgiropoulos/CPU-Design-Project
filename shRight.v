module shRight(value, count, result);

input [31:0] value;
input [4:0] count;
output [31:0] result;

assign result = value >> count;

endmodule
