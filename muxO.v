module muxO(OSEL, ADD, SHIFT, LOGICAL, OUT);
  
  // inputs
  input[1:0]  OSEL;
  input[7:0] ADD;
  input[7:0] SHIFT;
  input[7:0] LOGICAL;
  
  // outputs
  output [7:0]OUT;

  // MUX LOGIC:
  //   if   OSEL == 00 => ADD
  //   else if OSEL == 01   => SHIFT
  //   else => LOGICAL
  
  assign OUT = (OSEL == 2'b00) ? ADD : (OSEL == 2'b01) ? SHIFT : (OSEL == 2'b10) ? LOGICAL : LOGICAL ;

endmodule