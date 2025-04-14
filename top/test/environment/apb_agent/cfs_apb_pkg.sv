`ifndef CFS_APB_PKG_SV
    `define CFS_APB_PKG_SV
    `include "cfs_apb_if.sv"
    package cfs_apb_pkg;
        
        import uvm_pkg::*;
        `include "uvm_macros.svh"

        // Virtual interface typedef
        typedef virtual cfs_apb_if cfs_apb_vif;

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

    endpackage: cfs_apb_pkg


`endif // CFS_APB_PKG_SV