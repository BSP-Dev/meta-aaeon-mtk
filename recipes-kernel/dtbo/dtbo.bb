# Copyright (C) 2019 Fabien Parent <fparent@baylibre.com>
# Released under the MIT license (see COPYING.MIT for the terms)
DESCRIPTION = "Custom DTBO files for G510"
LICENSE = "CLOSED"

FILESEXTRAPATHS:prepend:mtk-ucom-m510 := "${THISDIR}/v6/genio-510-evk:"
FILESEXTRAPATHS:prepend:mtk-ucom-m700 := "${THISDIR}/v6/genio-700-evk:"

SRC_URI:append:mtk-ucom-m510 = " \
	file://display-dp.dts \
	file://display-edp.dts \
"

SRC_URI:append:mtk-ucom-m700 = " \
	file://display-dp.dts \
	file://display-edp.dts \
"
