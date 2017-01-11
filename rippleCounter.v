`include "DFF.v"

module rippleCounter(q, clk, reset);
	
	input clk, reset;
	output [3:0] q;
	wire [3:0] qBar;

	DFF dff1 (.q(q[0]), .qBar(qBar[0]), .D(qBar[0]), .clk(clk), .reset(reset));
	DFF dff2 (.q(q[1]), .qBar(qBar[1]), .D(qBar[1]), .clk(qBar[0]), .reset(reset));
	DFF dff3 (.q(q[2]), .qBar(qBar[2]), .D(qBar[2]), .clk(qBar[1]), .reset(reset));
	DFF dff4 (.q(q[3]), .qBar(qBar[3]), .D(qBar[3]), .clk(qBar[2]), .reset(reset));


endmodule 

/*
module testbench; 
	
	reg clk, reset; 
	wire [3:0] q;

	parameter ClockDelay = 5;

	rippleCounter counter_1 (.q(q), .clk(clk), .reset(reset)); 

	initial begin // Set up the clock
		clk <= 0;
		forever #(ClockDelay/2) clk <= ~clk;
	end

	initial begin 

		$dumpfile( "rippleCounter.vcd" );
		$dumpvars( 1, testbench );
		reset = 0; 
		#7 
		reset = 1; 
		#65 
		reset = 0; 
		#7 
		reset = 1; 

		#100  $finish;
	end 

endmodule
*/