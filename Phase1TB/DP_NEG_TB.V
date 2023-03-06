`timescale 1ns/10ps
module DP_NEG_TB;

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
                 Mdatain <= 32'h00000012; //In binary 10010
              
                MR_Read <= 0; enable <= 0;
                //MR Read and MDR enable HI
		      #15 MR_Read <= 1; enable[21] <= 1;
		      #15 MR_Read <= 0; enable[21] <= 0;
                
                end
                Reg_load1b: begin 
                  //MR Out and R2 enable HI
			#15 busSelect[21] <= 1; enable[2] <= 1;
			#15 busSelect[21] <= 0; enable[2] <= 0;
                  // initialize R2 with the value 12
                 
                end
                Reg_load2a: begin
                    Mdatain <= 32'h00000014; //10100
                  //MR read and MDR enable HI
			#15 MR_Read <= 1; enable[21] <= 1;
                  
			#15 MR_Read <= 0; enable[21] <= 0;
                  
                  
                end
                Reg_load2b: begin 
                  	//MDR out and R3 enable is HI
			#15 busSelect[21] <= 1; enable[3] <= 1;
			#15 busSelect[21] <= 0; enable[3] <= 0;
                    // initialize R3 with the value 14
                  
                  
		
                end
                Reg_load3a: begin
                    Mdatain <= 32'h00000018; //11000
                    //MR Read and MDR enable HI
			#15 MR_Read <= 1; enable[21] <= 1;
			#15 MR_Read <= 0; enable[21] <= 0;
			
                end
                Reg_load3b: begin
                    
			              //MDR out and R1 enable HI
			#15 busSelect[21] <= 1; enable[1] <= 1;
			#15 busSelect[21] <= 0; enable[1] <= 0;
			              // initialize R1 with the value 18
                end 
                T0: begin
			              //PC out, MAR enable, increment PC and PC enable HI
			#15 busSelect[20] <= 1; enable[25] <= 1; enable[20]<= 1; // PC INC
			#15 busSelect[20] <= 0; enable[25] <= 0; enable [20] <= 0// INC PC = 0;
                end
                T1: begin
                    //MDR enable, MR read HI
			enable[21] <= 1; MR_Read <= 1;
			               Mdatain <= 32'h90080000; // opcode for not R1, R2, R3
                   
                   
                end
                T2: begin
			              //MDR out and IR enable HI
			#15 busSelect[21] <= 1; enable[23] <= 1;
			#15 busSelect[21] <= 0; enable[23] <= 0;
                end
                T3: begin
                    Control_Signals <= 4'd5;
			//Neg control signal 
			              
			              //R1 out and Z enable HI
			#15 busSelect[1] <= 1; enable[24] <= 1;
                    
                end
            endcase
        end
endmodule
