`timescale 1ns/10ps
module ALUTB;

reg[31:0] value1, value2, select;
wire[63:0] result;

ALU alu_inst(value1, value2, select, result);

initial begin

value1 <= 32'b00000000000000000000000000000100;//00000000000000000000000000000000
value2 <= 32'b00000000000000000000000000000010;
select = 1;
end

endmodule
