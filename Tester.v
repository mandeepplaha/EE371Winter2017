module Tester (xOut, yOut, XandYin, XorYin);
	input [1:0] XandYin, XorYin;
	output [1:0] xOut, yOut;
	reg [1:0] xOut, yOut;

	parameter stimDelay = 20;
	initial // Response 
		begin
			$display("\t\t xOut \t yOut \t XandYin XorYin \t Time ");
			$monitor("\t\t %b\t %b \t %b \t %b", xOut, yOut, XandYin, XorYin, $time );

		end

	initial // Stimulus
		begin
			xOut = 2'b00; yOut = 2'b00;
			#stimDelay yOut = 2'b01;
			#stimDelay yOut = 2'b10; 
			#stimDelay yOut = 2'b11;
			#stimDelay xOut = 2'b01; yOut = 2'b00;
			#stimDelay yOut = 2'b01;
			#stimDelay yOut = 2'b10; 
			#stimDelay yOut = 2'b11;
			#stimDelay xOut = 2'b10; yOut = 2'b00;
			#stimDelay yOut = 2'b01;
			#stimDelay yOut = 2'b10; 
			#stimDelay yOut = 2'b11;
			#stimDelay xOut = 2'b11; yOut = 2'b00;
			#stimDelay yOut = 2'b01;
			#stimDelay yOut = 2'b10; 
			#stimDelay yOut = 2'b11;
			#stimDelay 

			#(2*stimDelay);		// needed to see END of simulation
			$finish; 			// finish simulation
		end
endmodule

