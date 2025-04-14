`ifndef CFS_APB_IF_SV
    `define CFS_APB_IF_SV
    interface cfs_apb_if(input bit pclk);
        parameter CFS_APB_MAX_ADDR_WIDTH = 16;
        parameter CFS_APB_MAX_DATA_WIDTH = 32;

        logic preset_n; // Reset signal - active low
        logic psel; // APB Select
        logic penable; // APB Write
        logic [CFS_APB_MAX_ADDR_WIDTH-1:0] paddr; // APB address - bits paddr[1:0] are ignored and treated as equal to 2'b00 (word aligned)
        logic [CFS_APB_MAX_DATA_WIDTH-1:0] pwdata; // APB write data
        logic pready; // APB ready signal
        logic [CFS_APB_MAX_DATA_WIDTH-1:0] prdata; // APB read data;
        logic pslverr; // APB slave error

    endinterface : cfs_apb_if
`endif // CFS_APB_IF_SV