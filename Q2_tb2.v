module full_half_adder2_tb();
parameter WIDTH_tb = 4,PIPELINE_ENABLE_tb=1,USE_FULL_ADDER_tb=0;
reg [WIDTH_tb-1:0] a_tb,b_tb,sum_expect;

reg clk_tb,rst_tb,cin_tb,cout_expect;
wire [WIDTH_tb-1:0]sum_dut;
wire cout_dut;
full_half_adder #(WIDTH_tb,PIPELINE_ENABLE_tb,USE_FULL_ADDER_tb)dut (a_tb,b_tb,clk_tb,cin_tb,rst_tb,sum_dut,cout_dut);
initial begin
    clk_tb=0;
    forever 
    #1 clk_tb=~clk_tb;
end
initial begin
    rst_tb= 1;a_tb=0;b_tb=0;cin_tb=0;cout_expect=0;sum_expect=0;
    @(negedge clk_tb);
    if({cout_dut,sum_dut}!={cout_expect,sum_expect})begin
        $display("error :cout_dut=%h,sum_dut=%h, cout_expect=,sum_expect",cout_dut,sum_dut,cout_expect,sum_expect);
        $stop;    
    end
    rst_tb = 0 ;    
    repeat(100)begin
        a_tb=$random;b_tb=$random;cin_tb=$random;
        @(negedge clk_tb);
        {cout_expect,sum_expect}=a_tb+b_tb;
        if({cout_dut,sum_dut}!={cout_expect,sum_expect})begin
            $display("error :cout_dut=%h,sum_dut=%h, cout_expect=,sum_expect",cout_dut,sum_dut,cout_expect,sum_expect);
            $stop;         
        end
    end
    $stop;
end
endmodule