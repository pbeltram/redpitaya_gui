
![Alt text](./rpt_guiext.jpg?raw=true "RedPitaya GUI Extension")  

Purpose of this project is to demonstrate usage of Qt GUI application on Zynq based system.  
Such system becomes standalone, portable, battery power-supply system.  
Network is not available everywhere and having touch screen LCD GUI sometimes becomes handy.  
This project was done on RedPitaya, same steps can be used on any other Zynq based system.  

Project is composed of:  
- HW extension board with all HW interfaces needed to export video signal from RedPitaya base board to monitor.  
- FPGA design to interface between Linux GUI framework and HW.  
- Linux device driver to interface Linux GUI framework with Qt GUI application.  
- Qt GUI application as final demo top (Qwt example qt-oscilloscope).

Look for ```README.md``` file in each project subdirectory for instructions.  

Part of project are also external Linux kernel and U-Boot git forks, so don't forget to initialize submodules:  

```git submodule update --init --recursive```  

NOTE:  
I have working RedPitaya Qt GUI system and I am transferring files and HowTo's to this git repo. It is work in progress, until this note is removed :-).

WBR Primoz
