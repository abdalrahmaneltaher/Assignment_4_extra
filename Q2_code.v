module full_half_adder(a,b,clk,cin,rst,sum,cout);
parameter WIDTH = 4,PIPELINE_ENABLE=1,USE_FULL_ADDER=1;
input clk,rst,cin;
input [WIDTH-1:0] a,b;
output reg [WIDTH-1:0]sum;
output reg cout;
generate
    if(PIPELINE_ENABLE)begin
        always @(posedge clk) begin
            if(rst)begin
                sum<=0;
                cout<=0;
            end    
            else begin
                if(USE_FULL_ADDER)
                    {cout,sum}<=a+b+cin;
                else 1
                    {cout,sum}<=a+b;
            end
        end
    end
    else begin
        always @(*) begin
        if(USE_FULL_ADDER)
            {cout,sum}=a+b+cin;
        else 
            {cout,sum}=a+b;          
        end
    end
endgenerate
endmodule