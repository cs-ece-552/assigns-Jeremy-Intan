/*
    CS/ECE 552 Spring '19
    Homework #3, Problem 1

    4-1 mux template
*/
module mux4_1(InA, InB, InC, InD, S, Out);
    input        InA, InB, InC, InD;
    input [1:0]  S;
    output       Out;

    wire A_B, C_D;
    mux2_1 A_B_sel(.InA(InA), .InB(InB), .S(S[0]), .Out(A_B));
    mux2_1 C_D_sel(.InA(InC), .InB(InD), .S(S[0]), .Out(C_D));
    mux2_1 out_sel(.InA(A_B), .InB(C_D), .S(S[1]), .Out(Out));

endmodule
