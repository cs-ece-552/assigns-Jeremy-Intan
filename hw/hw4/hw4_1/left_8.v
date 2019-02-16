/*
    shift left/rotate left 8 bit
 */
module left_8 (In, Op, Out);
    parameter   N = 16;
    
    input [N-1:0]  In;
    input Op;
    output [N-1:0] Out;
    
    assign Out[7:0] = Op ? 8'b0 : In[15:8];
    assign Out[15:8] = In[7:0];
endmodule