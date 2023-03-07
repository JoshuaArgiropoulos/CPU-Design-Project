module Encoder(EncodeIn, EncodeOut);
	input [31:0] 	 EncodeIn;
	output reg [4:0] EncodeOut;
	
	always begin
	case(EncodeIn)
	 32'b00000000000000000000000000000000 : EncodeOut = 5'b00000;
    32'b00000000000000000000000000000001 : EncodeOut = 5'b00001;
    32'b00000000000000000000000000000010 : EncodeOut = 5'b00010;
    32'b00000000000000000000000000000100 : EncodeOut = 5'b00100;
    32'b00000000000000000000000000001000 : EncodeOut = 5'b01000;
    32'b00000000000000000000000000010000 : EncodeOut = 5'b10000;
    32'b00000000000000000000000000100000 : EncodeOut = 5'b00011;
    32'b00000000000000000000000001000000 : EncodeOut = 5'b00101;
    32'b00000000000000000000000010000000 : EncodeOut = 5'b01001;
    32'b00000000000000000000000100000000 : EncodeOut = 5'b10001;
    32'b00000000000000000000001000000000 : EncodeOut = 5'b00110;
    32'b00000000000000000000010000000000 : EncodeOut = 5'b01010;
    32'b00000000000000000000100000000000 : EncodeOut = 5'b10100;
    32'b00000000000000000001000000000000 : EncodeOut = 5'b01100;
    32'b00000000000000000010000000000000 : EncodeOut = 5'b11000;
    32'b00000000000000000100000000000000 : EncodeOut = 5'b01101;
    32'b00000000000000001000000000000000 : EncodeOut = 5'b10101;
    32'b00000000000000010000000000000000 : EncodeOut = 5'b10110;
    32'b00000000000000100000000000000000 : EncodeOut = 5'b01110;
    32'b00000000000001000000000000000000 : EncodeOut = 5'b11010;
    32'b00000000000010000000000000000000 : EncodeOut = 5'b11100;
    32'b00000000000100000000000000000000 : EncodeOut = 5'b10111;
    32'b00000000001000000000000000000000 : EncodeOut = 5'b11001;
    32'b00000000010000000000000000000000 : EncodeOut = 5'b11011;
    32'b00000000100000000000000000000000 : EncodeOut = 5'b11101;
	 
	 /*
	 if (00000000000000000000000000000000 <= EncodeIn) assign EncodeOut = 5'b00000;
    if (00000000000000000000000000000001 <= EncodeIn) assign EncodeOut = 5'b00001;
    if (00000000000000000000000000000010 <= EncodeIn) assign EncodeOut = 5'b00010;
    if (00000000000000000000000000000100 <= EncodeIn) assign EncodeOut = 5'b00100;
    if (00000000000000000000000000001000 <= EncodeIn) assign EncodeOut = 5'b01000;
    if (00000000000000000000000000010000 <= EncodeIn) assign EncodeOut = 5'b10000;
    if (00000000000000000000000000100000 <= EncodeIn) assign EncodeOut = 5'b00011;
    if (00000000000000000000000001000000 <= EncodeIn) assign EncodeOut = 5'b00101;
    if (00000000000000000000000010000000 <= EncodeIn) assign EncodeOut = 5'b01001;
    if (00000000000000000000000100000000 <= EncodeIn) assign EncodeOut = 5'b10001;
    if (00000000000000000000001000000000 <= EncodeIn) assign EncodeOut = 5'b00110;
    if (00000000000000000000010000000000 <= EncodeIn) assign EncodeOut = 5'b01010;
    if (00000000000000000000100000000000 <= EncodeIn) assign EncodeOut = 5'b10100;
    if (00000000000000000001000000000000 <= EncodeIn) assign EncodeOut = 5'b01100;
    if (00000000000000000010000000000000 <= EncodeIn) assign EncodeOut = 5'b11000;
    if (00000000000000000100000000000000 <= EncodeIn) assign EncodeOut = 5'b01101;
    if (00000000000000001000000000000000 <= EncodeIn) assign EncodeOut = 5'b10101;
    if (00000000000000010000000000000000 <= EncodeIn) assign EncodeOut = 5'b10110;
    if (00000000000000100000000000000000 <= EncodeIn) assign EncodeOut = 5'b01110;
    if (00000000000001000000000000000000 <= EncodeIn) assign EncodeOut = 5'b11010;
    if (00000000000010000000000000000000 <= EncodeIn) assign EncodeOut = 5'b11100;
    if (00000000000100000000000000000000 <= EncodeIn) assign EncodeOut = 5'b10111;
    if (00000000001000000000000000000000 <= EncodeIn) assign EncodeOut = 5'b11001;
    if (00000000010000000000000000000000 <= EncodeIn) assign EncodeOut = 5'b11011;
    if (00000000100000000000000000000000 <= EncodeIn) assign EncodeOut = 5'b11101;
	 */
	endcase
	end

endmodule