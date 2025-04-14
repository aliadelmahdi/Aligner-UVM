`ifndef CFS_ALGN_ENV_SV
    `define CFS_ALGN_ENV_SV
    import uvm_pkg::*;
    `include "uvm_macros.svh"
    class cfs_algn_env extends uvm_env;

        `uvm_component_utils(cfs_algn_env)
        
        function new(string name = "cfs_algn_env", uvm_component parent);
            super.new(name,parent);
        endfunction


    endclass : cfs_algn_env
`endif // CFS_ALGN_ENV_SV