module elevator (x,y,oSEG7, clk, rst_n, inbtn1, inbtn2, inbtn3, outbtn1, outbtn2_down, outbtn2_up, outbtn3, sensor1, sensor2, sensor3, sensor4,led1,led2,led3,led4,led5,led6,led7,led8,led9,led10);
output x, y,led1,led2,led3,led4,led5,led6,led7,led8,led9,led10;
output [6:0]oSEG7;
input clk, rst_n, inbtn1, inbtn2, inbtn3, outbtn1, outbtn2_down,outbtn2_up, outbtn3 ,sensor1, sensor2, sensor3, sensor4;
wire sp_inbtn1, sp_inbtn2 ,sp_inbtn3 ,sp_outbtn1 ,sp_outbtn2_down,sp_outbtn2_up,sp_outbtn3,clk_24,turn_down,turn_up,led1,led2,led3,led4,led5,led6,led7;
wire [2:0]story;
wire led8,led9,led10;

assign led1=~sp_outbtn1;
assign led2=~sp_outbtn2_up;
assign led3=~sp_outbtn2_down;
assign led4=~sp_outbtn3;
assign led5=~sp_inbtn1;
assign led6=~sp_inbtn2;
assign led7=~sp_inbtn3;
assign led8=sensor2;
assign led9=sensor3;
assign led10=sensor4;



clk_div C0(clk_24,clk,rst_n);

debouncing DI0 (sp_inbtn1 ,inbtn1 , sensor1 , sensor2,clk ,rst_n ); 
debouncing DI1 (sp_inbtn2 ,inbtn2 ,sensor2 , sensor3,clk ,rst_n ); 
debouncing DI2 (sp_inbtn3 ,inbtn3 ,sensor3 , sensor4,clk ,rst_n );

debouncing DO0 (sp_outbtn1 ,outbtn1,sensor1 , sensor2 ,clk ,rst_n );
debouncing_up DO1 (sp_outbtn2_up ,outbtn2_up ,sensor2 , sensor3,clk ,rst_n );
debouncing_down DO3 (sp_outbtn2_down ,outbtn2_down ,sensor2 , sensor3,clk ,rst_n );
debouncing DO2 (sp_outbtn3 ,outbtn3 ,sensor3 , sensor4,clk ,rst_n );




seven_seg S0 ( oSEG7 , story );
ID Y0 (clk ,rst_n,story,turn_up,turn_down,sp_inbtn1, sp_inbtn2 ,sp_inbtn3 ,sp_outbtn1 ,sp_outbtn2_up,sp_outbtn2_down,sp_outbtn3 );
motor_control mc0 (clk_24,rst_n,x,y,turn_down,turn_up);
sensor_story SS0(clk,rst_n,story,sensor1,sensor2,sensor3,sensor4);



endmodule