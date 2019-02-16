module fullAdder_1b_bench;

    reg A;
    reg B;
    reg [1:0] Sumcalc;
    reg C_in;
    wire SUM;
    wire CO;
    wire Clk;
    //2 dummy wires
    wire rst;
    wire err;
    clkrst my_clkrst( .clk(Clk), .rst(rst), .err(err));
    fullAdder_1b DUT (.A(A), .B(B), .C_in(C_in),.S(SUM), .C_out(CO));
  
    initial begin
        A = 1'b0;
        B = 1'b0;
        C_in = 1'b0;
        @(negedge Clk);
        @(posedge Clk);
        A = 1'b1;
        B = 1'b0;
        C_in = 1'b0;
        @(negedge Clk);
        @(posedge Clk);
        A = 1'b0;
        B = 1'b1;
        C_in = 1'b0;
        @(negedge Clk);
        @(posedge Clk);
        A = 1'b1;
        B = 1'b1;
        C_in = 1'b0;
        @(negedge Clk);
        @(posedge Clk);
        A = 1'b0;
        B = 1'b0;
        C_in = 1'b1;
        @(negedge Clk);
        @(posedge Clk);
        A = 1'b1;
        B = 1'b0;
        C_in = 1'b1;
        @(negedge Clk);
        @(posedge Clk);
        A = 1'b0;
        B = 1'b1;
        C_in = 1'b1;
        @(negedge Clk);
        @(posedge Clk);
        A = 1'b1;
        B = 1'b1;
        C_in = 1'b1;
        
        #3200 $finish;
    end
   
    always@(negedge Clk) begin
        Sumcalc = A+B+C_in;
        $display("A: %x, B: %x, Sum: %x", A, B, SUM);
    
        if (Sumcalc[0] !== SUM) $display ("ERRORCHECK Sum error");
        if (Sumcalc[1] !== CO) $display ("ERRORCHECK CO error");
    end
endmodule
