/**
* First part of the counter
*/
module First_Bit(up, down, w1, fb);
    input up, down;
    output fb, w1;
    wire w1, nup;

    and(w1,nup,down);
    or(fb,up,w1);
    not(nup,up);
endmodule

module Second_Bit(w1, Qb1, up, Q1, w2, w3, sb);
    input w1, Qb1, up, Q1;
    output w2, w3, sb;
    wire w2, w3;

    and(w2,w1,Qb1);
    and(w3,up,Q1);
    or(sb,w2,w3);
endmodule


module flipflop(clock, clear_b, T, Q, Qb);
input clock, clear_b, T;
output Q;
output Qb;
reg Q;
assign Qb = ~Q;
wire D;
//Turns D flip flops into T types
assign D = T^Q;
always @(posedge clock or posedge clear_b)
  begin
    if (clear_b) begin
      // Asynchronous reset when reset goes high
      Q <= 1'b0;
    end else begin
      // Assign D to Q on positive clock edge
      Q <= D;
    end
  end
endmodule

module test;
reg clock;
reg clear_b;
reg up;
reg down;
wire b1;
wire b2;
wire b3;
wire b4;
wire w1;
wire w2, w3;
wire w4, w5;
wire w6, w7;
wire Q1, Qb1;
wire Q2, Qb2;
wire Q3, Qb3;
wire Q4, Qb4;

//Set up the beginning of the circuit
First_Bit first(.up(up), .down(down), .w1(w1), .fb(b1));
flipflop ff1(.clock(clock), .clear_b(clear_b), .T(b1), .Q(Q1), .Qb(Qb1));
Second_Bit second(.w1(w1), .Qb1(Qb1), .up(up), .Q1(Q1), .w2(w2), .w3(w3), .sb(b2));
Second_Bit third(.w1(w2), .Qb1(Qb2), .up(w3), .Q1(Q2), .w2(w4), .w3(w5), .sb(b3));
Second_Bit fourth(.w1(w4), .Qb1(Qb3), .up(w5), .Q1(Q3), .w2(w6), .w3(w7), .sb(b4));
//Feed into the D flip flops the results of the previous circuits
flipflop ff2(.clock(clock), .clear_b(clear_b), .T(b2), .Q(Q2), .Qb(Qb2));
flipflop ff3(.clock(clock), .clear_b(clear_b), .T(b3), .Q(Q3), .Qb(Qb3));
flipflop ff4(.clock(clock), .clear_b(clear_b), .T(b4), .Q(Q4), .Qb(Qb4));
initial begin
	clock = 0;
	clear_b = 1;
	up = 0;
	down = 1;
	#1
	clock = 1; display;
	clear_b=0;
	clock = 0; display;
	clock = 1; display;
	clock = 0; display;
	clock = 1; display;
	clock = 0; display;
end

task display;
	$display("Clock:%0b | B1:%0b B2:%0b B3:%0b B4:%0b",clock,Q1,Q2,Q3,Q4);
endtask
endmodule
