**Work in progress...**  

---
### Petalinux build environment setup  

```source ~/opt/Xilinx/petalnx/2018.3/settings.sh```  
```sudo sysctl fs.inotify.max_user_watches=1000000```  

---
### Import HDF  
```petalinux-config --get-hw-description=../staging/```  

---
### Build  
```petalinux-build -x mrproper```  
```petalinux-build```  

---
### Create BOOT.bin  
```petalinux-package --boot --fsbl ./images/linux/zynq_fsbl.elf --fpga ./images/linux/system.bit --u-boot ./images/linux/u-boot.elf --force --output ./images/linux/BOOT.BIN```  

---

