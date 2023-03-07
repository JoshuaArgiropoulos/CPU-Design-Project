module datapath (
	 input [31:0] enable, busSelect, inPort, MDataIn,
    input clk, clr, MD_Read, IncPC,
    input [3:0] Control_Signals,
    output [31:0] TrueBusMuxOut, 
	 output wire [31:0] r1, r2, r3, mdr, zhi, zlo, pc, hi, lo, temp
);

	
	 
	 //connect registers output to bus mux
	 wire [31:0] BusMuxIn_R0;
	 wire [31:0] BusMuxIn_R1;
	 wire [31:0] BusMuxIn_R2;
	 wire [31:0] BusMuxIn_R3;
	 wire [31:0] BusMuxIn_R4;
	 wire [31:0] BusMuxIn_R5;
	 wire [31:0] BusMuxIn_R6;
	 wire [31:0] BusMuxIn_R7;
	 wire [31:0] BusMuxIn_R8;
	 wire [31:0] BusMuxIn_R9;
	 wire [31:0] BusMuxIn_R10;
	 wire [31:0] BusMuxIn_R11;
	 wire [31:0] BusMuxIn_R12;
	 wire [31:0] BusMuxIn_R13;
	 wire [31:0] BusMuxIn_R14;
	 wire [31:0] BusMuxIn_R15;
	 
	 wire [31:0] YOut;
	 wire [63:0] ZOut;
	 
	 wire [31:0] BusMuxIn_HI;
	 wire [31:0] BusMuxIn_LO;
	 wire [31:0] BusMuxIn_ZHI;
	 wire [31:0] BusMuxIn_ZLO;
	 wire [31:0] BusMuxIn_ZRHI;
	 wire [31:0] BusMuxIn_ZRLO;
	 wire [31:0] BusMuxIn_PC;
	 wire [31:0] BusMuxIn_MDR;
	 wire [31:0] BusMuxIn_MAR;
	 wire [31:0] BusMuxIn_INPORT;
	 wire [31:0] BusMuxIn_OUTPORT;
	 wire [31:0] CSignExtended;
     wire [31:0] BusMuxOut;
	 
	 // Modules
	 
	 
	 
    //LOOK TO FIX
   
   assign r1 = BusMuxIn_R1;
	assign r2 = BusMuxIn_R2;
	assign r3 = BusMuxIn_R3;
	assign mdr = BusMuxIn_MDR;
	assign zhi = BusMuxIn_ZRHI;
	assign zlo = BusMuxIn_ZRLO;
	assign pc = BusMuxIn_PC;
	assign hi = BusMuxIn_HI;
	assign lo = BusMuxIn_LO;
	assign temp = BusMuxIn_ZLO;
	assign TrueBusMuxOut = BusMuxOut;
	

    Register R0(clk, clr, enable[0], BusMuxOut, BusMuxIn_R0);
    Register R1(clk, clr, enable[1], BusMuxOut, BusMuxIn_R1);
    Register R2(clk, clr, enable[2], BusMuxOut, BusMuxIn_R2);
    Register R3(clk, clr, enable[3], BusMuxOut, BusMuxIn_R3);
    Register R4(clk, clr, enable[4], BusMuxOut, BusMuxIn_R4);
    Register R5(clk, clr, enable[5], BusMuxOut, BusMuxIn_R5);
    Register R6(clk, clr, enable[6], BusMuxOut, BusMuxIn_R6);
    Register R7(clk, clr, enable[7], BusMuxOut, BusMuxIn_R7);
    Register R8(clk, clr, enable[8], BusMuxOut, BusMuxIn_R8);
    Register R9(clk, clr, enable[9], BusMuxOut, BusMuxIn_R9);

    Register R10(clk, clr, enable[10], BusMuxOut, BusMuxIn_R10);
    Register R11(clk, clr, enable[11], BusMuxOut, BusMuxIn_R11);
    Register R12(clk, clr, enable[12], BusMuxOut, BusMuxIn_R12);
    Register R13(clk, clr, enable[13], BusMuxOut, BusMuxIn_R13);
    Register R14(clk, clr, enable[14], BusMuxOut, BusMuxIn_R14);
    Register R15(clk, clr, enable[15], BusMuxOut, BusMuxIn_R15);
    
	 
    
    
    Register HI(clk, clr, enable[16], BusMuxOut, BusMuxIn_HI);
    Register LO(clk, clr, enable[17], BusMuxOut, BusMuxIn_LO);
	 Register ZHI(clk, clr, enable[18], BusMuxIn_ZHI, BusMuxIn_ZRHI);
    Register ZLO(clk, clr, enable[19], BusMuxIn_ZLO, BusMuxIn_ZRLO);
	 Register PC(clk, clr, enable[20], IncPC, BusMuxIn_PC);
    //Register MAR(clk, clr, enable, BusMuxOut, BusMuxIn_MDR);
 
    MDR MdrReg(MDataIn, BusMuxOut, clr, clk, enable[21], MD_Read, BusMuxIn_MDR);
    //input [31:0] Mdatain, BusMuxOut, input clr, clk, enable, output [31:0] Q
	 Register INPORT(clk, clr, enable[22], InPortData, BusMuxIn_INPORT);
	 
	 
	 //idk about these
	 Register IR(clk, clr, enable[23], BusMuxOut, BusMuxIn_IR);
    
    Register64bit Z(clk, clr, enable[24], ZOut, BusMuxIn_ZHI, BusMuxIn_ZLO);
	 
	 Register MAR(clk, clr, enable[25], BusMuxOut);
	 Register OUTPORT(clk, clr, enable[26], BusMuxOut, BusMuxIn_OUTPORT);
	 Register Y(clk, clr, enable[27], BusMuxOut, YOut);
	 
	  // Instantiate ALU module
    
    ALU ALUPath(YOut, BusMuxOut, Control_Signals[3:0], ZOut);
	 
	 ConnectedBus dpBus(busSelect, BusMuxIn_R0, BusMuxIn_R1, BusMuxIn_R2, BusMuxIn_R3,
	 BusMuxIn_R4, BusMuxIn_R5, BusMuxIn_R6, BusMuxIn_R7, BusMuxIn_R8,
	 BusMuxIn_R9, BusMuxIn_R10, BusMuxIn_R11, BusMuxIn_R12, BusMuxIn_R13,
	 BusMuxIn_R14, BusMuxIn_R15, BusMuxIn_HI, BusMuxIn_LO, BusMuxIn_ZHI,
	 BusMuxIn_ZLO, BusMuxIn_PC, BusMuxIn_MDR, BusMuxIn_INPORT, CSignExtended, BusMuxOut);
	 
endmodule
