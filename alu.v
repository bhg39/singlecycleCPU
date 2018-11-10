module alu(A, B, OP, Y, C, V, N, Z);
  input  [7:0]  A;
  input  [7:0]  B;
  input  [2:0]  OP;

  output [7:0]  Y;
  output        C;
  output        V;
  output        N;
  output        Z;
  
  wire LOP;
  wire [7:0] BOUT;
  wire [7:0] YADD;
  wire [7:0] YSHIFT;
  wire [7:0] YLOG;
  wire BSELM;
  wire CISELM;
  wire CIIN;
  wire [1:0] OSELM;
  wire SLAM;
  wire SLRM;
  wire CSHIFT;

  // ADD YOUR CODE BELOW THIS LINE
  muxB MB(
  .BSEL(BSELM), 
  .B(B), 
  .Bout(BOUT)
  );
  
  muxCI MCI(
  .CISEL(CISELM),
  .CIout(CIIN)
  );
  
  muxO MO(
  .OSEL(OSELM), 
  .ADD(YADD), 
  .SHIFT(YSHIFT), 
  .LOGICAL(YLOG), 
  .OUT(Y)
  );
  
  adder addy(
  .A(A),
  .B(BOUT),
  .CI(CIIN),
  .C(CADD),
  .Y(YADD),
  .V(VADD)
  );
  
  shifter shifty(
  .A(A), 
  .LA(SLAM), 
  .Y(YSHIFT), 
  .C(CSHIFT), 
  .LR(SLRM)
  );
  
  logical loggy(
  .A(A),
  .B(BOUT),
  .Y(YLOG),
  .OP(LOP)
  );
  
  control controlly(
  .OP(OP), 
  .CISEL(CISELM), 
  .BSEL(BSELM), 
  .OSEL(OSELM), 
  .SLA(SLAM), 
  .SLR(SLRM), 
  .LOP(LOP)
  );
  
  assign C = (OP == (3'b000)|OP == (3'b001)) ? CADD : (OP == (3'b010)|OP == (3'b011)|OP == (3'b100)) ? CSHIFT : 1'b0;
  assign V = (OP == (3'b000)|OP == (3'b001)) ? VADD : 1'b0;
  assign N = (Y[7] == 1);
  assign Z = (Y == 8'd0);
  // ADD YOUR CODE ABOVE THIS LINE


endmodule
