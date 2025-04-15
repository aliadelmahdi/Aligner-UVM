`ifndef CFS_APB_AGENT_SV
  `define CFS_APB_AGENT_SV

    class cfs_apb_agent extends uvm_agent;
        
        `uvm_component_utils(cfs_apb_agent)
        cfs_apb_agent_config agent_config;

        function new(string name = "cfs_apb_agent", uvm_component parent);
            super.new(name,parent);
        endfunction: new

        virtual function void build_phase(uvm_phase phase);
            super.build_phase(phase);
            agent_config = cfs_apb_agent_config::type_id::create("agent_config", this);
        endfunction: build_phase

        virtual function void connect_phase(uvm_phase phase);
            cfs_apb_vif vif;
            super.connect_phase(phase);
            if(!uvm_config_db#(cfs_apb_vif)::get(this, "", "vif",vif))
                `uvm_fatal("APB_NO_VIF","Could not get the virtual interface from the database")
            else
                agent_config.set_vif(vif);
        endfunction: connect_phase
    endclass: cfs_apb_agent
    
`endif // CFS_APB_AGENT_SV