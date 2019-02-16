/*
    shift right 1 bit
*/
module right_1 (In, Op, Out);
    parameter   N = 16;
    
    input [N-1:0]  In;
    input Op;
    output [N-1:0] Out;
    
    assign Out[15] = Op ? 1'b0 : In[15];
    assign Out[14:0] = In[15:1];
endmodule