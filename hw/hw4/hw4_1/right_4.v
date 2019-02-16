/*
    shift right 4 bit
*/
module right_4 (In, Op, Out);
    parameter   N = 16;
    
    input [N-1:0]  In;
    input Op;
    output [N-1:0] Out;
    
    assign Out[15:12] = Op ? 4'b0 : {4{In[15]}};
    assign Out[11:0] = In[15:4];
endmodule