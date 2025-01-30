
// In 1 clk we get output
module pe(clk,rst,a_in,b_in,d_in,a_out,b_out,d_out);
    input clk;
    input rst;
    input [7:0] a_in;
    input [7:0] b_in;
    input [7:0] d_in;
    output reg [7:0] a_out; //default x (unkown)
    output reg [7:0] b_out;
    output reg [7:0] d_out;
    
    
    wire [3:0] d_temp; //default z (unconnected)
    
    multiplier dut1(.a_in(a_in),.b_in(b_in),.d_in(d_in),.d_out(d_temp));
    
    always@(posedge clk) begin
        if(rst) {a_out,b_out,d_out} = 0;
        
        else begin
            a_out <= a_in;
            b_out <= b_in;
            d_out <= d_temp;
        end
        
    end
endmodule
