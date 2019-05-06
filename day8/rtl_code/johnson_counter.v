// =============================================================================
// Filename: johnson_counter.v
// Author: KANG, Jian
// Email: jkangac@connect.ust.hk
// Affiliation: Hong Kong University of Science and Technology
// Description:
// -----------------------------------------------------------------------------
`timescale 1 ns / 1 ps
module johnson_counter(
	input clk,
	input rst_n,
	output reg[3:0] o_cnt 
);

always @ (posedge clk)
    begin
        if(!rst_n)
        	begin
        		o_cnt <= 4'b0;
        	end
        else
        	begin
        		if (!o_cnt[0]) 
        		    begin
        		       o_cnt <= {1'b1,o_cnt[3:1]}; 
        		    end
        		else 
        		    begin
        		       o_cnt <= {1'b0,o_cnt[3:1]};
        		    end
        	end
    end
endmodule