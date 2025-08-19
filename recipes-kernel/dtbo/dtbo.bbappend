# Copyright (C) 2019 Fabien Parent <fparent@baylibre.com>
# Released under the MIT license (see COPYING.MIT for the terms)
DESCRIPTION = "Custom DTBO files for G510"
LICENSE = "CLOSED"

SRC_URI:append:genio-510-evk = " \
	file://camera-common.dtsi \
	file://display-dp.dts \
	file://display-dsi.dts \
	file://display-dsi2lvds.dts \
	file://display-dsidp.dts \
	file://display-dsiedp.dts \
	file://display-edp.dts \
	file://display-edpdp.dts \
	file://display-edphdmi.dts \
	file://display-hdmi.dts \
	file://display-hdmidp.dts \
	file://display-headless.dts \
	file://display-lvdsdp.dts \
	file://display-lvdsedp.dts \
	file://display-lvdshdmi.dts \
"
