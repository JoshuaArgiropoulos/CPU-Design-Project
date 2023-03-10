module RAM_Reg_TB();

  // Inputs
  reg clk;
  reg [31:0] Data_Signal;
  reg Read;
  reg Write;
  reg [31:0] Address_Signal;

  // Outputs
  wire [31:0] BusMuxIn;

 
  RAM_Reg  RAM_reg_test(
    .clk(clk),
    .Data_Signal(Data_Signal),
    .Read(Read),
    .Write(Write),
    .Address_Signal(Address_Signal),
    .BusMuxIn(BusMuxIn)
  );

  // Clock generation
  always #5 clk = ~clk;

  initial begin
    clk <= 0;
    Data_Signal <= 32'h12345678;
    Write <= 1;
    Address_Signal <= 8'h00;
    #10;
    Write <= 0;
    Read <= 1;
    #10;
   
    Read <= 0;
  end
endmodule
