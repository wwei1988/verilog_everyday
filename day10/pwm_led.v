// =============================================================================
// Filename: pwm_led.v
// Author: KANG, Jian
// Email: jkangac@connect.ust.hk
// Affiliation: Hong Kong University of Science and Technology
// Description:
// input frequency: 24Mhz
// the frequency of pwm: 1khz
// the accuracy of pwm: 1mhz
// the length of pwm: 1hz
// -----------------------------------------------------------------------------
`timescale 1 ns / 1 ps
module pwm_led(
	input clk,
	input rst,
	output reg [0:0] pwm_out 	
);

//the divider to get 1mhz
reg [3:0] cnt_1;
reg clk_1mhz;
always @ (posedge clk or posedge rst)
    begin
        if(rst)
        	begin
        		cnt_1 <= 0;
        		clk_1mhz <= 0;
        	end
        else
        	begin
        		if (cnt_1 == 5'd11) 
        		    begin
        		        cnt_1 <= 0;
        		        clk_1mhz <= ~clk_1mhz;
        		    end
        		else 
        		    begin
        		        cnt_1 <=  cnt_1 + 1'b1;
        		    end
        	end
    end
//the divider to get 1khz
reg [8:0] cnt_2;
reg clk_1khz;
always @ (posedge clk_1mhz or posedge rst)
    begin
        if(rst)
        	begin
        		cnt_2 <= 0;
        		clk_1khz <= 1'b0;	
        	end
        else
        	begin
        		if (cnt_2 == 9'd499) 
        		    begin
        		        cnt_2 <= 0;
        		        clk_1khz <= ~clk_1khz;
        		    end
        		else 
        		    begin
        		        cnt_2 <= cnt_2 +1'b1;
        		    end
        	end
    end
//decide the duty circle
reg [9:0] cnt_duty_circle;
reg flag;//show reduce or increase,0 means increase and 1 means decrease
always @ (posedge clk_1khz or posedge rst)
    begin
        if(rst)
        	begin
        		cnt_duty_circle <= 0;
        		flag <= 1'b0;
        	end
        else
        	begin
        		if (cnt_duty_circle == 10'd1000 && flag == 1'b0) 
        		    begin
        		        flag <= 1'b1; 
        		        cnt_duty_circle <= cnt_duty_circle - 1'b1;     		    	        
        		    end
        		else if(cnt_duty_circle == 1'b1 && flag == 1'b1)
        			begin
        				flag <= 1'b0;
        				cnt_duty_circle <= cnt_duty_circle + 1'b1;
        			end
        		else 
        		    begin
        		    	if (flag == 1'b0) 
        		    	    begin
        		        		cnt_duty_circle <= cnt_duty_circle + 1'b1;        		    	        
        		    	    end
        		    	else 
        		    	    begin
        		    	        cnt_duty_circle <= cnt_duty_circle -1'b1;
        		    	    end
        		    end
        	end
    end
reg [9:0] cnt__output_decide;
always @ (posedge clk_1mhz or posedge rst)
    begin
        if(rst)
        	begin
        		cnt__output_decide <= 1'b0;
        	end
        else
        	begin
        		if (cnt__output_decide == 10'd1000) 
        		    begin
        		        cnt__output_decide <= 0;
        		    end
        		else 
        		    begin
        		        cnt__output_decide <=  cnt__output_decide + 1'b1;
        		    end
        	end
    end
//Output decision
always @ (posedge clk)
    begin
        if(rst)
        	begin
        		pwm_out = 1'b0;
        	end
        else
        	begin
        		if (cnt__output_decide < cnt_duty_circle) 
        		    begin
        		        pwm_out <= 1'b1;
        		    end
        		else 
        		    begin
        		        pwm_out <= 1'b0;
        		    end
        	end
    end
endmodule