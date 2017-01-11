`include "DFlipFlop.v"

module johnsonCounter(q, clk, reset);
	
	input clk, reset;
	output [3:0] q;
	wire [3:0] qBar;

	DFlipFlop dff1 (.q(q[0]), .qBar(qBar[0]), .D(qBar[3]), .clk(clk), .reset(reset));
	DFlipFlop dff2 (.q(q[1]), .qBar(qBar[1]), .D(q[0]), .clk(clk), .reset(reset));
	DFlipFlop dff3 (.q(q[2]), .qBar(qBar[2]), .D(q[1]), .clk(clk), .reset(reset));
	DFlipFlop dff4 (.q(q[3]), .qBar(qBar[3]), .D(q[2]), .clk(clk), .reset(reset));


endmodule 


module testbench; 
	
	reg clk, reset; 
	wire [3:0] q;

	parameter ClockDelay = 5;

	johnsonCounter counter_1 (.q(q), .clk(clk), .reset(reset)); 

	initial begin // Set up the clock
		clk <= 0;
		forever #(ClockDelay/2) clk <= ~clk;
	end

	initial begin 

		$dumpfile( "johnsonCounter.vcd" );
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
