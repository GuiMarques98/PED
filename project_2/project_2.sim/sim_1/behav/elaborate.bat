@echo off
set xv_path=C:\\Xilinx\\Vivado\\2016.4\\bin
call %xv_path%/xelab  -wto a32b9c68602a48cfa953262f362e849e -m64 --debug typical --relax --mt 2 -L xil_defaultlib -L secureip --snapshot soma_polinomio_behav xil_defaultlib.soma_polinomio -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
