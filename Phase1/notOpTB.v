`timescale 1ns/10ps
module notOpTB;

reg [31:0] value;

wire [31:0] result;

notOp notOp_instance(value, result);

initial begin

value <= 32'b00110100011;

end
endmodule
