// Pure combinational circuit, 7 cycles to get output matrix
module pe_comb(
    input clk, rst,
    input [7:0] a1, a2, a3, a4, a5, b1, b2, b3, b4, b5,
    output [7:0] d_a, d_b, d_c, d_d, d_e
);
    // Number is made to match to systolic array
    wire [7:0] wa1_1, wa1_2, wa1_3, wa1_4, wa1_5;
    wire [7:0] wa2_1, wa2_2, wa2_3, wa2_4, wa2_5;
    wire [7:0] wa3_1, wa3_2, wa3_3, wa3_4, wa3_5;
    wire [7:0] wa4_1, wa4_2, wa4_3, wa4_4, wa4_5;
    wire [7:0] wa5_1, wa5_2, wa5_3, wa5_4, wa5_5;
    
    wire [7:0] wb1_1, wb1_2, wb1_3, wb1_4, wb1_5;
    wire [7:0] wb2_1, wb2_2, wb2_3, wb2_4, wb2_5;
    wire [7:0] wb3_1, wb3_2, wb3_3, wb3_4, wb3_5;
    wire [7:0] wb4_1, wb4_2, wb4_3, wb4_4, wb4_5;
    wire [7:0] wb5_1, wb5_2, wb5_3, wb5_4, wb5_5;

    wire [7:0] w_d [1:25];
    
    // Instantiate Processing Elements (PEs)
    pe pe1 (clk, rst, a1   , b1, 8'b0, wa1_1, wb1_1, w_d[1]);
    pe pe2 (clk, rst, wa1_1, b2, 8'b0, wa1_2, wb2_1, w_d[2]);
    pe pe3 (clk, rst, wa1_2, b3, 8'b0, wa1_3, wb3_1, w_d[3]);
    pe pe4 (clk, rst, wa1_3, b4, 8'b0, wa1_4, wb4_1, w_d[4]);
    pe pe5 (clk, rst, wa1_4, b5, 8'b0, wa1_5, wb5_1, w_d[5]);
    
    pe pe6 (clk, rst, a2   , wb1_1, 8'b0  , wa2_1, wb1_2, w_d[6]);
    pe pe7 (clk, rst, wa2_1, wb2_1, w_d[1], wa2_2, wb2_2, w_d[7]);
    pe pe8 (clk, rst, wa2_2, wb3_1, w_d[2], wa2_3, wb3_2, w_d[8]);
    pe pe9 (clk, rst, wa2_3, wb4_1, w_d[3], wa2_4, wb4_2, w_d[9]);
    pe pe10(clk, rst, wa2_4, wb5_1, w_d[4], wa2_5, wb5_2, w_d[10]);
    
    pe pe11(clk, rst, a3   , wb1_2, 8'b0  , wa3_1, wb1_3, w_d[11]);
    pe pe12(clk, rst, wa3_1, wb2_2, w_d[6], wa3_2, wb2_3, w_d[12]);
    pe pe13(clk, rst, wa3_2, wb3_2, w_d[7], wa3_3, wb3_3, w_d[13]);
    pe pe14(clk, rst, wa3_3, wb4_2, w_d[8], wa3_4, wb4_3, w_d[14]);
    pe pe15(clk, rst, wa3_4, wb5_2, w_d[9], wa3_5, wb5_3, w_d[15]);
    
    pe pe16(clk, rst, a4   , wb1_3, 8'b0   , wa4_1, wb1_4, w_d[16]);
    pe pe17(clk, rst, wa4_1, wb2_3, w_d[11], wa4_2, wb2_4, w_d[17]);
    pe pe18(clk, rst, wa4_2, wb3_3, w_d[12], wa4_3, wb3_4, w_d[18]);
    pe pe19(clk, rst, wa4_3, wb4_3, w_d[13], wa4_4, wb4_4, w_d[19]);
    pe pe20(clk, rst, wa4_4, wb5_3, w_d[14], wa4_5, wb5_4, w_d[20]);
    
    pe pe21(clk, rst, a5   , wb1_4, 8'b0   , wa5_1, wb1_5, w_d[21]);
    pe pe22(clk, rst, wa5_1, wb2_4, w_d[16], wa5_2, wb2_5, w_d[22]);
    pe pe23(clk, rst, wa5_2, wb3_4, w_d[17], wa5_3, wb3_5, w_d[23]);
    pe pe24(clk, rst, wa5_3, wb4_4, w_d[18], wa5_4, wb4_5, w_d[24]);
    pe pe25(clk, rst, wa5_4, wb5_4, w_d[19], wa5_5, wb5_5, w_d[25]);
    
    // Assign outputs
    assign d_a = w_d[15];
    assign d_b = w_d[20];
    assign d_c = w_d[25];
    assign d_d = w_d[24];
    assign d_e = w_d[23];
    
//    initial begin
        
        
//        $monitor("[D:layer 1] %d %d %d %d %d \n[D:layer 2] %d %d %d %d %d \n[D:layer 3] %d %d %d %d %d \n[D:layer 4] %d %d %d %d %d \n[D:layer 5] %d %d %d %d %d \n--------------------",
//        w_d[1], w_d[2], w_d[3], w_d[4], w_d[5],w_d[6], w_d[7], w_d[8], w_d[9], w_d[10],
//        w_d[11], w_d[12], w_d[13], w_d[14], w_d[15],w_d[16], w_d[17], w_d[18], w_d[19], w_d[20],
//        w_d[21],w_d[22],w_d[23],w_d[24],w_d[25]);
        
//    end
    
endmodule
