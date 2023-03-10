module RAM_Reg(input Data_Signal[31:0], input Read, input Write, input Address_Signal[31:0], output BusMuxIn);

  reg [31:0] RAM[512]; // 512 32-bit registers for memory storage

  always @ (posedge) begin
    begin 
      if (Write)
        RAM[Address_Signal] <= Data_Signal;
    end
    if (Read)
      BusMuxIn <= RAM[Address_Signal];
    end
   
    

endmodule
