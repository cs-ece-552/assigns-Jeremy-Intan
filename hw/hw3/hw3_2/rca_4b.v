/*
    CS/ECE 552 Spring '19
    Homework #3, Problem 2
    
    a 4-bit RCA module
*/
module rca_4b(A, B, C_in, S, C_out);

    // declare constant for size of inputs, outputs (N)
    parameter   N = 4;

    input [N-1: 0] A, B;
    input          C_in;
    output [N-1:0] S;
    output         C_out;

    wire C_itm_1, C_itm_2, C_itm_3;
    
    fullAdder_1b b_0 (.A(A[0]), .B(B[0]), .C_in(C_in), .S(S[0]), .C_out(C_itm_1));
    fullAdder_1b b_1 (.A(A[1]), .B(B[1]), .C_in(C_itm_1), .S(S[1]), .C_out(C_itm_2));
    fullAdder_1b b_2 (.A(A[2]), .B(B[2]), .C_in(C_itm_2), .S(S[2]), .C_out(C_itm_3));
    fullAdder_1b b_3 (.A(A[3]), .B(B[3]), .C_in(C_itm_3), .S(S[3]), .C_out(C_out));

endmodule
