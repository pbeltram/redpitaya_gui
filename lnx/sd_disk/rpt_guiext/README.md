
---
### Files  

**BOOT.BIN**  
File contains Zynq HW startup code FSBL and FPGA bitstream file.  
File is generated with Petalinux build.  

**image.ub**  
File contains Linux kernel and device tree blob.  
File is generated with Petalinux build.  

**rootfs.tar.gz**  
File contains Linux root file system binary and configuration files.  
File is generated with Petalinux build.  

**rpt-guiext.ko**  
This is RedPitaya GUI Extension Linux device driver provided in binary form as loadable Linux kernel device driver.  
File mus be copied on RedPitaya in ```/opt``` directory. Script ```zynqconfig.sh``` will start this driver.  
TODO: Provide driver binary file.  

**startup.sh**  
This is startup script invoked automatically at Linux startup.  
File must be copied on RedPitaya in ```/opt/bin``` directory. Its purpose is to initialize GPIO (if any) and call user defined ```/opt/bin/zynqconfig.sh``` script.  

**zynqconfig.sh**  
This script is called by ```startup.sh``` script. Its intention is to put some system specific initialization task.  
This script will start ```rpt-guiext.ko``` device driver.  
You can put some system specific initialization tasks into this script.  

---
