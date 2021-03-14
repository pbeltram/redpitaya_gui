**Work in progress ...**  

---

### SD card layout (4GByte SD card /dev/sdf example)
```
Device     Boot   Start     End Sectors  Size Id Type
/dev/sdf1  *       2048  526335  524288  256M  c W95 FAT32 (LBA)
/dev/sdf2        526336 3672063 3145728  1,5G 83 Linux
/dev/sdf3       3672064 7741439 4069376    2G 83 Linux
```  

**/dev/sdf1 on /media/$USER/boot type vfat**  
Format as FAT32.  
Contains BOOT.bin and image.ub.  
Min size: 64MByte.  

**/dev/sdf2 on /media/$USER/rootfs type ext4**  
Format as EXT4.  
Contains Linux rootfs.  
Min size: 256MByte.  

**/dev/sdf3 on /media/$USER/userfs type ext4**  
Format as EXT4.  
Mounted as /opt directory.  
Contains Qt4 and other user files.  
Min size: 512MByte.  

---

### Copy Boot files to SD card  

```cp ./rpt_guiext/BOOT.BIN /media/$USER/boot/```  
```cp ./rpt_guiext/image.ub /media/$USER/boot/```  

or via scp utility to ```rpt``` host:  
```scp ./rpt_guiext/BOOT.BIN root@rpt:/run/media/mmcblk0p1/```  
```scp ./rpt_guiext/image.ub root@rpt:/run/media/mmcblk0p1/```  

### Copy Linux rootfs to SD card  
**NOTE: Double check your SD card device partition path (```/dev/sdX2```)!**
**NOTE: Format will destroy data on ```/dev/sdX2``` partition!**
**NOTE: Commands executed below can destroy your PC disk data, if directed to wrong device partition!**
**NOTE: If you don't know what you are doing, than don't do it!**
**Execution of commands below is your solely responsability. You have been warned!**

```sudo umount /dev/sdX2```  
```sudo mkfs.ext4 /dev/sdX2```  
```sudo e2label /dev/sdX2 rootfs```  
```udisksctl mount -b /dev/sdX2```  
```sudo su -c 'tar xvf ./rpt_guiext/rootfs.tar.gz -C /media/$SUDO_USER/rootfs/'```  

---

