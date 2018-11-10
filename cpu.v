module cpu(CLK, RESET, EN_L, Iin, Din, PC, NextPC, DataA, DataB, DataC, DataD, MW);
  input         CLK;
  input         RESET;
  input         EN_L;
  input  [15:0] Iin;
  input  [7:0]  Din;
  
  output [7:0]  PC;
  output [7:0]  NextPC;
  output [7:0]  DataA;
  output [7:0]  DataB;
  output [7:0]  DataC;
  output [7:0]  DataD;
  output        MW;
  
  // comment the two lines out below if you use a submodule to generate PC/NextPC
  reg [7:0] PC;
  reg [7:0] NextPC;
  
  wire MW;
  wire [2:0] SA;
  wire [2:0] SB;
  wire [7:0] DataA;
  wire [7:0] DataB;
  wire [7:0] DataBALU;
  wire [7:0] DataDRAM;
  wire [2:0] OP;
  wire [2:0] DR;
  wire [2:0] BS;
  wire LD;
  wire MBSEL;
  wire MDSEL;
  wire H;
  wire Z;
  wire [5:0] PCOFF6;
  wire [7:0] PCOFF8;
  wire N;
  wire MP;
  wire HALT;
  wire [5:0] IMM6;
  wire [7:0] IMM8;
  wire [7:0] NEXTPCH;
  
  // ADD YOUR CODE BELOW THIS LINE
  registerF RF(
		.LD(LD), 
		.SA(SA), 
		.SB(SB), 
		.DR(DR), 
		.D_in(DataC), 
		.DataA(DataA), 
		.DataB(DataB), 
		.CLK(CLK),
		.RESET(RESET)
		);
		
  halter halty(
		.HALT(HALT), 
		.EN_L(EN_L), 
		.H(H),
		.CLK(CLK)
		);
	
  NextPCMux PCMux(
		.NXT(NextPC), 
		.BR(PCOFF8), 
		.HLT(PC), 
		.H(H), 
		.MP(MP), 
		.NextPC(NEXTPCH)
		);
		
  BrMux Branchy(
		.Z(Z), 
		.N(N), 
		.BS(BS), 
		.MP(MP),
		.CLK(CLK)
		);
	
  IMM SE(
		.IN(IMM6),
		.OUT(IMM8)
		);
		
  IMMPC PCIMM(
		.IN(PCOFF6),
		.OUT(PCOFF8)
		);
  
  muxMB MB(
		.MB(MBSEL), 
		.DataB(DataB), 
		.IMMS(IMM8), 
		.Bout(DataBALU)
		);
		
  muxMD MD(
		.MD(MDSEL), 
		.DataALU(Din), 
		.DataD(DataD), 
		.DataC(DataC)
		);
  
  decoder drivingdecode(
		.INST(Iin), 
		.DR(DR), 
		.SA(SA), 
		.SB(SB), 
		.IMM(IMM6), 
		.MB(MBSEL), 
		.FS(OP), 
		.MD(MDSEL), 
		.LD(LD), 
		.MW(MW), 
		.BS(BS), 
		.OFF(PCOFF6), 
		.HALT(HALT)
		);
  
  alu aluu( // ALU 
		.A(DataA), 
		.B(DataBALU), 
		.OP(OP), 
		.Y(DataD), 
		.C(), 
		.V(), 
		.N(N), 
		.Z(Z)
  );
  
  
  
  always @ (posedge CLK)// PC
  begin
		if (RESET == 1) begin
		PC = 0;
		end
		else begin
		PC = NextPC;
		end
  end

  always @ (*) begin
  
		if (H == 1) begin
			NextPC = PC;
		end
		else if (MP) begin
			NextPC = PC + PCOFF8;
		end
		else begin
			NextPC = PC + 8'b00000010;
		end
  
  end

  // ADD YOUR CODE ABOVE THIS LINE

endmodule
