// =============================================================================
// Filename: divider_tb.v
// Author: KANG, Jian
// Email: jkangac@connect.ust.hk
// Affiliation: Hong Kong University of Science and Technology
//Description:
// -----------------------------------------------------------------------------
`timescale 1 ns / 1 ps

module divider_tb;

// ----------------------------------
// Local parameter declaration
// ----------------------------------
localparam CLK_PERIOD = 5;  // clock period: ns

// ----------------------------------
// Interface of the tested module
// ----------------------------------
reg clk;
reg rst;
wire clk_out_even;
wire clk_out_odd;

// ----------------------------------
// Instantiate the tested module
// ----------------------------------
divider_odd
#(
	.N(3)
)
divider_odd_inst
(
	.clk(clk),
	.rst(rst),
	.clk_div_odd(clk_out_odd)
);

divider_even#(
	.N(2)
)
divider_even_inst
(
	.clk(clk),
	.rst(rst),
	.clk_div_even(clk_out_even)
);
// ----------------------------------
// Clock generation
// ----------------------------------
initial begin
  clk = 1'b0;
  forever #(CLK_PERIOD/2.0) clk = ~clk;
end

// ----------------------------------
// Input stimulus
// Generate the ad-hoc stimulus
//This is an example
//initial begin
  // Reset
  //rst         = 1'b1;
  //start       = 1'b0;
  //dividend    = 32'd0;
  //divisor     = 32'd0;
  //#(2*CLK_PERIOD) rst = 1'b0;
  //end
// ----------------------------------

initial
  begin
  //Add Your Code
  	   rst = 1'b1;
  	   #22
  	   rst = 1'b0;
  end
// ----------------------------------
// Output monitor
//This is an example
//always @(posedge clk) begin
  //if (done) begin
    //("%0d / %0d: quotient = %0d, remainder = //%0d", dividend, divisor,
      //quotient, remainder);
  //end
// ----------------------------------
//Add Your Code

endmodule