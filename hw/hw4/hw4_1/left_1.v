/*
    shift left/rotate left 1 bit
 */
module left_1 (In, Op, Out);
    parameter   N = 16;
    
    input [N-1:0]  In;
    input Op;
    output [N-1:0] Out;
    
    assign Out[0] = Op ? 1'b0 : In[15];
    assign Out[15:1] = In[14:0];
endmodule