module SimpleCounterTB();
logic clk;
logic reset;
logic [31:0] b;

`ifdef SYNTHESIS
localparam THRESHOLD = 4000000;
`else
localparam THRESHOLD = 400;
`endif

SimpleCounter #(.THRESHOLD(THRESHOLD)) u_SimpleCounter_0(
    .clk(clk), 
    .reset(reset), 
    .b(b));

always #5 clk = ~clk;

initial begin
    clk = 0;
    reset = 0;
    #40;
    reset = 1;
    #200;
    reset = 0;
    #40;
    reset = 1;
    wait(b == THRESHOLD);
    #40;
    $display("Simulation Finished %d", b);
    $finish();
end

endmodule