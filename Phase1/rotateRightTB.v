`timescale 1ns/10ps
module rotateRightTB;

reg [31:0] value;
reg [4:0] count;

wire [31:0] result;

rotateRight rotateRight_instance(value, count, result);

initial begin

value <= 32'b00110100011;
count <= 5'b11111;

end
endmodule
