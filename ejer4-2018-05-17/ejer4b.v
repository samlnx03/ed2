module FFjk(input reset, clk, j,k, output reg Q);
	always @(posedge clk, posedge reset) begin
		if( reset)
			Q<=1'b0;
		else begin
			if(j==0 && k==0)
				Q<=Q;
			else if({j,k}==2'b01)
				Q<=1'b0;
			else if(j&~k)
				Q<=1'b1;
			else
				Q<=~Q;
		end
	end
endmodule

module ejemplo4(input r, clk, x, output z);
	wire A, B;
	wire w1,w2,w3;
	// r es reset
	//initial begin
	//	A=0;
	//	B=0;
	//end
	assign w1=B&~x;
	not N1(w2,x);
	xor E1(w3,x,A);
	FFjk ffA(r,clk, B, w1, A);
	FFjk ffB(r,clk,w2,w3,B);
	assign z=~(A&B);
endmodule

module ejemplo4_TB();
	reg r, clk, x;
	wire z;

	ejemplo4 E4(r,clk,x,z);

	initial forever #10 clk=~clk;
	initial #110 $finish;

	initial begin
		r=0;
		clk=0;
		x=0;
		#3 x=1;
		#15 x=0;	// t=18
	end
	initial begin #2 r=1; #2 r=0; end

	initial
		$monitor("t=%d\treset=%b, clk=%b\tx=%b\tz=%b, A=%b, B=%b", 
				$time, r, clk, x, z,E4.A, E4.B);
endmodule

