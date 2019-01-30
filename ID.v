module  ID (clk ,rst_n,story,turn_up,turn_down,sp_inbtn1, sp_inbtn2 ,sp_inbtn3 ,sp_outbtn1 ,sp_outbtn2_up,sp_outbtn2_down,sp_outbtn3 );
output  turn_up,turn_down;
input clk,rst_n,sp_inbtn1, sp_inbtn2 ,sp_inbtn3 ,sp_outbtn1 ,sp_outbtn2_up,sp_outbtn2_down,sp_outbtn3;
input [2:0]story;
reg turn_down,turn_up;



always@(*)begin				
case(story)
	1:
	begin
		if(sp_inbtn2 == 0 || sp_outbtn2_up == 0 || sp_outbtn2_down == 0)begin	
			turn_down = 0;
			turn_up = 1;
		end else if (sp_inbtn3 == 0 || sp_outbtn3 == 0)begin
			turn_down = 0;
			turn_up = 1;
		end else begin
			turn_down = 0;
			turn_up = 0;
		end
	end
	2:
	begin
		if(sp_inbtn1 == 0 || sp_outbtn1 == 0)begin	
			turn_down = 1;
			turn_up = 0;
		end else if (sp_inbtn3 == 0 || sp_outbtn3 == 0)begin
			turn_down = 0;
			turn_up = 1;
		end else begin
			turn_down = 0;
			turn_up = 0;
		end
	end
	3:
	begin
		if(sp_inbtn2 == 0 || sp_outbtn2_up == 0 || sp_outbtn2_down == 0)begin	
			turn_down = 1;
			turn_up = 0;
		end else if (sp_inbtn1 == 0 || sp_outbtn1 == 0)begin
			turn_down = 1;
			turn_up = 0;
		end else begin
			turn_down = 0;
			turn_up = 0;
		end
	end
	endcase
end






endmodule