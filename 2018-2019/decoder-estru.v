module decoder1de4(input s1,s0, output y0,y1,y2,y3);
	// estructural (o de compuertas)
	// flujo de datos (ecuaciones)
	// de comportamiento (algoritmico)

	// estructural
	wire w0, w1;
	not N0(w0,s0);
	not N1(w1,s1);
	and A3(y3,s1,s0);
	and A2(y2,s1,w0);
	and A1(y1,w1,s0);
	and A0(y0,w1,w0);

endmodule

// simulacion prueba (testbench)
module decoder1de4_TB(); // sin input  y sin output
	reg s1,s0;  // las input se declaran como reg
	wire y0,y1,y2,y3;  // los output se declaran como wire
	
	decoder1de4 U1(s1,s0, y0,y1,y2,y3);  // modulo a simular

	initial begin
		$monitor("%2d:  s1s0=%b%b, y0=%b y1=%b y2=%b y3=%b",$time, s1,s0,y0,y1,y2,y3);
	end
	
	initial begin
		// t=0
		s1=0; s0=0;
		#10  s0=1;
		#10 s1=1; s0=0;
		#10 s0=1;
		#10 $finish;
	end

endmodule








