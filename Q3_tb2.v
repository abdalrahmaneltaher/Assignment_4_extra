module shift_register2_tb();
parameter SHIFT_DIRECTION_tb = "RIGHT" , SHIFT_AMOUNT_tb = 2 ;
reg clk_tb,rst_tb,load_tb;
reg [7:0] load_value_tb,PO_expect;
wire  [7:0] PO_dut;
shift_register #(SHIFT_DIRECTION_tb,SHIFT_AMOUNT_tb) dut(clk_tb,rst_tb,load_tb,load_value_tb,PO_dut);
initial begin
    clk_tb=0;
    forever 
    #1 clk_tb=~clk_tb;
end
initial begin
    rst_tb=1;PO_expect=0;load_tb=0;load_value_tb=0;
        @(negedge clk_tb);
        if(PO_dut!=PO_expect)begin
            $display("error : PO_dut=%h,PO_expect=%h",PO_dut,PO_expect);
            $stop;
        end
    rst_tb = 0 ;load_tb=1;
    repeat (10)begin
        load_value_tb = $random;
        PO_expect = load_value_tb;
        @(negedge clk_tb);
        if(PO_dut!=PO_expect)begin
            $display("error : PO_dut=%h,PO_expect=%h",PO_dut,PO_expect);
            $stop;
        end
    end
    load_tb=0;
     repeat (10)begin
        PO_expect = PO_expect>>SHIFT_AMOUNT_tb;
        @(negedge clk_tb);
        if(PO_dut!=PO_expect)begin
            $display("error : PO_dut=%h,PO_expect=%h",PO_dut,PO_expect);
            $stop;
        end
    end
    load_tb=1;
    repeat (10)begin
        load_value_tb = $random;
        PO_expect = load_value_tb;
        @(negedge clk_tb);
        if(PO_dut!=PO_expect)begin
            $display("error : PO_dut=%h,PO_expect=%h",PO_dut,PO_expect);
            $stop;
        end
    end
    load_tb=0;
     repeat (10)begin
        PO_expect = PO_expect>>SHIFT_AMOUNT_tb;
        @(negedge clk_tb);
        if(PO_dut!=PO_expect)begin
            $display("error : PO_dut=%h,PO_expect=%h",PO_dut,PO_expect);
            $stop;
        end
    end
    $stop;        
end
endmodule

