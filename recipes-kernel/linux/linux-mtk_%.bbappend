FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

#SRC_URI += "${EXTRA_KERNEL_PATCHES}"
SRC_URI = "file://001-ucom-g510-kernel.patch"

PACKAGE_ARCH = "${MACHINE_ARCH}"