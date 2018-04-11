module ByteAnd (A, B, out);
  // 8-bit inputs
  input [7:0] A;
  input [7:0] B;
  // 8-bit output
  output [7:0] out;
  reg [7:0] out;

  integer index;
  always @(*) begin
    for (index = 0; index < 8; index++) begin
      out[index] = A[index] & B[index];
    end
  end
endmodule

module ByteOr (A, B, out);
  // 8-bit inputs
  input [7:0] A;
  input [7:0] B;
  // 8-bit output
  output [7:0] out;
  reg [7:0] out;

  integer index;
  always @(*) begin
    for (index = 0; index < 8; index++) begin
      out[index] = A[index] | B[index];
    end
  end
endmodule

module ByteXor (A, B, out);
  // 8-bit inputs
  input [7:0] A;
  input [7:0] B;
  // 8-bit output
  output [7:0] out;
  reg [7:0] out;

  integer index;
  always @(*) begin
    for (index = 0; index < 8; index++) begin
      out[index] = A[index] ^ B[index];
    end
  end
endmodule

module ByteNot (A, out);
  // 8-bit input
  input [7:0] A;
  // 8-bit output
  output [7:0] out;
  reg [7:0] out;

  integer index;
  always @(*) begin
    for (index = 0; index < 8; index++) begin
      out[index] = !A[index];
    end
  end
endmodule

module testbench;
  reg clock;
  // 2 8-bit inputs (A, B) -> 8-bit output
  reg [7:0] A;
  reg [7:0] B;
  wire [7:0] AandB;
  wire [7:0] AorB;
  wire [7:0] AxorB;
  wire [7:0] notA;

  ByteAnd byteAnd(.A(A), .B(B), .out(AandB));
  ByteOr byteOr(.A(A), .B(B), .out(AorB));
  ByteXor byteXor(.A(A), .B(B), .out(AxorB));
  ByteNot byteNot(.A(A), .out(notA));

  initial begin
    #1

    // Initialize input as byte
    A[7:0] = 8'b11101111;
    B[7:0] = 8'b01101101;

    clock=0;
    clock=1; display;
  end

  task display;
    // TODO: Display result of each ALU component
    #1 $display("Clock: %b | A and B: %b | A or B: %b | A xor B: %b | not A: %b", clock, AandB, AorB, AxorB, notA);
  endtask

endmodule
