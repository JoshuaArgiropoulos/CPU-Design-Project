module RAM_Reg(
  input clk,
  input [31:0] Data_Signal,
  input Read,
  input Write,
  input [31:0] Address_Signal,
  output reg [31:0] BusMuxIn
);

  reg [31:0] RAM[512]; // 512 32-bit registers for memory storage

  always @(posedge clk) begin 
    if (Write) begin
      RAM[Address_Signal] <= Data_Signal;
    end
    if (Read) begin
      BusMuxIn <= RAM[Address_Signal];
    end
  end
	 
endmodule

