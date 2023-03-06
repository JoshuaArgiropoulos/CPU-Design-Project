//Unsure of ROR
`timescale 1ns/10ps
module DP_ROR_TB;

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

clk = 0;
forever #10 clk = ~clk;

end

always @(posedge clk) begin
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

always @(Present_state) begin
  case(Present_state)
    Default:begin
      enable <= 32'h00000000;
      busSelect<= 32'h00000000;
      inPort <= 32'h00000000;
      MDataIn<= 32'h00000000; 
      clk <= 0;
      clr <= 0;
      MR_Read <= 0;
      control_Singnals <= 4'b0000;
      busMuxOut <= 32'h00000000;
     end
     
     Reg_load1a: begin 
                    Mdatain <= 32'h00000001;
                    MR_Read <= 0;
                    enable <=0;
                    
                    #15 MR_Read <= 1;
                    //Set MDR enable
                    enable <=21;
       
                    #15 MR_Read <= 0; enable <= 0;
                   
                end
                Reg_load1b: begin 
                  //MDR out and R3 enable are HI
                    #15 busSelect <= 21; enable <= 3;
                  
                    #15 busSelect <= 0; enable <= 0; 
                end
                Reg_load2a: begin
                    Mdatain <= 32'h00000004; 
                    //Set MR_Read and MDR enable HI
                    #15 MR_Read <= 1; enable <=21;
                    
                    #15 MR_Read <= 0; enable 0;
                  
                end
                Reg_load2b: begin 
                  
                  //MDR out and R5 enable HI
                  
                    #15 busSelect <= 21; enable <= 5;
                  
                  
                    #15 busSelect <= 0; enable <= 0; 
                  
                end
                Reg_load3a: begin
                    Mdatain <= 32'h00000003; 
                  
                    //MR Read and MDR enable HI
                  
                    #15 MR_Read <= 1; enable <=21;
                  
                    #15 MR_Read <= 0; enable <=0;
                  
                end
                Reg_load3b: begin
                  //MDR out and R1 enable HI
                  #15 busSelect <= 21; enable <=1;
                  
                  #15 busSelect <= 0; enable <=0;
                    
                end 
                T0: begin
                  //PC Out, MAR enable increment PC and PC enable HI
                  #15 busSelect <= 20; enable <= 25; enable <= 20; //IncPC ++
                  
                  #15 busSelect <= 0; enable 0;
                  
          
                end
                T1: begin
                  //Clears PC out, sets MDR enable and MR read HI
                  #15 busSelect <= 0; enable <= 21; MR_Read <= 1; 
			Mdatain <= 32'h389A8000; // opcode for shr R1, R3, R5
                  
                end
                T2: begin
                  //MDR Out and IR enable HI
                  #15 busSelect <= 21; enable <= 23;
                  
                   #15 busSelect <= 0;
                  
                end
                T3: begin
                  //R3 out and Y enable set HI
                  #15 busSelect <= 3; enable <=27;
					
                  #15 busSelect <= 0; enable <= 0;
                   
                end
                T4: begin
			//Set R5 out, Z enable HI
			#15 busSelect <= 5; enable <= 24;
			Control_Signals <= 4'd9;
			// ROR signal 
			#15 busSelect <= 0;
                   
                end
                T5: begin
			
			enable <= 0; 
			//Zlow out is HI
			busSelect <= 19;
			//R1 enable is HI
			#15 enable <= 1; 
			#15 busSelect <= 0; enable <= 0;
                    
                end
            endcase


end
endmodule
