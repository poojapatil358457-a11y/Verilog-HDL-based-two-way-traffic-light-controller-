module testbench;

reg clk, rst;
wire [1:0] state;
wire [2:0] road1, road2;

traffic_light dut(
    .clk(clk),
    .rst(rst),
    .state(state),
    .road1(road1),
    .road2(road2)
);

always #5 clk = ~clk;

initial begin
    $dumpfile("traffic_light.vcd");
  $dumpvars(0);

    clk = 0;
    rst = 1;
    #12 rst = 0;
    #150;
    $finish;
end

always @(state) begin
    case(state)
        2'b00:
            $display("ROAD 1: GREEN | ROAD 2: RED");

        2'b01:
            $display("ROAD 1: YELLOW | ROAD 2: RED");

        2'b10:
            $display("ROAD 1: RED | ROAD 2: GREEN");

        2'b11:
            $display("ROAD 1: RED | ROAD 2: YELLOW");
    endcase
end

endmodule
