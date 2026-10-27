
# ============================================================
# MediaTek UCOM M510 / M700 Display DTBO Customization
# ============================================================

FILESEXTRAPATHS:prepend := "${THISDIR}/files/common:"

# ============================================================
# Common AAEON Display Device Tree Overlays
# ============================================================

UCOM_DISPLAY_DTBO_FILES = " \
    file://display-aaeon-dsi.dts \
    file://display-aaeon-edp.dts \
"

# ============================================================
# UCOM M510 - MT8370
# ============================================================

SRC_URI:append:mtk-ucom-m510 = " \
    ${UCOM_DISPLAY_DTBO_FILES} \
"

# ============================================================
# UCOM M700 - MT8390
# ============================================================

SRC_URI:append:mtk-ucom-m700 = " \
    ${UCOM_DISPLAY_DTBO_FILES} \
"
