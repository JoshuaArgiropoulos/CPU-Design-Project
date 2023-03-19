module ALU (value1, value2, select, result);

input [31:0] value1, value2;
input [4:0] select;
output reg [63:0] result;
reg [31:0] IncPc = 1;

wire [31:0] addOut, subOut, andOut, orOut, negOut, notOut, shrOut, shlOut, rorOut, rolOut, addIOut, andIOut, orIOut, IncPcAddOut;
wire [63:0] divOut, mulOut;

add aluAdd (value1, value2, addOut);
add PcIncAdd (IncPc, value2, IncPcAddOut);
sub aluSub (value1, value2, subOut);
andOp aluAnd (value1, value2, andOut);
orOp aluOr (value1, value2, orOut);
negate aluNeg (value1, negOut);
notOp aluNot (value1, notOut);
shRight aluShr (value1, value2, shrOut);
shLeft aluShl (value1, value2, shlOut);
rotateRight aluRor (value1, value2, rorOut);
rotateLeft aluRol (value1, value2, rolOut);
shRightA aluShrA (value1, value2, shrOutA);

division aluDiv (value1, value2, divOut[31:0], divOut[63:32]); //low = quotient high = remainder
multiplication5bit aluMul (value1, value2, mulOut[31:0], mulOut[63:32]);


always @(*) begin

	case(select)
		4'd1:	begin//add
					result[31:0] <= addOut;
					result[63:32] <= 32'b0;
			   end
		4'd2:begin//sub
					result[31:0] <= subOut;
					result[63:32] <= 32'b0;
			   end
		4'd3:begin//and
					result[31:0] <= andOut;
					result[63:32] <= 32'b0;
			   end
		4'd4:begin//or
					result[31:0] <= orOut;
					result[63:32] <= 32'b0;
			   end
		4'd5:begin//negate
					result[31:0] <= negOut;
					result[63:32] <= 32'b0;
			   end
		4'd6:begin//not
					result[31:0] <= notOut;
					result[63:32] <= 32'b0;
			   end
		4'd7:begin//shr
					result[31:0] <= shrOut;
					result[63:32] <= 32'b0;
			   end
		4'd8:begin//shl
					result[31:0] <= shlOut;
					result[63:32] <= 32'b0;
			   end
		4'd9:begin//ror
					result[31:0] <= rorOut;
					result[63:32] <= 32'b0;
			   end
		4'd10:begin//rol
					result[31:0] <= rolOut;
					result[63:32] <= 32'b0;
			   end
		4'd11:begin//div
					result[31:0] <= divOut[31:0];
					result[63:32] <= divOut[63:32];
			   end
		4'd12:begin//mul
					result[31:0] <= mulOut[31:0];
					result[63:32] <= mulOut[63:32];
			   end
		4'd13:begin//shrA
					result[31:0] <= shrOutA;
					result[63:32] <= 32'b0;
				end
		4'd14:begin//IncPc
					result[31:0] <= IncPcAddOut;
					result[63:32] <= 32'b0;
				end
		default result[63:0] <= 64'b0;
		endcase

end


endmodule
