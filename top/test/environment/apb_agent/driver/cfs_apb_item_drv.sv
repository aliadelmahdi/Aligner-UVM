`ifndef CFS_APB_ITEM_DRV_SV
    `define CFS_APB_ITEM_DRV_SV
    import uvm_pkg::*;
    `include "uvm_macros.svh"
    class cfs_apb_item_drv extends uvm_driver#(cfs_apb_item_base);

        `uvm_component_utils(cfs_apb_item_drv)
        cfs_apb_item_base stimulus_seq_item;
        virtual cfs_apb_if apb_if;
        function new(string name, uvm_component parent);
            super.new(name,parent);
        endfunction: new

        task run_phase(uvm_phase phase);
            super.run_phase(phase);
            forever begin
                stimulus_seq_item = cfs_apb_item_base::type_id::create("stimulus_seq_item");
                seq_item_port.get_next_item(stimulus_seq_item);
                apb_if.preset_n = stimulus_seq_item.preset_n;
                apb_if.psel = stimulus_seq_item.psel;
                apb_if.penable = stimulus_seq_item.penable;
                apb_if.paddr = stimulus_seq_item.paddr;
                apb_if.pwdata = stimulus_seq_item.pwdata;
                apb_if.pwrite = stimulus_seq_item.dir;
                @(negedge apb_if.pclk);
                seq_item_port.item_done();
                `uvm_info("run_phase", stimulus_seq_item.sprint(), UVM_HIGH)
            end
        endtask: run_phase

    endclass: cfs_apb_item_drv
`endif // CFS_APB_ITEM_DRV_SV