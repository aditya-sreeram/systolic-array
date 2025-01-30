
module data_enc(
    input clk,
    input rst,
    input [7:0] d_a,d_b,d_c,d_d,d_e,
    output reg done
    );
    
    reg [2:0]counter;
//    integer i=1;
    
    reg [7:0] matrix_c [1:9];
    
    always@(negedge clk)begin
        if(rst) begin
        {done,counter}<=0;
        matrix_c[1] <= 8'b0;
        matrix_c[2] <= 8'b0;
        matrix_c[3] <= 8'b0;
        matrix_c[4] <= 8'b0;
        matrix_c[5] <= 8'b0;
        matrix_c[6] <= 8'b0;
        matrix_c[7] <= 8'b0;
        matrix_c[8] <= 8'b0;
        matrix_c[9] <= 8'b0;
        
        end
        else begin
            if(counter==3'd5) begin
                matrix_c[3]<=d_a;
                matrix_c[4]<=d_b;
                matrix_c[1]<=d_c;
                matrix_c[2]<=d_d;
                matrix_c[7]<=d_e;
            end
            else if(counter==3'd6) begin
                matrix_c[6]<=d_b;
                matrix_c[5]<=d_c;
                matrix_c[8]<=d_d;             
            end
            else if(counter==3'd7) begin
                matrix_c[9]<=d_c;
                done<=1;
                
                
            end
            counter<= counter + 1;
        end
            
        
    end
    
//    initial begin
//        $monitor("%d %d %d \n%d %d %d \n%d %d %d",
//                matrix_c[1],matrix_c[2],matrix_c[3],
//                matrix_c[4],matrix_c[5],matrix_c[6],
//                matrix_c[6],matrix_c[7],matrix_c[9]);
//    end
endmodule