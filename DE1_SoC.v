`include "rippleCounter.v"

module DE1_SoC (HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, KEY, LEDR, SW);
      
      output   [6:0]  HEX0, HEX1, HEX2, HEX3, HEX4, HEX5;
      output   [9:0]  LEDR;
      input    [3:0]  KEY; // True when not pressed, False when pressed
      input    [9:0]  SW;
      
      reg clk;
      
      // Hook up FSM inputs and outputs.
      wire reset;
      //reg [3:0] out;
      assign reset = ~KEY[0];     // Reset when KEY[0] is pressed.

      rippleCounter rp (.q(LEDR[3:0]), .clk(0.75), .reset(reset));


      // Show signals on LEDRs so we can see what is happening.
      //assign LEDR = { clk[whichClock], 1'b0, reset, 2'b0, out};

endmodule

// divided_clocks[0] = 25MHz, [1] = 12.5Mhz, ... [23] = 3Hz, [24] = 1.5Hz, [25] = 0.75Hz, ...