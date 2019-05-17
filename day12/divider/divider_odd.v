// =============================================================================
// Filename: divider_odd.v
// Author: KANG, Jian
// Email: jkangac@connect.ust.hk
// Affiliation: Hong Kong University of Science and Technology
// Description: odd number divider
// -----------------------------------------------------------------------------
`timescale 1 ns / 1 ps
module divider_odd
#(
	parameter N = 3
)
(
	input clk,
	input rst,
	output clk_div_odd
);
localparam WD = clogb2(N);

reg [WD-1:0] cnt;
reg clk_div_pos;
reg clk_div_neg;

always @ (posedge clk)
    begin
        if(rst)
            begin
        	   cnt <= 0;
            end
        else
            begin
        	   if (cnt == N-1) 
        	       begin
        	   			cnt <= 0;
        	   	   end
        	   else 
        	   	begin
        	   		cnt <= cnt + 1'b1;
        	   	end
            end
    end

always @ (posedge clk or posedge rst)
    begin
        if(rst)
            begin
        	   clk_div_pos <= 1'b0;
            end
        else
            begin
        	   if (cnt==(N-1)/2 || cnt == (N-1)) 
        	    begin
        	   		clk_div_pos <= ~clk_div_pos;	
        	    end
        	   else 
        	   	begin
        	   		clk_div_pos <= clk_div_pos;
        	   	end
            end
    end
always @ (negedge clk or posedge rst)
    begin
        if(rst)
            begin
        	    clk_div_neg <= 1'b0;
            end
        else
            begin
        	   if (cnt==(N-1)/2|| cnt == N-1) 
        	    begin
        	   		clk_div_neg <= ~clk_div_neg;
        	   	end
        	   else 
        	   	begin
        	   		clk_div_neg <= clk_div_neg;
        	   	end
            end
    end
assign clk_div_odd = clk_div_neg | clk_div_pos;
function integer clogb2 (input integer depth);
	begin
		for (clogb2 = 0; depth > 0 ; clogb2 = clogb2 + 1)
			begin
				depth = depth >> 1;
			end
	end
endfunction

endmodule
