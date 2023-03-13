module CONFFLogic(input enable, input [31:0] IRIn, input [31:0] BusMuxIn, output [31:0] ControlUnitOut);
	reg [3:0] Ra;
	
	reg [31:0] Bit0;
	reg [31:0] Bit1;
	reg [31:0] Bit2;
	reg [31:0] Bit3;
	always @(*)
begin
    case([20:19] IRIn)
        2'b00: Ra = 4'b0001;
        2'b01: Ra = 4'b0010;
        2'b10: Ra = 4'b0100;
        2'b11: Ra = 4'b1000;
        default: Ra = 4'b0000;
    endcase
	 
	 if (Ra[0]) begin
	 //BRZR
	 else if (Ra[1]) begin
	 //BRNZ
	 else if (Ra[2]) begin
	 //BRPL
	 else if (Ra[3]) begin
	 //BRMI
	 
	 Bit0 <= Ra[0] & ;
	 Bit1 <= Ra[0] & ~;
	 Bit2 <= Ra[0] & ~IRIn[31];
	 Bit3 <= Ra[0] & IRIn[31];
	 
	 
	if (enable)
		temp1 <= temp2;
	
	
	
	
		assign ControlUnitOut = *****HOLDER******;

endmodule
