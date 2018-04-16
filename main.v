/**
 * Main.v - ALU implementation
 */

// Multiplexer to choose output
module Mux8(
  out,
  sel,
  in0,
  in1,
  in2,
  in3,
  in4,
  in5,
  in6,
  in7
);

  input [7:0] in0, in1, in2, in3, in4, in5, in6, in7;
  input [2:0] sel;

  output [7:0] out;

  reg [7:0] out;

  always @ (in0 or in1 or in2 or in3 or in4 or in5 or in6 or in7 or sel) begin
    case (sel)
      3'b000: out = in0;
      3'b001: out = in1;
      3'b010: out = in2;
      3'b011: out = in3;
      3'b100: out = in4;
      3'b101: out = in5;
      3'b110: out = in6;
      3'b111: out = in7;

      // If input is undefined then output is undefined
      default: out = 8'bx;
    endcase
  end

endmodule

module Mux1(
  out,
  sel,
  in0,
  in1,
  in2,
  in3,
  in4,
  in5,
  in6,
  in7
);

  input in0, in1, in2, in3, in4, in5, in6, in7;
  input [2:0] sel;

  output out;

  reg out;

  always @ (in0 or in1 or in2 or in3 or in4 or in5 or in6 or in7 or sel) begin
    case (sel)
      3'b000: out = in0;
      3'b001: out = in1;
      3'b010: out = in2;
      3'b011: out = in3;
      3'b100: out = in4;
      3'b101: out = in5;
      3'b110: out = in6;
      3'b111: out = in7;

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

  // TODO: Shift A Left
  wire [7:0] shiftALeft;

  // TODO: Shift A Right
  wire [7:0] shiftARight;

  // Mux selector to choose the output (8 Choices)
  wire [7:0] out;
  reg [2:0] sel;
  Mux8 outMux8(out, sel,
    sum,
    diff,
    aAndB,
    aOrB,
    aXorB,
    notA,
    shiftALeft,
    shiftARight
  );

  // Mux selector to choose the overflow output
  wire overflow;
  Mux1 overflowMux1(overflow, sel,
    addCout,
    subCout,
    1'bx,
    1'bx,
    1'bx,
    1'bx,
    1'bx,
    1'bx
  );

  initial begin
    #1

    // Init input as byte
    A[7:0] = 8'b1;
    B[7:0] = 8'b0;

    // Select inputs
    // 000 = sum
    // 001 = diff
    // 010 = and
    // 011 = or
    // 100 = xor
    // 101 = not
    // 110 = shift left
    // 111 = shift right

    // TODO: Set input and sel on clock tick
    clock=0;
    // ADD
    #1 $display("ADD");
    clock=1; addCin=0; sel=3'b0; display;
    clock=0;
    // SUB
    #1 $display("SUB");
    clock=1; B=8'b10101010; sel=3'b001; display;
    clock=0;
    // AND
    #1 $display("AND");
    clock=1; A=8'b10100000; sel=3'b010; display;
    clock=0;
    // OR
    #1 $display("OR");
    clock=1; B=8'b00101100; sel=3'b011; display;
    clock=0;
    // XOR
    #1 $display("XOR");
    clock=1; A=8'b00100011; sel=3'b100; display;
    clock=0;
    // NOT
    #1 $display("NOT");
    clock=1; A=8'b00001111; sel=3'b101; display;
    clock=0;

    // TODO: Shift Left/Right
  end

  task display;
    #1 $display("Clock: %b | A: %b | B: %b | AddCin: %b | Output: %b | Overflow: %b", clock, A, B, addCin, out, overflow);
  endtask

endmodule