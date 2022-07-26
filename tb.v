module tb;
    reg clk,set;
    wire [3:0] sig_in0, sig_in1, sig_in2, sig_in3, sig_out0, sig_out1, sig_out2, sig_out3;
    initial begin $dumpfile("compliment.vcd"); $dumpvars(0,tb); end
    initial clk = 1'b0; always #5 clk =~ clk;
    initial set = 1'b1; always #12 set = 1'b0;
    assign sig_in0[0] = 1'b0;
    assign sig_in0[1] = 1'b1;
    assign sig_in0[2] = 1'b0;
    assign sig_in0[3] = 1'b1;
    assign sig_in1[0] = 1'b1;
    assign sig_in1[1] = 1'b1;
    assign sig_in1[2] = 1'b0;
    assign sig_in1[3] = 1'b0;
    assign sig_in2[0] = 1'b0;
    assign sig_in2[1] = 1'b0;
    assign sig_in2[2] = 1'b0;
    assign sig_in2[3] = 1'b1;
    assign sig_in3[0] = 1'b0;
    assign sig_in3[1] = 1'b1;
    assign sig_in3[2] = 1'b1;
    assign sig_in3[3] = 1'b0;

    serialcompliment sci0 (clk, set, sig_in0, sig_out0);
    serialcompliment sci1 (clk, set, sig_in1, sig_out1);
    serialcompliment sci2 (clk, set, sig_in2, sig_out2);
    serialcompliment sci3 (clk, set, sig_in3, sig_out3);

    initial begin
        #55 $finish;
    end
endmodule