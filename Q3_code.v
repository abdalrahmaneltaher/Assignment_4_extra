module shift_register(clk,rst,load,load_value,PO);
parameter SHIFT_DIRECTION = "LEFT" , SHIFT_AMOUNT = 1 ;
input clk,rst,load;
input[7:0] load_value;
output reg [7:0] PO ;
always @(posedge clk or posedge rst) begin
    if(rst)
        PO<=0;
    else begin
        if(load)
            PO<=load_value;
        else begin
            if(SHIFT_DIRECTION=="LEFT")
                PO<=PO << SHIFT_AMOUNT; 
            else 
                PO<=PO>>SHIFT_AMOUNT; 
        end
    end
end
endmodule

