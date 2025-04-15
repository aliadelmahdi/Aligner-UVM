`ifndef CFS_APB_ITEM_BASE_SV
    `define CFS_APB_ITEM_BASE_SV
    `include "uvm_macros.svh"
    import uvm_pkg::*;

    class cfs_apb_item_base extends uvm_sequence_item;
        
        logic preset_n; // Reset signal - active low
        logic psel; // APB Select
        logic penable; // APB Enable
        rand cfs_apb_dir dir;
        rand logic [`CFS_APB_MAX_ADDR_WIDTH-1:0] paddr; // APB address - bits paddr[1:0] are ignored and treated as equal to 2'b00 (word aligned)
        rand logic [`CFS_APB_MAX_DATA_WIDTH-1:0] pwdata; // APB write data

        rand int unsigned pre_drive_delay;
        rand int unsigned post_drive_delay;

        logic pready; // APB ready signal
        logic [`CFS_APB_MAX_DATA_WIDTH-1:0] prdata; // APB read data;
        logic pslverr; // APB slave error

        `uvm_object_utils_begin(cfs_apb_item_base);
            `uvm_field_int(preset_n, UVM_DEFAULT)
            `uvm_field_int(psel, UVM_DEFAULT)
            `uvm_field_int(penable, UVM_DEFAULT)
            `uvm_field_enum(cfs_apb_dir, dir, UVM_DEFAULT)
            `uvm_field_int(paddr, UVM_DEFAULT)
            `uvm_field_int(pwdata, UVM_DEFAULT)
            `uvm_field_int(pready, UVM_DEFAULT)
            `uvm_field_int(prdata, UVM_DEFAULT)
            `uvm_field_int(pslverr, UVM_DEFAULT)
            `uvm_field_int(pre_drive_delay, UVM_DEFAULT)
            `uvm_field_int(post_drive_delay, UVM_DEFAULT)
        `uvm_object_utils_end

        function new(string name = "cfs_apb_item_base");
            super.new(name);
        endfunction: new

        // Constrain the random delays
        constraint pre_drive_delay_default {
            soft pre_drive_delay <=5;
        }

        constraint post_drive_delay_default {
            soft post_drive_delay <=5;
        }
        
    endclass: cfs_apb_item_base
    
`endif // CFS_APB_ITEM_BASE_SV