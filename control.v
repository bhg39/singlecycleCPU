module control(OP, CISEL, BSEL, OSEL, SLA, SLR, LOP); // add other inputs and outputs here

  // inputs (add others here)
  input  [2:0]  OP;
  
  // outputs (add others here)
  output        CISEL;
  output        BSEL;
  output[1:0]   OSEL;
  output        SLA;
  output        SLR;
  output        LOP;

  // reg and internal variable definitions
  
  
  // implement module here (add other control signals below)
  assign CISEL = (OP == 3'b001) ? 1'b1 : 1'b0;
  assign BSEL = (OP == 3'b001) ? 1'b1 : 1'b0;
  assign OSEL = (OP == (3'b000)|OP == (3'b001)) ? 2'b00 : (OP == (3'b010)|OP == (3'b011)|OP == (3'b100)) ? 2'b01 : (OP == (3'b101)|OP == (3'b110)) ? 2'b10 : 2'b11 ;
  assign SLA = (OP == 3'b010) ? 1'b1 : 1'b0;
  assign SLR = (OP == (3'b010)|OP == (3'b011)) ? 1'b1 : 1'b0;
  assign LOP = (OP == 3'b101) ? 1'b1 : 1'b0;
  
endmodule