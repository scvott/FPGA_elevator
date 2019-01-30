module elevaor (door,story_singal,oSEG7, clk, rst_n, inbtn1, inbtn2, inbtn3, inbtn4, outbtn1, outbtn1, outbtn2, outbtn3, outbtn4,sns1,sns2,sns3,sns4);
output door, story_singal ,oSEG7;
input clk, rst_n, inbtn1, inbtn2, inbtn3, inbtn4, outbtn1, outbtn1, outbtn2, outbtn3, outbtn4,sns1,sns2,sns3,sns4;
wire sp_inbtn1, sp_inbtn2 sp_inbtn3, sp_inbtn4 ,sp_outbtn1 ,sp_outbtn2,sp_outbtn3 ,sp_outbtn4 ;
wire [2:0]story;
wire clk_24;

clk_div CD0 ( clk_24, clk,rst_n );
debouncing DI0 (sp_inbtn1 ,inbtn1 ,clk ,rst_n ); 
debouncing DI1 (sp_inbtn2 ,inbtn2 ,clk ,rst_n );
debouncing DI2 (sp_inbtn3 ,inbtn3 ,clk ,rst_n );
debouncing DI3 (sp_inbtn4 ,inbtn4 ,clk ,rst_n );
debouncing DO0 (sp_outbtn1 ,outbtn1 ,clk ,rst_n );
debouncing DO1 (sp_outbtn2 ,outbtn2 ,clk ,rst_n );
debouncing DO2 (sp_outbtn3 ,outbtn3 ,clk ,rst_n );
debouncing DO3 (sp_outbtn4 ,outbtn4 ,clk ,rst_n );
seven_seg S0 ( oSEG7 , story );
ID Y0 (story_T ,sp_inbtn1, sp_inbtn2 sp_inbtn3, sp_inbtn4 ,sp_outbtn1 ,sp_outbtn2,sp_outbtn3 ,sp_outbtn4 );
motor M0 ( story_singal , story_T,story );
open_door OD0 ( door_oper ,story , sns1, sns2, sns3, sns4);


endmodule