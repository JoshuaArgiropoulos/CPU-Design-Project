`timescale 1ns/10ps
module DP_MUL_TB;

reg [31:0] enable, busSelect, inPort, MDataIn;
reg clk, clr, MD_Read;
reg [3:0] Control_Signals;
wire [31:0] busMuxOut, r1, r2, r3, mdr, zhi, zlo, pc;//, hi, lo, temp;
//wire [63:0] temp;

parameter Default = 4'b0000, Reg_load1a = 4'b0001, Reg_load1b = 4'b0010, Reg_load2a = 4'b0011, 
			 Reg_load2b = 4'b0100, Reg_load3a = 4'b0101, Reg_load3b = 4'b0110, T0 = 4'b0111, 
			 T1 = 4'b1000, T2 = 4'b1001, T3 = 4'b1010, T4 = 4'b1011, T5 = 4'b1100, T6 = 4'b1101;
reg [3:0] Present_state = Default;

	 

datapath DUT(enable, busSelect, inPort, MDataIn, clk, clr, MD_Read, /*IncPC,*/ Control_Signals, busMuxOut, r1, r2, r3, mdr, zhi, zlo, pc);//, hi, lo, temp); 

initial begin

clk = 0;
forever #10 clk = ~clk;

end

always @(posedge clk) begin
	case(Present_state)
		Default : Present_state = Reg_load1a;
		Reg_load1a :#40 Present_state = Reg_load1b;
		Reg_load1b :#40 Present_state = Reg_load2a;
		Reg_load2a :#40 Present_state = Reg_load2b;
		Reg_load2b :#40 Present_state = Reg_load3a;
		Reg_load3a :#40 Present_state = Reg_load3b;
		Reg_load3b :#40 Present_state = T0;
		T0 :#40 Present_state = T1;
		T1 :#40 Present_state = T2;
		T2 :#40 Present_state = T3;
		T3 :#40 Present_state = T4;
		T4 :#40 Present_state = T5;
		T5 :#40 Present_state = T6;
	endcase
end

    always @(Present_state) // do the required job in each state
        begin
            case (Present_state) // assert the required signals in each clock cycle
                Default: begin
                    
                  enable <= 32'h00000000;
                  busSelect <= 32'h00000000;
                  inPort <= 32'h00000000;
                  MDataIn<= 32'h00000000;
                  clr <= 0; 
                  MD_Read <= 0;
                  Control_Signals <= 4'b0000;

                end
              Reg_load1a: begin 
		      MDataIn <= 32'b10; //In binary 0010
		      MD_Read <= 0; enable[21] <= 0;
		      //MR Read and MDR enable HI
		      #10 MD_Read <= 1; enable[21] <= 1;
		      #15 MD_Read <= 0; enable[21] <= 0;         
               
                end
                Reg_load1b: begin 
                  //MDR Out and r6 enable hi
			#10 busSelect[21] <= 1; enable[1] <= 1;
			#15 busSelect[21] <= 0; enable[1] <= 0;
                  //initialize R6 with the value 12
                end
                Reg_load2a: begin
                    MDataIn <= 32'b100; // Place 0010 into MdataIn
                  //MR read and MDR enable hi
			#10 MD_Read <= 1; enable[21] <= 1;
			#15 MD_Read <= 0; enable[21] <= 0;
                  
                end
                Reg_load2b: begin 
                  //MDR out and R7 enable select HI
			#15 busSelect[21] <= 1; enable[2] <= 1;
			#15 busSelect[21] <= 0; enable[2] <= 0;
                  //initialize R7 with the value 2
                end
                T0: begin
								#10 busSelect[20] <= 1;//PC
								enable[25] <= 1;//MAR
								enable[19] <= 1;//incPC bit is bit 28
								enable[18] <= 1;//Zin
								#15 busSelect[20] <= 0;
								enable[25] <= 0;//MAR
								enable[19] <= 0;//incPC bit is bit 28
								enable[17] <= 0;//Zin
                    
                end
                T1: begin
			
						#10 busSelect[19] <= 1;
						enable[20] <= 1;
						MD_Read <= 1;
						enable[21] <= 1;
									MDataIn <= 32'h78900000; //opcode for: mul R6, R7
						#15		
						busSelect[19] <= 0;
						enable[20] <= 0;
						MD_Read <= 0;	
						enable[21] <= 0;	
                end
                T2: begin
			//MDR out and IR enable HI
			#10 busSelect[21] <= 1; enable[24] <= 1;
			#15 busSelect[21] <= 0; enable[24]<= 0;
                   
                end
                T3: begin
			//R6 out and Y enable HI
			#10 busSelect[1] <= 1; enable[19] <= 1;
			#15 busSelect[1] <= 0; enable[19] <= 0;
                end
                T4: begin
			//R7 out, Z enable HI
			#10 busSelect[2] <= 1; enable[18]<= 1; Control_Signals <= 4'd12; // Mul control signal 
			#15 busSelect[2] <= 0; enable[18] <= 0; Control_Signals <= 0;
                end
                T5: begin
			//Zlow out HI, LO enable 
			#10 busSelect[19] <= 1; enable[17] <= 1;
			
			#15 busSelect[19] <= 0; enable[17] <= 0;
			
                end
                T6: begin
			//Z high out HI
			#10 busSelect[18] <= 1; enable[16] <= 1;
			#15 busSelect[18] <= 0; enable[16] <= 0;
                end
            endcase
        end
endmodule
