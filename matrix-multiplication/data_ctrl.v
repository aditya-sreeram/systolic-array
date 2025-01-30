module data_ctrl(
    input clk,rst,
    output reg [7:0] a1,a2,a3,a4,a5,b1,b2,b3,b4,b5
    );
    
    reg [7:0] matrix_a [1:9];
    reg [7:0] matrix_b [1:9];
    reg [2:0]count;
    
    initial begin
        $readmemh("matrix_a.mem",matrix_a);
        $readmemh("matrix_b.mem",matrix_b);
    end
    
    always@(negedge clk) begin
        if(rst) count<=0;
        else begin
            case(count)
                3'd0: begin
                    a1<= matrix_a[1];
                    a2<= matrix_a[2];
                    a3<= matrix_a[3];
                    {a4,a5}<=0;
                    
                    b1<= matrix_b[1];
                    b2<= matrix_b[4];
                    b3<= matrix_b[7];
                    {b4,b5}<=0;
                    
                end
                3'd1: begin
                    a1<=0;
                    a2<= matrix_a[4];
                    a3<= matrix_a[5];
                    a4<= matrix_a[6];
                    a5<=0;
                    
                    b1<=0;
                    b2<= matrix_b[2];
                    b3<= matrix_b[5];
                    b4<= matrix_b[8];
                    b5<=0;
                    
                end
                
                3'd2: begin
                    {a1,a2}<=0;
                    a3<= matrix_a[7];
                    a4<= matrix_a[8];
                    a5<= matrix_a[9];
                    
                    {b1,b2}<=0;
                    b3<= matrix_b[3];
                    b4<= matrix_b[6];
                    b5<= matrix_b[9];
                    
                end
                 
                default: {a1,a2,a3,a4,a5,b1,b2,b3,b4,b4,b5}<=0;
            endcase
            
            count<= count + 1;
        end 
    end
    
//    initial begin
//        $monitor("[cycle: count] %d",count);
//    end
endmodule
