SUMMARY = "Create empty rootfs directory structure"
SECTION = "PETALINUX/apps"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"

S = "${WORKDIR}"

inherit allarch

do_install () {
	install -d ${D}/opt
}
FILES_${PN} += "/opt"
