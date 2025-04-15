`ifndef CFS_APB_TYPES_SV
  `define CFS_APB_TYPES_SV

    // Virtual interface typedef
    typedef virtual cfs_apb_if cfs_apb_vif;
    
    // APB READ/WRITE direction bit typedef enum
    typedef enum bit {
        CFS_APB_READ,
        CFS_APB_WRITE
    } cfs_apb_dir;

    // APB WIDTH
    `define CFS_APB_MAX_ADDR_WIDTH  16
    `define CFS_APB_MAX_DATA_WIDTH  32

`endif // CFS_APB_TYPES_SV