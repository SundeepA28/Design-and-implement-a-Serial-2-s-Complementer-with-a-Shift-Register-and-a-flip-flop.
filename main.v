module shiftreg(input wire clk, load, cin, input wire[3:0] load_sig, output wire cout, output wire[3:0] out_sig);
    wire[3: 0] tmp;
    wire[3: 0] regw;

    assign out_sig = regw;
    assign cout = regw[0];

    mux2 mx0 (regw[1], load_sig[0], load, tmp[0]);
    mux2 mx1 (regw[2], load_sig[1], load, tmp[1]);
    mux2 mx2 (regw[3], load_sig[2], load, tmp[2]);
    mux2 mx3 (cin, load_sig[3], load, tmp[3]);

    df df0 (clk, tmp[0], regw[0]);
    df df1 (clk, tmp[1], regw[1]);
    df df2 (clk, tmp[2], regw[2]);
    df df3 (clk, tmp[3], regw[3]);
endmodule

module halfadder(input wire a, b, output wire s, c);
    assign s = a ^ b;
    assign c = a & b;
endmodule

module serialcompliment(input wire clk, load, input wire[3:0] load_sig, output wire[3:0] out_sig);
    wire carry,t,t1, t2;
    shiftreg sr0 (clk, load, t1, load_sig, t2, out_sig);
    dfs df4 (clk, load, t, carry);
    halfadder h (!t2, carry, t1, t);
endmodule
