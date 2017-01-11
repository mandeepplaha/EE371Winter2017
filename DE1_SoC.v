`include "rippleCounter.v"

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
      
		reg [25:0] clk = 26'b0;
            always @(posedge CLOCK_50)
                  clk <= clk + 1;

		parameter whichClock = 10;			
		
		rippleCounter rp (.q(LEDR[3:0]), .clk(clk[whichClock]), .reset(reset));

endmodule
