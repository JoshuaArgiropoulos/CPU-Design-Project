module datapath (
	 //input clk, clr, MD_Read, Gra, Grb, Grc, Rin, Rout, BAout, WriteRAM, ReadRAM,
	//For CU
	input clk, clr, Stop,
	input [31:0] InPortData,
	 //input [31:0] enable, busSelect, InPortData,
    //input [4:0] Control_Signals,
    output [31:0] TrueBusMuxOut, OutputUnit, 
	 output wire [31:0] r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, r11, r12, r13, r14, r15, mdr, zhi, zlo, pc, ir,
	 output wire CONFFOut
);

	//For CU
	wire MD_Read, Gra, Grb, Grc, Rin, Rout, BAout, WriteRAM, ReadRAM;
	wire [31:0] enable, busSelect;
	wire [4:0] Control_Signals;
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
	 
	 wire [31:0] RAMOut;
	 wire [8:0] AddressSignalRAM;
	 
	 wire [31:0] IROut;
	 wire [15:0] regsIn;
	 wire [15:0] regsOut;
	 
   assign r0 = BusMuxIn_R0;
   assign r1 = BusMuxIn_R1;
	assign r2 = BusMuxIn_R2;
	assign r3 = BusMuxIn_R3;
	assign r4 = BusMuxIn_R4;
	assign r5 = BusMuxIn_R5;
	assign r6 = BusMuxIn_R6;
	assign r7 = BusMuxIn_R7;
	assign r8 = BusMuxIn_R8;
	assign r9 = BusMuxIn_R9;
	assign r10 = BusMuxIn_R10;
	assign r11 = BusMuxIn_R11;
	assign r12 = BusMuxIn_R12;
	assign r13 = BusMuxIn_R13;
	assign r14 = BusMuxIn_R14;
	assign r15 = BusMuxIn_R15;
	
	assign mdr = BusMuxIn_MDR;
	assign zhi = BusMuxIn_ZHI;
	assign zlo = BusMuxIn_ZLO;
	assign pc = BusMuxIn_PC;
	assign ir = IROut;
	assign TrueBusMuxOut = BusMuxOut;
	
	 RevisedR0 R0 (clk, clr, regsIn[0] | enable[0], BAout, BusMuxOut, BusMuxIn_R0);
    Register R1(clk, clr, regsIn[1] | enable[1], BusMuxOut, BusMuxIn_R1);
    Register R2(clk, clr, regsIn[2] | enable[2], BusMuxOut, BusMuxIn_R2);
    Register R3(clk, clr, regsIn[3] | enable[3], BusMuxOut, BusMuxIn_R3);
    Register R4(clk, clr, regsIn[4] | enable[4], BusMuxOut, BusMuxIn_R4);
    Register R5(clk, clr, regsIn[5] | enable[5], BusMuxOut, BusMuxIn_R5);
    Register R6(clk, clr, regsIn[6] | enable[6], BusMuxOut, BusMuxIn_R6);
    Register R7(clk, clr, regsIn[7] | enable[7], BusMuxOut, BusMuxIn_R7);
    Register R8(clk, clr, regsIn[8] | enable[8], BusMuxOut, BusMuxIn_R8);
    Register R9(clk, clr, regsIn[9] | enable[9], BusMuxOut, BusMuxIn_R9);
    Register R10(clk, clr, regsIn[10] | enable[10], BusMuxOut, BusMuxIn_R10);
    Register R11(clk, clr, regsIn[11] | enable[11], BusMuxOut, BusMuxIn_R11);
    Register R12(clk, clr, regsIn[12] | enable[12], BusMuxOut, BusMuxIn_R12);
    Register R13(clk, clr, regsIn[13] | enable[13], BusMuxOut, BusMuxIn_R13);
    Register R14(clk, clr, regsIn[14] | enable[14], BusMuxOut, BusMuxIn_R14);
    Register R15(clk, clr, regsIn[15] | enable[15], BusMuxOut, BusMuxIn_R15);
    
    Register HI(clk, clr, enable[16], BusMuxOut, BusMuxIn_HI);
    Register LO(clk, clr, enable[17], BusMuxOut, BusMuxIn_LO);
	 Register64bit Z(clk, clr, enable[18], ZOut, BusMuxIn_ZHI, BusMuxIn_ZLO); //was 24
	 Register Y(clk, clr, enable[19], BusMuxOut, YOut);
	 
	 Register PC(clk, clr, enable[20], BusMuxOut, BusMuxIn_PC);
	 
    MDR MdrReg(RAMOut, BusMuxOut, clr, clk, enable[21], MD_Read, BusMuxIn_MDR); //output change from BusMuxOut

	 Register IR(clk, clr, enable[24], BusMuxOut, IROut); // was 27
	 Register MAR(clk, clr, enable[25], BusMuxOut, AddressSignalRAM);
	 //Register OUTPORT(clk, clr, enable[26], IROut);
	 
    ALU ALUPath(YOut, BusMuxOut, Control_Signals[4:0], ZOut);
	 
	 selectAndEncode sae(Gra, Grb, Grc, Rin, Rout, BAout, IROut, regsIn, regsOut, CSignExtended);
	 RAM RAMdp(clk, ReadRAM, WriteRAM, AddressSignalRAM, BusMuxOut, RAMOut); //not sure about outputs here
	 
	 CONFFLogic CFF(enable[27], IROut, BusMuxOut, CONFFOut);
	 
	 Inport inprt(clr, clk, InPortData, BusMuxIn_INPORT);
	 Outport otprt(clr, clk, enable[28], BusMuxOut, OutputUnit);
	 
	 ConnectedBus dpBus(busSelect | regsOut, BusMuxIn_R0, BusMuxIn_R1, BusMuxIn_R2, BusMuxIn_R3,
	 BusMuxIn_R4, BusMuxIn_R5, BusMuxIn_R6, BusMuxIn_R7, BusMuxIn_R8,
	 BusMuxIn_R9, BusMuxIn_R10, BusMuxIn_R11, BusMuxIn_R12, BusMuxIn_R13,
	 BusMuxIn_R14, BusMuxIn_R15, BusMuxIn_HI, BusMuxIn_LO, BusMuxIn_ZHI,
	 BusMuxIn_ZLO, BusMuxIn_PC, BusMuxIn_MDR, BusMuxIn_INPORT, CSignExtended, BusMuxOut);
  
  ControlUnit CU(MD_Read, Gra, Grb, Grc, Rin, Rout, BAout, WriteRAM, ReadRAM, run, enable, busSelect, Control_Signals, IROut, InPortData, CONFFOut, clk, clr, Stop);
	 
endmodule
