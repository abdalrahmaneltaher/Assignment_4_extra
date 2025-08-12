module LASER_tb();
reg clk_tb,rst_tb,set_tb;
reg [3:0]out_expect;
wire [3:0] out_dut;
LASER dut(clk_tb,rst_tb,set_tb,out_dut);
initial begin
    clk_tb=0;
    forever 
    #1 clk_tb =~clk_tb;
end
initial begin
    set_tb=1;rst_tb=1;out_expect=4'b0001;
    @(negedge clk_tb);
    if(out_expect!=out_dut)begin
        $display("erorr: out_expect=%h,out_dut=%h",out_expect,out_dut);
        $stop;
    end
    set_tb=0;rst_tb=0;
    repeat(50)begin
        @(negedge clk_tb);out_expect=4'b0010; 
        @(negedge clk_tb);out_expect=4'b0100;
        @(negedge clk_tb);out_expect=4'b1000;
        @(negedge clk_tb);out_expect=4'b0011;
        @(negedge clk_tb);out_expect=4'b0110;
        @(negedge clk_tb);out_expect=4'b1100;
        @(negedge clk_tb);out_expect=4'b1011;
        @(negedge clk_tb);out_expect=4'b0101;
        @(negedge clk_tb);out_expect=4'b1010;
        @(negedge clk_tb);out_expect=4'b0111;
        @(negedge clk_tb);out_expect=4'b1110;
        @(negedge clk_tb);out_expect=4'b1111;
        @(negedge clk_tb);out_expect=4'b1101;
        @(negedge clk_tb);out_expect=4'b1001;
        @(negedge clk_tb);out_expect=4'b0001;     
    end
    $stop;
end
endmodule
