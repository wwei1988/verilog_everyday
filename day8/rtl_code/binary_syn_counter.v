// =============================================================================
// Filename: binary_syn_counter.v
// Author: KANG, Jian
// Email: jkangac@connect.ust.hk
// Affiliation: Hong Kong University of Science and Technology
// Description:
// -----------------------------------------------------------------------------
`timescale 1 ns / 1 ps
module binary_syn_counter(
	input clk,
	input rst_n,
	output reg [3:0] o_cnt 
);

always @ (posedge clk)
    begin
        if(!rst_n)
        	begin
        		o_cnt <= 0;
        	end
        else
        	begin
        		o_cnt <= o_cnt + 1'b1;
        	end
    end

endmodule