# Copyright (C) 2019 Fabien Parent <fparent@baylibre.com>
# Released under the MIT license (see COPYING.MIT for the terms)
DESCRIPTION = "Custom DTBO files for G510"
LICENSE = "CLOSED"

SRC_URI:append:v6/genio-510-evk = " \
	file://display-dp.dts \
"
