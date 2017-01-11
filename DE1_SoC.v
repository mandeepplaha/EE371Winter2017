//`include "rippleCounter.v"

module DE1_SoC (CLOCK_50, HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, KEY, LEDR, SW);
      
      output   [6:0]  HEX0, HEX1, HEX2, HEX3, HEX4, HEX5;
      output   [9:0]  LEDR;
      input    [3:0]  KEY; // True when not pressed, False when pressed
      input    [9:0]  SW;
      input  CLOCK_50;
		
		assign HEX0 = 7'b1111111;
		assign HEX1 = 7'b1111111;
		assign HEX2 = 7'b1111111;
		assign HEX3 = 7'b1111111;
		assign HEX4 = 7'b1111111;
		assign HEX5 = 7'b1111111;
		
      // Hook up FSM inputs and outputs.
      wire reset;
		//assign reset = ~KEY[0];     // Reset when KEY[0] is pressed.
		assign reset = SW[0];
      
		wire clk;
		parameter whichClock = 10;
		clock_1_sec cdiv (.clk(clk), .CLOCK_50(CLOCK_50));		
			
		
		rippleCounter rp (.q(LEDR[3:0]), .clk(clk), .reset(reset));


      // Show signals on LEDRs so we can see what is happening.
      //assign LEDR = { clk[whichClock], 1'b0, reset, 2'b0, out};

endmodule

module clock_1_sec(clk, CLOCK_50);
	output reg clk;
	input	CLOCK_50;
	reg	[25:0] count;
	always @(posedge CLOCK_50)
		begin
			if(count==26'd49_999_999)
				begin
					count<=26'd0;
					clk<=1;
				end
			else
				begin
					count<=count+1;
					clk<=0;
				end
		end
endmodule
