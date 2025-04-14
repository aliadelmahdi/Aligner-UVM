`timescale 1ns/1ns
`include "cfs_algn_test_pkg.sv"
module tb_top;

    import uvm_pkg::*;
    import cfs_algn_test_pkg::*;
    bit clk;
    // Clock Generation
    initial begin
        clk = 0;
        forever clk = #5 ~clk;
    end

    bit reset_n;

    initial begin
        reset_n = 1;
        #6 reset_n = 0;
        #30 reset_n = 1;
    end

    cfs_aligner DUT(
        .clk(clk),
        .reset_n(reset_n)
    );

    initial begin
        uvm_top.set_report_verbosity_level(UVM_MEDIUM); // Set verbosity level
        run_test("cfs_algn_test_reg_access");
    end

endmodule : tb_top