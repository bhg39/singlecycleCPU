module adder(A, B, CI, Y, C, V);

  // inputs
  input [7:0] A;
  input [7:0] B;
  input CI;
  
  // outputs
  output [7:0] Y;
  output C;
  output V;
  
  wire [8:0] SUM;
  
  wire [7:0] A;
  wire [7:0] B;
  wire zerotoone;
  wire onetotwo;
  wire twotothree;
  wire threetofour;
  wire fourtofive;
  wire fivetosix;
  wire sixtoseven;
  wire seventoeight;
  
  fulladder bit0(
  .A(A[0]),
  .B(B[0]),
  .CIN(CI),
  .COUT(zerotoone),
  .S(SUM[0])
  );
  
  fulladder bit1(
  .A(A[1]),
  .B(B[1]),
  .CIN(zerotoone),
  .COUT(onetotwo),
  .S(SUM[1])
  );
  
  fulladder bit2(
  .A(A[2]),
  .B(B[2]),
  .CIN(onetotwo),
  .COUT(twotothree),
  .S(SUM[2])
  );
  
  fulladder bit3(
  .A(A[3]),
  .B(B[3]),
  .CIN(twotothree),
  .COUT(threetofour),
  .S(SUM[3])
  );
  
  fulladder bit4(
  .A(A[4]),
  .B(B[4]),
  .CIN(threetofour),
  .COUT(fourtofive),
  .S(SUM[4])
  );
  
  fulladder bit5(
  .A(A[5]),
  .B(B[5]),
  .CIN(fourtofive),
  .COUT(fivetosix),
  .S(SUM[5])
  );
  
  fulladder bit6(
  .A(A[6]),
  .B(B[6]),
  .CIN(fivetosix),
  .COUT(sixtoseven),
  .S(SUM[6])
  );
  
  fulladder bit7(
  .A(A[7]),
  .B(B[7]),
  .CIN(sixtoseven),
  .COUT(seventoeight),
  .S(SUM[7])
  );
  
  assign Y = SUM[7:0];
  assign C = seventoeight;
  //assign V = ((A[7] == B[7]) & (A[7] != seventoeight));
  assign V = (seventoeight != sixtoseven);
endmodule