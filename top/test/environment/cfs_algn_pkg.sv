`ifndef CFS_ALGN_PKG_SV
    `define CFS_ALGN_PKG_SV
    package cfs_algn_pkg;
         `include "cfs_apb_pkg.sv"
         import cfs_apb_pkg::*;
         
        `include "cfs_algn_env.sv"
        
    endpackage: cfs_algn_pkg
`endif // CFS_ALGN_PKG_SV