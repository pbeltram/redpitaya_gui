
---

### Create rpt_guiext Vivado project  

Start Vivado 2016.4  

Type Vivado TCL console command to change directory into this git fpga projects directory.  
Example is to have ``redpitaya_gui`` git rep checkout somewhere into ``$HOME/gitrepos/`` directory.  
```cd /home/.../gitrepos/redpitaya_gui/fpga/vivado_2016.4/```  

Type this TCL commands to set up project name, chip part and project directory:  
```set project_part "xc7z010clg400-1"```  
```set project_name "rpt_guiext"```  
```cd ${project_name}```  
```pwd```  

Create Vivado project file:  
```set SrcDir "."```  
```set RunDir "."```  
```create_project $project_name $RunDir -part $project_part -force```  

Set IP repository path to this git repo checkout:  
```set_property ip_repo_paths [concat [get_property ip_repo_paths [current_project]] {../../ip-repo}] [current_project]```  
```update_ip_catalog -rebuild```  

Add xdc files:  
```import_files -norecurse -fileset constrs_1 $SrcDir/${project_name}_pins.xdc```  
```import_files -norecurse -fileset constrs_1 $SrcDir/${project_name}.xdc```  

Create block design:  
```set project_bd ${project_name}-system.tcl```  
```create_bd_design "system"```  
```source $SrcDir/$project_bd```  
```regenerate_bd_layout```  
```validate_bd_design```  
```save_bd_design```  
```make_wrapper -files [get_files $RunDir/$project_name.srcs/sources_1/bd/system/system.bd] -top```  
```add_files -norecurse $RunDir/$project_name.srcs/sources_1/bd/system/hdl/system_wrapper.v```  

Generate Bitstream FPGA design.  
Export Hardware (HDF file with include bitstream) to be used in Petalinux build.  

---
