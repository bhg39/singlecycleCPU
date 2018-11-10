module muxMD(MD, DataALU, DataD, DataC);
  
  // inputs
  input  MD;
  input[7:0] DataALU;
  input[7:0] DataD;
  
  // outputs
  output [7:0]DataC;

  // MUX LOGIC:
  //   if   MB == 0 => Bout = DataB
  //   else            => Bout = IMMS'
  assign DataC = (MD == 1'b0) ? DataD : DataALU ;

endmodule