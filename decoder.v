module decoder(INST, DR, SA, SB, IMM, MB, FS, MD, LD, MW, BS, OFF, HALT);

	input [15:0]INST;
	output [2:0]BS;
	output [5:0]OFF;
	output HALT;
	
	
	output [2:0]  DR;
	output [2:0]  SA;
	output [2:0]  SB;
	output [5:0]  IMM;
	output        MB;
	output [2:0]  FS;
	output        MD;
	output        LD;
	output        MW;
	
	
	reg [2:0]  DR;
	reg [2:0]  SA;
	reg [2:0]  SB;
	reg [5:0]  IMM;
	reg        MB;
	reg [2:0]  FS;
	reg        MD;
	reg        LD;
	reg        MW;
	reg        HALT;
	reg [5:0]  OFF;
	reg [2:0]  BS;
	
   wire [3:0]OP;
	wire [2:0]RS;
	wire [2:0]RT;
	wire [2:0]RD;
	wire [2:0]FUNCT;
	
	
	assign OP  =  INST[15:12];
	assign RS = INST[11:9];
	assign RT = INST[8:6];
	assign RD = INST[5:3];
	assign FUNCT = INST[2:0];
	
	
	
	always@(*) begin
	if(OP == 4'b0000) begin
		if(FUNCT == 3'b001) begin
		DR = 3'b000; 
		SA = 3'b000;
		SB = 3'b000; 
		IMM = 6'b000000;
		MB = 0; 
		FS = 3'b000; 
		MD = 0; 
		LD = 0; 
		MW = 0; 
		HALT = 1;
		BS = 3'b100;
		OFF = 6'b000000;
		end
		else begin
		DR = 3'b000; 
		SA = 3'b000;
		SB = 3'b000; 
		IMM = 6'b000000;
		MB = 0; 
		FS = 3'b000; 
		MD = 0; 
		LD = 0; 
		MW = 0; 
		HALT = 0;
		BS = 3'b100;
		OFF = 6'b000000;
		end
	end
	
	else if(OP == 4'b1000)begin // BEQ  Z
		DR = 3'b000; //XXX 
		SA = RS;
		SB = RT; 
		IMM = INST[5:0];
		MB = 0; 
		FS = 3'b001; 
		MD = 0; //X
		LD = 0; 
		MW = 0; 
		HALT = 0;
		BS = 3'b000;
		OFF = INST[5:0];
	end
	
	else if(OP == 4'b1001)begin // BNE  not Z
		DR = 3'b000; //XXX 
		SA = RS;
		SB = RT; 
		IMM = INST[5:0];
		MB = 0; 
		FS = 3'b001; 
		MD = 0; //X
		LD = 0; 
		MW = 0; 
		HALT = 0;
		BS = 3'b001;
		OFF = INST[5:0];
	end
	
	else if(OP == 4'b1010)begin // BGEZ  not N
		DR = 3'b000; //XXX 
		SA = RS;
		SB = 3'b000; //XXX 
		IMM = 6'b000000;
		MB = 1; 
		FS = 3'b000; 
		MD = 0; //X
		LD = 0; 
		MW = 0; 
		HALT = 0;
		BS = 3'b010;
		OFF = INST[5:0];
	end
	
	else if(OP == 4'b1011)begin // BLTZ  N
		DR = 3'b000; //XXX 
		SA = RS;
		SB = 3'b000; //XXX 
		IMM = 6'b000000;
		MB = 1; 
		FS = 3'b000; 
		MD = 0; //X
		LD = 0; 
		MW = 0; 
		HALT = 0;
		BS = 3'b011;
		OFF = INST[5:0];
	end
	
	else if(OP == 4'b0010)begin
	DR = RT; 
   SA = RS;
   SB = 3'b000; //XXX
   IMM = INST[5:0]; //IMM
   MB = 1; 
   FS = 3'b000; //ADD
   MD = 1; 
   LD = 1; //1
   MW = 0; 
	HALT = 0;
	BS = 3'b100;
	OFF = 6'b000000;
	end
	else if(OP == 4'b0100)begin
	DR = 3'b000; //XXX 
   SA = RS;
   SB = RT; 
   IMM = INST[5:0]; //IMM
   MB = 1; //1
   FS = 3'b000; //ADD
   MD = 0; //X 
   LD = 0; 
   MW = 1; //1 
	HALT = 0;
	BS = 3'b100;
	OFF = 6'b000000;
	end
	else if(OP == 4'b0101)begin
	DR = RT; 
   SA = RS;
   SB = 3'b000;//XXX 
   IMM = INST[5:0]; //IMM
   MB = 1; //1
   FS = 3'b000; //ADD
   MD = 0; 
   LD = 1; //1
   MW = 0;  
	HALT = 0;
	BS = 3'b100;
	OFF = 6'b000000;
	end
	else if(OP == 4'b0110)begin
	DR = RT; 
   SA = RS;
   SB = 3'b000;//XXX 
   IMM = INST[5:0]; //IMM
   MB = 1; //1
   FS = 3'b101; //AND
   MD = 0; 
   LD = 1; //1
   MW = 0;  
	HALT = 0;
	BS = 3'b100;
	OFF = 6'b000000;
	end
	else if(OP == 4'b0111)begin
	DR = RT; 
   SA = RS;
   SB = 3'b000;//XXX 
   IMM = INST[5:0]; //IMM
   MB = 1; //1
   FS = 3'b110; //AND
   MD = 0; 
   LD = 1; //1
   MW = 0;  
	HALT = 0;
	BS = 3'b100;
	OFF = 6'b000000;
	end
	else if(OP == 4'b1111)begin
		if(FUNCT == 3'b000) begin
		DR = RD;  
      SA = RS;
      SB = RT;
      IMM = INST[5:0]; 
      MB = 0; 
      FS = 3'b000;
      MD = 0; 
      LD = 1; 
      MW = 0;
		HALT = 0;
		BS = 3'b100;
		OFF = 6'b000000;
		end
		else if(FUNCT == 3'b001) begin
		DR = RD;  
      SA = RS;
      SB = RT;
      IMM = INST[5:0]; 
      MB = 0; 
      FS = 3'b001;
      MD = 0; 
      LD = 1; 
      MW = 0;
		HALT = 0;
		BS = 3'b100;
		OFF = 6'b000000;
		end
		else if(FUNCT == 3'b010) begin
		DR = RD;  
      SA = RS;
      SB = 3'b000; //XXX
      IMM = INST[5:0]; 
      MB = 0; //X
      FS = 3'b010;
      MD = 0; 
      LD = 1; 
      MW = 0;
		HALT = 0;
		BS = 3'b100;
		OFF = 6'b000000;
		end
		else if(FUNCT == 3'b011) begin
		DR = RD;  
      SA = RS;
      SB = 3'b000; //XXX
      IMM = INST[5:0]; 
      MB = 0; //X
      FS = 3'b011;
      MD = 0; 
      LD = 1; 
      MW = 0;
		HALT = 0;
		BS = 3'b100;
		OFF = 6'b000000;
		end
		else if(FUNCT == 3'b100) begin
		DR = RD;  
      SA = RS;
      SB = 3'b000; //XXX
      IMM = INST[5:0]; 
      MB = 0; //X
      FS = 3'b100;
      MD = 0; 
      LD = 1; 
      MW = 0;
		HALT = 0;
		BS = 3'b100;
		OFF = 6'b000000;
		end
		else if(FUNCT == 3'b101) begin
		DR = RD;  
      SA = RS;
      SB = RT;
      IMM = INST[5:0]; 
      MB = 0; 
      FS = 3'b101;
      MD = 0; 
      LD = 1; 
      MW = 0;
		HALT = 0;
		BS = 3'b100;
		OFF = 6'b000000;
		end
		else if(FUNCT == 3'b110) begin
		DR = RD;  
      SA = RS;
      SB = RT;
      IMM = INST[5:0]; 
      MB = 0; 
      FS = 3'b110;
      MD = 0; 
      LD = 1; 
      MW = 0;
		HALT = 0;
		BS = 3'b100;
		OFF = 6'b000000;
		end
		else begin
		DR = 3'b000; 
      SA = 3'b000;
      SB = 3'b000; 
      IMM = 6'b000000;
      MB = 0; 
      FS = 3'b000; 
      MD = 0; 
      LD = 0; 
      MW = 0; 
		HALT = 0;
		BS = 3'b100;
		OFF = 6'b000000;
		end
		
		end
	else begin
	DR = 3'b000; 
   SA = 3'b000;
   SB = 3'b000; 
   IMM = 6'b000000;
   MB = 0; 
   FS = 3'b000; 
   MD = 0; 
   LD = 0; 
   MW = 0; 
	HALT = 0;
	BS = 3'b100;
	OFF = 6'b000000;
	end
	
	end
	
	
	

endmodule
