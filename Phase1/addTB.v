`timescale 1ns/10ps
module addTB;

reg [31:0] value1;
reg [31:0] value2;

wire [31:0] result;

add add_instance(value1, value2, result);

initial begin

value1 <= 32'b1111;
value2 <= 32'b11;
end

endmodule
