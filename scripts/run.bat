@echo off
cd /d "%~dp0\.."
echo Current directory is: %CD%
C:/questasim64_2021.1/win64/vsim -c -do "scripts/run.tcl"
cmd /k