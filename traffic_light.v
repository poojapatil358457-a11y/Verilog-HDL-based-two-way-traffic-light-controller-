module traffic_light(
    input clk,
    input rst,
    output reg [1:0] state,
    output reg [2:0] road1,
    output reg [2:0] road2
);

reg [1:0] count;

always @(posedge clk) begin
    if (rst) begin
        state <= 2'b00;
        count <= 0;
    end
    else begin
        if (count == 2) begin
            count <= 0;
            state <= state + 1;
        end
        else begin
            count <= count + 1;
        end
    end
end

always @(*) begin
    case(state)
        2'b00: begin
            road1 = 3'b001;
            road2 = 3'b100;
        end

        2'b01: begin
            road1 = 3'b010;
            road2 = 3'b100;
        end

        2'b10: begin
            road1 = 3'b100;
            road2 = 3'b001;
        end

        2'b11: begin
            road1 = 3'b100;
            road2 = 3'b010;
        end

        default: begin
            road1 = 3'b100;
            road2 = 3'b100;
        end
    endcase
end

endmodule
