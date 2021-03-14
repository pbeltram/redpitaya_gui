# Patch for FSBL
# Note: do_configure_prepend task section is required only for 2017.1 release
# Refer https://github.com/Xilinx/meta-xilinx-tools/blob/rel-v2017.2/classes/xsctbase.bbclass#L29-L35
  
do_configure_prepend() {
    if [ -d "${S}/patches" ]; then
       rm -rf ${S}/patches
    fi
  
    if [ -d "${S}/.pc" ]; then
       rm -rf ${S}/.pc
    fi
}

SRC_URI_append = " \
        "

FILESEXTRAPATHS_prepend := "${THISDIR}/files:"

#Add compiler flags for FSBL
YAML_COMPILER_FLAGS_append = " -DFSBL_DEBUG"
YAML_COMPILER_FLAGS_append = " -DFSBL_DEBUG_INFO"

# Note: This is not required if you are using Yocto
# CAUTION!: EXTERNALXSCTSRC and EXTERNALXSCTSRC_BUILD is required only for 2018.2 and below petalinux releases
EXTERNALXSCTSRC = ""
EXTERNALXSCTSRC_BUILD = ""
