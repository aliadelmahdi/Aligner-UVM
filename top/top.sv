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

    initial begin
        apb_if.preset_n = 1;
        #6 apb_if.preset_n = 0;
        #30 apb_if.preset_n = 1;
    end
    // cfs_apb_if apb_if(.pclk(clk));
    cfs_apb_if apb_if(clk);

    cfs_aligner DUT(
        .clk(clk),
        .reset_n(apb_if.preset_n),
        .psel(apb_if.psel),
        .penable(apb_if.penable),
        .paddr(apb_if.paddr),
        .pwdata(apb_if.pwdata),
        .pready(apb_if.pready),
        .prdata(apb_if.prdata),
        .pslverr(apb_if.pslverr)
    );

    initial begin
        uvm_top.set_report_verbosity_level(UVM_MEDIUM); // Set verbosity level
        uvm_config_db#(virtual cfs_apb_if)::set(null,"uvm_test_top.env.apb_agent", "vif", apb_if);
        run_test("cfs_algn_test_reg_access");
    end

endmodule : tb_top