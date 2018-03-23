module flipflop1(clock, reset,a, b, Q);
input clock, reset, a, b;
output Q;
reg Q;
wire D;
always @(posedge clock or posedge reset)
  begin
    if (reset) begin
      // Asynchronous reset when reset goes high
      Q <= 1'b0;
    end else begin
      // Assign D to Q on positive clock edge
      Q <= D;
    end
  end
  assign D = a;
endmodule

module test;

reg clock;
reg reset;
reg a;
reg b;
wire Q;

flipflop1 ff(.clock(clock), .reset(reset), .a(a), .b(b), .Q(Q));

initial begin

	$display("reset clock");
	a = 0;
	b = 0;
	clock = 0;
	reset = 1;
	#1 $display("Q:%0h",Q);
	$display("Reset");
	a = 1;
	b = 0;
	reset = 0;
	#1 $display("Q:%0h",Q);
	$display("set 1");
	clock = 1;
	#1 $display("Q:%0h",Q);
	#1 $display("Q:%0h",Q);
	#1 $display("Q:%0h",Q);
	clock = 0;
	a = 0;
	b = 0;
	#1 $display("Q:%0h",Q);
	#1 $display("Q:%0h",Q);
	clock = 1;
	#1 $display("Q:%0h",Q);
end
endmodule
