# Inherit device configuration for roth.
$(call inherit-product, device/nvidia/roth/full_roth.mk)

# Inherit some common lineage stuff.
ifeq ($(ALTERNATE_BUILD),true)
$(call inherit-product, vendor/cm/config/common_full_tv.mk)
else
$(call inherit-product, vendor/cm/config/common_full_tablet_wifionly.mk)
endif

PRODUCT_NAME := lineage_roth
PRODUCT_DEVICE := roth
