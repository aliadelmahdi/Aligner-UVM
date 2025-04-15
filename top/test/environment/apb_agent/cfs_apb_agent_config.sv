`ifndef CFS_APB_AGENT_CONFIG_SV
  `define CFS_APB_AGENT_CONFIG_SV

    class cfs_apb_agent_config extends uvm_component;
        `uvm_component_utils(cfs_apb_agent_config);
    
        // Virtual interface
        local cfs_apb_vif vif;

        //  Constructor: new
        function new(string name = "cfs_apb_agent_config", uvm_component parent);
            super.new(name, parent);
        endfunction: new

        virtual function cfs_apb_vif get_vif();
            return vif;
        endfunction: get_vif
        
        virtual function void set_vif(cfs_apb_vif vif_value);
                vif = vif_value;
        endfunction: set_vif
        
        virtual function void start_of_simulation_phase(uvm_phase phase);
            super.start_of_simulation_phase(phase);
            if(get_vif()==null)
                `uvm_fatal("ISSUE","The APB virtual interface is not configured at \"Start of simulation\" phase")
            else
                `uvm_info("APB_CONFIG","The APB virtual interface is configured at \"Start of simulation\" phase",UVM_LOW)
        endfunction: start_of_simulation_phase
        
    endclass: cfs_apb_agent_config
    
`endif // CFS_APB_AGENT_CONFIG_SV