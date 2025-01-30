module multiplier(
    input [7:0]a_in,
    input [7:0]b_in,
    input [7:0]d_in,
    output [7:0]d_out
    );
    
//    assign d_out = (d_in == 4'bz)? (a_in * b_in) + d_in  : (a_in * b_in);
    assign d_out = (a_in * b_in) + d_in;

endmodule