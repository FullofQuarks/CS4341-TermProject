// D flip-flop
module dff (clk, reset, d, q, qb);
  input      clk;
  input      reset;
  input      d;
  output     q;
  output     qb;

  reg        q;

  assign qb = ~q;

  always @(posedge clk or posedge reset)
  begin
    if (reset) begin
      // Asynchronous reset when reset goes high
      q <= 1'b0;
    end else begin
      // Assign D to Q on positive clock edge
      q <= d;
    end
  end
endmodule

module main;
    reg clock;
    reg x, y;
    reg A, B, resetA, resetB;

    wire nextA, nextB, nextANot, nextBNot;

    dff DFF_A(clock, resetA, dA, nextA, nextANot);
    dff DFF_B(clock, resetB, dB, nextB, nextBNot);

    initial begin

        // // Reset the flip flops
        // // Reset
        // resetA = 1;
        // A = 1'bx;
        // resetB = 1;
        // B = 1'bx;
        // // Release Reset
        // A = 1;
        // resetA = 0;
        // B = 1;
        // resetB = 0;

        clock=0; A=0; B=1; display;
        clock=1; A=0; B=1; display;
        clock=0; A=0; B=1; display;
        clock=1; A=0; B=1; display;
        clock=0; A=0; B=0; display;
        clock=1; A=0; B=0; display;
        clock=0; A=0; B=0; display;
        clock=1; A=0; B=0; display;
        clock=0; A=1; B=1; display;
        clock=1; A=1; B=1; display;
        clock=0; A=1; B=1; display;
        clock=1; A=1; B=1; display;
        clock=0; A=1; B=0; display;
        clock=1; A=1; B=0; display;
        clock=0; A=1; B=0; display;
        clock=1; A=1; B=0; display;
    end

    task display;
        #1 $display("Clock: %b | A: %b | B: %b | x: %b | y: %b | Next A: %b | Next B: %b | z: %b", clock, A, B, x, y, nextA, nextB, nextA);
    endtask

endmodule