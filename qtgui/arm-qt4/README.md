**Work in progress ...**  

---
### Download Qt source

[Qt4.8 Download archive](https://download.qt.io/archive/qt/4.8/4.8.7/qt-everywhere-opensource-src-4.8.7.tar.gz)  
```d990ee66bf7ab0c785589776f35ba6ad  qt-everywhere-opensource-src-4.8.7.tar.gz```  

Unpack it: ```tar -xzvf ./qt-everywhere-opensource-src-4.8.7.tar.gz -C ./build/```   

Apply patch: ```cat ./patches/qt-4.8.7.patch | patch -Nu -p1 -d ./build/qt-everywhere-opensource-src-4.8.7/```  

---
### Download Qwt source

[Qwt 6.1.4 Download](https://sourceforge.net/projects/qwt/files/qwt/6.1.4/qwt-6.1.4.zip/download)  
```94cba1069f972706e676ea816582e5ce  qwt-6.1.4.zip```  

Unpack it: ```unzip ./qwt-6.1.4.zip -d ./build/```   

Apply patch: ```cat ./patches/qwt-6.1.4.patch | patch -Nu -p1 -d ./build/qwt-6.1.4/```  

---
### Cross compile Qt runtime

**Set environment build variables**  
```
source ~/opt/Xilinx/SDK/2018.3/settings64.sh
export WORK_DIR=~/src/gitrepos/redpitaya_gui/qtgui
export ZYNQ_QT_INSTALL=${WORK_DIR}/arm-qt4/install
export ZYNQ_QT_TARGET=/opt/lib/qt4
export PATH=$ZYNQ_QT_INSTALL/bin:$PATH
export ROOTFS=${WORK_DIR}/rootfs/sysroots/cortexa9hf-neon-xilinx-linux-gnueabi
```  

**Configure Qt build options**  
```
cd ${WORK_DIR}/arm-qt4/build/qt-everywhere-opensource-src-4.8.7
make confclean
./configure \
  -embedded arm \
  -xplatform qws/linux-arm-gnueabi-g++ \
  -little-endian \
  -opensource \
  -host-little-endian \
  -confirm-license \
  -nomake demos \
  -nomake examples \
  -no-sql-db2 \
  -no-sql-ibase \
  -no-sql-mysql \
  -no-sql-oci \
  -no-sql-odbc \
  -no-sql-psql \
  -no-sql-sqlite \
  -no-sql-sqlite2 \
  -no-sql-sqlite_symbian \
  -no-sql-symsql \
  -no-sql-tds \
  -qt-zlib \
  -qt-libtiff \
  -qt-libpng \
  -qt-libmng \
  -qt-libjpeg \
  -no-openssl \
  -verbose \
  -no-dbus \
  -no-cups \
  -no-glib \
  -qt-freetype \
  -qt-gfx-linuxfb \
  -qt-kbd-linuxinput \
  -qt-mouse-linuxinput \
  -no-webkit \
  -no-javascript-jit \
  -no-script \
  -no-scripttools \
  -no-qt3support \
  -no-xmlpatterns \
  -no-multimedia \
  -no-audio-backend \
  -no-phonon \
  -no-phonon-backend \
  -hostprefix $ZYNQ_QT_INSTALL \
  -prefix $ZYNQ_QT_TARGET \
  -no-mmx \
  -no-3dnow \
  -no-sse \
  -no-sse2 \
  -no-sse3 \
  -no-ssse3 \
  -no-sse4.1 \
  -no-sse4.2 \
  -no-avx \
  -no-neon
```  

**Build Qt runtime**  
```
cd ${WORK_DIR}/arm-qt4/build/qt-everywhere-opensource-src-4.8.7
make
make install
```  

---
### Cross compile Qwt runtime

**Set environment build variables**  
```
source ~/opt/Xilinx/SDK/2018.3/settings64.sh
export WORK_DIR=~/src/gitrepos/redpitaya_gui/qtgui
export ZYNQ_QT_INSTALL=${WORK_DIR}/arm-qt4/install
export ZYNQ_QT_TARGET=/opt/lib/qt4
export PATH=$ZYNQ_QT_INSTALL/bin:$PATH
export ROOTFS=${WORK_DIR}/rootfs/sysroots/cortexa9hf-neon-xilinx-linux-gnueabi
```  

**Build Qwt runtime**  
```
cd ${WORK_DIR}/arm-qt4/build/qwt-6.1.4
qmake qwt.pro
make
make install
```  

---

**Copy Qt and Qwt runtime files to RedPitaya**  

NOTE: Destination directory ```/opt/lib/qt4``` defined as ${ZYNQ_QT_TARGET} build environment, must already exist on RedPitaya.  

```
cd ${ZYNQ_QT_INSTALL}
tar -czvf ./translations.tar.gz ./translations/
tar -czvf ./plugins.tar.gz ./plugins/
tar -czvf ./lib.tar.gz ./lib/
scp ./translations.tar.gz root@rpt:${ZYNQ_QT_TARGET}/
scp ./lib.tar.gz root@rpt:${ZYNQ_QT_TARGET}/
scp ./plugins.tar.gz root@rpt:${ZYNQ_QT_TARGET}/
```  
TODO: Alternative is to copy/set files on locally mounted RedPitaya SD card ```userfs``` partition.

**Install Qt and Qwt runtime files on RedPitaya**  

On RedPitaya extract Qt runtime files:  
```
cd /opt/lib/qt4
tar -xzvf ./translations.tar.gz
tar -xzvf ./plugins.tar.gz
tar -xzvf ./lib.tar.gz
```  

---

