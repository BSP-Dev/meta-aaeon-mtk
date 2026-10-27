
# ============================================================
# MediaTek UCOM M510 / M700 Kernel Customization
# ============================================================

FILESEXTRAPATHS:prepend := "${THISDIR}/files/common:${THISDIR}/files/ucom-m510:${THISDIR}/files/ucom-m700:"

# ============================================================
# Common Kernel Configuration & Patches
# ============================================================

UCOM_COMMON_KERNEL_FILES = " \
    file://mt8188-mt6359-aic3106.patch \
    file://mtk-ucom.cfg \
"

# ============================================================
# UCOM M510 - MT8370
# ============================================================

UCOM_KERNEL_DTS:mtk-ucom-m510 = "mt8370-genio-510-evk-ucom-m510"

SRC_URI:append:mtk-ucom-m510 = " \
    ${UCOM_COMMON_KERNEL_FILES} \
    file://mt8370-genio-510-evk-ucom-m510.dts \
"

# ============================================================
# UCOM M700 - MT8390
# ============================================================

UCOM_KERNEL_DTS:mtk-ucom-m700 = "mt8390-genio-700-evk-ucom-m700"

SRC_URI:append:mtk-ucom-m700 = " \
    ${UCOM_COMMON_KERNEL_FILES} \
    file://mt8390-genio-700-evk-ucom-m700.dts \
"

# ============================================================
# Common DTS Installation
# ============================================================

UCOM_KERNEL_DTS ?= ""

do_configure:prepend() {

    if [ -n "${UCOM_KERNEL_DTS}" ]; then

        dts_name="${UCOM_KERNEL_DTS}"
        dts_source="${WORKDIR}/${dts_name}.dts"
        dts_dir="${S}/arch/arm64/boot/dts/mediatek"
        makefile="${dts_dir}/Makefile"

        # Validate source DTS and Kernel paths
        if [ ! -f "${dts_source}" ]; then
            bbfatal "UCOM DTS not found: ${dts_source}"
        fi

        if [ ! -f "${makefile}" ]; then
            bbfatal "Kernel DTS Makefile not found: ${makefile}"
        fi

        # Copy custom DTS into Kernel source
        install -m 0644 \
            "${dts_source}" \
            "${dts_dir}/${dts_name}.dts"

        # Register the custom DTB in Makefile
        dtb_entry="dtb-\$(CONFIG_ARCH_MEDIATEK) += ${dts_name}.dtb"

        if ! grep -Fqx "${dtb_entry}" "${makefile}"; then
            printf '%s\n' "${dtb_entry}" >> "${makefile}"
        fi

    fi
}
