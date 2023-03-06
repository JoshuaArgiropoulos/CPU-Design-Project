`timescale 1ns/10ps
module DP_SHL_TB;

reg [31:0] enable, busSelect, inPort, MDataIn;
reg clk, clr, MR_Read;
  reg [3:0] Control_Signals;
wire [31:0] busMuxOut;

parameter Default = 4'b0000, Reg_loadla = 4'b0001, Reg_loadlb = 4'b0010, Reg_load2a = 4'b0011, 
             Reg_load2b = 4'b0100, Reg_load3a = 4'b0101, Reg_load3b = 4'b0110, TO = 4'b0111, 
             Tl = 4'b1000, T2 = 4'b1001, T3 = 4'b1010, T4 = 4'b1011, T5 = 4'b1100; 
reg [3:0] Present_state = Default;

     

Datapath DUT(enable, busSelect, inPort, MDataIn, clk, clr, MD_Read, Control_Signals, busMuxOut); 

initial begin

Clock = 0;
            forever #10 Clock = ~ Clock;
        end

    always @(posedge Clock) // finite state machine; if clock rising-edge
        begin
            case (Present_state)
                Default : Present_state = Reg_load1a;
                Reg_load1a : Present_state = Reg_load1b;
                Reg_load1b : Present_state = Reg_load2a;
                Reg_load2a : Present_state = Reg_load2b;
                Reg_load2b : Present_state = Reg_load3a;
                Reg_load3a : Present_state = Reg_load3b;
                Reg_load3b : Present_state = T0;
                T0 : Present_state = T1;
                T1 : Present_state = T2;
                T2 : Present_state = T3;
                T3 : Present_state = T4;
                T4 : Present_state = T5;
            endcase
        end

    always @(Present_state) // do the required job in each state
        begin
            case (Present_state) // assert the required signals in each clock cycle
                Default: begin
                    
                  enable <= 32'h00000000;
                  budSelect <= 32'h00000000;
                  inPort <= 32'h00000000;
                  MDataIn<= 32'h00000000;
                  clr <= 0; 
                  MR_Read <= 0;
                  Control_Signal <= 4'b0000;
                  
                  busMuxOut <= 32'h00000000;
                  
                end
Reg_load1a: begin 
                   
	Mdatain <= 32'h00000001; // 0001
	MR_ Read <= 0; enable <= 0;
	//MR read and MDR enable HI
	#15 MR_Read <= 1; enable <= 21;
	
	#15 MR_Read <= 0; enable <= 0;
	
                end
                Reg_load1b: begin 
			//MDR out and R3 enable HI
			#15 busSelect <= 21; enable <= 3;
			#15 busSelect <= 0; enable <= 0;
                   
                end
                Reg_load2a: begin
                   
			 Mdatain <= 32'h00000002; // 0010
			//MR read and MDR enable HI
			#15 MR_Read <= 1; enable <= 21;
			#15 MR_Read <= 0; enable <= 0;
                end
                Reg_load2b: begin 
			//MDR OUT and R5 enable HI
			#15 busSelect <= 21; enable <= 5;
			#15 busSelect <= 0; enable <= 0;
             // initialize R5 with the value 2
                end
                Reg_load3a: begin
                    
			Mdatain <= 32'h00000003; // 0011
			//MR Read and MDR enable HI
			#15 MR_Read <= 1; enable <= 21;
			#15 MR_Read <= 0; enable <= 0;
                end
                Reg_load3b: begin 
			//MDR OUT and R1 enable HI
			#15 busSelect <= 21; enable <= 1;
			#15 busSelect <= 0; enable <= 0;
               // initialize R0 with the value 3
                end 
                T0: begin
			//PC out, MAR enable, increment PC and PC enable HI
			#15 busSelect <= 20; enable <= 25; enable <= 20; //INC PC ++
			#15 busSelect <= 0; enable <= 0;
			
                end
                T1: begin
			busSelect <= 0; enable <= 21; MR_Read <= 1;
			Mdatain <= 32'h489A8000; // opcode for shl R1, R3, R5
                    
                    
                end
                T2: begin
			//MDR out and IR HI
			#15 busSelect <= 21; enable<= 23;
			
			#15 busSelect <= 0;
                end
                T3: begin
			//R3 out HI and Y enable 
			#15 busSelect <= 3; enable <= 27;
			#15 busSelect <= 0; enable <= 0;
			
			
                end
                T4: begin
			#15 busSelect <= 5; enable <= 24;
			Control_Signals <= 4'd8;
			// SHL signal 
			
			#15 busSelect <= 0;
			
                end
                T5: begin
			//enable low and Zlow out HI
			#15 enable <=0; busSelect <= 19;
			#15 enable <= 1;
			#15 busSelect <= 0;
			#15 enable <= 0;
                end
            endcase
        end
endmodule
