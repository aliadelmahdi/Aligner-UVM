
# Interface files
interface/cfs_apb_if.sv
# Design files
design/cfs_synch.v
design/cfs_synch_fifo.v
design/cfs_rx_ctrl.v
design/cfs_ctrl.v
design/cfs_tx_ctrl.v
design/cfs_edge_detect.v
design/cfs_regs.v
design/cfs_aligner_core.v
design/cfs_aligner.v

# Agents
top/test/environment/apb_agent/cfs_apb_pkg.sv

# Scoreboard and coverage

# Environment files
top/test/environment/cfs_algn_pkg.sv

# Test files
top/test/cfs_algn_test_base.sv
top/test/cfs_algn_test_reg_access.sv
top/test/cfs_algn_test_pkg.sv

# Top-level file
top/top.sv

+incdir+./design
+incdir+./interface
+incdir+./objects
+incdir+./top
+incdir+./top/test
+incdir+./top/test/environment
+incdir+./top/test/environment/apb_agent
+incdir+./top/test/environment/apb_agent/driver
+incdir+./top/test/environment/apb_agent/monitor
+incdir+./top/test/environment/apb_agent/sequencer
+incdir+./top/test/environment/coverage_collector
+incdir+./top/test/environment/scoreboard
