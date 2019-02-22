/*
    CS/ECE 552 Spring '19
    Homework #3, Problem 1

    2-1 mux template
*/
module mux2_1(InA, InB, S, Out);
    input   InA, InB;
    input   S;
    output  Out;

    wire sel_A_out, sel_B_out, S_not;
    not1 s_inv (.in1(S), .out(S_inv));
    nand2 a_sel (.in1(InA), .in2(S_inv), .out(sel_A_out));
    nand2 b_sel (.in1(InB), .in2(S), .out(sel_B_out));
    nand2 out_sel (.in1(sel_A_out), .in2(sel_B_out), .out(Out));

endmodule
