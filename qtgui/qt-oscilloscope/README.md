
---
### Build Qt application

**Set environment build variables**  
```
source ~/opt/Xilinx/SDK/2018.3/settings64.sh
export WORK_DIR=~/src/gitrepos/redpitaya_gui/qtgui
export ZYNQ_QT_INSTALL=${WORK_DIR}/arm-qt4/install
export PATH=$ZYNQ_QT_INSTALL/bin:$PATH
export ROOTFS=${WORK_DIR}/rootfs/sysroots/cortexa9hf-neon-xilinx-linux-gnueabi
```  

**Generate makefile**  

NOTE: Qt4.8 ```qmake``` is in PATH from above environment build variables settings, so you can ommit prefix paths.  

```
qmake --version
QMake version 2.01a
Using Qt version 4.8.7 in ${WORK_DIR}/qtgui/arm-qt4/install/lib
```  

Invoke build with:  
```
qmake -o Makefile qt-oscilloscope.pro
make
```  

**Copy Qt application to RedPitaya**  

NOTE: Destination directory ```/opt/qt4``` on RedPitaya must already exist.  

```
scp ./qt-oscilloscope root@rpt:/opt/qt4/
```
TODO: Alternative is to copy file on localy mounted RedPitaya SD card ```userfs``` partition.  

---
### Run Qt application on RedPitaya

Start Qt application on RedPitaya with:  
```/opt/qt4/qt-oscilloscope -qws```  

---

