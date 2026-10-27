
SUMMARY = "AAEON UCOM M510/M700 common packages"
DESCRIPTION = "Common runtime and development packages for AAEON UCOM boards"
LICENSE = "MIT"

PACKAGE_ARCH = "${MACHINE_ARCH}"

inherit packagegroup

# ============================================================
# System Utilities
# ============================================================

AAEON_SYSTEM_PACKAGES = " \
    glibc-utils \
    localedef \
    ntp \
    nfs-utils \
    dosfstools \
    dos2unix \
    net-tools \
    i2c-tools \
    usbutils \
    iperf3 \
    rng-tools \
    mtd-utils \
    bluez5 \
    can-utils \
    pm-utils \
    lshw \
    memtester \
    gptfdisk \
    rsync \
    vim \
    hdparm \
    devmem2 \
    tree \
    lsb-release \
    tcpdump \
    htop \
    rfkill \
    cifs-utils \
    v4l-utils \
    mtools \
    lmsensors \
    minicom \
"

# ============================================================
# Networking / Communication
# ============================================================

AAEON_NETWORK_PACKAGES = " \
    libmnl \
    libmodbus \
    networkmanager \
    dhcpcd \
    wpa-supplicant \
    openldap \
    openvpn \
    modemmanager \
    python3-speedtest-cli \
    libssh \
    libssh2 \
"

# ============================================================
# Libraries / Frameworks
# ============================================================

AAEON_LIBRARY_PACKAGES = " \
    libp11 \
    dbus \
    autoconf-archive \
    json-c \
    json-glib \
    cmocka \
    lame \
    cups \
    libvpx \
    fmt \
    libpcre \
    leveldb \
    tslib \
    zlib \
    freetype \
    libusb1 \
    libusbg \
    libgpiod \
    libgpiod-dev \
    libgpiod-tools \
    qpdf \
"

# ============================================================
# Multimedia / Graphics
# ============================================================

AAEON_MULTIMEDIA_PACKAGES = " \
    mesa \
    gstreamer1.0-plugins-bad \
    gstreamer1.0-plugins-good \
    pulseaudio \
    pulseaudio-module-dbus-protocol \
    python3-python-vlc \
    ttf-bitstream-vera \
"

# ============================================================
# Development / Debug Tools
# ============================================================

AAEON_DEVELOPMENT_PACKAGES = " \
    git \
    doxygen \
    gcc \
    gcc-symlinks \
    g++ \
    g++-symlinks \
    make \
    cmake \
    automake \
    autoconf \
    libtool \
    sysbench \
    stress-ng \
    trace-cmd \
"

# ============================================================
# Package Dependencies
# ============================================================

RDEPENDS:${PN} = " \
    ${AAEON_SYSTEM_PACKAGES} \
    ${AAEON_NETWORK_PACKAGES} \
    ${AAEON_LIBRARY_PACKAGES} \
    ${AAEON_MULTIMEDIA_PACKAGES} \
    ${AAEON_DEVELOPMENT_PACKAGES} \
"
