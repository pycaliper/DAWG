`include "./cacheline_consts.vh"

module miter (
    clk,
    reset1,
    os_req1,
    hitmap1,
    user_req1,
    addr1,
    hit1,
    reset2,
    os_req2,
    hitmap2,
    user_req2,
    addr2,
    hit2,
);

    input clk;
    input reset1;
    input os_req1;
    input [`NUM_WAYS-1:0] hitmap1;
    input user_req1;
    input [`ADDR_WIDTH-1:0] addr1;
    output hit1;

    input reset2;
    input os_req2;
    input [`NUM_WAYS-1:0] hitmap2;
    input user_req2;
    input [`ADDR_WIDTH-1:0] addr2;
    output hit2;

    cacheline a (
        .clk(clk),
        .reset(reset1),
        .os_req(os_req1),
        .hitmap(hitmap1),
        .user_req(user_req1),
        .addr(addr1),
        .hit(hit1),
    );

    cacheline b (
        .clk(clk),
        .reset(reset2),
        .os_req(os_req2),
        .hitmap(hitmap2),
        .user_req(user_req2),
        .addr(addr2),
        .hit(hit2),
    );

    reg [`NUM_WAYS-1:0] attacker_hitmap;
    reg attacker_domain;

    always @(posedge clk) begin
        attacker_hitmap <= attacker_hitmap;
        attacker_domain <= attacker_domain;
    end

endmodule