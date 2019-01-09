#
# Copyright (C) 2018 The LineageOS Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Only include Shield apps for first party targets
ifneq ($(filter $(word 2,$(subst _, ,$(TARGET_PRODUCT))), roth dalmore),)
$(call inherit-product, device/nvidia/shield-common/shield.mk)
endif

TARGET_REFERENCE_DEVICE ?= roth
TARGET_TEGRA_VARIANT    ?= common

$(call inherit-product, device/nvidia/t114-common/t114.mk)
$(call inherit-product, device/nvidia/touch/raydium.mk)

PRODUCT_CHARACTERISTICS  := tv
PRODUCT_AAPT_CONFIG      := normal
PRODUCT_AAPT_PREF_CONFIG := xhdpi
TARGET_SCREEN_HEIGHT     := 720
TARGET_SCREEN_WIDTH      := 1280

$(call inherit-product, frameworks/native/build/phone-xhdpi-2048-dalvik-heap.mk)

# Init related
PRODUCT_PACKAGES += \
    fstab.dalmore \
    fstab.molly \
    fstab.roth \
    init.dalmore.rc \
    init.molly.rc \
    init.roth.rc \
    init.roth_common.rc \
    init.recovery.dalmore.rc \
    init.recovery.molly.rc \
    init.recovery.roth.rc \
    power.dalmore.rc \
    power.molly.rc \
    power.roth.rc \
    ueventd.roth.rc

# Kernel
ifneq ($(TARGET_PREBUILT_KERNEL),)
PRODUCT_COPY_FILES += \
    $(TARGET_PREBUILT_KERNEL):kernel
endif

# Wifi
$(call inherit-product-if-exists, hardware/broadcom/wlan/bcmdhd/config/config-bcm.mk)
