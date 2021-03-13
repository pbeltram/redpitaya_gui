**Work in progress ...**  

---

###U-Boot petalinux build  

**NOTE**  
Always start with HDF file import to petalinux build (all over again build, clean build) to get properly configured U-Boot.  
Else, there is a mess with ```platform-*.h``` files and U-Boot recipie ```platform-top.h``` file and with ```include/configs/zynq_rpt_guiext.h```  

**NOTE**  
Petalinux U-Boot autoconf config select, will create ```platform-auto.h```.  
Else, you need to fill ```platform-auto.h``` defines in ```zynq_rpt_guiext.h```.

---

