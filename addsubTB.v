`timescale 1ns/10ps
module addsubTB;

reg sign;
reg [31:0] value1;
reg [31:0] value2;

wire [31:0] result;

addsub addsub_instance(sign, value1, value2, result);

initial begin

sign <= 1;
value1 <= 32'b1111;
value2 <= 32'b11;
end

endmodule
