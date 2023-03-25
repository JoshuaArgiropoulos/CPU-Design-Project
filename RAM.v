module RAM(
  input clk,
  input Read,
  input Write,
  input [8:0] AddressSignal,
  input [31:0] DataIn,
  output reg[31:0] DataOut
);
  integer i;
  reg [31:0] RAM[511:0]; 
  initial begin
		$readmemh("RamInit.hex", RAM);
  end
  
  always @(posedge clk) begin 
    if (Write) begin
      RAM[AddressSignal] <= DataIn;
    end
    if (Read) begin
      DataOut <= RAM[AddressSignal];
    end
  end
	
endmodule
