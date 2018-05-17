module FFjk(input clk, j,k, output reg Q);
	initial Q=0;
	always @(posedge clk) begin
		if(j==0 && k==0)
			Q<=Q;
		else if({j,k}==2'b01)
			Q<=1'b0;
		else if(j&~k)
			Q<=1'b1;
		else
			Q<=~Q;
	end
endmodule

module ejemplo4(input clk, x, output z);
	wire A, B;
	wire w1,w2,w3;
	//initial begin
	//	A=0;
	//	B=0;
	//end
	assign w1=B&~x;
	not N1(w2,x);
	xor E1(w3,x,A);
	FFjk ffA(clk, B, w1, A);
	FFjk ffB(clk,w2,w3,B);
	assign z=~(A&B);
endmodule

module ejemplo4_TB();
	reg clk, x;
	wire z;

	ejemplo4 E4(clk,x,z);

	initial forever #10 clk=~clk;
	initial #110 $finish;

	initial begin
		clk=0;
		x=0;
		#3 x=1;
		#15 x=0;	// t=18
	end

	initial
		$monitor("t=%d\tclk=%b\tx=%b\tz=%b, A=%b, B=%b", $time, clk, x, z,E4.A, E4.B);
endmodule

