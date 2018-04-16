module ByteAdder;
  
endmodule

module BtyeSub;

endmodule

module FullAdder(A, B, Cin, Sum, Cout);
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

module testbench;

  reg clock;
  // 2 8-bit inputs (A, B) -> 8-bit output
  reg [7:0] A;
  reg [7:0] B;

  reg FAa, FAb, FAcin;

  wire FAsum, FAcout;

  FullAdder fullAdder(FAa, FAb, FAcin, FAsum, FAcout);

  initial begin
    #1

    // Initialize input as byte
    A[7:0] = 8'b11111111;
    B[7:0] = 8'b11111111;

    clock=0;
    clock=1; FAa=1; FAb=0; FAcin=0; display;
    clock=0;
    clock=1; FAa=1; FAb=1; FAcin=1; display;
    clock=0;
    clock=1; FAa=0; FAb=0; FAcin=1; display;
  end

  task display;
    #1 $display("Clock: %b | A + B: %b Cout: %b", clock, FAsum, FAcout);
  endtask

endmodule