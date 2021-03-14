SUMMARY = "sys-init startup script"
SECTION = "PETALINUX/apps"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"

SRC_URI = "file://sys-init.sh \
	"

FILESEXTRAPATHS_prepend := "${THISDIR}/files:"

inherit update-rc.d

INITSCRIPT_NAME = "sys-init.sh"
INITSCRIPT_PARAMS = "start 99 S ."

S = "${WORKDIR}"

do_install() {
	install -d ${D}${sysconfdir}/init.d
	install -m 0755 ${S}/sys-init.sh ${D}${sysconfdir}/init.d/sys-init.sh
}

FILES_${PN} += "${sysconfdir}/*"

