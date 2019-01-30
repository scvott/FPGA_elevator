module sensor_story (clk,rst_n,story,sensor1,sensor2,sensor3,sensor4); 
input clk,rst_n,sensor1,sensor2,sensor3,sensor4; 
output story; 
reg [2:0]story,n_story; 

always @(posedge clk or negedge rst_n)begin 
 story <= n_story; 
end 

always @(*)begin 
 if(sensor1 == 0 && sensor2 == 0)begin 
  n_story = 1; 
 end else if(sensor3 == 0 && sensor2 == 0) begin 
  n_story =2; 
 end else if(sensor3 == 0 && sensor4 == 0) begin 
  n_story =3; 
 end else begin 
  n_story = story; 
 end 
end 

endmodule