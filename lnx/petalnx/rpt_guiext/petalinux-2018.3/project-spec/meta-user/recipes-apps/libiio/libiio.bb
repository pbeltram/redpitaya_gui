# https://github.com/openembedded/meta-openembedded/blob/master/meta-oe/recipes-support/libiio/libiio_git.bb

SUMMARY = "Library for interfacing with IIO devices"
HOMEPAGE = "https://wiki.analog.com/resources/tools-software/linux-software/libiio"
SECTION = "PETALINUX/apps"
LICENSE = "LGPLv2.1+"
LIC_FILES_CHKSUM = "file://COPYING.txt;md5=7c13b3376cea0ce68d2d2da0a1b3a72c"

#
# Version 0.18 + a few fixes
# see https://github.com/analogdevicesinc/libiio/issues/310
#
# 0.18.1
SRCREV = "c0012d04b2f885d930fc69e5658d1825bff1ff4a"
IIOVER = "0.18.1"

# 0.15
#SRCREV = "6ecff5d46e1b12c2859f0b63a73282940e3402bb"
#IIOVER = "0.15"

# 0.10
#SRCREV = "11b871b4f5fb1b9e9029fae1a7fd3734efb441b0"
#IIOVER = "0.10"

SRC_URI = "git://github.com/analogdevicesinc/libiio.git \
           file://iiod.sysv"

S = "${WORKDIR}/git"

inherit cmake gitpkgv update-rc.d

PV = "${IIOVER}-git${SRCPV}"
PKGV = "${IIOVER}-git${GITPKGV}"

DEPENDS = " \
    flex-native bison-native libaio \
    ${@bb.utils.contains('DISTRO_FEATURES', 'zeroconf', 'avahi', '', d)} \
"

EXTRA_OECMAKE = " \
    -DCMAKE_BUILD_TYPE=RelWithDebInfo \
    -DUDEV_RULES_INSTALL_DIR=${nonarch_base_libdir}/udev/rules.d \
    -DWITH_IIOD=ON -DWITH_IIOD_CLIENT=ON \
    ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '-DWITH_SYSTEMD=ON', '', d)} \
    ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', '-DWITH_SYSVINIT=ON', '', d)} \
"

PACKAGECONFIG ??= "USB_BACKEND NETWORK_BACKEND PYTHON_BINDINGS"

PACKAGECONFIG[USB_BACKEND] = "-DWITH_USB_BACKEND=ON,-DWITH_USB_BACKEND=OFF,libusb1,libxml2"
PACKAGECONFIG[NETWORK_BACKEND] = "-DWITH_NETWORK_BACKEND=ON,-DWITH_NETWORK_BACKEND=OFF,libxml2"
PACKAGECONFIG[PYTHON_BINDINGS] = ",,python"

PACKAGES =+ "${PN}-iiod ${PN}-tests ${PN}-python"

# IIOD sysvinit script
do_install_append () {
	rm ${D}/${sysconfdir}/init.d/iiod
	install -m 0755 ${WORKDIR}/iiod.sysv ${D}/${sysconfdir}/init.d/iiod
}

FILES_${PN}-iiod = " \
    ${sbindir}/iiod \
    ${systemd_system_unitdir}/iiod.service \
    ${sysconfdir}/init.d/iiod \
"
FILES_${PN}-tests = "${bindir}"
FILES_${PN}-python = "${PYTHON_SITEPACKAGES_DIR}"

#SYSTEMD_PACKAGES = "${PN}-iiod"
#SYSTEMD_SERVICE_${PN}-iiod = "iiod.service"

INITSCRIPT_PACKAGES = "${PN}-iiod"
INITSCRIPT_NAME_${PN}-iiod = "iiod"
INITSCRIPT_PARAMS_${PN}-iiod = "defaults 80 20"

IMAGE_INSTALL_append = " libiio libiio-iiod"

