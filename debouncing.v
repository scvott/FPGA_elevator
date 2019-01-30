module debouncing(sp_btn,btn,sensor1,sensor2,clk,rst_n); 
output sp_btn; 
input  rst_n,clk,btn,sensor1,sensor2; 
reg [1:0]st; 

 
always @(posedge clk or negedge rst_n) begin 
 if (!rst_n) st <= 2'b00; 
 else begin 
  if(btn==0) 
   st<=2'b01; 
  if(sensor1==1 && sensor2 == 1) 
   st<=2'b00; 
 end 
end 
assign sp_btn = (st ==2'b01 ) ? 1'b0 : 1'b1 ; 
endmodule