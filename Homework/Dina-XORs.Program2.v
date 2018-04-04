/**
* DinaXORs.Program2.v - Homework #1 - Problem 3.36
* Software: iVerilog, http://iverilog.icarus.com/
* Jacob Greenway, James Dunlap, Nicholas Smith, Ian Llewellyn
*/

module Circuit_A(A, B, C, D, F);
    input A, B, C, D;
    output F;
    wire w, x, y, z, a, d;

    or(x, B, C, d);
    and(y, a, C);
    and(w, z, B);
    and(z, y, A);
    or(F, x, w);
    not(a, A);
    not(d, D);

endmodule

module Circuit_B(F1, F2, F3, A0, A1, B0, B1);
    output F1, F2, F3;
    input A0, A1, B0, B1;

    nor(F1, F2, F3);
    or(F2, w1, w2, w3);
    and(F3, w4, w5);
    and(w1, w6, B1);
    or(w2, w6, w7, B0);
    and(w3, w7, B0, B1);
    not(w6, A1);
    not(w7, A0);
    xor(w4, A1, B1);
    xnor(w5, A0, B0);

endmodule

module Circuit_C(y1, y2, y3, a, b);
    output y1, y2, y3;
    input a, b;

    assign y1 = a || b;
    and(y2, a, b);
    assign y3 = a && b;

endmodule

