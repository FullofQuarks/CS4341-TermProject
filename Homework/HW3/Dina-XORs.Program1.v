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

    wire dA, dB, qA, qB, qANot, qBNot;

    // nextA = xy' + xB
    wire yNot, xAndyNot, xAndB;
    not(yNot, y);
    and(xAndyNot, x, yNot);
    and(xAndB, x, B);
    or(dA, xAndyNot, xAndB);

    // nextB = xA + xB'
    wire xAndA, BNot, xAndBNot;
    and(xAndA, x, A);
    not(BNot, B);
    and(xAndBNot, x, BNot);
    or(dB, xAndA, xAndBNot);

    // Flip flops
    dff DFF_A(clock, resetA, dA, qA, qANot);
    dff DFF_B(clock, resetB, dB, qB, qBNot);

    initial begin

        // Reset the flip flops
        // Reset
        clock = 0;
        resetA = 1;
        A = 1'bx;
        resetB = 1;
        B = 1'bx;
        // Release Reset
        
        #1

        clock=0; A=0; B=0; x=0; y=0; display;
        resetA = 0;
        resetB = 0;
        clock=1; A=0; B=0; x=0; y=1; display;
        clock=0; A=0; B=0; x=1; y=0; display;
        clock=1; A=0; B=0; x=1; y=1; display;
        clock=0; A=0; B=1; x=0; y=0; display;
        clock=1; A=0; B=1; x=0; y=1; display;
        clock=0; A=0; B=1; x=1; y=0; display;
        clock=1; A=0; B=1; x=1; y=1; display;
        clock=0; A=1; B=0; x=0; y=0; display;
        clock=1; A=1; B=0; x=0; y=1; display;
        clock=0; A=1; B=0; x=1; y=0; display;
        clock=1; A=1; B=0; x=1; y=1; display;
        clock=0; A=1; B=1; x=0; y=0; display;
        clock=1; A=1; B=1; x=0; y=1; display;
        clock=0; A=1; B=1; x=1; y=0; display;
        clock=1; A=1; B=1; x=1; y=1; display;
    end

    task display;
        #1 $display("Clock: %b | A: %b | B: %b | x: %b | y: %b | Next A: %b | Next B: %b | z: %b", clock, A, B, x, y, dA, dB, A);
    endtask

endmodule