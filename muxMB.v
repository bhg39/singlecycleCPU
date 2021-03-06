module muxMB(MB, DataB, IMMS, Bout);
  
  // inputs
  input  MB;
  input[7:0] IMMS;
  input[7:0] DataB;
  
  // outputs
  output [7:0]Bout;

  // MUX LOGIC:
  //   if   MB == 0 => Bout = DataB
  //   else            => Bout = IMMS'
  assign Bout = (MB == 1'b0) ? DataB : IMMS;

endmodule