module stepper(clk,rst_n,x,y,xb,yb);
input clk,rst_n;
output x,y,xb,yb;
reg x,y,xb,yb;
reg	[2:0] state,next_state;

always@(posedge clk or negedge rst_n)begin
	if(!rst_n) state <=0;
	else state <= next_state;
end

always@(*)begin
	case(state)
		0:
		begin
		next_state = 1;
		x = 0;
		y = 0;
		xb = 1;
		yb = 1;
		end
		1:
		begin
		next_state = 2;
		x = 1;
		y = 0;
		xb = 0;
		yb = 1;
		end
		2:
		begin
		next_state = 3;
		x = 1;
		y = 1;
		xb = 0;
		yb = 0;
		end
		3:
		begin
		next_state = 0;
		x = 0;
		y = 1;
		xb = 1;
		yb = 0;
		end
	endcase
	
end 
endmodule