module ByteAnd #(parameter MSB=8) (A, B, out);
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

module ByteOr #(parameter MSB=8) (A, B, out);
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

module testbench;
  reg clock;
  // 2 8-bit inputs (A, B) -> 8-bit output
  reg [7:0] A;
  reg [7:0] B;
  wire [7:0] AandB;
  wire [7:0] AorB;

  ByteAnd byteAnd(.A(A), .B(B), .out(AandB));
  ByteOr byteOr(.A(A), .B(B), .out(AorB));

  initial begin
    #1

    // Initialize input as empty byte
    A[7:0] = 8'b11111111;
    B[7:0] = 8'b11111111;

    clock=0;
    clock=1; display;
  end

  task display;
    // TODO: Display result of each ALU component
    #1 $display("Clock: %b | A and B: %b | A or B: %b", clock, AandB, AorB);
  endtask

endmodule