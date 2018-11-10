module fulladder(A, B, CIN, COUT, S);
	input A;
	input B;
	input CIN;
	output S;
	output COUT;
	
	assign S = (A ^ B) ^ CIN;
	assign COUT = (A & B)|((A ^ B) & CIN); 
endmodule