
#ifndef __PLNX_CONFIG_PLATFORM_TOP_H
#define __PLNX_CONFIG_PLATFORM_TOP_H

#include <configs/platform-auto.h>
#include <configs/zynq-common.h>

/* ethernet - ps7_ethernet_0 */
#define CONFIG_SYS_FAULT_ECHO_LINK_DOWN
#define CONFIG_PHY_XILINX
#define CONFIG_MII
#define CONFIG_NET_MULTI
#define CONFIG_NETCONSOLE	1
#define CONFIG_SERVERIP	192.168.1.20
#define CONFIG_IPADDR

#define CONFIG_SYS_BOOTM_LEN 0xF000000
#define DFU_ALT_INFO_RAM \
        "dfu_ram_info=" \
        "setenv dfu_alt_info " \
        "image.ub ram $netstart 0x1e00000\0" \
        "dfu_ram=run dfu_ram_info && dfu 0 ram 0\0" \
        "thor_ram=run dfu_ram_info && thordown 0 ram 0\0"

#define DFU_ALT_INFO_MMC \
        "dfu_mmc_info=" \
        "set dfu_alt_info " \
        "${kernel_image} fat 0 1\\\\;" \
        "dfu_mmc=run dfu_mmc_info && dfu 0 mmc 0\0" \
        "thor_mmc=run dfu_mmc_info && thordown 0 mmc 0\0"


/*Required for uartless designs */
#ifndef CONFIG_BAUDRATE
#define CONFIG_BAUDRATE 115200
#ifdef CONFIG_DEBUG_UART
#undef CONFIG_DEBUG_UART
#endif
#endif

/*Define CONFIG_ZYNQ_EEPROM here and its necessaries in u-boot menuconfig if you had EEPROM memory. */
#ifdef CONFIG_ZYNQ_EEPROM
#define CONFIG_SYS_I2C_EEPROM_ADDR_LEN         1
#define CONFIG_SYS_I2C_EEPROM_ADDR             0x50
#define CONFIG_SYS_EEPROM_PAGE_WRITE_BITS      5
#define CONFIG_SYS_EEPROM_PAGE_WRITE_DELAY_MS  5
#define CONFIG_SYS_EEPROM_SIZE                 (8*1024) /* Bytes */
#endif

#define CONFIG_PREBOOT	"echo U-BOOT for RPT GUI Extension; rpt_guiext_init;" \
	"echo importing env from FSBL shared area at 0xFFFFFC00; " \
	"if itest *0xFFFFFC00 == 0xCAFEBABE; then echo Found valid magic; " \
	"env import -t 0xFFFFFC04; fi;setenv preboot; echo"

/* Set correct RAM size */
#define CONFIG_SYS_SDRAM_BASE	0x0
#define CONFIG_SYS_SDRAM_SIZE	0x20000000

