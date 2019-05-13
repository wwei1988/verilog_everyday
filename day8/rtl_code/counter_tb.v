// =============================================================================
// Filename: counter_tb.v
// Author: KANG, Jian
// Email: jkangac@connect.ust.hk
// Affiliation: Hong Kong University of Science and Technology
//Description:
// -----------------------------------------------------------------------------
`timescale 1 ns / 1 ps

module counter_tb;

// ----------------------------------
// Local parameter declaration
// ----------------------------------
localparam CLK_PERIOD = 5;  // clock period: ns

// ----------------------------------
// Interface of the tested module
// ----------------------------------
reg clk;
reg rst_n;
wire [3:0] o_cnt_asyn, o_cnt_syn, o_cnt_circle, o_cnt_johnson;
// ----------------------------------
// Instantiate the tested module
// ----------------------------------
binary_asyn_counter binary_asyn_counter_inst(
	.clk(clk),
	.rst_n(rst_n),
	.o_cnt(o_cnt_asyn) 
);

binary_syn_counter binary_syn_counter_inst(
	.clk(clk),
	.rst_n(rst_n),
	.o_cnt(o_cnt_syn) 
);

circle_counter circle_counter_inst(
	.clk(clk),
	.rst_n(rst_n),
	.o_cnt(o_cnt_circle) 
);

johnson_counter johnson_counter_inst(
	.clk(clk),
	.rst_n(rst_n),
	.o_cnt(o_cnt_johnson) 
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
		rst_n = 1'b0;
		#22 
		rst_n = 1'b1;	
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