module main;

    reg clock;
    reg A;
    reg B;
    reg C;
    reg D;

    wire resultA;
    wire resultB_1;
    wire resultB_2;
    wire resultB_3;
    wire resultC_1;
    wire resultC_2;
    wire resultC_3;

    Circuit_A circuit_A(A, B, C, D, resultA);
    Circuit_B circuit_B(resultB_1, resultB_2, resultB_3, A, B, C, D);
    Circuit_C circuit_C(resultC_1, resultC_2, resultC_3, A, B);

    initial begin
        forever begin
            #5 clock=0; A=1; B=1; C=1; D=1;
            #5 clock=1; A=1; B=1; C=1; D=0;
            #5 clock=0; A=1; B=1; C=0; D=1;
            #5 clock=1; A=1; B=1; C=0; D=0;
            #5 clock=0; A=1; B=0; C=1; D=1;
            #5 clock=1; A=1; B=0; C=1; D=0;
            #5 clock=0; A=1; B=0; C=0; D=1;
            #5 clock=1; A=1; B=0; C=0; D=0;
            #5 clock=0; A=0; B=1; C=1; D=1;
            #5 clock=1; A=0; B=1; C=1; D=0;
            #5 clock=0; A=0; B=1; C=0; D=1;
            #5 clock=1; A=0; B=1; C=0; D=0;
            #5 clock=0; A=0; B=0; C=1; D=1;
            #5 clock=1; A=0; B=0; C=1; D=0;
            #5 clock=0; A=0; B=0; C=0; D=1;
            #5 clock=1; A=0; B=0; C=0; D=0;
        end
    end

    initial begin
        #1
        #5 $display("Clock: %b | A: %b | B: %b | C: %b | D: %b | Circuit_A: %b | Circuit_B: F1: %b, F2: %b, F3: %b | Circuit_C: y1: %b, y2: %b, y3: %b", clock, A, B, C, D, resultA, resultB_1, resultB_2, resultB_3, resultC_1, resultC_2, resultC_3);
        #5 $display("Clock: %b | A: %b | B: %b | C: %b | D: %b | Circuit_A: %b | Circuit_B: F1: %b, F2: %b, F3: %b | Circuit_C: y1: %b, y2: %b, y3: %b", clock, A, B, C, D, resultA, resultB_1, resultB_2, resultB_3, resultC_1, resultC_2, resultC_3);
        #5 $display("Clock: %b | A: %b | B: %b | C: %b | D: %b | Circuit_A: %b | Circuit_B: F1: %b, F2: %b, F3: %b | Circuit_C: y1: %b, y2: %b, y3: %b", clock, A, B, C, D, resultA, resultB_1, resultB_2, resultB_3, resultC_1, resultC_2, resultC_3);
        #5 $display("Clock: %b | A: %b | B: %b | C: %b | D: %b | Circuit_A: %b | Circuit_B: F1: %b, F2: %b, F3: %b | Circuit_C: y1: %b, y2: %b, y3: %b", clock, A, B, C, D, resultA, resultB_1, resultB_2, resultB_3, resultC_1, resultC_2, resultC_3);
        #5 $display("Clock: %b | A: %b | B: %b | C: %b | D: %b | Circuit_A: %b | Circuit_B: F1: %b, F2: %b, F3: %b | Circuit_C: y1: %b, y2: %b, y3: %b", clock, A, B, C, D, resultA, resultB_1, resultB_2, resultB_3, resultC_1, resultC_2, resultC_3);
        #5 $display("Clock: %b | A: %b | B: %b | C: %b | D: %b | Circuit_A: %b | Circuit_B: F1: %b, F2: %b, F3: %b | Circuit_C: y1: %b, y2: %b, y3: %b", clock, A, B, C, D, resultA, resultB_1, resultB_2, resultB_3, resultC_1, resultC_2, resultC_3);
        #5 $display("Clock: %b | A: %b | B: %b | C: %b | D: %b | Circuit_A: %b | Circuit_B: F1: %b, F2: %b, F3: %b | Circuit_C: y1: %b, y2: %b, y3: %b", clock, A, B, C, D, resultA, resultB_1, resultB_2, resultB_3, resultC_1, resultC_2, resultC_3);
        #5 $display("Clock: %b | A: %b | B: %b | C: %b | D: %b | Circuit_A: %b | Circuit_B: F1: %b, F2: %b, F3: %b | Circuit_C: y1: %b, y2: %b, y3: %b", clock, A, B, C, D, resultA, resultB_1, resultB_2, resultB_3, resultC_1, resultC_2, resultC_3);
        #5 $display("Clock: %b | A: %b | B: %b | C: %b | D: %b | Circuit_A: %b | Circuit_B: F1: %b, F2: %b, F3: %b | Circuit_C: y1: %b, y2: %b, y3: %b", clock, A, B, C, D, resultA, resultB_1, resultB_2, resultB_3, resultC_1, resultC_2, resultC_3);
        #5 $display("Clock: %b | A: %b | B: %b | C: %b | D: %b | Circuit_A: %b | Circuit_B: F1: %b, F2: %b, F3: %b | Circuit_C: y1: %b, y2: %b, y3: %b", clock, A, B, C, D, resultA, resultB_1, resultB_2, resultB_3, resultC_1, resultC_2, resultC_3);
        #5 $display("Clock: %b | A: %b | B: %b | C: %b | D: %b | Circuit_A: %b | Circuit_B: F1: %b, F2: %b, F3: %b | Circuit_C: y1: %b, y2: %b, y3: %b", clock, A, B, C, D, resultA, resultB_1, resultB_2, resultB_3, resultC_1, resultC_2, resultC_3);
        #5 $display("Clock: %b | A: %b | B: %b | C: %b | D: %b | Circuit_A: %b | Circuit_B: F1: %b, F2: %b, F3: %b | Circuit_C: y1: %b, y2: %b, y3: %b", clock, A, B, C, D, resultA, resultB_1, resultB_2, resultB_3, resultC_1, resultC_2, resultC_3);
        #5 $display("Clock: %b | A: %b | B: %b | C: %b | D: %b | Circuit_A: %b | Circuit_B: F1: %b, F2: %b, F3: %b | Circuit_C: y1: %b, y2: %b, y3: %b", clock, A, B, C, D, resultA, resultB_1, resultB_2, resultB_3, resultC_1, resultC_2, resultC_3);
        #5 $display("Clock: %b | A: %b | B: %b | C: %b | D: %b | Circuit_A: %b | Circuit_B: F1: %b, F2: %b, F3: %b | Circuit_C: y1: %b, y2: %b, y3: %b", clock, A, B, C, D, resultA, resultB_1, resultB_2, resultB_3, resultC_1, resultC_2, resultC_3);
        #5 $display("Clock: %b | A: %b | B: %b | C: %b | D: %b | Circuit_A: %b | Circuit_B: F1: %b, F2: %b, F3: %b | Circuit_C: y1: %b, y2: %b, y3: %b", clock, A, B, C, D, resultA, resultB_1, resultB_2, resultB_3, resultC_1, resultC_2, resultC_3);
        #5 $display("Clock: %b | A: %b | B: %b | C: %b | D: %b | Circuit_A: %b | Circuit_B: F1: %b, F2: %b, F3: %b | Circuit_C: y1: %b, y2: %b, y3: %b", clock, A, B, C, D, resultA, resultB_1, resultB_2, resultB_3, resultC_1, resultC_2, resultC_3);
        $finish;
    end
endmodule