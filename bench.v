module bench;
	reg a;
	initial begin
		$dumpvars(0, bench);
		#10;
		a = 0;
		#10;
		a = 1;
		#10;
	end
endmodule
