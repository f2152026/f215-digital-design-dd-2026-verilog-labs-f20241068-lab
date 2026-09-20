// and_df.v
// AND gate - DATAFLOW style

module and_df (
    input a,
    input b,
    output y
);

    assign #5 y = a & b;

endmodule