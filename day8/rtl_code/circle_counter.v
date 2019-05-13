// =============================================================================
// Filename: circle_counter.v
// Author: KANG, Jian
// Email: jkangac@connect.ust.hk
// Affiliation: Hong Kong University of Science and Technology
// Description:
// -----------------------------------------------------------------------------
`timescale 1 ns / 1 ps
module circle_counter(
	input clk,
	input rst_n,
	output reg [3:0] o_cnt 
);

always @ (posedge clk)
    begin
        if(!rst_n)
        	begin
        		o_cnt <= 4'b0001;
        	end
        else
        	begin
        		if (o_cnt[3] != 1'b1) 
        		    begin
        		        o_cnt <= {o_cnt[2:0],1'b0};
        		    end
        		else 
        		    begin
        		        o_cnt <= 4'b0001;
        		    end
        	end
    end

endmodule