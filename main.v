/**
 * Main.v - ALU implementation
 */

// Include adder/subtractor, shift left/right, AND, OR, XOR, NOT
// Overflow and carry-over
`include "addersub.v"
`include "shift.v"
`include "logic.v"

module main;
  reg clock;
  // 2 8-bit inputs (A, B) -> 8-bit output
  reg [7:0] A;
  reg [7:0] B;

  // TODO: A + B

  // TODO: A - B

  // TODO: Shift A Left 1 Bit

  // TODO: Shift A Right 1 Bit

  // TOOD: A AND B

  // TODO: A OR B
  
  // TODO: A XOR B

  // TODO: NOT A

  initial begin
    #1

    // Initialize input as empty byte
    A[7:0] = 8'b0;
    B[7:0] = 8'b0;

    clock=0;
    clock=1; display;
  end

  task display;
    // TODO: Display result of each ALU component
    #1 $display("Clock: %b", clock);
  endtask

endmodule


