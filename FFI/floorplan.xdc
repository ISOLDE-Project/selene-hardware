create_pblock {pblock_cpuloop[0].core}
add_cells_to_pblock [get_pblocks {pblock_cpuloop[0].core}] [get_cells -quiet [list {cpu/core0/gpp0/noelv0/cpuloop[0].core}]]
resize_pblock [get_pblocks {pblock_cpuloop[0].core}] -add {SLICE_X3Y302:SLICE_X111Y417}
resize_pblock [get_pblocks {pblock_cpuloop[0].core}] -add {DSP48E2_X1Y122:DSP48E2_X13Y165}
resize_pblock [get_pblocks {pblock_cpuloop[0].core}] -add {LAGUNA_X0Y244:LAGUNA_X15Y359}
resize_pblock [get_pblocks {pblock_cpuloop[0].core}] -add {RAMB18_X0Y122:RAMB18_X7Y165}
resize_pblock [get_pblocks {pblock_cpuloop[0].core}] -add {RAMB36_X0Y61:RAMB36_X7Y82}
resize_pblock [get_pblocks {pblock_cpuloop[0].core}] -add {URAM288_X0Y84:URAM288_X2Y107}
#set_property EXCLUDE_PLACEMENT 1 [get_pblocks {pblock_cpuloop[0].core}]


create_pblock {pblock_cpuloop[1].core}
add_cells_to_pblock [get_pblocks {pblock_cpuloop[1].core}] [get_cells -quiet [list {cpu/core0/gpp0/noelv0/cpuloop[1].core}]]
resize_pblock [get_pblocks {pblock_cpuloop[1].core}] -add {SLICE_X3Y422:SLICE_X111Y538}
resize_pblock [get_pblocks {pblock_cpuloop[1].core}] -add {DSP48E2_X1Y170:DSP48E2_X13Y213}
resize_pblock [get_pblocks {pblock_cpuloop[1].core}] -add {RAMB18_X0Y170:RAMB18_X7Y213}
resize_pblock [get_pblocks {pblock_cpuloop[1].core}] -add {RAMB36_X0Y85:RAMB36_X7Y106}
resize_pblock [get_pblocks {pblock_cpuloop[1].core}] -add {URAM288_X0Y116:URAM288_X2Y139}
#set_property EXCLUDE_PLACEMENT 1 [get_pblocks {pblock_cpuloop[1].core}]


create_pblock {pblock_cpuloop[2].core}
add_cells_to_pblock [get_pblocks {pblock_cpuloop[2].core}] [get_cells -quiet [list {cpu/core0/gpp0/noelv0/cpuloop[2].core}]]
resize_pblock [get_pblocks {pblock_cpuloop[2].core}] -add {SLICE_X3Y182:SLICE_X111Y297}
resize_pblock [get_pblocks {pblock_cpuloop[2].core}] -add {DSP48E2_X1Y74:DSP48E2_X13Y117}
resize_pblock [get_pblocks {pblock_cpuloop[2].core}] -add {LAGUNA_X0Y120:LAGUNA_X15Y235}
resize_pblock [get_pblocks {pblock_cpuloop[2].core}] -add {RAMB18_X0Y74:RAMB18_X7Y117}
resize_pblock [get_pblocks {pblock_cpuloop[2].core}] -add {RAMB36_X0Y37:RAMB36_X7Y58}
resize_pblock [get_pblocks {pblock_cpuloop[2].core}] -add {URAM288_X0Y52:URAM288_X2Y75}
#set_property EXCLUDE_PLACEMENT 1 [get_pblocks {pblock_cpuloop[2].core}]


create_pblock {pblock_cpuloop[3].core}
add_cells_to_pblock [get_pblocks {pblock_cpuloop[3].core}] [get_cells -quiet [list {cpu/core0/gpp0/noelv0/cpuloop[3].core}]]
resize_pblock [get_pblocks {pblock_cpuloop[3].core}] -add {SLICE_X3Y62:SLICE_X111Y177}
resize_pblock [get_pblocks {pblock_cpuloop[3].core}] -add {DSP48E2_X1Y26:DSP48E2_X13Y69}
resize_pblock [get_pblocks {pblock_cpuloop[3].core}] -add {RAMB18_X0Y26:RAMB18_X7Y69}
resize_pblock [get_pblocks {pblock_cpuloop[3].core}] -add {RAMB36_X0Y13:RAMB36_X7Y34}
resize_pblock [get_pblocks {pblock_cpuloop[3].core}] -add {URAM288_X0Y20:URAM288_X2Y43}
#set_property EXCLUDE_PLACEMENT 1 [get_pblocks {pblock_cpuloop[3].core}]


