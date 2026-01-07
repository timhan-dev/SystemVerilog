module SimpleCounter
#(parameter THRESHOLD = 400, 
parameter WIDTH = 32)
(input logic clk,
input logic reset,
output logic [WIDTH-1:0] b);

always_ff @(posedge clk)

begin:SIMPLECOUNTER_REG_BLK
    if (!reset)
        b <= {WIDTH{1'b0}};
    else
        if (b == THRESHOLD)
            b <= 'd0;
        else
            b <= b + 'd1;
end

endmodule
