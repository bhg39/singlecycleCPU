module BrMux(Z, N, BS, MP, CLK);

	input CLK;
	input Z;
	input N;
	input [2:0] BS;
	
	output MP;
	
	wire ZnN;
	wire NnN;
	//wire MP;
	
	assign ZnN = (Z == 1'b0) ? 1'b1 : 1'b0;
	assign NnN = (N == 1'b0) ? 1'b1 : 1'b0;
	
	
	
	
	reg MP;

	always @ (*) begin
	
	if (BS == 3'b000) begin 
		MP = Z;
	end
	else if (BS == 3'b001) begin
		MP = ZnN;
	end
	else if (BS == 3'b010) begin
		MP = NnN;
	end
	else if (BS == 3'b011) begin 
		MP = N;
	end
	else begin
		MP = 1'b0;
	end
	
	end
//	assign MP = (BS == 3'b000) ? Z : (BS == 3'b001) ? ZnN : (BS == 3'b010) ? NnN : (BS == 3'b011) ? N : 1'b0;


endmodule