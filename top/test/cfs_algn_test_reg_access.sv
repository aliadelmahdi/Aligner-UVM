`ifndef CFS_ALGN_TEST_REG_ACCESS_SV
    `define CFS_ALGN_TEST_REG_ACCESS_SV
   
    class cfs_algn_test_reg_access extends cfs_algn_test_base;

        `uvm_component_utils(cfs_algn_test_reg_access)
        function new(string name = "cfs_algn_test_reg_access", uvm_component parent);
            super.new(name,parent);
        endfunction: new

        virtual task run_phase(uvm_phase phase);
            super.run_phase(phase);
            phase.raise_objection(this, "TEST_DONE");
            `uvm_info("DUBUG", "start of test", UVM_LOW)
            
            `uvm_info("DUBUG", "end of test", UVM_LOW)
            phase.drop_objection(this, "TEST_DONE");
        endtask: run_phase

    endclass : cfs_algn_test_reg_access

`endif // CFS_ALGN_TEST_REG_ACCESS_SV