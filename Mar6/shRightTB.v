`timescale 1ns/10ps
module shRightTB;

reg [31:0] value;
reg [4:0] count;

wire [31:0] result;

shRight shRight_instance(value, count, result);

initial begin

value <= 32'b00110100011;
count <= 4'b11;

end
endmodule
