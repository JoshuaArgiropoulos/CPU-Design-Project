module Datapath (
    input clk,
    input clr,
    input [31:0] enable,
    input [31:0] inPort,
    output [31:0] outPort
);
//LOOK TO FIX
    // Registers
    //reg [31:0] PC;
    //reg [31:0] IR;
    reg [31:0] R[15:0]; // fix size to 16
    reg MD_Read;
    reg Mdatain[31:0];
    reg Control_Signals[3:0];
    // Additional registers
   // reg [31:0] Hi;
   // reg [31:0] Lo;

    // Wires
    wire [4:0] EncodeOut;
    wire [31:0] BusMuxOut;
    wire [31:0] SignExtended;
    wire [31:0] ALUResult;
    wire [31:0] MDMuxOutput;

    // Modules
    //LOOK TO FIX
    Register PC_inst(clk, clr, enable, PC, PC_Out);
    Register IR_inst(clk, clr, enable, IR, IR_Out);
    
    Register64bit Z_inst(clk, clr, enable, ALUout);
    
    Register HI_inst(clk, clr, enable, BusMuxOut);
    Register LO_inst(clk, clr, enable, BusMuxOut);
    Register Y_inst(clk, clr, enable, BusMuxOut[31:0]);
    Register MAR(clk, clr, enable, BusMuxOut);
   

    Register R0_inst(clk, clr, enable[0], BusMuxOut,R0_Out);
    Register R1_inst(clk, clr, enable[1], BusMuxOut,R1_Out);
    Register R2_inst(clk, clr, enable[2], BusMuxOut,R2_Out);
    Register R3_inst(clk, clr, enable[3], BusMuxOut,R3_Out);
    Register R4_inst(clk, clr, enable[4], BusMuxOut,R4_Out);
    Register R5_inst(clk, clr, enable[5], BusMuxOut,R5_Out);
    Register R6_inst(clk, clr, enable[6], BusMuxOut,R6_Out);
    Register R7_inst(clk, clr, enable[7], BusMuxOut,R7_Out);
    Register R8_inst(clk, clr, enable[8], BusMuxOut,R8_Out);
    Register R9_inst(clk, clr, enable[9], BusMuxOut,R9_Out);

    Register R10_inst(clk, clr, enable[10], BusMuxOut,R10_Out);
    Register R11_inst(clk, clr, enable[11], BusMuxOut,R11_Out);
    Register R12_inst(clk, clr, enable[12], BusMuxOut,R12_Out);
    Register R13_inst(clk, clr, enable[13], BusMuxOut,R13_Out);
    Register R14_inst(clk, clr, enable[14], BusMuxOut,R14_Out);
    Register R15_inst(clk, clr, enable[15], BusMuxOut,R15_Out);
    
    // Instantiate ALU module
    
    ALU ALU_inst(Y_inst, BusMuxOut, Control_Signals[3:0], ALUOut);

    ConnectedBus BusInst(inPort, R0_Out, R1_Out, R2_Out, R3_Out,R4_Out, R5_Out, R6_Out, R7_Out, R8_Out, R9_Out, R10_Out, R11_Out, R12_Out, R13_Out, R14_Out, R15_Out, Hi, Lo, PC, IR, inPort, SignExtended, BusMuxOut, EncodeOut);
    
    MDMux MDMux_inst(BusMuxOut, Mdatain, MD_Read, MDMuxOutput);

    MDR MdrReg(MDMuxOutput, clr, clk, enable, MDROut);
    
endmodule
