module Datapath (
	 input [31:0] enable, busSelect, inPort, MDataIn
    input clk, clr, MR_Read,
    input [3:0] control_Signals,
    output [31:0] busMuxOut
);
//LOOK TO FIX
    // Registers
    //reg [31:0] PC;
    //reg [31:0] IR;
    reg [31:0] R[15:0]; // fix size to 16
    //reg MD_Read;
    //reg Mdatain[31:0];
    //reg Control_Signals[3:0];
    // Additional registers
   // reg [31:0] Hi;
   // reg [31:0] Lo;

    // Wires
    //wire [4:0] EncodeOut;
    //wire [31:0] BusMuxOut;
    //wire [31:0] SignExtended;
    //wire [31:0] ALUResult;
    //wire [31:0] MDMuxOutput;
	
	 
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
	 
	 wire [31:0] yOut;
	 //wire [63:0] ZOut;
	 
	 wire [31:0] BusMuxIn_HI;
	 wire [31:0] BusMuxIn_LO;
	 wire [31:0] BusMuxIn_ZHI;
	 wire [31:0] BusMuxIn_ZLO;
	 wire [31:0] BusMuxIn_PC;
	 wire [31:0] BusMuxIn_MDR;
	 wire [31:0] BusMuxIn_MAR;
	 wire [31:0] BusMuxIn_INPORT;
	 wire [31:0] BusMuxIn_OUTPORT;
	 wire [31:0] CSignExtended;
	 ///wire [31:0] internalALUOutZHI;
	 //wire [31:0] internalALUOutZLO;
	 //wire [31:0] internalBusMuxOut;
    
	 
	 // Modules
	 
	 
	 
    //LOOK TO FIX
   
   

    Register R0(clk, clr, enable[0], BusMuxOut, BusMuxIn_R0);
    Register R1(clk, clr, enable[1], BusMuxOut, BusMuxIn_R1);
    Register R2(clk, clr, enable[2], BusMuxOut, BusMuxIn_R);
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
	 Register ZHI(clk, clr, enable[18], BusMuxOut, BusMuxIn_ZHI);
    Register ZLO(clk, clr, enable[19], BusMuxOut, BusMuxIn_ZLO);
	 Register PC(clk, clr, enable[20], PC, BusMuxIn_PC);
    Register MAR(clk, clr, enable, BusMuxOut, BusMuxIn_MDR);
	 Register Y(clk, clr, enable, BusMuxOut, YOut);
	 
    // Instantiate ALU module
    
    ALU ALUPath(Y, BusMuxOut, Control_Signals[3:0], ZOut);
	 

    //ConnectedBus BusInst(inPort, BusMuxIn_R0, R1_Out, R2_Out, R3_Out,R4_Out, R5_Out, R6_Out, R7_Out, R8_Out, R9_Out, R10_Out, R11_Out, R12_Out, R13_Out, R14_Out, R15_Out, Hi, Lo, PC, IR, inPort, SignExtended, BusMuxOut, EncodeOut);
    
    //MDMux MDMux(BusMuxOut, Mdatain, MD_Read, MDMuxOutput);

    MDR MdrReg(MDMuxOutput, clr, clk, enable[21], MDROut);
    
	 Register INPORT(clk, clr, enable[22], InPortData, BusMuxIn_INPORT);
	 
	 
	 //idk about these
	 Register IR(clk, clr, enable[23], busMuxOut, BusMuxIn_IR);
    
    Register64bit Z(clk, clr, enable[24], ZOut, ZHI, ZLO);
	 
	 Register MAR(clk, clr, enable[25], busMuxOut;
	 Register INPORT(clk, clr, enable[26], busMuxOut, BusMuxIn_OUTPORT);
	 
	 Bus dpBus(busSelect, BusMuxIn_R0, BusMuxIn_R1, BusMuxIn_R2, BusMuxIn_R3,
	 BusMuxIn_R4, BusMuxIn_R5, BusMuxIn_R6, BusMuxIn_R7, BusMuxIn_R8,
	 BusMuxIn_R9, BusMuxIn_R10, BusMuxIn_R11, BusMuxIn_R12, BusMuxIn_R13,
	 BusMuxIn_R14, BusMuxIn_R15, BusMuxIn_HI, BusMuxIn_LO, BusMuxIn_ZHI,
	 BusMuxIn_ZLO, BusMuxIn_PC, BusMuxIn_MDR, BusMuxIn_INPORT, CSignExtended, BusMuxOut)
	 
endmodule
