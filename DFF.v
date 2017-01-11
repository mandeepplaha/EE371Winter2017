module DFF(q, qBar, D, clk, reset); 

	input D, clk, reset;
	output q, qBar; 
	reg q;
	not n1 (qBar, q);

	always@ (negedge reset or posedge clk) 
	begin
		if(!reset)
			q = 0;
		else
			q = D;
	end 

endmodule 