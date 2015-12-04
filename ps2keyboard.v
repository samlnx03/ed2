`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:32:01 12/04/2015 
// Design Name: 
// Module Name:    keyboard
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//		codigo verilog
//		http://students.iitk.ac.in/eclub/assets/tutorials/keyboard.pdf 
//
//		scan codes y teroria
//		http://www.eecg.toronto.edu/~jayar/ece241_08F/AudioVideoCores/ps2/ps2.html
//
//////////////////////////////////////////////////////////////////////////////////
module keyboard(
	input wire clk,// Clock pin form keyboard
	input wire data, //Data pin form keyboard
	output reg [7:0] led  //Printing input data to led
	);
	reg [7:0] data_curr;
	reg [7:0] data_pre;
	reg [3:0] b;
	reg flag;
	initial begin
		b<=4'h1;
		flag<=1'b0;
		data_curr<=8'hf0;
		data_pre<=8'hf0;
		led<=8'hf0;
	end 
	always @(negedge clk) begin //Activating at negative edge of clock from keyboard
		case(b)
			1:; 		//first bit
			2:data_curr[0]<=data;
			3:data_curr[1]<=data;
			4:data_curr[2]<=data;
			5:data_curr[3]<=data;
			6:data_curr[4]<=data;
			7:data_curr[5]<=data;
			8:data_curr[6]<=data;
			9:data_curr[7]<=data;
			10:flag<=1'b1;  //Parity bit
			11:flag<=1'b0;  //stop bit
		endcase
		if(b<=10)
			b<=b+1;
		else if(b==11)
			b<=1;
	end 
	always@(posedge flag) begin // Printing data obtained to led
		if(data_curr==8'hf0)	// break code
			led<=data_pre;		// será leido nuevamente pero es el mismo :)
		else
			data_pre<=data_curr;
	end

endmodule
