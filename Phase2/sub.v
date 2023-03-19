module sub(value1, value2, result);
input [31:0] value1;
input [31:0] value2;
output [31:0] result;
reg [31:0] ra;

always @(*) begin
ra <= value1 - value2;
end
assign result = ra;
endmodule
