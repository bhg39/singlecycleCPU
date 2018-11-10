module myiram6(CLK, RESET, ADDR, Q);
  input         CLK;
  input         RESET;
  input  [7:0]  ADDR;
  output [15:0] Q;

  reg    [15:0] mem[0:127]; // instruction memory with 16 bit entries

  wire   [6:0]  saddr;
  integer       i;

  assign saddr = ADDR[7:1];
  assign Q = mem[saddr];

  always @(posedge CLK) begin
    if(RESET) begin

      // data goes here
      mem[0] <= 16'b1111000000000001; //   SUB R0, R0, R0
      mem[1] <= 16'b1111010010010001; //   SUB R2, R2, R2
      mem[2] <= 16'b1111001001001001; //   SUB R1, R1, R1
      mem[3] <= 16'b1111111111111001; //   SUB R7, R7, R7
      mem[4] <= 16'b1111110110110001; //   SUB R6, R6, R6
      mem[5] <= 16'b0101000101111111; //   ADDI R5, R0, -1
      mem[6] <= 16'b1111101000101011; //   SRL R5, R5
      mem[7] <= 16'b0010000011111011; //   LB R3, -5(R0)
      mem[8] <= 16'b0110011011000001; //   ANDI R3, R3, 1
      mem[9] <= 16'b0010000100111011; // monitor_loop:  LB R4, -5(R0)
      mem[10] <= 16'b0110100100000001; //   ANDI R4, R4, 1
      mem[11] <= 16'b1111100011011000; //   ADD R3, R4, R3
      mem[12] <= 16'b0110011011000001; //   ANDI R3, R3, 1
      mem[13] <= 16'b1111011100011101; //   AND R3, R3, R4
      mem[14] <= 16'b1111010011010000; //   ADD R2, R2, R3
      mem[15] <= 16'b1111100000011000; //   ADD R3, R4, R0
      mem[16] <= 16'b0101111111111111; //   ADDI R7, R7, -1
      mem[17] <= 16'b1001000111111000; //   BNE R7, R0, monitor_loop
      mem[18] <= 16'b0101110110111111; //   ADDI R6, R6, -1
      mem[19] <= 16'b1001000110110110; //   BNE R6, R0, monitor_loop
      mem[20] <= 16'b0101101101111111; //   ADDI R5, R5, -1
      mem[21] <= 16'b1001000101110100; //   BNE R5, R0, monitor_loop
      mem[22] <= 16'b0101010100111001; //   ADDI R4, R2, -7
      mem[23] <= 16'b0101001001110000; //   ADDI R1, R1, -16
      mem[24] <= 16'b0101001001110000; //   ADDI R1, R1, -16
      mem[25] <= 16'b0101001001110000; //   ADDI R1, R1, -16
      mem[26] <= 16'b0101001001110000; //   ADDI R1, R1, -16
      mem[27] <= 16'b0101001001110000; //   ADDI R1, R1, -16
      mem[28] <= 16'b0101001001110000; //   ADDI R1, R1, -16
      mem[29] <= 16'b0101001001110000; //   ADDI R1, R1, -16
      mem[30] <= 16'b0101001001110000; //   ADDI R1, R1, -16
      mem[31] <= 16'b1010100000010111; //   BGEZ R4, end
      mem[32] <= 16'b0101010100111000; //   ADDI R4, R2, -8
      mem[33] <= 16'b1111001000001010; //   SRA R1, R1
      mem[34] <= 16'b1010100000010100; //   BGEZ R4, end
      mem[35] <= 16'b0101010100110111; //   ADDI R4, R2, -9
      mem[36] <= 16'b1111001000001010; //   SRA R1, R1
      mem[37] <= 16'b1010100000010001; //   BGEZ R4, end
      mem[38] <= 16'b0101010100110101; //   ADDI R4, R2, -11
      mem[39] <= 16'b1111001000001010; //   SRA R1, R1
      mem[40] <= 16'b1010100000001110; //   BGEZ R4, end
      mem[41] <= 16'b0101010100110100; //   ADDI R4, R2, -12
      mem[42] <= 16'b1111001000001010; //   SRA R1, R1
      mem[43] <= 16'b1010100000001011; //   BGEZ R4, end
      mem[44] <= 16'b0101010100110011; //   ADDI R4, R2, -13
      mem[45] <= 16'b1111001000001010; //   SRA R1, R1
      mem[46] <= 16'b1010100000001000; //   BGEZ R4, end
      mem[47] <= 16'b0101010100110010; //   ADDI R4, R2, -14
      mem[48] <= 16'b1111001000001010; //   SRA R1, R1
      mem[49] <= 16'b1010100000000101; //   BGEZ R4, end
      mem[50] <= 16'b0101010100110001; //   ADDI R4, R2, -15
      mem[51] <= 16'b1111001000001010; //   SRA R1, R1
      mem[52] <= 16'b1010100000000010; //   BGEZ R4, end
      mem[53] <= 16'b1111001000001010; //   SRA R1, R1
      mem[54] <= 16'b0101010100100010; // end:  ADDI R4, R2, -30
      mem[55] <= 16'b1011100000000010; //   BLTZ R4, multiply_by_two
      mem[56] <= 16'b0101000010011101; //   ADDI R2, R0, 29
      mem[57] <= 16'b1111010000010100; // multiply_by_two:  SLL R2, R2
      mem[58] <= 16'b0010010011000000; //   LB R3, 0(R2)
      mem[59] <= 16'b0100000011111110; //   SB R3, -2(R0)
      mem[60] <= 16'b0010010011000001; //   LB R3, 1(R2)
      mem[61] <= 16'b0100000011111111; //   SB R3, -1(R0)
      mem[62] <= 16'b0100000001111100; //   SB R1, -4(R0)

      for(i = 63; i < 128; i = i + 1) begin
        mem[i] <= 16'b0000000000000000;
      end
    end
  end

endmodule
