`ifndef CFS_ALGN_ENV_SV
    `define CFS_ALGN_ENV_SV
    `include "cfs_apb_pkg.sv"
    import cfs_apb_pkg::*;
    import uvm_pkg::*;
    `include "uvm_macros.svh"
    class cfs_algn_env extends uvm_env;

        `uvm_component_utils(cfs_algn_env)
        cfs_apb_agent apb_agent;
        function new(string name = "cfs_algn_env", uvm_component parent);
            super.new(name,parent);
        endfunction: new

        // Build Phase
        virtual function void build_phase(uvm_phase phase);
            super.build_phase(phase);
            apb_agent = cfs_apb_agent::type_id::create("apb_agent", this);
        endfunction: build_phase


    endclass: cfs_algn_env
    
`endif // CFS_ALGN_ENV_SV