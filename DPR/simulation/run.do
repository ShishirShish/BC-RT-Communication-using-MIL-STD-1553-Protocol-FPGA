quietly set ACTELLIBNAME PolarFireSoC
quietly set PROJECT_DIR "D:/FPGA codes/DPR"

if {[file exists presynth/_info]} {
   echo "INFO: Simulation library presynth already exists"
} else {
   file delete -force presynth 
   vlib presynth
}
vmap presynth presynth
vmap polarfire "E:/Libero_SoC_2025.2/Libero_SoC_2025.2/Libero_SoC/Designer/lib/modelsimpro/precompiled/vlog/polarfire"

vcom -2008 -explicit  -work presynth "${PROJECT_DIR}/hdl/dual_port_memory.vhd"
vlog -sv -work presynth "${PROJECT_DIR}/component/work/memory/memory.v"
vcom -2008 -explicit  -work presynth "${PROJECT_DIR}/stimulus/DUAL_PORT_RAM_TB.vhd"

vsim -L polarfire -L presynth  -t 1ps -pli E:/Libero_SoC_2025.2/Libero_SoC_2025.2/Libero_SoC/Designer/lib/modelsimpro/pli/pf_crypto_win_me_pli.dll presynth.DUAL_PORT_RAM_TB
add wave /DUAL_PORT_RAM_TB/*
run 1000ns
