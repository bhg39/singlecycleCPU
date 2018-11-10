module lab6iramHRM_test(CLK, RESET, ADDR, Q);
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
      mem[0]  <= 16'b1111000000000001; //SUB   R0, R0, R0
      mem[1]  <= 16'b0000000000000001; //HALT
      mem[2]  <= 16'b0010000010111010; //LB    R2, -6(R0)
      mem[3]  <= 16'b0101010100100010; //ADDI  R4, R2, -30
      mem[4]  <= 16'b1011100000000010; //BLTZ  R4, 2
      mem[5]  <= 16'b0101000010011101; //ADDI  R2, R0, 29
      mem[6]  <= 16'b1111010000010100; //SLL   R2, R2
      mem[7]  <= 16'b0010010011000000; //LB    R3, 0(R2)
      mem[8]  <= 16'b0100000011111110; //SB    R3, -2(R0)
      mem[9]  <= 16'b0010010011000001; //LB    R3, 1(R2)
      mem[10]  <= 16'b0100000011111111; //SB    R3, -1(R0)

    
      for(i = 11; i < 128; i = i + 1) begin
        mem[i] <= 16'b0000000000000000;
      end
    end
  end

endmodule
