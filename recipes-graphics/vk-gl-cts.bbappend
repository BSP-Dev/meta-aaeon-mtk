# Copyright (C) 2019 Fabien Parent <fparent@baylibre.com>
# Released under the MIT license (see COPYING.MIT for the terms)
DESCRIPTION = "Custom vk-gl-cts files for G510"
LICENSE = "CLOSED"

SRC_URI:append:vk-gl-cts = " \
	file://khronos-cts.inc \
"
