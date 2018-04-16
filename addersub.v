`include "logic.v"

module FullAdder (A, B, Cin, Sum, Cout);
  input A;
  input B;
  input Cin;
  output Sum;
  output Cout;

  wire Xor1, Sum, And1, And2, Cout;

  xor(Xor1, A, B);
  and(And1, A, B);
  xor(Sum, Cin, Xor1);
  and(And2, Cin, Xor1);
  or(Cout, And1, And2);
endmodule

module ByteAdder (A, B, Cin, out, Cout);
  // 8-bit inputs
  input [7:0] A;
  input [7:0] B;

  input Cin;

  // 8-bit output
  output [7:0] out;

  output Cout;

  wire c1, c2, c3, c4, c5, c6, c7;

  FullAdder fa0(A[0], B[0], Cin, out[0], c1);
  FullAdder fa1(A[1], B[1], c1, out[1], c2);
  FullAdder fa2(A[2], B[2], c2, out[2], c3);
  FullAdder fa3(A[3], B[3], c3, out[3], c4);
  FullAdder fa4(A[4], B[4], c4, out[4], c5);
  FullAdder fa5(A[5], B[5], c5, out[5], c6);
  FullAdder fa6(A[6], B[6], c6, out[6], c7);
  FullAdder fa7(A[7], B[7], c7, out[7], Cout);
endmodule

module ByteSub (A, B, Diff, Cout);
  input [7:0] A;
  input [7:0] B;

  output [7:0] Diff;
  output Cout;

  wire [7:0] notB;
  ByteNot byteNot(B, notB);
  ByteAdder byteAdder(A, notB, 1'b1, Diff, Cout);

endmodule

module addersubtestbench;

  reg clock;
  // 2 8-bit inputs (A, B) -> 8-bit output
  reg [7:0] A;
  reg [7:0] B;

  reg Cin;

  wire AdderOut;
  wire SubOut;

  wire [7:0] Sum;
  wire [7:0] Diff;

  ByteAdder byteAdder(A, B, Cin, Sum, AdderOut);
  ByteSub byteSub(A, B, Diff, SubOut);

  initial begin
    #1

    // Initialize input as byte
    A[7:0] = 8'b11111111;
    B[7:0] = 8'b00001111;

    clock=0;
    clock=1; Cin=0; display;
  end

  task display;
    #1 $display("Clock: %b | Cin: %b | A + B: %b | AdderCarryOut: %b | A - B: %b | SubCarryOut: %b ", clock, Cin, Sum, AdderOut, Diff, SubOut);
  endtask

endmodule