@echo off
set xv_path=E:\\Program_Files\\Vivado\\2016.2\\bin
call %xv_path%/xelab  -wto 973b187326964de684fc9e761b72d546 -m64 --debug typical --relax --mt 2 -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip --snapshot twoD_register_sim_behav xil_defaultlib.twoD_register_sim xil_defaultlib.glbl -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
