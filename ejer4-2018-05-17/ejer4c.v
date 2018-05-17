module ejemplo4(input r, clk, x, output z);
	reg A, B;
	always @(posedge clk, posedge r) begin
		if(r) begin
			A<=0;
			B<=0;
		end
		else begin
			A<=~A&B | A&~B | A&x;
			B<=~A&~x | ~B&~x | A&B&x;
		end
	end
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

	initial begin
		$dumpfile("salida.vcd");
		$dumpvars();
	end
endmodule

