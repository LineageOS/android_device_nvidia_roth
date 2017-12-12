# Inherit device configuration for roth.
$(call inherit-product, device/nvidia/roth/full_roth.mk)

# Inherit some common lineage stuff.
$(call inherit-product, vendor/cm/config/common_full_tablet_wifionly.mk)

PRODUCT_NAME := lineage_roth
PRODUCT_DEVICE := roth
