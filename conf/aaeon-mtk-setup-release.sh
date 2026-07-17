#!/bin/sh

sed -i '28a\ \ ##OEROOT##/../meta-aaeon-mtk \\' src/meta-rity/meta/conf/templates/default/bblayers.conf.sample

sed -i 's/#MACHINE ??= "genio-510-evk"/MACHINE ??= "genio-510-evk"/' src/meta-rity/meta/conf/templates/default/local.conf.sample
sed -i 's/MACHINE ??= "genio-700-evk"/#MACHINE ??= "genio-700-evk"/' src/meta-rity/meta/conf/templates/default/local.conf.sample
sed -i '140a\EXTRA_IMAGE_FEATURES:append = " tools-sdk"\' src/meta-rity/meta/conf/templates/default/local.conf.sample

sed -i '/#DEFAULTTUNE:virtclass-multilib-lib32 = "armv7athf-neon"/a \
# AAEON: Alan Modified: 24.08.27\
###########################################################################\
PACKAGE_CLASSES = "package_deb"\
EXTRA_IMAGE_FEATURES += "package-management"\
IMAGE_INSTALL:append = " glibc-utils localedef"\
IMAGE_INSTALL:append = " ntp"\
IMAGE_INSTALL:append = " nfs-utils"\
IMAGE_INSTALL:append = " dosfstools dos2unix"\
IMAGE_INSTALL:append = " net-tools"\
IMAGE_INSTALL:append = " i2c-tools"\
IMAGE_INSTALL:append = " usbutils"\
IMAGE_INSTALL:append = " iperf3"\
IMAGE_INSTALL:append = " rng-tools"\
IMAGE_INSTALL:append = " mtd-utils"\
IMAGE_INSTALL:append = " bluez5"\
IMAGE_INSTALL:append = " can-utils"\
IMAGE_INSTALL:append = " pm-utils"\
IMAGE_INSTALL:append = " lshw"\
IMAGE_INSTALL:append = " memtester"\
IMAGE_INSTALL:append = " gptfdisk"\
IMAGE_INSTALL:append = " rsync"\
IMAGE_INSTALL:append = " can-utils"\
IMAGE_INSTALL:append = " vim"\
IMAGE_INSTALL:append = " libmnl"\
IMAGE_INSTALL:append = " libmodbus"\
IMAGE_INSTALL:append = " networkmanager"\
IMAGE_INSTALL:append = " sysbench"\
IMAGE_INSTALL:append = " stress-ng"\
IMAGE_INSTALL:append = " hdparm"\
IMAGE_INSTALL:append = " devmem2"\
IMAGE_INSTALL:append = " python3-python-vlc"\
IMAGE_INSTALL:append = " git doxygen libp11 dbus autoconf-archive json-c json-glib cmocka"\
IMAGE_INSTALL:append = " lame cups libvpx libssh libssh2 fmt libpcre leveldb tslib zlib lsb-release libusb1 libusbg"\
IMAGE_INSTALL:append = " libgpiod libgpiod-dev libgpiod-tools"\
IMAGE_INSTALL:append = " dhcpcd wpa-supplicant"\
IMAGE_INSTALL:append = " mesa"\
IMAGE_INSTALL:append = " gstreamer1.0-plugins-bad"\
IMAGE_INSTALL:append = " gstreamer1.0-plugins-good"\
IMAGE_INSTALL:append = " ttf-bitstream-vera tree openldap openvpn qpdf tcpdump htop rfkill freetype cifs-utils v4l-utils mtools lmsensors"\
IMAGE_INSTALL:append = " modemmanager minicom python3-speedtest-cli"\
IMAGE_INSTALL:append = " gcc gcc-symlinks g++ g++-symlinks make cmake automake autoconf libtool"\
IMAGE_INSTALL:append = " pulseaudio pulseaudio-module-dbus-protocol trace-cmd"\
###########################################################################' src/meta-rity/meta/conf/templates/default/local.conf.sample

cat << 'EOF' >> src/meta-rity/meta/conf/templates/default/local.conf.sample
OPTEE_DRAM_SIZE:genio-510-evk = "0x200000000"
LICENSE_FLAGS_ACCEPTED += "commercial_libav commercial_x264"

DL_DIR = "${TOPDIR}/../downloads"
SSTATE_DIR = "${TOPDIR}/../sstate-cache"
DL_TIMEOUT = "600"
BB_NUMBER_THREADS = "4"
PARALLEL_MAKE = "-j 4"
EOF
