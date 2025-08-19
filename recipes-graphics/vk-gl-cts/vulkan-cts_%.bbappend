SRC_URI = "\
	git://github.com/KhronosGroup/VK-GL-CTS.git;protocol=https;name=vk-gl-cts;nobranch=1 \
	git://github.com/google/amber;protocol=https;destsuffix=git/external/amber/src;name=amber;branch=main \
	git://github.com/KhronosGroup/glslang.git;protocol=https;destsuffix=git/external/glslang/src;name=glslang;branch=main \
	git://github.com/KhronosGroup/SPIRV-Headers.git;protocol=https;destsuffix=git/external/spirv-headers/src;name=spirv-headers;branch=main \
	git://github.com/KhronosGroup/SPIRV-Tools.git;protocol=https;destsuffix=git/external/spirv-tools/src;name=spirv-tools;branch=main \
	https://raw.githubusercontent.com/baldurk/renderdoc/v1.1/renderdoc/api/app/renderdoc_app.h;subdir=git/external/renderdoc/src;name=renderdoc \
"
