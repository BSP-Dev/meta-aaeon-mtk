
# ============================================================
# MediaTek UCOM M510 / M700 U-Boot Customization
# ============================================================

# ============================================================
# File Search Paths
# ============================================================

FILESEXTRAPATHS:prepend := "${THISDIR}/files/ucom-m510:"

# ============================================================
# UCOM M510 - MT8370
# ============================================================

# Update U-Boot Device Tree Memory Node for 8GB DRAM
SRC_URI:append:mtk-ucom-m510 = " \
    file://genio-510-evk-common-8gddr.patch \
"

# ============================================================
# UCOM M700 - MT8390
# ============================================================

# Currently inherits original Genio 700 EVK U-Boot settings.
# Add M700-specific patches here when needed.
