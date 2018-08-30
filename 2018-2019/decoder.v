module decoder1de4(input s1,s0, output reg y0,y1,y2,y3);
	// estructural (o de compuertas)
	// flujo de datos (ecuaciones)
	// de comportamiento (algoritmico)

	// compportamiento
	always @(s1,s0) begin  // (*) lista sensible, cuando cambia alguna
							// de las vatiables se evalua el bloque de codigo
		{y0,y1,y2,y3}=4'b0000;  // las llaves son para agrupar bits y verlos
								// como un conjunto o numero binario
		case({s1,s0})
			2'b00: begin y0=1; end
			2'd1:	y1=1;
			2'h2:	y2=1;
			2'o3:	y3=1;
			default: begin y0=0; y1=0; y2=0; y3=0; end
		endcase
	end

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








