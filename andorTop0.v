// andorTop0.v 
`include "andOr0.v"
`include "Tester.v"

module testBench;
	
	// connect the two modules 
	wire [1:0] X, Y;
	wire [1:0] XandY, XorY;
	
	// declare an instance of the AND module
	AndOr myAndOr (XandY[1:0], XorY[1:0], X[1:0], Y[1:0]);
	
	// declare an instance of the testIt module
	Tester aTester (X[1:0], Y[1:0], XandY[1:0], XorY[1:0]);
	
	// file for gtkwave
	initial 
		begin
			// these two files support gtkwave and are required $dumpfile("andor0.vcd");
			$dumpvars(1, myAndOr); 
		end
endmodule
