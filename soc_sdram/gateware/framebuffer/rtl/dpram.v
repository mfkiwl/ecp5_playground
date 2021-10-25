`default_nettype none

module dpram #(
    parameter DATA = 36,
    parameter ADDR = 9
) (
    // Port A: Write Port
    input   wire                a_clk,
    input   wire                a_wr,
    input   wire    [ADDR-1:0]  a_addr,
    input   wire    [DATA-1:0]  a_din,
//    output  reg     [DATA-1:0]  a_dout,

    // Port B: Read Port
    input   wire                b_clk,
//    input   wire                b_wr,
    input   wire    [ADDR-1:0]  b_addr,
//    input   wire    [DATA-1:0]  b_din,
    output  reg     [DATA-1:0]  b_dout
);

// Shared memory
reg [DATA-1:0] mem [(2**ADDR)-1:0];
//   initial begin
//     $readmemh("../build/nuc.hex", mem);
//   end

// Port A: Write Port
always @(posedge a_clk) begin
    // a_dout      <= mem[a_addr];
    if(a_wr) begin
//        a_dout      <= a_din;
        mem[a_addr] <= a_din;
    end
end

// Port B: Read Port
always @(posedge b_clk) begin
    b_dout      <= mem[b_addr];
    // if(b_wr) begin
    //     b_dout      <= b_din;
    //     mem[b_addr] <= b_din;
    // end
end

endmodule