/* Extra U-Boot Env settings */
#undef CONFIG_EXTRA_ENV_SETTINGS
#define CONFIG_EXTRA_ENV_SETTINGS \
	SERIAL_MULTI \ 
	CONSOLE_ARG \ 
	DFU_ALT_INFO_RAM \ 
	DFU_ALT_INFO_MMC \ 
	PSSERIAL0 \ 
	"nc=setenv stdout nc;setenv stdin nc;\0" \ 
	"ethaddr=00:0a:35:00:1e:53\0" \
	"bootenv=uEnv.txt\0" \ 
	"importbootenv=echo \"Importing environment from SD ...\"; env import -t ${loadbootenv_addr} $filesize\0" \ 
	"loadbootenv=load mmc $sdbootdev:$partid ${loadbootenv_addr} ${bootenv}\0" \ 
	"sd_uEnvtxt_existence_test=test -e mmc $sdbootdev:$partid /uEnv.txt\0" \ 
	"uenvboot=" \ 
		"if run sd_uEnvtxt_existence_test; then " \ 
			"run loadbootenv; " \ 
			"echo Loaded environment from ${bootenv}; " \ 
			"run importbootenv; " \ 
			"fi; " \ 
		"if test -n $uenvcmd; then " \ 
			"echo Running uenvcmd ...; " \ 
			"run uenvcmd; " \ 
		"fi\0" \ 
	"autoload=no\0" \ 
	"sdbootdev=0\0" \ 
	"clobstart=0x01000000\0" \ 
	"netstart=0x01000000\0" \ 
	"dtbnetstart=0x14fff000\0" \ 
	"loadaddr=0x01000000\0" \ 
	"boot_img=BOOT.BIN\0" \ 
	"load_boot=tftpboot ${clobstart} ${boot_img}\0" \ 
	"update_boot=setenv img boot; setenv psize ${bootsize}; setenv installcmd \"install_boot\"; run load_boot ${installcmd}; setenv img; setenv psize; setenv installcmd\0" \ 
	"install_boot=mmcinfo && fatwrite mmc ${sdbootdev} ${clobstart} ${boot_img} ${filesize}\0" \ 
	"bootenvsize=0x20000\0" \ 
	"bootenvstart=0x23e0000\0" \ 
	"jffs2size=0x800000\0" \ 
	"jffs2start=0x3800000\0" \ 
	"eraseenv=sf probe 0 && sf erase ${bootenvstart} ${bootenvsize}\0" \ 
	"jffs2_img=rootfs.jffs2\0" \ 
	"load_jffs2=tftpboot ${clobstart} ${jffs2_img}\0" \ 
	"update_jffs2=setenv img jffs2; setenv psize ${jffs2size}; setenv installcmd \"install_jffs2\"; run load_jffs2 test_img; setenv img; setenv psize; setenv installcmd\0" \ 
	"sd_update_jffs2=echo Updating jffs2 from SD; mmcinfo && fatload mmc ${sdbootdev}:1 ${clobstart} ${jffs2_img} && run install_jffs2\0" \ 
	"install_jffs2=sf probe 0 && sf erase ${jffs2start} ${jffs2size} && sf write ${clobstart} ${jffs2start} ${filesize}\0" \ 
	"kernel_img=image.ub\0" \ 
	"load_kernel=tftpboot ${clobstart} ${kernel_img}\0" \ 
	"update_kernel=setenv img kernel; setenv psize ${kernelsize}; setenv installcmd \"install_kernel\"; run load_kernel ${installcmd}; setenv img; setenv psize; setenv installcmd\0" \ 
	"install_kernel=mmcinfo && fatwrite mmc ${sdbootdev} ${clobstart} ${kernel_img} ${filesize}\0" \ 
	"cp_kernel2ram=mmcinfo && fatload mmc ${sdbootdev} ${netstart} ${kernel_img}\0" \ 
	"dtb_img=system.dtb\0" \ 
	"load_dtb=tftpboot ${clobstart} ${dtb_img}\0" \ 
	"update_dtb=setenv img dtb; setenv psize ${dtbsize}; setenv installcmd \"install_dtb\"; run load_dtb test_img; setenv img; setenv psize; setenv installcmd\0" \ 
	"sd_update_dtb=echo Updating dtb from SD; mmcinfo && fatload mmc ${sdbootdev}:1 ${clobstart} ${dtb_img} && run install_dtb\0" \ 
	"loadbootenv_addr=0x00100000\0" \ 
	"fault=echo ${img} image size is greater than allocated place - partition ${img} is NOT UPDATED\0" \ 
	"test_crc=if imi ${clobstart}; then run test_img; else echo ${img} Bad CRC - ${img} is NOT UPDATED; fi\0" \ 
	"test_img=setenv var \"if test ${filesize} -gt ${psize}\\; then run fault\\; else run ${installcmd}\\; fi\"; run var; setenv var\0" \ 
	"netboot=tftpboot ${netstart} ${kernel_img} && bootm\0" \ 
	"default_bootcmd=run uenvboot; run cp_kernel2ram && bootm ${netstart}\0" \ 
""

#endif /* __PLNX_CONFIG_PLATFORM_TOP_H */
