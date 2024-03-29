module multiplication3bit(multiplicand, multiplier, resLo, resHi);
input [31:0] multiplicand, multiplier;
output[31:0] resLo, resHi;
//output [63:0] result;

  reg signed [31:0] multiplicand_reg, multiplier_reg;
  reg signed [61:0] result_reg;
  reg signed [63:0] partial_product;
  reg signed [63:0] temp;
  
  integer i, n, j;
  reg [1:0] bit_pairs;
  integer booth_num[31:0];
  integer three_bit_booth[10:0];
  
 /*
 
 booth thinker
 multiplicand
 multiplier
 
 put above into reg
 make bit pair booth number from multiplier (big for loop?)
 enter loop to create final number
 have a 64 bit num with 32 1's
	shift this each loop and use to or with multiplied multiplicand
 do partial products at eaech stage
 
 var needed 
 bit pair num
 64 bit of 1's (might need zeros too)
 parrtial product var (64 bits)
 might also need a placeholder for multi
 */
 
 always @(*) begin
 partial_product = 0;
 multiplier_reg = multiplier;
 multiplicand_reg = multiplicand;
 
for (i = 0; i <= 31; i = i + 1) begin
	//$display("The value of i is %d", i);
	case(i)
		  0: bit_pairs = multiplier_reg[0] << 1;
        1: bit_pairs = multiplier_reg[1:0];
        2: bit_pairs = multiplier_reg[2:1];
        3: bit_pairs = multiplier_reg[3:2];
        4: bit_pairs = multiplier_reg[4:3];
        5: bit_pairs = multiplier_reg[5:4];
        6: bit_pairs = multiplier_reg[6:5];
        7: bit_pairs = multiplier_reg[7:6];
        8: bit_pairs = multiplier_reg[8:7];
        9: bit_pairs = multiplier_reg[9:8];
        10: bit_pairs = multiplier_reg[10:9];
        11: bit_pairs = multiplier_reg[11:10];
        12: bit_pairs = multiplier_reg[12:11];
        13: bit_pairs = multiplier_reg[13:12];
        14: bit_pairs = multiplier_reg[14:13];
        15: bit_pairs = multiplier_reg[15:14];
        16: bit_pairs = multiplier_reg[16:15];
        17: bit_pairs = multiplier_reg[17:16];
        18: bit_pairs = multiplier_reg[18:17];
        19: bit_pairs = multiplier_reg[19:18];
        20: bit_pairs = multiplier_reg[20:19];
        21: bit_pairs = multiplier_reg[21:20];
        22: bit_pairs = multiplier_reg[22:21];
        23: bit_pairs = multiplier_reg[23:22];
        24: bit_pairs = multiplier_reg[24:23];
        25: bit_pairs = multiplier_reg[25:24];
        26: bit_pairs = multiplier_reg[26:25];
        27: bit_pairs = multiplier_reg[27:26];
        28: bit_pairs = multiplier_reg[28:27];
        29: bit_pairs = multiplier_reg[29:28];
        30: bit_pairs = multiplier_reg[30:29];
        31: bit_pairs = multiplier_reg[31:30];
		  default: bit_pairs = multiplier_reg[0:0];
		  endcase
	case(bit_pairs)
			2'b00: booth_num[i] = 0;
			2'b01: booth_num[i] = 1;
			2'b10: booth_num[i] = -1;
			2'b11: booth_num[i] = 0;
			default: booth_num[i] = 0;
		endcase
		//$display("The value of bit_pairs is %b", bit_pairs);
	//$display("The value of booth_num is %d", booth_num[i]);
	end// for i end
	//$display("The value of booth_num is %p", booth_num);
	
	for (n = 0; n <= 27; n = n + 3) begin 
	if(n==0)three_bit_booth[0] = {booth_num[2]<<2} + {booth_num[1]<<1} + booth_num[0];
	else three_bit_booth[n/3] = {booth_num[n+2] << 2} + {booth_num[n+1] << 1 } + booth_num[n];//{n-1}>>n
	//$display("The value of n is %d", n);
	//$display("The value of booth_num is %d %d %d", booth_num[n+2], booth_num[n+1], booth_num[n]);
	//$display("The value of three_bit_booth is %d", three_bit_booth[n/3]);
		//$display("The value of three_bit_booth is %p", three_bit_booth);

	end // for n loop
	three_bit_booth[10] = {booth_num[31]<<1} + booth_num[30];
	//$display("The value of three_bit_booth is %p", three_bit_booth);
	//$display("The value of booth_num is %p", booth_num);
	//$display("1The value of multiplicand_reg is %b", multiplicand_reg);
	// partial_product = {{32{multiplicand_reg[31]}}, multiplicand_reg};
	//$display("2The value of partial_product is %b", partial_product);
	//$display("The value of partial_product is %b", partial_product);
	//temp = multiplicand_reg * three_bit_booth[0];
	//partial_product = partial_product + {{32{temp[31]}}, temp}; //{ {2{x[5]}}, x } {{32{multiplicand_reg[31]}}, multiplicand_reg}
	//$display("The value of partial_product is %b", partial_product);
	for (j = 0; j <= 9; j = j + 1) begin 
	//$display("The value of j is %d", j);
	
	
	//temp = (multiplicand_reg * three_bit_booth[j]) << 3*j;
	//$display("The value m is %b", multiplicand_reg);
	//$display("The value tbb is %d", three_bit_booth[j]);
	//$display("The value of temp1 is %d", temp);
	case (three_bit_booth[j])
		-4: temp = -(multiplicand_reg << 2);
		-3: temp = -((multiplicand_reg << 1) + multiplicand_reg);
		-2: temp = -(multiplicand_reg << 1);
		-1: temp = -multiplicand_reg;
		0: temp = 0;
		1: temp = multiplicand_reg;
		2: temp = multiplicand_reg << 1;
		3: temp = (multiplicand_reg << 1) + multiplicand_reg;
		4: temp = multiplicand_reg << 2;
      default: temp = 0;
    endcase
	 temp = temp << {(j << 1) + j};
	//$display("The value of temp is %d", temp);
	partial_product = partial_product + temp;
	//partial_product = partial_product + {{31{temp[32]}}, temp};
	//$display("The value of PP is %d", partial_product);
	//partial_product = partial_product + {{32{multiplicand_reg[31]}}, multiplicand_reg} * three_bit_booth[j]; //{ {2{x[5]}}, x }
	end
	//$display("The value of partial_product is %d", partial_product);
	//$display("The value of multiplicand is %d", multiplicand_reg);
	//$display("The value of multiplier is %d", multiplier_reg);
 end
 assign resLo = partial_product[31:0];
 assign resHi = partial_product[63:32];

 endmodule
 