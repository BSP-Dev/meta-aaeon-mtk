FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

SRC_URI += "file://001-ucom-g510-8gddr-uboot.patch"

PACKAGE_ARCH = "${MACHINE_ARCH}"
