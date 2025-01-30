
module top(
    input clk,
    input rst,
    output done
    );
    
    wire [7:0] a1,a2,a3,a4,a5,b1,b2,b3,b4,b5 ;
    wire [7:0] d_a,d_b,d_c,d_d,d_e;

    data_ctrl dut_ctrl(.clk(clk),.rst(rst),.a1(a1),.a2(a2),.a3(a3),.a4(a4),.a5(a5),.b1(b1),.b2(b2),.b3(b3),.b4(b4),.b5(b5));

    pe_comb dut_pe(.clk(clk),.rst(rst),.a1(a1),.a2(a2),.a3(a3),.a4(a4),.a5(a5),.b1(b1),.b2(b2),.b3(b3),.b4(b4),.b5(b5),
    .d_a(d_a),.d_b(d_b),.d_c(d_c),.d_d(d_d),.d_e(d_e));
    
    data_enc dut_enc(.clk(clk),.rst(rst),.d_a(d_a),.d_b(d_b),.d_c(d_c),.d_d(d_d),.d_e(d_e),.done(done));
    
endmodule