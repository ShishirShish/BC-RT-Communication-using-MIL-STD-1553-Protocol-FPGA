quietly set ACTELLIBNAME PolarFireSoC
quietly set PROJECT_DIR "D:/FPGA_SOC_DESIGN/ttl_manchester"

if {[file exists presynth/_info]} {
   echo "INFO: Simulation library presynth already exists"
} else {
   file delete -force presynth 
   vlib presynth
}
vmap presynth presynth
vmap polarfire "C:/Microchip/Libero_SoC_2025.2/Libero_SoC/Designer/lib/modelsimpro/precompiled/vlog/polarfire"

vcom -2008 -explicit  -work presynth "${PROJECT_DIR}/hdl/TTL_to_Machester_1553.vhd"
vcom -2008 -explicit  -work presynth "${PROJECT_DIR}/stimulus/tb_TTL_Manchester_Generator.vhd"

vsim -L polarfire -L presynth  -t 1ps -pli C:/Microchip/Libero_SoC_2025.2/Libero_SoC/Designer/lib/modelsimpro/pli/pf_crypto_win_me_pli.dll presynth.tb_TTL_Manchester_Generator
add wave /tb_TTL_Manchester_Generator/*
run 1000ns