create_pblock {pblock_cpuloop[4].core}
add_cells_to_pblock [get_pblocks {pblock_cpuloop[4].core}] [get_cells -quiet [list {cpu/core0/gpp0/noelv0/cpuloop[4].core}]]
resize_pblock [get_pblocks {pblock_cpuloop[4].core}] -add {SLICE_X3Y603:SLICE_X111Y717}
resize_pblock [get_pblocks {pblock_cpuloop[4].core}] -add {DSP48E2_X1Y242:DSP48E2_X13Y285}
resize_pblock [get_pblocks {pblock_cpuloop[4].core}] -add {LAGUNA_X0Y486:LAGUNA_X15Y599}
resize_pblock [get_pblocks {pblock_cpuloop[4].core}] -add {RAMB18_X0Y242:RAMB18_X7Y285}
resize_pblock [get_pblocks {pblock_cpuloop[4].core}] -add {RAMB36_X0Y121:RAMB36_X7Y142}
resize_pblock [get_pblocks {pblock_cpuloop[4].core}] -add {URAM288_X0Y164:URAM288_X2Y187}
#set_property EXCLUDE_PLACEMENT 1 [get_pblocks {pblock_cpuloop[4].core}]


create_pblock {pblock_cpuloop[5].core}
add_cells_to_pblock [get_pblocks {pblock_cpuloop[5].core}] [get_cells -quiet [list {cpu/core0/gpp0/noelv0/cpuloop[5].core}]]
resize_pblock [get_pblocks {pblock_cpuloop[5].core}] -add {SLICE_X3Y722:SLICE_X111Y838}
resize_pblock [get_pblocks {pblock_cpuloop[5].core}] -add {DSP48E2_X1Y290:DSP48E2_X13Y333}
resize_pblock [get_pblocks {pblock_cpuloop[5].core}] -add {RAMB18_X0Y290:RAMB18_X7Y333}
resize_pblock [get_pblocks {pblock_cpuloop[5].core}] -add {RAMB36_X0Y145:RAMB36_X7Y166}
resize_pblock [get_pblocks {pblock_cpuloop[5].core}] -add {URAM288_X0Y196:URAM288_X2Y219}
#set_property EXCLUDE_PLACEMENT 1 [get_pblocks {pblock_cpuloop[5].core}]


create_pblock pblock_grdmac2gen.grdmac2_0
add_cells_to_pblock [get_pblocks pblock_grdmac2gen.grdmac2_0] [get_cells -quiet [list cpu/core0/io0/grdmac2gen.grdmac2_0]]
resize_pblock [get_pblocks pblock_grdmac2gen.grdmac2_0] -add {SLICE_X117Y303:SLICE_X139Y479}
resize_pblock [get_pblocks pblock_grdmac2gen.grdmac2_0] -add {DSP48E2_X14Y122:DSP48E2_X15Y191}
resize_pblock [get_pblocks pblock_grdmac2gen.grdmac2_0] -add {LAGUNA_X16Y246:LAGUNA_X19Y359}
resize_pblock [get_pblocks pblock_grdmac2gen.grdmac2_0] -add {RAMB18_X9Y122:RAMB18_X9Y191}
resize_pblock [get_pblocks pblock_grdmac2gen.grdmac2_0] -add {RAMB36_X9Y61:RAMB36_X9Y95}
resize_pblock [get_pblocks pblock_grdmac2gen.grdmac2_0] -add {URAM288_X3Y84:URAM288_X3Y127}
#set_property EXCLUDE_PLACEMENT 1 [get_pblocks {pblock_grdmac2gen.grdmac2_0}]

create_pblock pblock_FFI_GEN.FFICORE
add_cells_to_pblock [get_pblocks pblock_FFI_GEN.FFICORE] [get_cells -quiet [list cpu/core0/FFI_GEN.FFICORE]]
resize_pblock [get_pblocks pblock_FFI_GEN.FFICORE] -add {SLICE_X153Y660:SLICE_X161Y839}
resize_pblock [get_pblocks pblock_FFI_GEN.FFICORE] -add {RAMB18_X10Y264:RAMB18_X11Y335}
resize_pblock [get_pblocks pblock_FFI_GEN.FFICORE] -add {RAMB36_X10Y132:RAMB36_X11Y167}
set_property EXCLUDE_PLACEMENT 1 [get_pblocks pblock_FFI_GEN.FFICORE]


