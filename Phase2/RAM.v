module RAM(
  input clk,
  input Read,
  input Write,
  input [8:0] AddressSignal, // from MAR
  input [31:0] DataIn,
  output [31:0] DataOut
);
  integer i;
  reg [31:0] RAM[511:0]; 
  initial begin
		$readmemh("RamInit.hex", RAM);
		for (i = 0; i < 5; i = i + 1) begin
        $display("RAM[%0d] = %h", i, RAM[i]);
		end
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
