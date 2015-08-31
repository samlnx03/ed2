module m0(input s1,s0, output reg y3,y2,y1,y0);
// compilado con iverilog de linux
always @(*) begin
        if(!s1 && !s0) begin
                y3<=0; y2=0; y1=0; y0=1;
        end
        else if(!s1 && s0) begin
                y3<=0; y2=0; y1=1; y0=0;
        end
        else if (s1 && !s0) begin
                y3<=0; y2=1; y1=0; y0=0;
        end
        else if (s1 && s0) begin
                y3<=1; y2=0; y1=0; y0=0;
        end
end
endmodule

// testbench para la simulacion
module simulacionmotb;
reg z1, s0;
wire y3,y2,y1,y0;
m0 m0tb(z1,s0, y3,y2,y1,y0);
initial begin
        z1=0; s0=0;
        #50;
        z1=0; s0=1;
        #50;
        z1=1; s0=0;
        #50;
        z1=1; s0=1;
        #50;
end

initial begin
        $display("t\ts1\ts0\ty3\ty2\ty1\ty0");
        $monitor("%3d\t%b\t%b\t%b\t%b\t%b\t%b", $time, z1, s0, y3,y2,y1,y0);
end
endmodule
