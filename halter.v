module halter(HALT, EN_L, H, CLK);
	input HALT;
	input EN_L;
	input CLK;
	
	output H;
	
	
	reg EN_LP;
	reg EN_LC;
	wire CH;
	wire H;

//	always @(negedge EN_L) begin
//		if(HALT == 1)begin
//			H = 0; 
//		end
//		else begin
//			H = H;
//		end
//	
//	end
//	

	assign CH = ((EN_LP == 1) & (EN_L == 0));
	
	assign H = ((HALT == 1) & (CH == 0));
	
	
	always @(posedge CLK) begin
	
//		if(HALT == 1)begin
//	
//			if((EN_LP == 1) & (EN_L == 0)) begin
//				H = 0; 
//			end
//			else begin
//			H = HALT;
//			end
//	
//		end
//		else begin
//		H = H;
//		end
		
	EN_LP <= EN_L;
	//EN_LC <= EN_L;
	
	
	end
	

endmodule 