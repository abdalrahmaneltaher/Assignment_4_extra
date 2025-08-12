//dff_rst
module dff_rst(rst,clk,d,q);
input rst,clk,d;
output reg q;
always @(posedge clk or posedge rst) begin
    if(rst)
        q<=0;
    else
        q<=d;    
end
endmodule
//xor
module xor_comb(a,b,c);
input a,b;
output c;
assign c = a^b;
endmodule
//dff_set
module dff_set(set,clk,d,q);
input set,clk,d;
output reg q;
always @(posedge clk or posedge set) begin
    if(set)
        q<=1;
    else
        q<=d;    
end
endmodule
module LASER(clk,rst,set,out);
input set,rst,clk;
output [3:0]out ;
wire [3:0]internal_q;
wire in_xor;
//set
dff_set ff1(.clk(clk),.set(set),.d(internal_q[3]),.q(internal_q[0]));
//xor
xor_comb comb(.a(internal_q[0]),.b(internal_q[3]),.c(in_xor));
//rst
dff_rst ff2 (.clk(clk),.rst(rst),.d(in_xor),.q(internal_q[1]));
dff_rst ff3 (.clk(clk),.rst(rst),.d(internal_q[1]),.q(internal_q[2]));
dff_rst ff4 (.clk(clk),.rst(rst),.d(internal_q[2]),.q(internal_q[3]));
assign out = internal_q ;
endmodule
