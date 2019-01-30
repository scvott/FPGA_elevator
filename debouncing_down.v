module debouncing_down(sp_btn,btn,sensor1,sensor2,clk,rst_n); 
output sp_btn; 
input  rst_n,clk,btn,sensor1,sensor2;  
reg [1:0]st;
reg down; 

 
always @(posedge clk or negedge rst_n) begin 
 if (!rst_n) st <= 2'b00; 
 else begin 
  if(btn==0) 
   st<=2'b01; 
  if(sensor2==1 && sensor1 == 0) 
   down<=1;
   else 
   down<=0;
  if (down==1 && sensor1==1)
	st<=2'b00;
 end 
end 
assign sp_btn = (st ==2'b01 ) ? 1'b0 : 1'b1 ; 
endmodule