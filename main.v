/**
 * Main.v - ALU implementation
 */

// Multiplexer to choose output
module DisplayMux(
  out,
  sel,
  in0,
  in1,
  in2,
  in3,
  in4,
  in5,
  in6,
  in7,
  in8
);

  input [7:0] in0, in1, in2, in3, in4, in5, in6, in7, in8;
  input [3:0] sel;

  output [7:0] out;

  reg [7:0] out;

  always @ (in0 or in1 or in2 or in3 or in4 or in5 or in6 or in7 or in8 or sel) begin
    case (sel)
      // ADD
      4'b0000: out = in0;
      // SUB
      4'b0001: out = in1;
      // AND
      4'b0010: out = in2;
      // OR
      4'b0011: out = in3;
      // XOR
      4'b0100: out = in4;
      // NOT
      4'b0101: out = in5;
      // SHIFT LEFT
      4'b0110: out = in6;
      // SHIFT RIGHT
      4'b0111: out = in7;
      // LAST SOLUTION
      4'b1000: out = in8;

      // If input is undefined then output is undefined
      default: out = 8'bx;
    endcase
  end

endmodule

module OverflowMux(
  out,
  sel,
  in0,
  in1
);

  input in0, in1;
  input [3:0] sel;

  output out;

  reg out;

  always @ (in0 or in1 or sel) begin
    case (sel)
      // Add
      4'b0000: out = in0;
      // Shift Left
      4'b0110: out = in1;

      // If input is undefined then output is undefined
      default: out = 1'bx;
    endcase
  end

endmodule

// Include adder/subtractor, shift left/right, AND, OR, XOR, NOT
// Overflow and carry-over
`include "addersub.v"
`include "shift.v"

module main;
  reg clock;
  // 2 8-bit inputs (A, B) -> 8-bit output
  reg [7:0] A;
  reg [7:0] B;

  // Mode params for output and overflow mux
  // 0000 = sum
  // 0001 = diff
  // 0010 = and
  // 0011 = or
  // 0100 = xor
  // 0101 = not
  // 0110 = shift left
  // 0111 = shift right
  // 1000 = last solution

  // A + B
  reg addCin;
  wire [7:0] sum;
  wire addCout;
  ByteAdder byteAdder(A, B, addCin, sum, addCout);

  // A - B
  wire [7:0] diff;
  wire subCout;
  ByteSub byteSub(A, B, diff, subCout);

  // A AND B
  wire [7:0] aAndB;
  ByteAnd byteAnd(A, B, aAndB);

  // A OR B
  wire [7:0] aOrB;
  ByteOr byteOr(A, B, aOrB);
  
  // A XOR B
  wire [7:0] aXorB;
  ByteXor byteXor(A, B, aXorB);

  // NOT A
  wire [7:0] notA;
  ByteNot byteNot(A, notA);

  // Shift
  reg clear;
  reg dataBit;

  // Shift A Left
  wire [7:0] shiftALeft;
  wire leftOverflow;
  shiftLeft shftLeft(clock, clear, dataBit, shiftALeft, leftOverflow);

  // Shift A Right
  wire [7:0] shiftARight;
  wire rightOverflow;
  shiftRight shftRight(clock, clear, dataBit, shiftARight, rightOverflow);

  // Last Solution
  reg [7:0] lastSolution;

  // Mux selector to choose the output (9 Choices)
  wire [7:0] out;
  reg [3:0] mode;
  DisplayMux displayMux(out, mode,
    sum,
    diff,
    aAndB,
    aOrB,
    aXorB,
    notA,
    shiftALeft,
    shiftARight,
    lastSolution
  );

  // Mux selector to choose the overflow output (2 Choices)
  wire overflow;
  OverflowMux overflowMux(overflow, mode,
    addCout,
    leftOverflow
  );

  // Set the last solution to the output on each clock tick
  always @(posedge clock) begin
    lastSolution = out;
  end

  initial begin
    #1

    // Init input as byte
    A[7:0] = 8'b11111111;
    B[7:0] = 8'b0;

    addCin=1;

    // Set input and sel on clock tick
    clock=0;

    // ADD
    clock=1; mode=4'b0000; #1 $display("ADD | Mode: %b | AddCin: %b", mode, addCin); display;
    clock=0;

    // SUB
    clock=1; B=8'b10101010; mode=4'b0001; #1 $display("SUB | Mode: %b", mode); display;
    clock=0;

    // AND
    clock=1; A=8'b10100000; mode=4'b0010; $display("AND | Mode: %b", mode); display;
    clock=0;

    // OR
    clock=1; B=8'b00101100; mode=4'b0011; $display("OR | Mode: %b", mode); display;
    clock=0;

    // LAST SOLUTION
    clock=1; mode=4'b1000; $display("LAST SOL | Mode: %b", mode); display;

    // XOR
    clock=1; A=8'b00100011; mode=4'b0100; $display("XOR | Mode: %b", mode); display;
    clock=0;

    // NOT
    clock=1; A=8'b00001111; mode=4'b0101; $display("NOT | Mode: %b", mode); display;
    clock=0;

    // Shift Left
    #1 $display("SHIFT LEFT");
    clear=1'b1; dataBit=A[0];
    clock=1; dataBit=1'b1; mode=4'b0110; display;
    clock=0; clear=1'b0;
    // Shift Left
    repeat (8) begin
    #1 $display("SHIFT LEFT");
    clock=1; mode=4'b110; display;
    clock=0;
    end
    clear=1'b1; clock=1;clear=1'b0;clock=0;
    //Shift Right
    repeat (8) begin
    dataBit=1'b0; 
    #1 $display("SHIFT RIGHT");
    clock=1; mode=4'b0111; display;
    clock=0;
    end
  end

  task display;
    #1 $display("Clock: %b | A: %b | B: %b | Output: %b | Overflow: %b\n", clock, A, B, out, overflow);
  endtask

endmodule