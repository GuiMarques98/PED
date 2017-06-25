@echo off
set xv_path=C:\\Xilinx\\Vivado\\2016.4\\bin
call %xv_path%/xelab  -wto 56abbe35f343487ca8bc204a0061ea2e -m64 --debug typical --relax --mt 2 -L xil_defaultlib -L secureip --snapshot Demux9x1_behav xil_defaultlib.Demux9x1 -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
