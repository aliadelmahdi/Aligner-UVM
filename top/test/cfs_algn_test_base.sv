`ifndef CFS_ALGN_TEST_BASE_SV
    `define CFS_ALGN_TEST_BASE_SV
    `include "uvm_macros.svh"
    import uvm_pkg::*;
    import cfs_algn_pkg::*;
    class cfs_algn_test_base extends uvm_test;

        `uvm_component_utils(cfs_algn_test_base)
        cfs_algn_env env;
        function new(string name = "cfs_algn_test_base", uvm_component parent);
            super.new(name, parent);
        endfunction

        virtual function void build_phase (uvm_phase phase);
            super.build_phase(phase);
            env = cfs_algn_env::type_id::create("env",this);
        endfunction
    endclass : cfs_algn_test_base

`endif // CFS_ALGN_TEST_BASE_SV