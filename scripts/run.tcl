vlib work
vlog -f "scripts/list.f" -mfcu +cover -covercells
vsim -voptargs=+acc work.tb_top -cover -classdebug -uvmcontrol=all -fsmdebug 
log -r /*
# Code Coverage
coverage save top.ucdb -onexit
#/ -du work....
vcd file waves/waves.vcd
vcd add -r /* 
run -all
vcd flush
# # Functional Coverage Report
# coverage report -detail -cvg -directive  \
#     -output "reports/Functional Coverage Report.txt" \
#     /../aligner_coverage/*
quit -sim
# Save Coverage Report
vcover report top.ucdb -details -annotate -all -output "reports/Coverage Report - Code, Assertions, and Directives.txt"