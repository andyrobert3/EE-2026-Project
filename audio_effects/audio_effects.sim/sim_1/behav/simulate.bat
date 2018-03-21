@echo off
set xv_path=E:\\Program_Files\\Vivado\\2016.2\\bin
call %xv_path%/xsim twoD_register_sim_behav -key {Behavioral:sim_1:Functional:twoD_register_sim} -tclbatch twoD_register_sim.tcl -log simulate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
