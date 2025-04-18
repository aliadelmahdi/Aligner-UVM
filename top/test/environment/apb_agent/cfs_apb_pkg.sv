`ifndef CFS_APB_PKG_SV
    `define CFS_APB_PKG_SV
    `include "cfs_apb_if.sv"
    package cfs_apb_pkg;
        
        import uvm_pkg::*;
        `include "uvm_macros.svh"
        `include "cfs_apb_types.sv"
        `include "cfs_apb_item_base.sv"
        `include "cfs_apb_item_drv.sv"
        `include "cfs_apb_agent_config.sv"
        `include "cfs_apb_agent.sv"
       
    endpackage: cfs_apb_pkg
`endif // CFS_APB_PKG_SV